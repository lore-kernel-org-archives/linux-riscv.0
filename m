Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A07C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 00:53:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5984861ABF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 00:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5984861ABF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0CbRIpMdSqt25CwMKFAR89BjA02d2KwBcwoRiJUOwPc=; b=IRQIsnOGqJr8vY
	9Dfn8JyNLnZPaks5iX3710Rt8X9mu5TlOwguNeNSTDW68O0XkEA5gckE2Vq2ZkAiP5YtFCMnI6BAl
	yLU3ldYsV6z7M7eS4b0TgS9rsXYsCRPdahiLVXG5W2iyUyT5ydJ20G6skGOwCuyDdPWXE6KOAv9ZG
	6G6ELddhZawcuK9XiMnatbaWHomkFFAuek/KSsHC1gNAgEd3LXKgTcvfQ+EQhDSYuYSmdpJnuwI16
	+C6Hwxvq0FLM/QPFieY05VcqLFhbtG8/SVBRjEKZlsLyy4VZYLi9iUFbfwQ4JLYhpcPXcIdj7wsAD
	18p+shzF4R4A3GmxVtug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmmj4-00HTxc-3I; Tue, 16 Nov 2021 00:53:30 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmmik-00HTrJ-Vn
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 00:53:13 +0000
Received: by mail-pf1-x42c.google.com with SMTP id g19so16531659pfb.8
 for <linux-riscv@lists.infradead.org>; Mon, 15 Nov 2021 16:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mQ4zBzdLNeEoEE74Qz4XRg/VBkFxechuDPINXlbW2qc=;
 b=VEU1Q9m+nafMaezjJbss0mGeK7ymabadCo5+aoUS/F2b7H4K5CZ731E2duImYM77uE
 M/jd5rLQt1f0y6D4OVNm+8Je8kFmLkE8OKO5Cab71ISBGPrOCrMTxCGC6WH+HtQogF+9
 lTEd0lDibWcJ9OXrkHxNyMPltK3hbFVzWfggQBw3oswWf3BwalmhG9r1ULbyVl0DPDN9
 t+TLg76Hp2hSst0XRDn67WmiV3Jtma3LMRgnHyF4g00ycZt4DHBuTUS6HHZYEBI9G72G
 PDjb1Nv3MiOVDqxk09bfedjwOgylWanBJHTXSr0eVJY0P/5ORf7UuN+fg/bd/nMaxNtp
 sI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mQ4zBzdLNeEoEE74Qz4XRg/VBkFxechuDPINXlbW2qc=;
 b=3zArdIgbJzxw1zaBhe/riD2vyNXJi8waKnV8z8yKF15qENpiobVJBU5zbmC15PCG4A
 xAeA+5pgopyjVQsZ8bhqdb6I4qgWJPSBAAIe8/MKWV/9hJ+vAUhjV3CH4fx8Ac3Xhdt8
 dbWtn4LTVca1icZfixLNwr4Vi4gR8LIeKkMMidpkLw+dN02mQgwgP8joM0iAZAuJN0Pw
 BR1QL9Av9kaM6yKgtVg9I+3IsmIhW8Qw7aHODohDCnQDzR9QLPaafWNTtJA8b75t45mH
 5wLBgLxJaDdjDpP/+KzP2klH83gOi3ZbakXZjIWVqGIc7hnG80t/nEZpQ6B5CJv3gkFu
 NWng==
X-Gm-Message-State: AOAM530pCqxEdYlEegRLb9+J3+sS1KeRM5RbXAflPOTHkgLLY3jX52lt
 wcfDuO6xHcO2gZkeq/XLfD0=
X-Google-Smtp-Source: ABdhPJwWHpML+YUDcHJCudx7sqn0Ep4LzQiuRZB9kU2ct73HsNkMskXqdNdDQtw32VZtOAqRbi0FoQ==
X-Received: by 2002:a63:8c5c:: with SMTP id q28mr2247255pgn.244.1637023985989; 
 Mon, 15 Nov 2021 16:53:05 -0800 (PST)
Received: from localhost.lan ([2400:4070:175b:7500::7a7])
 by smtp.gmail.com with ESMTPSA id 14sm4819960pge.35.2021.11.15.16.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 16:53:05 -0800 (PST)
Received: from x2.lan (localhost [127.0.0.1])
 by localhost.lan (Postfix) with ESMTPSA id 71755900957;
 Tue, 16 Nov 2021 00:53:03 +0000 (GMT)
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Yash Shah <yash.shah@sifive.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Subject: [PATCH] riscv: dts: sifive unmatched: Expose the PMIC sub-functions.
Date: Tue, 16 Nov 2021 00:52:58 +0000
Message-Id: <0f5e86c3658817874f158b06f78cf2d4e8e1a9e5.1637023980.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
References: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_165311_046006_A4D0B310 
X-CRM114-Status: UNSURE (   9.38  )
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
