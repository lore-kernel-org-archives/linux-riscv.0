Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F81C77B7C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 18:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t+dibvplB+im9p9YzzZ1pw/W8Zu6L3RlccgRQ9APcpI=; b=e+sFCa7QtHD213
	RMgXDC+dwglOwZoLAZZLYxiO5tR9t+xOf/+0DyVNWZjQevB7M/hfG+M/SgeDNNv8IFImPczg0xHef
	KfhkJ23OMPl3fi7X4v96AtUZXUYK2VtpTxcVHIF2SX5jTcP9zjxkduZklY8jNBLRoKEEdU/00Ukup
	UbGi8awW5WAr4DFuIACSTy32qdPAxYmSa8lN8uXXrefCP936A6jTkYky7DByhXwHJHuVuYo9jPSjR
	6Gm97NGFeB1+3AcIOwbHJXv/jg4NnRrynMCx0b/Jv7Vh5yJx3MVHGJ9r2zm/CvHDFYFPcK6B4OSf3
	t0zTsHjw7SWJm7VgqBLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvjDC-00GYFo-0Z;
	Sun, 07 May 2023 18:34:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvjD9-00GYEs-3A
	for linux-riscv@lists.infradead.org;
	Sun, 07 May 2023 18:34:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8FF2B60FB1;
	Sun,  7 May 2023 18:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F993C433D2;
	Sun,  7 May 2023 18:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683484459;
	bh=Cwi9G0RC9sDhCBbFheRaOVgx+rmiAvtJuPLG5ht1r7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uNMPk3ntZAVS8YwlGv7g0/1DxLS+CXoeUiidi4/241Adf5EX2uPx2Ky9DwASPEh9P
	 tlnzGdYjzsgWdMnSbcVsFbQBkNwMNDiI4ceLzELguWR78J0trAbI/463xvg2mGEKSz
	 bUdNrvv8fgJ7YTZYWyWPg5bPNCyr7rMZyvkSM4VEzTtEX2/1HjNb7bq8J4HL9Hl83z
	 SEaXt+7YLPVlPuSIBZ6vLJEZFk75f2J/oqpDKppyCOxKVxYoOd9z/H5zbisZ0NmT2P
	 5XW600//wLg/3j+ctQVwLf0s7QvgsztjxL+oa3vs58PktKJBcGCOY6YdVjk/GD7Hl8
	 pdupIoJGBLpbQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH 2/5] riscv: Add the T-HEAD SoC family Kconfig option
Date: Mon,  8 May 2023 02:23:01 +0800
Message-Id: <20230507182304.2934-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230507182304.2934-1-jszhang@kernel.org>
References: <20230507182304.2934-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_113420_057328_1E5B0C0F 
X-CRM114-Status: UNSURE (   9.50  )
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

The first SoC in the T-HEAD series is light(a.k.a th1520), containing
quad T-HEAD C910 cores.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig.socs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 1cf69f958f10..ce10a38dff37 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -41,6 +41,12 @@ config ARCH_SUNXI
 	  This enables support for Allwinner sun20i platform hardware,
 	  including boards based on the D1 and D1s SoCs.
 
+config ARCH_THEAD
+	bool "T-HEAD RISC-V SoCs"
+	select ERRATA_THEAD
+	help
+	  This enables support for the RISC-V based T-HEAD SoCs.
+
 config ARCH_VIRT
 	def_bool SOC_VIRT
 
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
