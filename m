Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2C7C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 12:18:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B947D61352
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 12:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B947D61352
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kwX08/74s+EL3jYDd4uXE4Q0zE71V9eOPkYRjlryuos=; b=Yt11mBWHx9nUweUD/Vhpgj9DI
	KhK7w026TTPCNFLueMhApe9cA2+weY2ni3aJW1ZFqkzZ4HNZrWaOgrR+NK/1Hl0XWwX1C2PxzX8gb
	4VAKWJG35ZgdhEag64KbaqzPqUqAa1i0T5Nv1kNC03eacOtRq6rsXqH+xlCmzTm3QtR7iVKvmE/c5
	f27AJ2Qo9pAhGeNtGX/v9ddxh8WPpo/I1++Y5eGxMaLAYIxEiYC6AJ2sqjd0UqPEDnioBsnvCDo2j
	kn3VpzMqZVw8cVtjIBT6XwGaFpT4y36e62zqFCXoiIMakkGrsTs73VjlpiAhsL71Iv29fzOYlRrXP
	KiP7YLFvA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc5c4-005bsD-Ka; Thu, 29 Apr 2021 12:17:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc5c2-005brz-N1
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 12:17:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=ZYa2s6CeOlyjWzbp7h/PAH3PUM0XgPsnXMjhhXnCjOw=; b=kO4yBBnyrpzIVcZIO/JF7o7LyG
 qZQ8ma8adTUvQ1gfQ2NpGiacnGFtC/+pJHqif0UW+/9EEsI4FAZd6a/rSD9tZHANxV+3ZLd9Bnt1q
 cqRmbFMZ4ToL1yq+oXTlltcNSt0hXCYljJXZdRtkaKKr9UftzpCT0UbqQ2fRWUM6+x0KBLF4yZ/8K
 HNqbDUSJM6KZBxiVfwsXB80wiFawVHy82wejQc/GR8bDAdAefdb9t2NRMiAqkaS38ofUo2/BKLIHe
 7oNGOJCmUxNFmQYIf+Nt5wLPfrU+5JtgFdnHEh3t+YFZtN4nalrvJ/Xa2dmoeXxcS9WDjyL6jkLmJ
 PgwewiIA==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc5bz-000cFN-UQ
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 12:17:45 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.100] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 02D596000D;
 Thu, 29 Apr 2021 12:17:39 +0000 (UTC)
Subject: Re: [PATCH] riscv: Disallow to build XIP_KERNEL with SOC_SIFIVE
To: Anup Patel <anup@brainfault.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
References: <20210429084541.28083-1-alex@ghiti.fr>
 <CAAhSdy0Wxjop+X2AUp8azDS9JdD21pmdapUjH0vU9rNBu7Evjg@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <6442db5b-ad37-3bb3-b828-caf3311569d0@ghiti.fr>
Date: Thu, 29 Apr 2021 08:17:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy0Wxjop+X2AUp8azDS9JdD21pmdapUjH0vU9rNBu7Evjg@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_051744_139161_A04B15BB 
X-CRM114-Status: GOOD (  22.35  )
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

Le 4/29/21 =E0 5:04 AM, Anup Patel a =E9crit=A0:
> On Thu, Apr 29, 2021 at 2:15 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>>
>> RISCV_ERRATA_ALTERNATIVE patches text at runtime which is not possible w=
hen
>> the kernel is executed from the flash in XIP mode, and as the SIFIVE
>> errata must be fixed somehow, disallow to build a XIP kernel that
>> supports SIFIVE socs.
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>> ---
>>   arch/riscv/Kconfig.erratas | 2 +-
>>   arch/riscv/Kconfig.socs    | 1 +
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
>> index d5d03ae8d685..9537dbd67357 100644
>> --- a/arch/riscv/Kconfig.erratas
>> +++ b/arch/riscv/Kconfig.erratas
>> @@ -2,7 +2,7 @@ menu "CPU errata selection"
>>
>>   config RISCV_ERRATA_ALTERNATIVE
>>          bool "RISC-V alternative scheme"
>> -       default y
>> +       default y if !XIP_KERNEL
>>          help
>>            This Kconfig allows the kernel to automatically patch the
>>            errata required by the execution platform at run time. The
>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>> index 00c2b205654c..9cb38bc9d7cd 100644
>> --- a/arch/riscv/Kconfig.socs
>> +++ b/arch/riscv/Kconfig.socs
>> @@ -9,6 +9,7 @@ config SOC_MICROCHIP_POLARFIRE
>>
>>   config SOC_SIFIVE
>>          bool "SiFive SoCs"
>> +       depends on !XIP_KERNEL
> =

> Does this mean that now all SOCs will have to explicitly say
> "depends on !XIP_KERNEL"
>  > How about adding "depends on !XIP_KERNEL" for RISCV_ERRATA_ALTERNATIVE=
 ?

In any case, I had to add this because I could not get rid of the =

following warnings:

WARNING: unmet direct dependencies detected for ERRATA_SIFIVE
   Depends on [n]: RISCV_ERRATA_ALTERNATIVE [=3Dn]
   Selected by [y]:
   - SOC_SIFIVE [=3Dy]

If you have a solution for that, without touching any SOC_* config, I'll =

take it.

I'll try to implement what Vitaly proposed as it sounds way better than =

this "bandage" patch.

Thanks Anup,

Alex

> =

> Regards,
> Anup
> =

>>          select SERIAL_SIFIVE if TTY
>>          select SERIAL_SIFIVE_CONSOLE if TTY
>>          select CLK_SIFIVE
>> --
>> 2.20.1
>>
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
