Return-Path: <SRS0=diLN=LP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1428C48BE5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 07:12:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C23C61205
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 07:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C23C61205
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98H2QZGoPzpXBP/kb/aBNy+oT5S5jqpB+ExcbezVk0w=; b=lkXtHFJ8oh9AU23pmYt/DrPw9n
	Gxa8S+L3JorN1UXmw/jhI2TJFcT6YdZARyxvkNkAdM5JMcRXMwPvg4W94Fe/F8fudFpI0ezzxSHdU
	CcpvwQkzNRzZKLLjNvB8ub14Io6YwJBlrqhNY0yhUPG0lZRnKrNpfvjRIC3c3tCXwWun0+CSPBztx
	8j0v1C65jmCKRquW9CCeJSlf32bX2LRYNjkXG7yKT2iZx6997YDWsuzk9ja6R23vvVWVpCOfcyQwQ
	NDHgwAmW4PQsRjclSccP9J4lAjBmSVGId6r0FPpiMh5dorLgWuFHhssFZDABJ3Pi9yuag6vP1YucR
	TGFa70dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvE60-002RKi-Q7; Mon, 21 Jun 2021 07:11:48 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvE5w-002RJw-UP
 for linux-riscv@lists.infradead.org; Mon, 21 Jun 2021 07:11:47 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 437B6240008;
 Mon, 21 Jun 2021 07:11:38 +0000 (UTC)
Subject: Re: [PATCH] riscv: Bump COMMAND_LINE_SIZE value to 1024
To: Palmer Dabbelt <palmer@dabbelt.com>, macro@orcam.me.uk
Cc: david.abdurachmanov@gmail.com, dvyukov@google.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-api@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <mhng-9e6b4607-6bea-411c-b843-916c1e0798ee@palmerdabbelt-glaptop>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <182c1d4e-a117-79d6-4dd1-8e3c8a447b4a@ghiti.fr>
Date: Mon, 21 Jun 2021 09:11:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <mhng-9e6b4607-6bea-411c-b843-916c1e0798ee@palmerdabbelt-glaptop>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_001145_314963_5716391B 
X-CRM114-Status: GOOD (  36.62  )
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

Hi Palmer,

Le 23/04/2021 =E0 04:57, Palmer Dabbelt a =E9crit=A0:
> On Fri, 02 Apr 2021 11:33:30 PDT (-0700), macro@orcam.me.uk wrote:
>> On Fri, 2 Apr 2021, David Abdurachmanov wrote:
>>
>>> > > >=A0 This macro is exported as a part of the user API so it must =

>>> not depend on
>>> > > > Kconfig.=A0 Also changing it (rather than say adding =

>>> COMMAND_LINE_SIZE_V2 or
>>> > > > switching to an entirely new data object that has its dimension =

>>> set in a
>>> > > > different way) requires careful evaluation as external binaries =

>>> have and
>>> > > > will have the value it expands to compiled in, so it's a part =

>>> of the ABI
>>> > > > too.
>>> > >
>>> > > Thanks, I didn't realize this was part of the user BI.=A0 In that =

>>> case we
>>> > > really can't chage it, so we'll have to sort out some other way =

>>> do fix
>>> > > whatever is going on.
>>> > >
>>> > > I've dropped this from fixes.
>>> >
>>> > Does increasing COMMAND_LINE_SIZE break user-space binaries? I would
>>> > expect it to work the same way as adding new enum values, or adding
>>> > fields at the end of versioned structs, etc.
>>> > I would assume the old bootloaders/etc will only support up to the
>>> > old, smaller max command line size, while the kernel will support
>>> > larger command line size, which is fine.
>>> > However, if something copies /proc/cmdline into a fixed-size buffer
>>> > and expects that to work, that will break... that's quite unfortunate
>>> > user-space code... is it what we afraid of?
>>> >
>>> > Alternatively, could expose the same COMMAND_LINE_SIZE, but internally
>>> > support a larger command line?
>>>
>>> Looking at kernel commit history I see PowerPC switched from 512 to
>>> 2048, and I don't see complaints about the ABI on the mailing list.
>>>
>>> If COMMAND_LINE_SIZE is used by user space applications and we
>>> increase it there shouldn't be problems. I would expect things to
>>> work, but just get truncated boot args? That is the application will
>>> continue only to look at the initial 512 chars.
>>
>> =A0The macro is in an include/uapi header, so it's exported to the userl=
and
>> and a part of the user API.=A0 I don't know what the consequences are for
>> the RISC-V port specifically, but it has raised my attention, and I think
>> it has to be investigated.
>>
>> =A0Perhaps it's OK to change it after all, but you'd have to go through
>> known/potential users of this macro.=A0 I guess there shouldn't be that =

>> many
>> of them.
>>
>> =A0In any case it cannot depend on Kconfig, because the userland won't h=
ave
>> access to the configuration, and then presumably wants to handle any and
>> all.
> =

> It kind of feels to me like COMMAND_LINE_SIZE shouldn't have been part =

> of the UABI to begin with.=A0 I sent a patch to remove it from the =

> asm-generic UABI, let's see if anyone knows of a reason it should be UABI:
> =

> https://lore.kernel.org/linux-arch/20210423025545.313965-1-palmer@dabbelt=
.com/T/#u =


Arnd seemed to agree with you about removing COMMAND_LINE_SIZE from the =

UABI, any progress on your side?

Thanks,

Alex

> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
