Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A53C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 23:58:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84CBF613A7
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 23:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84CBF613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A4SbXxkJ3/7rAZXUGIBYs/NQUscWJYuw+/V0A9vxwPM=; b=Kx2MatoUY/aWY8
	JNzOUWrlQxJrslUjm7Hsl4F3XAYI2d+auWPlR+wSukfBCgepnth3tNqPho1HgX+FoO/f0NPZrPEtn
	TE4Id6wdNrp8Ku6958NVMntke85j1XIsrP1Fdurr6ybWz5YWXGNaFANwlRMC3gXxblulFJ4f28JGI
	+hLmqC4oNxkXMLEeoEFbLhHuy39fEglhGsYPEkJSBxXQ6dyntj+OR5B/rkmOY7CloVFl8BZh+oRGI
	/blfXvIffNJ4TWHpWsbN+2jBsijUmw7+wxIy2WWP3fDTwf9Y782+hy9XXiZk1odoj++qPEVYN7Xmk
	QndRYe4IPTnDDmmIq+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn8Kk-002zy5-DA; Tue, 16 Nov 2021 23:57:50 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn8Kh-002zvw-P6
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 23:57:49 +0000
Received: by mail-pf1-x42b.google.com with SMTP id g18so908172pfk.5
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 15:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OVuTAXKfST06LlKa+3lMZr3LwgCnmVMpB0im1jCL3Bc=;
 b=R0HeMjNP0oOGJit2TNJfMFN3aPrN1kb/JK9644Ic65UEfFRZsGsK27vd282geVOWWR
 8rMMFbhSbiwKLImoS0pmCSPUVPS3cQiz1Xm+I+jN7d2JUWRir8XzGHSci5G0DpQZwR3n
 GMFG8ocDfIR5V3PGgjJzPBNMVGeKzmFfKLRob3Y0tZTpt0WGLkf4IE7sqqc6m6+RSfKB
 DtGY2U7f6anDms43hsqdaE1rTLqodp0KXkto0tO2/18238ePV9eOIjxs9zP+/VX9/bqZ
 wOILzAbQx6dRbNTj6Su3pjRxZUVzdLZL+R3VCnTXnS9ecQZe7AvCY1RzRkPUzWp4alVq
 V/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OVuTAXKfST06LlKa+3lMZr3LwgCnmVMpB0im1jCL3Bc=;
 b=igsgJnAASDlVv2+BwT/qGkNT+6ALpPdX04To2+6NkZqqnINUfvAvozqVacbH+TzOv6
 3nnXjq8lerqb9Ue+Ia5CW1h9LweqqMTnmicdDmCzFe08bXlgiBxH5QhgmmOJgCIoELDo
 tqxty4zVYgVqL7BRorYrnaIFWGCQZeGpWLPPm94iTE79mZNzxPecY3teHROGjEeyswN/
 y3t69MNWx18W3kQ3KzwkgaKZiLbLb+Msq/uiLPBaQKfCBpR4p8E3BWdJdfGS9jRDqrg4
 pFvWOBzlalQ8+Vp5CknNeMnnbjmMRNOOqR2Qo79jncUQ0glr9hgNAIYG0A+P6J2bfLyh
 tdeQ==
X-Gm-Message-State: AOAM530T/UTPoz3rdHWta8uEpUUe2hz4My7zuI/MsAqzzyuYXFOy5LcH
 dvHmTLcQZnY2OQRlFeMlE48=
X-Google-Smtp-Source: ABdhPJwsRHRl1g6o/W4ZLU43Dsi9Xri70sEvBX9y2A2g4/QPkp4X8RIip5UKAvVk62VsVeP0+/K+pg==
X-Received: by 2002:a63:e614:: with SMTP id g20mr2120302pgh.159.1637107067072; 
 Tue, 16 Nov 2021 15:57:47 -0800 (PST)
Received: from localhost.lan (p4899162-ipngn25301marunouchi.tokyo.ocn.ne.jp.
 [122.18.9.162])
 by smtp.gmail.com with ESMTPSA id t67sm717236pfd.24.2021.11.16.15.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 15:57:46 -0800 (PST)
Received: from x2.lan (localhost [127.0.0.1])
 by localhost.lan (Postfix) with ESMTPSA id B13E2900957;
 Tue, 16 Nov 2021 23:57:44 +0000 (GMT)
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Subject: [PATCH v2 3/6] riscv: dts: sifive unmatched: Expose the PMIC
 sub-functions
Date: Tue, 16 Nov 2021 23:57:39 +0000
Message-Id: <72d7baa6829ff02ee7ad0344fe1d33a2269780a6.1637107062.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <bb7e8e36425a2c243cfbf03a23af525499268822.1637107062.git.plr.vincent@gmail.com>
References: <bb7e8e36425a2c243cfbf03a23af525499268822.1637107062.git.plr.vincent@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_155747_837482_55FF8DE8 
X-CRM114-Status: UNSURE (   9.60  )
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

These sub-functions are available in the chip revision on this board, so
expose them.

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>

--
Changes since v1:
- Remove trailing "." on subject line.
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index cf8937708829..270360b258b7 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -75,6 +75,18 @@ pmic@58 {
 		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
 
+		onkey {
+			compatible = "dlg,da9063-onkey";
+		};
+
+		rtc {
+			compatible = "dlg,da9063-rtc";
+		};
+
+		wdt {
+			compatible = "dlg,da9063-watchdog";
+		};
+
 		regulators {
 			vdd_bcore1: bcore1 {
 				regulator-min-microvolt = <900000>;
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
