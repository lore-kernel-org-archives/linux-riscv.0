Return-Path: <SRS0=Au/l=E2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7609DC5519F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2020 11:39:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BC222222A
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2020 11:39:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yLAxcEHK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BC222222A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FWK11Hffd9n/g3+6W2gxsKc1kbNbc/b0qURmiRn42f8=; b=yLAxcEHKm0YCdg4XzHlLapiS6
	nn/7cafghc7FFrEOG1R5TyK6kKLPv+6P3BqiSDJIMn1RHZHG4TyXvFyzCe12sbi/GSuagaSmMm6DA
	EMhjycNlO6gfiIfb17X538NwGu1Pj03OXWYiKpitsvsXuS5RO30yraLXwdDfK11ltU5M26NNxcRR7
	/Yo15aWszT8wHlJDJ30sg5b5ESOzbEehYGrADudnVB2wftlx4Ihjhf/CPGYiOw1myFvFJFowytw3q
	S68fi3cP5fpZgrNXlEAYma45KX/ZNoNKrB12US2DIr8nh8N4IdgIqWEVDDdD41/E3cy7Lhvs9dcmN
	OUkUv+/cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg4lZ-0002Bl-0S; Fri, 20 Nov 2020 11:39:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg4lP-00028v-LP; Fri, 20 Nov 2020 11:39:40 +0000
Received: from localhost.localdomain (unknown [2.26.170.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D418B22253;
 Fri, 20 Nov 2020 11:39:35 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, ardb@kernel.org,
 hch@lst.de
Subject: Re: [PATCH v7 0/7] arm64: Default to 32-bit wide ZONE_DMA
Date: Fri, 20 Nov 2020 11:39:34 +0000
Message-Id: <160587230018.19468.15360551479275381470.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119175400.9995-1-nsaenzjulienne@suse.de>
References: <20201119175400.9995-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_063939_820573_F62E4182 
X-CRM114-Status: GOOD (  10.72  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, jeremy.linton@arm.com,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-rpi-kernel@lists.infradead.org, guohanjun@huawei.com,
 linux-riscv@lists.infradead.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 19 Nov 2020 18:53:52 +0100, Nicolas Saenz Julienne wrote:
> Using two distinct DMA zones turned out to be problematic. Here's an
> attempt go back to a saner default.
> 
> I tested this on both a RPi4 and QEMU.

Applied to arm64 (for-next/zone-dma-default-32-bit), thanks!

[1/7] arm64: mm: Move reserve_crashkernel() into mem_init()
      https://git.kernel.org/arm64/c/0a30c53573b0
[2/7] arm64: mm: Move zone_dma_bits initialization into zone_sizes_init()
      https://git.kernel.org/arm64/c/9804f8c69b04
[3/7] of/address: Introduce of_dma_get_max_cpu_address()
      https://git.kernel.org/arm64/c/964db79d6c18
[4/7] of: unittest: Add test for of_dma_get_max_cpu_address()
      https://git.kernel.org/arm64/c/07d13a1d6120
[5/7] arm64: mm: Set ZONE_DMA size based on devicetree's dma-ranges
      https://git.kernel.org/arm64/c/8424ecdde7df
[6/7] arm64: mm: Set ZONE_DMA size based on early IORT scan
      https://git.kernel.org/arm64/c/2b8652936f0c
[7/7] mm: Remove examples from enum zone_type comment
      https://git.kernel.org/arm64/c/04435217f968

-- 
Catalin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
