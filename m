Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49E7CA101C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 07:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMpZ+E883A4o3489acaELQcp0NvHqxAfj4pmGpLAXCI=; b=fnUs0K87i6azpF
	VH7c/+lmJOvLv+HvYjxfC4dGay6A0frul+zB+uSVTIbwxZDZTMWWoBa5rBr6yM1PpdFsHirlysCVh
	qv5WX3TNw3YDkugn1aOXlWQbVD836NbcSIQRvKwGRb/4owPtf8uao8ljmA6m2oYHQK5oYPu7Wh9MY
	bKpU8YjGB1YjwMo2kqSdqkCwRj84a3KoQaKpk5Ds61mcDnPfMZGuoqlayrYLwdnNmMn54fC0TLc4F
	MqvUL04gxhlmIBvJCLnm6cIqvMMRjNXpqfc78d0dZlBp5nYN8CTJ+1EnxNHi+RgrOaAkB1eYkPmKK
	KB8yZhUbL3CJpb7JeSnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4lG-0000000A0dQ-0ft1;
	Thu, 04 Sep 2025 07:52:02 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4TR-00000009tQz-49k6
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 07:33:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1756971210; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=chm57lNvJ9riBqQbo0LKStfYeAL1ujNx1RZ+faJKURC2EDz6dVAkX0mXCT+g2GNotQ/FJCSDO4Oiv8rfYrQ1zNOVlwl6oUeM+xUJg9HryRRvtd3HjpV9N0svGgWIDiNW+qk2ALOb57skhobci2jXzZhnCzNzrJNqkTe6ucUZWUk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756971210; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fCwqZzYjFLFE1aXsxQ6a7vK/RQ+fI8vudZin6LlNzRI=; 
	b=HqDTvMckkf/GLYlTyjCzQWYziLJjW6+slf1Ah/GdRIOHWQpjjGBCpGdo8DfO2FNkCB25i81be7tQju29hoFjyEIilOBmlZoA9B7c1R2QZFVg0RNcs4RvAHwSaVxz++Nr7hi8Kuo8MXirRlNk0X+uT2Ufs96d4hfAlCxTSbHusP8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756971210;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fCwqZzYjFLFE1aXsxQ6a7vK/RQ+fI8vudZin6LlNzRI=;
	b=VQCh6Vixphv4lpAxB9jBHVDb+fd2IxbakryIb2MoVcRIvySAz51xU+xPhI7JZM99
	Lxy2/zYQGTgKOrUNmGpOKZbjHelaqaEGc8OPf/C0L68RYiZ62ue4r95PGn100+q4GJG
	bn38YlzuMKCy2n9WKHH7mOABx/rmvPC6YjdmME5UHLItSXa5MVch+a2ACzCTmJHQdyo
	7iPv7KattTZNujvZ38YdKMdP3+d4+fRRsc4FEAmMuX5+5QRcwgc0NWeJj/OLLiqGyAj
	AGczcdtAIZyO1wcxV908ns2M41kbGFBzkaw5ObhftFFgc2KLr7OISZwj01foQO3A6GU
	QjvELnvkxA==
Received: by mx.zohomail.com with SMTPS id 175697120750530.399496796533526;
	Thu, 4 Sep 2025 00:33:27 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	etnaviv@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 7/7] [NOT FOR UPSTREAM] riscv: dts: thead: enable GC620 G2D on TH1520
Date: Thu,  4 Sep 2025 15:31:51 +0800
Message-ID: <20250904073151.686227-8-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904073151.686227-1-uwu@icenowy.me>
References: <20250904073151.686227-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_003338_084566_86EE8184 
X-CRM114-Status: UNSURE (   8.82  )
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

The T-Head TH1520 SoC contains a GC620 2D graphics accelerator.

Enable it in the devicetree to allow using etnaviv driver with it.

This patch is currently very dirty because it relies on the bootloader
leaving the clocks enabled, and the core clock is a fake one.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
No changes in v2.

 arch/riscv/boot/dts/thead/th1520.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 03f1d73190499..bc7dd7ee59dd5 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -225,6 +225,13 @@ aonsys_clk: clock-73728000 {
 		#clock-cells = <0>;
 	};
 
+	gc620_cclk: clk-gc620-fake {
+		compatible = "fixed-clock";
+		clock-frequency = <264000000>;
+		clock-output-names = "gc620_cclk";
+		#clock-cells = <0>;
+	};
+
 	stmmac_axi_config: stmmac-axi-config {
 		snps,wr_osr_lmt = <15>;
 		snps,rd_osr_lmt = <15>;
@@ -495,6 +502,18 @@ uart2: serial@ffec010000 {
 			status = "disabled";
 		};
 
+		/* Vivante GC620, 2D only */
+		g2d: gpu@ffecc80000 {
+			compatible = "vivante,gc";
+			reg = <0xff 0xecc80000 0x0 0x40000>;
+			interrupt-parent = <&plic>;
+			interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gc620_cclk>;
+			clock-names = "core";
+			status = "okay";
+		};
+
 		clk: clock-controller@ffef010000 {
 			compatible = "thead,th1520-clk-ap";
 			reg = <0xff 0xef010000 0x0 0x1000>;
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
