Return-Path: <SRS0=p8lL=J3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878FCC433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 08:10:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACA28610FA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 08:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACA28610FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yzzFWuhcEgNSVIgBmnNaARGgxKwK9gKooU/2CEdmwVk=; b=R2nKVm0yRaktoK/UfS/V21MIo
	m6zFdkXxuV+idTZ+sE/gBAlVFyHWeEuW5H8nL84rMnnSrQfigwPANEfsaOThsLIUg67/aEpvpM1DH
	AXGhXa2qACZXcWdiUgTzCJJEazL+J0Cjw7xHkaBXDUZZmhSTIE6FWpTp9NRhOX+e3BaCmQv3ureOl
	t8Zdz02zbSUkOLRmX4GhkDBiarM87u4qRUFEnG2IZOH8bmj66MEMPYE6m/DlBi+XILnMLL2W4EFl1
	hAt+kTYut5s4cgCNanzUhmnGLOre3qVz3j3RjfGn+YnvRrGKEQ/AeMZBtG14Fv9askKCUKfSWCi8L
	p2t5vWRRw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcODH-007Tqa-BW; Fri, 30 Apr 2021 08:09:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcODD-007Tpv-QW
 for linux-riscv@desiato.infradead.org; Fri, 30 Apr 2021 08:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=MjnBpm7YmGtZNaEIpsw9cH+Gt5V9+pXDtwyFlsNnTjc=; b=M8XmAwixRJ2JT6qOw1mS7doUFp
 FjUM23p+peJfnd5ljdchYG1ItAuuDcBWf5rKLeeK9pSPVZ3lZbtLbUtlUa6fyqvOoxCQabaMQGaou
 WhO33thmB77ZfKdeWytIXxdeYYZpsqY1R/gqSf9YQ7E/Rs2K8vISONpoEpP2UWRBjcBRP1QA12LC5
 aiUAYuPe6MjZ8A3fuV+RJqacinHdvSxqq6gELL42dYVkwwwPoKhC8n5LD4CW/MVhbn84B7CEG8fYE
 ZyeDceGbDlrEGiSkGu0Tg8XjJhy3eHMuvtqZRraUpw5XduhjnhCClDC0Mj4ysJmwQ/NcAvPD5q2Og
 CbI1rnsg==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcODA-001E42-DF
 for linux-riscv@lists.infradead.org; Fri, 30 Apr 2021 08:09:22 +0000
Received: from [192.168.1.100] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 172C6240020;
 Fri, 30 Apr 2021 08:09:14 +0000 (UTC)
Subject: Re: [PATCH] riscv: Disallow to build XIP_KERNEL with SOC_SIFIVE
From: Alex Ghiti <alex@ghiti.fr>
To: Vitaly Wool <vitaly.wool@konsulko.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20210429084541.28083-1-alex@ghiti.fr>
 <CAM4kBBK=yQ=jXYw85Ti7Y3EyGd11aOYt7QnD4+fFFkDhvrwcxA@mail.gmail.com>
 <1a4a0a88-6ff5-66ad-6819-53dd96f76849@ghiti.fr>
Message-ID: <35b97408-328a-a9cd-1bb8-6758f42bde2d@ghiti.fr>
Date: Fri, 30 Apr 2021 04:09:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1a4a0a88-6ff5-66ad-6819-53dd96f76849@ghiti.fr>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_010920_940376_7E009630 
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

Le 4/29/21 =E0 8:13 AM, Alex Ghiti a =E9crit=A0:
> Le 4/29/21 =E0 5:11 AM, Vitaly Wool a =E9crit=A0:
>> On Thu, Apr 29, 2021 at 10:47 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>>>
>>> RISCV_ERRATA_ALTERNATIVE patches text at runtime which is not =

>>> possible when
>>> the kernel is executed from the flash in XIP mode, and as the SIFIVE
>>> errata must be fixed somehow, disallow to build a XIP kernel that
>>> supports SIFIVE socs.
>>
>> Could you please hold off this patch for a bit? I will try to come up
>> with an alternative solution. It should be possible to define a
>> special section within the RW area and place the functions that need
>> such patching there.
>> Not that I like that much but at least we'll keep the ability to use
>> XIP on SiFive.
> =

> Ok, I'm wondering why I did not think of that...I'll give it a try just =

> to punish myself.
> =

> Thanks Vitaly,
> =

> Alex
> =


I tried what you proposed and it works well, *callers* must be placed =

into this writable section in RAM and that's it, that may be more =

complicated if at some point the patched functions are generic but I =

think we can use an intermediate riscv function to patch instead or =

something else.

The modifications I did only consist in putting alternative section in =

RAM and place the exception vector table in this section.

If you can do the proper patch, I'll let you do it, otherwise I'll do =

that later as I have other things to do before.

So Palmer you can drop this patch.

Thanks again,

>>
>> Best regards,
>> =A0=A0=A0 Vitaly
>>
>>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>>> ---
>>> =A0 arch/riscv/Kconfig.erratas | 2 +-
>>> =A0 arch/riscv/Kconfig.socs=A0=A0=A0 | 1 +
>>> =A0 2 files changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
>>> index d5d03ae8d685..9537dbd67357 100644
>>> --- a/arch/riscv/Kconfig.erratas
>>> +++ b/arch/riscv/Kconfig.erratas
>>> @@ -2,7 +2,7 @@ menu "CPU errata selection"
>>>
>>> =A0 config RISCV_ERRATA_ALTERNATIVE
>>> =A0=A0=A0=A0=A0=A0=A0=A0 bool "RISC-V alternative scheme"
>>> -=A0=A0=A0=A0=A0=A0 default y
>>> +=A0=A0=A0=A0=A0=A0 default y if !XIP_KERNEL
>>> =A0=A0=A0=A0=A0=A0=A0=A0 help
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 This Kconfig allows the kernel to automa=
tically patch the
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 errata required by the execution platfor=
m at run time. The
>>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>>> index 00c2b205654c..9cb38bc9d7cd 100644
>>> --- a/arch/riscv/Kconfig.socs
>>> +++ b/arch/riscv/Kconfig.socs
>>> @@ -9,6 +9,7 @@ config SOC_MICROCHIP_POLARFIRE
>>>
>>> =A0 config SOC_SIFIVE
>>> =A0=A0=A0=A0=A0=A0=A0=A0 bool "SiFive SoCs"
>>> +=A0=A0=A0=A0=A0=A0 depends on !XIP_KERNEL
>>> =A0=A0=A0=A0=A0=A0=A0=A0 select SERIAL_SIFIVE if TTY
>>> =A0=A0=A0=A0=A0=A0=A0=A0 select SERIAL_SIFIVE_CONSOLE if TTY
>>> =A0=A0=A0=A0=A0=A0=A0=A0 select CLK_SIFIVE
>>> -- =

>>> 2.20.1
>>>
>>>
>>> _______________________________________________
>>> linux-riscv mailing list
>>> linux-riscv@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
