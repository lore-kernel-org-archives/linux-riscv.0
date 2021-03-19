Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C298DC433C1
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 15:03:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02CD96191A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 15:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02CD96191A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9WGr6Z7aKKbWxXVFsAv7mkJRyYP21Uigu2afFcwFS4U=; b=N4J+202jjT1wE++zy88CfK3+T
	acVkOivzkn8HRljrY5Hup4gBvuIQGkpz3NdGKSNwawluWScymBGDaZzwej9IhmUkRA+QtTtiaYyoX
	SfxhUgdyJ/VFBO4LhOv0Xt/SMOH3PoLPQN4PiLPt3aOYsW87wBNPsPdqOcyS7c488jQtlOK73sEDz
	rbjd/0VJwaV3nXwC+rl7RGN5c71C2K80MLHBG9UjOF0lQE8Rl3Vi2d1PVc0ouLxJDa25A7u8Od6RV
	A+AqpFwfRRcjvx7husyUheeC/nj4g1CO90eo3dQEWPjnheKd2gPvWfgDhLaJB9+tMojAvCaWWTHgo
	whTeZjIyA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNGf5-007aYp-6u; Fri, 19 Mar 2021 15:03:39 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNGey-007aXj-Ps
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 15:03:36 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.12] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 326A9E0007;
 Fri, 19 Mar 2021 15:03:29 +0000 (UTC)
Subject: Re: [PATCH] RFC: riscv: evaluate put_user() arg before enabling user
 access
To: Ben Dooks <ben.dooks@codethink.co.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Terry Hu <kejia.hu@codethink.co.uk>, Arnd Bergman <arnd@arndb.de>
References: <20210318224135.134344-1-ben.dooks@codethink.co.uk>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <8ba86786-ad2b-93e1-c345-6fc45f336dd4@ghiti.fr>
Date: Fri, 19 Mar 2021 11:03:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210318224135.134344-1-ben.dooks@codethink.co.uk>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_150333_168292_EC9280BE 
X-CRM114-Status: GOOD (  25.59  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le 3/18/21 =E0 6:41 PM, Ben Dooks a =E9crit=A0:
> The <asm/uaccess.h> header has a problem with
> put_user(a, ptr) if the 'a' is not a simple
> variable, such as a function. This can lead
> to the compiler producing code as so:
> =

> 1:	enable_user_access()
> 2:	evaluate 'a'
> 3:	put 'a' to 'ptr'
> 4:	disable_user_acess()
> =

> The issue is that 'a' is now being evaluated
> with the user memory protections disabled. So
> we try and force the evaulation by assinging
> 'x' to __val at the start, and hoping the
> compiler barriers in enable_user_access()
> do the job of ordering step 2 before step 1.
> =

> This has shown up in a bug where 'a' sleeps
> and thus schedules out and loses the SR_SUM
> flag. This isn't sufficient to fully fix, but
> should reduce the window of opportunity.

I would say this patch is enough to fix the issue because it only =

happens when 'a' *explicitly schedules* when in =

__enable_user_access()/__disable_user_access(). Otherwise, I see 2 cases:

- user memory is correctly mapped and nothing stops the current process.
- an exception (interrupt or trap) is triggered: in those cases, the =

exception path correctly saves and restores SR_SUM.

> =

> Cc: Arnd Bergman <arnd@arndb.de>
> ---
>   arch/riscv/include/asm/uaccess.h | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/ua=
ccess.h
> index 824b2c9da75b..7bf90d462ec9 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -306,7 +306,10 @@ do {								\
>    * data types like structures or arrays.
>    *
>    * @ptr must have pointer-to-simple-variable type, and @x must be assig=
nable
> - * to the result of dereferencing @ptr.
> + * to the result of dereferencing @ptr. The @x is copied inside the macro
> + * to avoid code re-ordering where @x gets evaulated within the block th=
at
> + * enables user-space access (thus possibly bypassing some of the protec=
tion
> + * this feautre provides).
>    *
>    * Caller must check the pointer with access_ok() before calling this
>    * function.
> @@ -316,12 +319,13 @@ do {								\
>   #define __put_user(x, ptr)					\
>   ({								\
>   	__typeof__(*(ptr)) __user *__gu_ptr =3D (ptr);		\
> +	__typeof__(*__gu_ptr) __val =3D (x);			\
>   	long __pu_err =3D 0;					\
>   								\
>   	__chk_user_ptr(__gu_ptr);				\
>   								\
>   	__enable_user_access();					\
> -	__put_user_nocheck(x, __gu_ptr, __pu_err);		\
> +	__put_user_nocheck(__val, __gu_ptr, __pu_err);		\
>   	__disable_user_access();				\
>   								\
>   	__pu_err;						\
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
