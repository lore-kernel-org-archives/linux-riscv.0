Return-Path: <SRS0=U2Mo=NA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BABDECDE3D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 20 Oct 2018 13:50:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFA77204FD
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 20 Oct 2018 13:50:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mE5iTzpM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RdWIrKup"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFA77204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8F7S9OWetKBfNuotzeRX0MYznDE8WHyVi6EfqoZo6JM=; b=mE5iTzpMWP9pQp
	XYAaBjXlpIPToqcJNewKX4yBnsypqVArGSqZ/QIF84iTGrl3v4JjbyMxszBxuPG4iADZ7QsPaRx4o
	0aiyoVQI9BJtZtZ9soQxFbud8Vx8WiIcXt3ns9IFTLacaQyQUswYfRIuHoayUgeW5tVF0xTDxzZvq
	KtFNhvQnuyK3K7CrsQ3sRFLwkkWKNO30UzskgotOEBDbaBN4qb/dUATHt6SaTNrIQj62D04eU8Ovw
	zvtQ0f1Va6l98omZgvHetXPXVf/VuDgZAHDaXV1a5E7YWUEaZSx2O49TH+1L7lDHzDdMlzWLfJ9Zl
	YH8vYkwbNK/PdZKMHEuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gDreZ-00026I-N8; Sat, 20 Oct 2018 13:50:55 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDreV-00022t-AE
 for linux-riscv@lists.infradead.org; Sat, 20 Oct 2018 13:50:53 +0000
Received: by mail-wr1-x444.google.com with SMTP id l6-v6so39819823wrt.1
 for <linux-riscv@lists.infradead.org>; Sat, 20 Oct 2018 06:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TwLCHpP8kf+4rr/NbIN453XbTBZTe4XodmQVrexotJY=;
 b=RdWIrKupHcDvm18Sfo9zS/lrKGcwiUvge3qibXzdVmaed+ACU+7HnBHQMPlvut8W5J
 FgOsCoi5GXfb2mujHsZ/AVCommDwAPmYQAOFpg/gajevBp4NHPqDjKmKKdlQ6WXPKahy
 Azs+icTGaoh5BQ3NDLvsUBoNR05C/khgIIYl62Hg5tVHcD+t3sCZEGKBGEBoOVNDFyRp
 AU72yPT+gMZak0Q/frX18AUp3iVrOh7COPpxh0o2X2qwjtryQ45M14k/UmnR0l4TCpdX
 OPgf/MmBaKcTStXOQBNp17zc6nEHSBB+Kkcbsay2SPd5y9WYUThXFNgJZ2ljGpjau9fb
 +VuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TwLCHpP8kf+4rr/NbIN453XbTBZTe4XodmQVrexotJY=;
 b=PlI+Wi9jGADZ5e8nvmy37P2fJm18494L7f+xamA+ISu3Wrf2tSmoQZGX8l3oHW0S8E
 5hxBU6IJdWHCVZTqRNPkEtfRGim9rXZFc7IwSMC9MZmjwByJaIugbuNjdAarILtqk6Xg
 9Yx8gF/8mRJAdsb/YxPKUCZctw6M8YQF16wn55qMEi0t+0VTrcBBz07OY8mE3zgPdGhP
 TjCOb1vNgxcARVYrb04rDwY8HoYjlWGsbHgSiDEmNQEWImb3dCyqrh/0pqlhZdXCzec4
 o5duwTJ2ReFnc11c/8mNe953AfYBw3gtLc9Lxsz+jJN/m01wHpbgWvPPSDih5fV+hGY1
 Utig==
X-Gm-Message-State: ABuFfohnm8d4Ad1VbMyRWwUxLcouwamYJjdtT6daAozN2WfxVx2qvOi0
 zZmySpj/Ai6DuMBsUJ2bShVtqg==
X-Google-Smtp-Source: ACcGV61PlikZUj7Qbw+Lc/0wkLSwO/nJIyd8fEDd9dpzZWi3QLt9RKDFst4+6CBC5bnhigN2ytGl3w==
X-Received: by 2002:adf:ecc9:: with SMTP id
 s9-v6mr36018146wro.142.1540043439647; 
 Sat, 20 Oct 2018 06:50:39 -0700 (PDT)
Received: from viisi.sifive.com ([37.152.39.96])
 by smtp.gmail.com with ESMTPSA id o4-v6sm16906615wrj.45.2018.10.20.06.50.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Oct 2018 06:50:39 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: clk: add documentation for the SiFive
 PRCI driver
Date: Sat, 20 Oct 2018 06:50:23 -0700
Message-Id: <20181020135024.28573-3-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181020135024.28573-1-paul.walmsley@sifive.com>
References: <20181020135024.28573-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181020_065051_401937_EF2EDACD 
X-CRM114-Status: GOOD (  14.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul@pwsan.com>,
 Stephen Boyd <sboyd@kernel.org>, Megan Wachs <megan@sifive.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181020135023.eOYXALkyqJu4gj7yjAQoXgtsBcewxvbBSK4j8YINlI4@z>

Add DT binding documentation for the Linux driver for the SiFive
PRCI clock & reset control IP block, as found on the SiFive
FU540 chip.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Megan Wachs <megan@sifive.com>
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
---
v2: remove out-of-date example, add documentation for the compatible
    string and for the required PCB clock nodes

.../bindings/clock/sifive/fu540-prci.txt      | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt

diff --git a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
new file mode 100644
index 000000000000..d7c1e83fa5ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
@@ -0,0 +1,43 @@
+SiFive FU540 PRCI bindings
+
+On the FU540 family of SoCs, most system-wide clock and reset integration
+is via the PRCI IP block.
+
+Required properties:
+- compatible: Should be "sifive,<chip>-prci<version>".  As of the time this
+              file was written, only one value is supported:
+	      "sifive,fu540-c000-prci0"
+- reg: Should describe the PRCI's register target physical address region
+- clocks: Should point to the hfclk device tree node and the rtcclk
+          device tree node.  The RTC clock here is not a time-of-day clock,
+	  but is instead a high-stability clock source for system timers
+	  and cycle counters.
+- #clock-cells: Should be <1>
+
+The clock consumer should specify the desired clock via the clock ID
+macros defined in include/linux/clk/sifive-fu540-prci.h.  These macros
+begin with PRCI_CLK_.
+
+The hfclk and rtcclk nodes are required, and represent physical
+crystals or resonators located on the PCB.
+
+Examples:
+
+hfclk: hfclk {
+	#clock-cells = <0>;
+	compatible = "fixed-clock";
+	clock-frequency = <33333333>;
+	clock-output-names = "hfclk";
+};
+rtcclk: rtcclk {
+	#clock-cells = <0>;
+	compatible = "fixed-clock";
+	clock-frequency = <1000000>;
+	clock-output-names = "rtcclk";
+};
+prci0: prci@10000000 {
+	compatible = "sifive,fu540-c000-prci0";
+	reg = <0x0 0x10000000 0x0 0x1000>;
+	clocks = <&hfclk>, <&rtcclk>;
+	#clock-cells = <1>;
+};
-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
