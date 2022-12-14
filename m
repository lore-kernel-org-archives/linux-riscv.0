Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB4BC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Dec 2022 21:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVv6FUuqJQRj7fmxMDuvHDAhYiynv+wpDfZJ/iW3cPk=; b=4Dho3kbnFw/bKN
	zCY+ovZbcJdtxvm69nJFVfJHgHK9sq1Qo8ZGVm3IBxbtdltuNEdsOTWTCW57M1KxYaZoIAFSyyhWC
	ongNEAcyvl5IscevpG1p7Pj2fuiFGoVxVXxIN+EvhmH0dQJP+OfNkR7gMwFxgW3EwHlR8GfcYVBES
	PV6U1bgEZwpxD97hfPGio/aRu/mDqG05Cj1tClbM1+QmPfiESdtZ76jtpndwQMPn3Koqcq91lP9W8
	Wd3QgrRvmp5HTJmasOum6w0OM1esN2/vbrOw4hiSnC2UpZi2A4KTQlyyUYJj3GQaT90xJr2Yln9++
	rOrYasRUvh/Ae6brPvlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5YvP-002y1b-30; Wed, 14 Dec 2022 21:04:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5YvM-002xzH-Lw
	for linux-riscv@lists.infradead.org; Wed, 14 Dec 2022 21:04:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D3CFFEC;
	Wed, 14 Dec 2022 13:05:00 -0800 (PST)
Received: from [10.57.88.237] (unknown [10.57.88.237])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C66D3F71E;
	Wed, 14 Dec 2022 13:04:18 -0800 (PST)
Message-ID: <b8665f9d-44cf-5719-c206-5eb622978b1a@arm.com>
Date: Wed, 14 Dec 2022 21:04:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] RISC-V: Disable IPMMU_VMSA on rv32
Content-Language: en-GB
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@rivosinc.com>, arnd@arndb.de, iommu@lists.linux.dev
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com
References: <20221214180409.7354-1-palmer@rivosinc.com>
 <8DACBAC8-F220-4DA7-BCC2-4E2ED9E3E03E@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <8DACBAC8-F220-4DA7-BCC2-4E2ED9E3E03E@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_130420_805201_9964C070 
X-CRM114-Status: GOOD (  12.55  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2022-12-14 19:46, Conor Dooley wrote:
> 
> 
> On 14 December 2022 10:04:09 GMT-08:00, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>> Without this I get a Kconfig warning and then subsequent build failure
>> when building allmodconfig on rv32.
>>
>> WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
>>   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=y])
>>   Selected by [y]:
>>   - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=y]
> 
> This here is your problem afaict
> I got a report from lkp about it yesterday, "blaming" Prabhakar for it:
> https://lore.kernel.org/all/202212142355.b7vf3Jh0-lkp@intel.com/
> 
> I hate selects, just ignores the dependency :(
> 
>   && !GENERIC_ATOMIC64 [=y])

I think the existing assumption was that ARCH_RENESAS implied 
!GENERIC_ATOMIC64. If that is no longer true then please feel free to 
adjust drivers/iommu/Kconfig to suit.

Thanks,
Robin.

>> linux/drivers/iommu/io-pgtable-arm.c: Assembler messages:
>> linux/drivers/iommu/io-pgtable-arm.c:330: Error: unrecognized opcode `lr.d s4,0(s1)'
>> linux/drivers/iommu/io-pgtable-arm.c:332: Error: unrecognized opcode `sc.d.rl a5,s6,0(s1)'
>> make[5]: *** [linux/scripts/Makefile.build:250: drivers/iommu/io-pgtable-arm.o] Error 1
>> make[4]: *** [linux/scripts/Makefile.build:502: drivers/iommu] Error 2
>> make[3]: *** [linux/scripts/Makefile.build:502: drivers] Error 2
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> ---
>>
>> This one seems pretty ugly, but I like to at least have a workaround for
>> the allmodconfig failures before sending up a PR.
>> ---
>> arch/riscv/configs/32-bit.config | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/riscv/configs/32-bit.config b/arch/riscv/configs/32-bit.config
>> index f6af0f708df4..7a2fa9b37b1c 100644
>> --- a/arch/riscv/configs/32-bit.config
>> +++ b/arch/riscv/configs/32-bit.config
>> @@ -2,3 +2,4 @@ CONFIG_ARCH_RV32I=y
>> CONFIG_32BIT=y
>> # CONFIG_PORTABLE is not set
>> CONFIG_NONPORTABLE=y
>> +CONFIG_IPMMU_VMSA=n
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
