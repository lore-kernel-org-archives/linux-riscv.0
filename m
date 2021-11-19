Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E7BC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 22:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eev1lEMrVnHIrOBD5Uq7HM/IAPaDcaJb71Xd8j5WrXI=; b=uWCJ7GM52brGq9
	Z0e+Mpnlfe0UDCsedlbBNe/fhbTF5sG7pGwdxNoarvs/i0/pwG6y9IqmfXRTSafsqhNGa+Yxu5vgY
	dnE0u/rQgU0wOcrhH4r2cuBykynuBgwwzHU0Ps2GwGweoPUAfA0R9cVvMWg5hIkOoA6pFxQEgELqr
	gkRNi5amDqoLKw/kkVb4uYdKo75Fac8a/TxpDgp4Ny/lJDNRVk135/sGBN6M3tkhgFZbKbKIQxsW0
	HoPWf0KoCuDchqYhkTRmSOEubn+SDW7LZHQa1kHMG7NNeVhfK1dJOotu90tsLkYS+jcVb+UR36E/9
	cQRXWfbX05AGKs0GNB/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moCnh-00BkNn-Qy; Fri, 19 Nov 2021 22:56:09 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moCnW-00BkGF-TC
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 22:56:01 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso9999023pjb.2
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 14:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3C4LuMh2VIE+wfKLtAY46glakCgCNvxeiTkI8GKqos4=;
 b=R+ZIw1XKRLZ9ySesQABrbTWa4gMlZwrFq+FIouSxHvqdXBsAwtrFP+20qRmNwSFRvc
 DASSwnuV+c32ig0DWg0QuxGajbinT4SwAe6f8klUqA4v4AURwQHOi40D1/L+8HVnMUrH
 0FVznStLfU4IUALgW01U346ZlgwER3uex4ce43vmToFZBFIr9qE4L2+QNwShn/lcCPf/
 R10lNKpqsqe5QPjR8fdIgq+5KDcEVR6c9GSbBX0CP30YVyBpuJjdXf2LN2ruIhLO+UzE
 ZjtUCWmEU3SDnJs0YztmLQd868/zlWs0x82wvtShX9ZP4x8ZqmIdtyuRdkCc8PTtGmny
 lljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3C4LuMh2VIE+wfKLtAY46glakCgCNvxeiTkI8GKqos4=;
 b=YbcX4WrEAg4n9PWr9kabkIKEct/WHti+7259H3aYRWCiiNKnuqjzJk/qkbGkEXOU5t
 ADpt4ceYbK7B4SIJV9uGQYWgJTv0F2FRqLUSjwoTUUH1mSU/M7ffz2GKiBvqkiygR6Uc
 3D3qhwN0lxChpy7LcG5PB4B9YEY2o/JKtO8xoPgHVbt24YHxWQgSxLXbiEu2AmiT50/c
 dMxMBm8EJBnKUypGKJUEw5hjKD19XNelkbS+CfJC4p4QyFng4Ywwk2zy52YLPww40t+Z
 1c0RhfUJLo2ErBKxsaQ5PXgUvP/F+HnTEOO6/4EgIfvsfpDdSY8COqmnqa1QqPYRw2mK
 tnJA==
X-Gm-Message-State: AOAM530lqEOmrQ3Psfkdcwph4uS+9d1YWtYbGNuoy1+PO6RfwktldJdo
 6W8odnvVVszJVW5jEOCRAxU=
X-Google-Smtp-Source: ABdhPJwY8Ho1qj5lw0Ln31TtjBdyghc07ysy3t1VPuYmJWU2d5GkuGWEIMcZg5LZFL6DFOjcVGO/Dg==
X-Received: by 2002:a17:903:1247:b0:143:b9b9:52a2 with SMTP id
 u7-20020a170903124700b00143b9b952a2mr65752312plh.35.1637362557406; 
 Fri, 19 Nov 2021 14:55:57 -0800 (PST)
Received: from localhost.lan (p4857108-ipngn27301marunouchi.tokyo.ocn.ne.jp.
 [114.164.215.108])
 by smtp.gmail.com with ESMTPSA id me7sm13446042pjb.9.2021.11.19.14.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:55:56 -0800 (PST)
Received: from x2.lan (localhost [127.0.0.1])
 by localhost.lan (Postfix) with ESMTPSA id 38B68900957;
 Fri, 19 Nov 2021 22:55:55 +0000 (GMT)
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Subject: [PATCH v3 3/6] riscv: dts: sifive unmatched: Expose the PMIC
 sub-functions
Date: Fri, 19 Nov 2021 22:55:39 +0000
Message-Id: <d309ed6c649eb6b8b0e5e06b016a3eacbe845159.1637362542.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <378c64fb868b595430b0068a9af10fdbeceb8e12.1637362542.git.plr.vincent@gmail.com>
References: <378c64fb868b595430b0068a9af10fdbeceb8e12.1637362542.git.plr.vincent@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_145558_990656_1C2FE57C 
X-CRM114-Status: GOOD (  10.45  )
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
Changes since v2:
- Fix end-of-commit-message separator so change lists do not end up in them.
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
