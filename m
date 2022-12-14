Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D5BC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Dec 2022 22:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYuO+AGhzY3WCm9aoAIzBlaeftzUAdg/phSFmjG0SfY=; b=x2Ual+RMXrdbIB
	9KlZWc23aM3k3MhZHAmXjWPDl8fk5yzNid8yCFMzTi2MpfZ8nic+5mAN2JNEcv3Zhn6EaczHyIO7E
	i6bELFPyn+cWT8K+fCQkS/2XSc7gSkIFC0xXvlYlMvm32Mih0suykCqAKuU719TXCKOMWPMA6/hvn
	WixCWqWmADA1h6hP6FkLM0FiVphYVRNWUDAfF0UQqlJgzIby/xjJ83YgWuKzscWGRnBPND+BxKLNy
	PXANh8JRoo4be9ZaLiU37453U4/cUYnSVPQQI2jjniH3XH284ZWWN5aXyXT5xeQN845aP5ztFT7GC
	09wmTU/BgqDRCJ+oxVDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5ZvA-003Unr-Gj; Wed, 14 Dec 2022 22:08:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Zv6-003Ui5-TN
	for linux-riscv@lists.infradead.org; Wed, 14 Dec 2022 22:08:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CA6FFEC;
	Wed, 14 Dec 2022 14:08:36 -0800 (PST)
Received: from [10.57.88.237] (unknown [10.57.88.237])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBDF43F5A1;
	Wed, 14 Dec 2022 14:07:54 -0800 (PST)
Message-ID: <2690fe3e-d68e-5e2b-d9fa-31ce1ccf5ff9@arm.com>
Date: Wed, 14 Dec 2022 22:07:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] RISC-V: Disable IPMMU_VMSA on rv32
Content-Language: en-GB
To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Conor Dooley <conor@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@rivosinc.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
References: <20221214180409.7354-1-palmer@rivosinc.com>
 <8DACBAC8-F220-4DA7-BCC2-4E2ED9E3E03E@kernel.org>
 <b8665f9d-44cf-5719-c206-5eb622978b1a@arm.com>
 <OSZPR01MB7019D761845E3AC9E30F2D2DAAE09@OSZPR01MB7019.jpnprd01.prod.outlook.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <OSZPR01MB7019D761845E3AC9E30F2D2DAAE09@OSZPR01MB7019.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_140809_080031_FC2E11E3 
X-CRM114-Status: GOOD (  11.01  )
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

On 2022-12-14 21:40, Prabhakar Mahadev Lad wrote:
> Hi,
> 
>> -----Original Message-----
>> From: Robin Murphy <robin.murphy@arm.com>
>> Sent: 14 December 2022 21:04
>> To: Conor Dooley <conor@kernel.org>; linux-riscv@lists.infradead.org; Palmer Dabbelt
>> <palmer@rivosinc.com>; arnd@arndb.de; iommu@lists.linux.dev
>> Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> Subject: Re: [PATCH] RISC-V: Disable IPMMU_VMSA on rv32
>>
>> On 2022-12-14 19:46, Conor Dooley wrote:
>>>
>>>
>>> On 14 December 2022 10:04:09 GMT-08:00, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>>> Without this I get a Kconfig warning and then subsequent build
>>>> failure when building allmodconfig on rv32.
>>>>
>>>> WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
>>>>    Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=y] && !GENERIC_ATOMIC64
>> [=y])
>>>>    Selected by [y]:
>>>>    - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] ||
>>>> COMPILE_TEST [=y]
>>>
>>> This here is your problem afaict
>>> I got a report from lkp about it yesterday, "blaming" Prabhakar for it:
>>> https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore
>>> .kernel.org%2Fall%2F202212142355.b7vf3Jh0-lkp%40intel.com%2F&amp;data=
>>> 05%7C01%7Cprabhakar.mahadev-lad.rj%40bp.renesas.com%7Ca51ccd27ccda45e7
>>> 53c208dade16c553%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C63806648
>>> 6632283001%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI
>>> iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=FshRCpnIoU0b
>>> c38MYnesotcgOV4JT%2FXVOidbDMpAWbc%3D&amp;reserved=0
>>>
>>> I hate selects, just ignores the dependency :(
>>>
>>>    && !GENERIC_ATOMIC64 [=y])
>>
>> I think the existing assumption was that ARCH_RENESAS implied !GENERIC_ATOMIC64. If that is no longer
>> true then please feel free to adjust drivers/iommu/Kconfig to suit.
>>
> IPMMU is not available on Renesas RISCV SoCs, so maybe something like below?

Seems fair to me, especially if it also means hiding a pointless choice 
for a normal interactive config :)

Cheers,
Robin.

> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -283,7 +283,7 @@ config EXYNOS_IOMMU_DEBUG
> 
>   config IPMMU_VMSA
>          bool "Renesas VMSA-compatible IPMMU"
> -       depends on ARCH_RENESAS || (COMPILE_TEST && !GENERIC_ATOMIC64)
> +       depends on (ARCH_RENESAS && !RISCV) || (COMPILE_TEST && !GENERIC_ATOMIC64)
>          select IOMMU_API
>          select IOMMU_IO_PGTABLE_LPAE
>          select ARM_DMA_USE_IOMMU
> 
> Cheers,
> Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
