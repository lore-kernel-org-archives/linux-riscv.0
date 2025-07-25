Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D156C87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 16:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=1vjUER+gjL4DrjrZkX/GzBPqwo6jJMli794Y/fo5fsE=; b=Ao1dQj3TW8NvPk
	FElgWNXyCPuLgECsOq7zEdxsQ9wHea5qBBC5s6QfoVVirZ2Y/Rb19SdTRixCAmiGyG5DnK2rLzDQo
	vD9QPLcAJXXnNaowWPF011vtewEE9SOohZrunNxrv21wItPYOxpTT02O66fxoOPi6LLVtXCHRsows
	dhDWx7f779pLBTWWJ8QcnZGoEcZ2RuH9S8qcPKGznPAMrBtmspHEMPzgdRqAE/U2fZFS4skBRL3eP
	zLsFjG3e2Dkbgxr6mIuS1xw58n7Ww6LE/OoMqelBV3RCwn0FOfhbqEqXyG29oaJLx9qVIphCTRwk2
	Z1sN4V4de59iCMlkeieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLJf-0000000AEM6-0Yg0;
	Fri, 25 Jul 2025 16:30:39 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLJ6-0000000AEIG-48eG
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 16:30:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753461001; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aEUfV3gZVITtA1V4+T10FU6Zp2cRgW/Vw5mIpQxxGoDgll87FQIaTDiIXFo5ZVo4vzQzc/qnq5oLr6gI9nJSvkDMs3NCtiKVnSWKzD6AchL1uKpJpgr0F8VVDPEMhoif9W7vuvqQfP9NKwaKyiMlUZT1D3Wk1NBPAS77+YxQjs8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753461001; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=V7UB6j/9y8mHrSKKCeR3NkchjsE3+xKogIfJfdZ88s0=; 
	b=GFU9/Ul0PVlcWPc8Ahil1Rsp5NWpbSGc+r5+ZPzm5Y5yMqTHz3BY/oac4k3LAsb0Ox3FVqtp8pQv3nSve8M/0sNt4yvw1j3TiuV+fipIYkNZucGgLUPG1RIbti9Ds7Js0M1PPEXDF7Qdz+IMAX2YTKClak8orVT1a1qzOgrjPtI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753461001;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=V7UB6j/9y8mHrSKKCeR3NkchjsE3+xKogIfJfdZ88s0=;
	b=pE4Yj3S2YyEqZb3A5ZEkjA2Va9iGhnyexrnASyMU0nA9Zqz/hPDuOFX7ocJMDxTV
	lB3Q9O0vvF/ug/RyVl7uEk7CXR+qcSBj6rIjR9HtW0VZQj332/Q29s48VDEBOMb9Ixm
	3wAyQIQE65qqK25mrV2+n1P/XI3XiMNWZqdACOXU=
Received: by mx.zohomail.com with SMTPS id 1753460998721142.7352358306208;
	Fri, 25 Jul 2025 09:29:58 -0700 (PDT)
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>
In-Reply-To: <e7499ddb-04f6-4891-bbce-38bb80a87401@ghiti.fr>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] riscv: mm: Use mmu-type from FDT to limit SATP mode
Message-ID: <18558b7c6df10da0.2100f58a3d0fe250.7de105a1ea2dd0f@Mac>
Date: Fri, 25 Jul 2025 16:29:56 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_093005_422717_5AC09CEA 
X-CRM114-Status: GOOD (  17.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 25/07/2025 16:04, Alexandre Ghiti wrote:
> On 7/21/25 18:53, Junhui Liu wrote:
>> Some RISC-V implementations may hang when attempting to write an
>> unsupported SATP mode, even though the latest RISC-V specification
>> states such writes should have no effect. To avoid this issue, the
>> logic for selecting SATP mode has been refined:
>>
>> The kernel now determines the SATP mode limit by taking the minimum of
>> the value specified by the kernel command line (noXlvl) and the
>> "mmu-type" property in the device tree (FDT). If only one is specified,
>> use that.
>> - If the resulting limit is sv48 or higher, the kernel will probe SATP
>>    modes from this limit downward until a supported mode is found.
>> - If the limit is sv39, the kernel will directly use sv39 without
>>    probing.
>>
>> This ensures SATP mode selection is safe and compatible with both
>> hardware and user configuration, minimizing the risk of hangs.
>>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>   arch/riscv/kernel/pi/fdt_early.c | 40 ++++++++++++++++++++++++++++++++++++++++
>>   arch/riscv/kernel/pi/pi.h        |  1 +
>>   arch/riscv/mm/init.c             | 11 ++++++++---
>>   3 files changed, 49 insertions(+), 3 deletions(-)
>>

[...]

> 
> I guess it's more convenient to use the 'mmu-type' property on this core 
> rather than using no4lvl right?

Yes, It's hard to ensure that all the users are aware of the need to use
the 'no4lvl', and the cmdline args can easily be overridden by the
bootloader or users if a `bootargs = "no4lvl"` is defined in the device
tree. Therefore, relying on the 'mmu-type' property is more robust and
user-friendly.

> 
> Anyway, what you implemented matches the description of the 'mmu-type' 
> binding, so:
> 
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> I'll take that for 6.17.

Thanks!

> 
> Thanks,
> 
> Alex

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
