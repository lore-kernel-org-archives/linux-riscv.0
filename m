Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA85C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 16:12:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D55F6197D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 16:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D55F6197D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3YbzyVK64qZL4dIfALFDn03eKYxejA/7W/Y+D9pi03E=; b=XO5swnPZsSGlc6YB1qnHNHa8y
	ZRGNgq1h5xwgdVumIgHzdLoYQgOgxktLDjGrU4vrpSF2+u5kJqeEy82Vj/Rg6yDRavTEJ87hYfjX0
	OADF+QMrIGXQNWe8BvdsfaUyvMZMpf0Lq3acAr2uMloBOoY90xKzh5OqiBlXKuHRhSJQsrlEk9akk
	TnOLOe9sF2NuqBvT8pvoT6HBS3VTIt7YHdTXKN5andZwHRkLgcTUvq/wXvnWUXmVJkHCNQIDvxYiD
	VPx0AfELl+xdIUbj3t6fPnQ83CCKAE+y9W4a+tJmmout/WfSyDi2BUm7oPws+ln/rN2pUO54EjGUT
	IthJPAPbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNHjd-007fiI-0R; Fri, 19 Mar 2021 16:12:25 +0000
Received: from relay13.mail.gandi.net ([217.70.178.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNHjZ-007fi0-Go
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 16:12:23 +0000
Received: from [192.168.1.12] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay13.mail.gandi.net (Postfix) with ESMTPSA id 088E180003;
 Fri, 19 Mar 2021 16:12:16 +0000 (UTC)
Subject: Re: [PATCH] RFC: riscv: evaluate put_user() arg before enabling user
 access
To: Ben Dooks <ben.dooks@codethink.co.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Terry Hu <kejia.hu@codethink.co.uk>, Arnd Bergman <arnd@arndb.de>
References: <20210318224135.134344-1-ben.dooks@codethink.co.uk>
 <8ba86786-ad2b-93e1-c345-6fc45f336dd4@ghiti.fr>
 <32c328a0-b1ab-397e-18d4-873d7ccfb6f2@codethink.co.uk>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <bd16115d-d327-87fd-67ed-a54b9e926472@ghiti.fr>
Date: Fri, 19 Mar 2021 12:12:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <32c328a0-b1ab-397e-18d4-873d7ccfb6f2@codethink.co.uk>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_161221_678716_C4D844C3 
X-CRM114-Status: GOOD (  26.14  )
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

Le 3/19/21 =E0 11:09 AM, Ben Dooks a =E9crit=A0:
> On 19/03/2021 15:03, Alex Ghiti wrote:
>> Le 3/18/21 =E0 6:41 PM, Ben Dooks a =E9crit=A0:
>>> The <asm/uaccess.h> header has a problem with
>>> put_user(a, ptr) if the 'a' is not a simple
>>> variable, such as a function. This can lead
>>> to the compiler producing code as so:
>>>
>>> 1:=A0=A0=A0 enable_user_access()
>>> 2:=A0=A0=A0 evaluate 'a'
>>> 3:=A0=A0=A0 put 'a' to 'ptr'
>>> 4:=A0=A0=A0 disable_user_acess()
>>>
>>> The issue is that 'a' is now being evaluated
>>> with the user memory protections disabled. So
>>> we try and force the evaulation by assinging
>>> 'x' to __val at the start, and hoping the
>>> compiler barriers in enable_user_access()
>>> do the job of ordering step 2 before step 1.
>>>
>>> This has shown up in a bug where 'a' sleeps
>>> and thus schedules out and loses the SR_SUM
>>> flag. This isn't sufficient to fully fix, but
>>> should reduce the window of opportunity.
>>
>> I would say this patch is enough to fix the issue because it only =

>> happens when 'a' *explicitly schedules* when in =

>> __enable_user_access()/__disable_user_access(). Otherwise, I see 2 cases:
>>
>> - user memory is correctly mapped and nothing stops the current process.
>> - an exception (interrupt or trap) is triggered: in those cases, the =

>> exception path correctly saves and restores SR_SUM.
> =

> This fixes part of the other issue.
> =

> I did point out in the other email there could be longer cases
> where the protections are disabled. The saving of the flags over
> switch_to() is still necessary.

I can't find your explanation, could you elaborate a bit more here on =

why this fix is not enough ?

Thanks !

> =

> Also, I am not sure if this will guarantee ordering. It does
> seem to fix it for the cases I checked
> =

>>>
>>> Cc: Arnd Bergman <arnd@arndb.de>
>>> ---
>>> =A0 arch/riscv/include/asm/uaccess.h | 8 ++++++--
>>> =A0 1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/riscv/include/asm/uaccess.h =

>>> b/arch/riscv/include/asm/uaccess.h
>>> index 824b2c9da75b..7bf90d462ec9 100644
>>> --- a/arch/riscv/include/asm/uaccess.h
>>> +++ b/arch/riscv/include/asm/uaccess.h
>>> @@ -306,7 +306,10 @@ do {=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>>> =A0=A0 * data types like structures or arrays.
>>> =A0=A0 *
>>> =A0=A0 * @ptr must have pointer-to-simple-variable type, and @x must be =

>>> assignable
>>> - * to the result of dereferencing @ptr.
>>> + * to the result of dereferencing @ptr. The @x is copied inside the =

>>> macro
>>> + * to avoid code re-ordering where @x gets evaulated within the =

>>> block that
>>> + * enables user-space access (thus possibly bypassing some of the =

>>> protection
>>> + * this feautre provides).
>>> =A0=A0 *
>>> =A0=A0 * Caller must check the pointer with access_ok() before calling =
this
>>> =A0=A0 * function.
>>> @@ -316,12 +319,13 @@ do {=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>>> =A0 #define __put_user(x, ptr)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 \
>>> =A0 ({=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>>> =A0=A0=A0=A0=A0 __typeof__(*(ptr)) __user *__gu_ptr =3D (ptr);=A0=A0=A0=
=A0=A0=A0=A0 \
>>> +=A0=A0=A0 __typeof__(*__gu_ptr) __val =3D (x);=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 \
>>> =A0=A0=A0=A0=A0 long __pu_err =3D 0;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 \
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>>> =A0=A0=A0=A0=A0 __chk_user_ptr(__gu_ptr);=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 \
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>>> =A0=A0=A0=A0=A0 __enable_user_access();=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>>> -=A0=A0=A0 __put_user_nocheck(x, __gu_ptr, __pu_err);=A0=A0=A0=A0=A0=A0=
=A0 \
>>> +=A0=A0=A0 __put_user_nocheck(__val, __gu_ptr, __pu_err);=A0=A0=A0=A0=
=A0=A0=A0 \
>>> =A0=A0=A0=A0=A0 __disable_user_access();=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 \
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>>> =A0=A0=A0=A0=A0 __pu_err;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 \
>>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
> =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
