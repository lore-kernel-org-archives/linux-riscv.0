Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C48D30CC2
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 21:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=zufBSPiLw++wqgDe7ZBB8GQYyqGdnkoDdD6VOcLVVaQ=; b=uhB7BFZTAeOPOE
	/xSnRgFztk1TLG0ql6kECGDy57+UXsmkUM4LIPGiiZbwi7Lp+1oaX+6XNG5ve+x3M9Abzw8fFQkXT
	qvoj8wq8zLuk38OgE/nVqiHczS5KDlOFzk5qGEMbEj6WZ1YA/KljQ7mF5J6LMO9LPhwgK/5YLSeCd
	mpFgZL4ZQN9yr5O+Z87g1jq+qD7OBnEtEvG3/qCpdUQ58aTcoIkCW8mLHk+kRTewiXKow1HKfeIQg
	Uwri6d3jRGMksYjOYeVZAD8NL2OZMWkDCUbJZLOrs18U5Q2pnzTJ9CNcdV9Y9guKlgmM3tZ7I1vb1
	9W5WuC2L2UnCTmRdbU0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmMx-00000007mpI-3P1n;
	Tue, 13 Jan 2026 21:56:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmMw-00000007mpC-1M97
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 21:56:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62D7460017;
	Tue, 13 Jan 2026 21:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE4AC116C6;
	Tue, 13 Jan 2026 21:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768341365;
	bh=nTh7fFqg/LT3f9MdXlSs711AfVqGFXu1moivv8qFk5I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=KVL0x7JGjD1UDylwCNvsq33YOeWSQBFTiC0+Ys1LNYVg3J074Acwc7UY/GnO/DNyq
	 bJLC0dA+r3nyYWkHrnmVPpipU6qBFuHkj2OMXLTlhXXEzWkPR6A2q5u1TOqw1AFKVu
	 8qyG6Y41DcW1nKub4hyAYH2bmHsXswKGrL7ifknyOCEXV9TXlmfQ4seB+DEuXruxFn
	 YuroqYs2OUBOVmiy0BbTxnvQyW6Mq7lOVI8NcKftIPjl4yAPCvM0Ii9XYkM1p22XWQ
	 zD47bg2Mj+wKYHbFE5Cor0+hKEq+Lm7VChI96RChOIkk4o0RtwZ6TccRsGnMDLKkbT
	 rRiTy9Wd4sQ/A==
Date: Tue, 13 Jan 2026 15:56:03 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: huyuye <huyuye812@163.com>
Subject: Re: [PATCH v2] ACPI: pci_root: Clear the acpi dependencies after PCI
 root bridge initialization on RISC-V
Message-ID: <20260113215603.GA781891@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260112141630.2869-1-huyuye812@163.com>
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, hu.yuye@zte.com.cn, guo.chang2@zte.com.cn, deng.weixian@zte.com.cn, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, zuo.jiang@zte.com.cn, linux-acpi@vger.kernel.org, li.kunpeng@zte.com.cn, wu.jiabao@zte.com.cn, Len Brown <lenb@kernel.org>, lin.yongchun@zte.com.cn, Albert Ou <aou@eecs.berkeley.edu>, dai.hualiang@zte.com.cn, Bjorn Helgaas <bhelgaas@google.com>, Alexandre Ghiti <alex@ghiti.fr>, zhang.longxiang@zte.com.cn, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 12, 2026 at 10:16:29PM +0800, huyuye wrote:
> Hi Rafael,
> Thank you for your thorough review and valuable comments on v1.
> I've updated the patch as follows:
> 1. Removed the redundant #ifdef CONFIG_ACPI and if (!acpi_disabled) 
> guard as you pointed out. The entire code block indeed already depends
> on CONFIG_ACPI at a higher level, making the inner guard unnecessary.
> 2. Moved acpi_dev_clear_dependencies to RISC-V specific architecture 
> code (driver/acpi/riscv/acpi_pci.c). This ensures that ACPI dependency
> clearing is handled within the appropriate architectural context.
> 
> Best regards

This really should have the commit log here, as it did in the original
post [1].

> Signed-off-by: huyuye <huyuye812@163.com> 
> ---

And the description of the changes from v1 to v2 can go here, after
the "---" since it doesn't need to be part of the permanent git
history; see [2].

[1] https://lore.kernel.org/r/20251203140716.3065-1-huyuye812@163.com
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=v6.18#n784

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
