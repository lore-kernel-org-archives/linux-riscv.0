Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE33C3ABBE
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 02:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NSkAnfq/CpSm0l1T/nEVUj7YYMBfY8yTjmScAnFdxpI=; b=HJjn/j+QYs8UHD
	7J9sBaZme9xuPA1gVR0ZtjDr9RiNd0+l29tzST+XoH7V56wCuyOso3Nu+KAFafAsLc+z970k+uFXE
	7C+Qg0sM7iMscwTtnrvsKceVI5QhlyHAT12Tuy4zv4XEYTtM6w9CbxQwTaA645baodNZHyBI63mqN
	2wHKdXaCplwXMOE/uPLHCmjfc6KAJbJG17XZLnsFOT19YWucHPHk93wroi8s7YRiYuFOPTuPkvaUT
	4ZHObuPhBqtiiydMeOg/CkeFGVLpXcJ7vIcMIgKzyAAYfjAQ+1I0nKeijW1IsXKaBwSHfBxMSDYOS
	OWOURRtXb8qIpbekH1EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUbk-0000000DwTi-0gTB;
	Wed, 07 May 2025 02:34:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPry-0000000DQih-0Vw0
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 21:30:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91FC74A06A;
	Tue,  6 May 2025 21:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CB3C4CEE4;
	Tue,  6 May 2025 21:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567029;
	bh=tHVSCMowVHak9eFvdfPawbHvEbN8M8vOtdhU5mpQIbU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tIxHCMEVNzGmZlsR7hg0FiY2js/ySu7vVNW0VTozqzvoEdwXRqRhVKo00FIIcTvVD
	 jBH2l5E0TL6aBm7Fw3hHCJctfykIjwrQGnrzoFKMsixFIEQVVGRA1G8winWudeS6sz
	 Rynlhtjp5LckOsx6gnK8G33zda4cT+oGr4repRWgN2DRqQvEX7DVuSNPfxCyCPnc1I
	 xZozNJY0PeBs43kwRdMWdQmGj9bCxPoq80+9NggkdGwq4L4mWXIPMXZItq9wXiSD3o
	 bCLAcvDZxCC7PsjLm+78YJH7SBW1PJunjrcn1Khu9F0A68ExXqAd0yvNWNq5QSWtIQ
	 NZ3FLz3dBHoBA==
Message-ID: <c46de621e098b7873a00c1af4ca550a1@kernel.org>
MIME-Version: 1.0
In-Reply-To: <475c9a27-e1e8-4245-9ca0-74c9ed663920@samsung.com>
References: <20250403094425.876981-1-m.wilczynski@samsung.com> <CGME20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319@eucas1p2.samsung.com> <20250403094425.876981-4-m.wilczynski@samsung.com> <Z/BoQIXKEhL3/q50@x1> <17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com> <9ce45e7c1769a25ea1abfaeac9aefcfb@kernel.org> <475c9a27-e1e8-4245-9ca0-74c9ed663920@samsung.com>
Subject: Re: [PATCH v7 3/3] riscv: dts: thead: Add device tree VO clock controller
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
To: Drew Fustini <drew@pdp7.com>, Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 06 May 2025 14:30:27 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_143030_201596_0C9BB6E7 
X-CRM114-Status: GOOD (  17.94  )
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

Quoting Michal Wilczynski (2025-04-30 00:52:29)
> 
> In the v2 version of the patchset, there was no reset controller yet, so
> I thought your comment was made referring to that earlier version.
> This representation clearly describes the hardware correctly, which is
> the requirement for the Device Tree.
> 
> The manual, in section 5.4.1.6 VO_SUBSYS, describes the reset registers
> starting at 0xFF_EF52_8000:
> 
> GPU_RST_CFG             0x00
> DPU_RST_CFG             0x04
> MIPI_DSI0_RST_CFG       0x8
> MIPI_DSI1_RST_CFG       0xc
> HDMI_RST_CFG            0x14
> AXI4_VO_DW_AXI          0x18
> X2H_X4_VOSYS_DW_AXI_X2H 0x20
> 
> And the clock registers for VO_SUBSYS, manual section 4.4.1.6 start at offset 0x50:
> VOSYS_CLK_GATE          0x50
> VOSYS_CLK_GATE1         0x54
> VOSYS_DPU_CCLK_CFG0     0x64
> TEST_CLK_FREQ_STAT      0xc4
> TEST_CLK_CFG            0xc8
> 
> So I considered this back then and thought it was appropriate to divide
> it into two nodes, as the reset node wasn't being considered at that
> time.
> 
> When looking for the reference [1], I didn't notice if you corrected
> yourself later, but I do remember considering the single-node approach
> at the time.
> 

If the two register ranges don't overlap then this is probably OK. I
imagine this is one device shipped by the hardware engineer, VO_SUBSYS,
which happens to be a clock and reset controller. This is quite common,
and we usually have one node with both #clock-cells and #reset-cells in
it. Then we use the auxiliary bus to create the reset device from the
clk driver with the same node. This helps match the device in the
datasheet to the node and compatible in DT without making the compatible
provider specific (clk or reset postfix).

That's another reason why we usually have one node. DT doesn't describe
software, i.e. the split between clk and reset frameworks may not exist
in other operating systems. We don't want to put the software design
decisions into the DT.

It may also be that a device like this consumes shared power resources
like clks or regulators that need to be enabled to drive the device, or
an IOMMU is used to translate the register mappings. We wouldn't want to
split the device in DT in that case so we can easily manage the power
resources or memory mappings for the device.

TL;DR: This is probably OK, but I'd be careful to not make it a thing.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
