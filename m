Return-Path: <SRS0=q/zc=LH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22F8C48BDF
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 06:15:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 774DD611CC
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 06:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 774DD611CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCLdEkU18Slx/KAdsRBuH1uEo4mMB5eKVZ6pcBcuPJY=; b=tizK1mcWvK/HIEz8tbNZuU3mCk
	Cb6dh8n5GO8zWmSHfVUqQdykE9JSAedCtgltFPoGEpSlTeqNoPYAb65TUN99IJyJWbjdulkuRycXG
	beCeySWPTZz8udtDT+e2kxuaYok1Pp9qrIclT5svAcHufggMseyf/UEEccD22F7o8IfTiwJQmSPRB
	m3a2kqwXHSICYKRaYpZyBQzoq0ePRpUmV2xzGfu7W2PlPDTW0DsEyGknGTXBg5+Ve1TWRKQ25WndT
	a5qpF+vMoUFMYWeXtF2Lv17jTcGrsigE46VdM8ea83rmY27a1IgMf+Hyjr1Y3lQwkRk+G9TRWTK1I
	OjQhvcmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsJOo-009nHZ-3I; Sun, 13 Jun 2021 06:15:10 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsJOk-009nFp-B0
 for linux-riscv@lists.infradead.org; Sun, 13 Jun 2021 06:15:08 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 2C5B0E0006;
 Sun, 13 Jun 2021 06:14:54 +0000 (UTC)
Subject: Re: [PATCH v4 1/4] riscv: Remove CONFIG_PHYS_RAM_BASE_FIXED
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: emil.renner.berthing@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, jszhang@kernel.org,
 Christoph Hellwig <hch@infradead.org>, zong.li@sifive.com,
 anup@brainfault.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <CANBLGcy3HrnmrweSpnDZViVstoWJYh4sCBoaX_24AsgWd=Q9XA@mail.gmail.com>
 <mhng-dfabeabd-e6df-4035-a9d0-c16269390120@palmerdabbelt-glaptop>
 <20210613084447.6db3cc02@xhacker>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <98bfae5f-748e-f951-876a-254d98197e10@ghiti.fr>
Date: Sun, 13 Jun 2021 08:14:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210613084447.6db3cc02@xhacker>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_231506_676384_57EE0234 
X-CRM114-Status: GOOD (  23.05  )
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

Hi,

Le 13/06/2021 =E0 02:44, Jisheng Zhang a =E9crit=A0:
> On Sat, 12 Jun 2021 17:23:51 -0700 (PDT)
> Palmer Dabbelt <palmer@dabbelt.com> wrote:
> =

>> On Sat, 12 Jun 2021 16:23:03 PDT (-0700), emil.renner.berthing@gmail.com=
 wrote:
>>> On Fri, 4 Jun 2021 at 13:51, Alexandre Ghiti <alex@ghiti.fr> wrote:
>>>>
>>>> Make the physical RAM base address available for all kernels, not only
>>>> XIP kernels as it will allow to simplify address conversions macros.
>>>
>>> Am I just reading it wrong or won't this patch make it so that the same=
 kernel
>>> can't run on two chips with physical ram starting at different addresse=
s?
> =

> I mentioned this point in http://lists.infradead.org/pipermail/linux-risc=
v/2021-June/006840.html
> =

>>
>> IIUC we were in that position, at least without relocatable kernels.
>> Maybe I'm misunderstanding this, though?
> =

> Just my humble opinion, before this series patch, at least geneirc Image
> for RV64 + MMU + !XIP is doable.
> =


This patch declares that the physical ram address is at 0x8000_0000, =

whatever the chip, which may not be the case in practice. I did not =

expect Palmer would take this one and had planned to simply push a v5 =

without the first 2 patches, but things happened this week that =

prevented me to do that. IMO, we should just wait for a v5 that I'll =

push when possible (probably today or in the coming days).

Thanks,

Alex

> Thanks
> =

>>
>>>
>>> /Emil
>>>   =

>>>> ---
>>>>   arch/riscv/Kconfig | 6 ------
>>>>   1 file changed, 6 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>>> index b58596b141fc..3d8e7e4bb45c 100644
>>>> --- a/arch/riscv/Kconfig
>>>> +++ b/arch/riscv/Kconfig
>>>> @@ -493,13 +493,8 @@ config STACKPROTECTOR_PER_TASK
>>>>          def_bool y
>>>>          depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_TLS
>>>>
>>>> -config PHYS_RAM_BASE_FIXED
>>>> -       bool "Explicitly specified physical RAM address"
>>>> -       default n
>>>> -
>>>>   config PHYS_RAM_BASE
>>>>          hex "Platform Physical RAM address"
>>>> -       depends on PHYS_RAM_BASE_FIXED
>>>>          default "0x80000000"
>>>>          help
>>>>            This is the physical address of RAM in the system. It has t=
o be
>>>> @@ -512,7 +507,6 @@ config XIP_KERNEL
>>>>          # This prevents XIP from being enabled by all{yes,mod}config,=
 which
>>>>          # fail to build since XIP doesn't support large kernels.
>>>>          depends on !COMPILE_TEST
>>>> -       select PHYS_RAM_BASE_FIXED
>>>>          help
>>>>            Execute-In-Place allows the kernel to run from non-volatile=
 storage
>>>>            directly addressable by the CPU, such as NOR flash. This sa=
ves RAM
>>>> --
>>>> 2.30.2
>>>>
>>>>
>>>> _______________________________________________
>>>> linux-riscv mailing list
>>>> linux-riscv@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =

> =

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
