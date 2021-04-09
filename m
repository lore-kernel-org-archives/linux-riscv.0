Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15650C433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 08:57:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC37E611B0
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 08:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC37E611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TTlkBxMjCmvgb5fwIqaVeU/eHxwaJ8kXZy90yRKIrfE=; b=eKFY81VmHbpyngbbjdPupwwiW
	fSfgoo1yoQ+EBSk9VGU3FJGuPQpUVZVfn0/TRIbYe+7fB6E0HHFSAMCBAPxDIlTV8nc0ysxxHSmMQ
	vaL6gw7laEd80cQlI+l1llTHjEVR17DD5tUPeV4ljeWOp7eOtKZUF5abxcl68/kLsfQBu7gaIAL/8
	3VPAPXwxcTJSLUongU7YQwwHKhmT16V5HQ5k92a/XYZevZADUq4j4vquJtm/oGeAxQ96uBiL9f8Jz
	+MMxypQnUXMciRK6cNCgCxU9OKH0n5YjbdSoj1U3NtDqYAJEdKsXJmk9ufXeu4fi7J8W8lRfl23HH
	Jmj2qDr3w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUmxJ-0008Bu-5U; Fri, 09 Apr 2021 08:57:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUmuv-0007NC-6Y
 for linux-riscv@desiato.infradead.org; Fri, 09 Apr 2021 08:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=+Lv1xi2rWJ5yRIh4+TdoUCqqtFfPI9aAvbsbdYOtFqI=; b=ITDHx2/UYF4NRFOKSdfG2v/4XE
 pMUbhgDokx6r3DsRmYX/TERmhYQjSoyBVqQxmsDqWlg9/9KGxoNIl0eCuMb12QUPaxCEAHTXibY5k
 HsvknwviOrVUQSckYlpRVFtod9++OL43ZVh3CeTT5pWPSgDsBMxFCsBmb0AXVelE6UvLf61EPOxae
 GSe2TgkMx+fzMh1w2q8yAu29/GNWPZUlKFhpGZ4LY0SoXkB/CwS0OJryD8dLtiGAtiOaiE3tbNMVR
 2wn4rMOHLHE4emx6gBHuW6nYRjWzoDsMx1+1nYjrLMO50Sqs+APMG2ffXlTO4dyRVH9srlHy2QE4q
 2/nQCaWQ==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lUmus-003cbf-6T
 for linux-riscv@lists.infradead.org; Fri, 09 Apr 2021 08:55:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 998CD1FB;
 Fri,  9 Apr 2021 01:54:56 -0700 (PDT)
Received: from e123427-lin.arm.com (unknown [10.57.43.181])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B6863F73D;
 Fri,  9 Apr 2021 01:54:52 -0700 (PDT)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: jh80.chung@samsung.com, zong.li@sifive.com, robh+dt@kernel.org,
 vidyas@nvidia.com, alex.dewar90@gmail.com, erik.danie@sifive.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 mturquette@baylibre.com, Greentime Hu <greentime.hu@sifive.com>,
 aou@eecs.berkeley.edu, sboyd@kernel.org, hayashi.kunihiko@socionext.com,
 hes@sifive.com, khilman@baylibre.com, p.zabel@pengutronix.de,
 bhelgaas@google.com, helgaas@kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH v5 0/6] Add SiFive FU740 PCIe host controller driver
 support
Date: Fri,  9 Apr 2021 09:54:46 +0100
Message-Id: <161795835843.16967.18210803147557738620.b4-ty@arm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210406092634.50465-1-greentime.hu@sifive.com>
References: <20210406092634.50465-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_015502_310162_A65713A5 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

On Tue, 6 Apr 2021 17:26:28 +0800, Greentime Hu wrote:
> This patchset includes SiFive FU740 PCIe host controller driver. We also
> add pcie_aux clock and pcie_power_on_reset controller to prci driver for
> PCIe driver to use it.
> 
> This is tested with e1000e: Intel(R) PRO/1000 Network Card, AMD Radeon R5
> 230 graphics card and SP M.2 PCIe Gen 3 SSD in SiFive Unmatched based on
> v5.11 Linux kernel.
> 
> [...]

Applied to pci/dwc [dropped patch 6], thanks!

[1/6] clk: sifive: Add pcie_aux clock in prci driver for PCIe driver
      https://git.kernel.org/lpieralisi/pci/c/f3ce593b1a
[2/6] clk: sifive: Use reset-simple in prci driver for PCIe driver
      https://git.kernel.org/lpieralisi/pci/c/0a78fcfd3d
[3/6] MAINTAINERS: Add maintainers for SiFive FU740 PCIe driver
      https://git.kernel.org/lpieralisi/pci/c/8bb1c66a90
[4/6] dt-bindings: PCI: Add SiFive FU740 PCIe host controller
      https://git.kernel.org/lpieralisi/pci/c/b86d55c107
[5/6] PCI: fu740: Add SiFive FU740 PCIe host controller driver
      https://git.kernel.org/lpieralisi/pci/c/327c333a79

Thanks,
Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
