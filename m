Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C451C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 06:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uUlJBRfqcJy/9Uo3ltz146nce2AZjAVKdcfLRKyoC+E=; b=xmGhrwTv6BBVWR
	HEW2BFgXj5FTIFZddAk9NYsz2MwF3BYs0kVmWEK/rM9+KJ8hFHUC2xvAqVnLta5CkqZm++y4moGGR
	3Gzwq8AtbwlL1yRevmjmE0Nv5En1GhQwumiz/jb8JbtffFkTEW1oezStq0EvGe29ND7ceQa+pi13A
	4ycbFwNRRiITmrqsKqO6NMnBKdDqX48axySBWJXsCOB0Ba7EA6CXLEPcNqObVu8S0NZgX7q9vX5jl
	0fcW+qH2LmHwpSfAIi06d3rWkSZtwhyfdqIoExscxfBBjUHnBBrSl6ti1bFELYo3ISNeBreDdeQIO
	3AmFoSmXk3kAp+ZCV3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7px2-0000000Cy2F-1Tdi;
	Thu, 24 Apr 2025 06:20:48 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7px0-0000000Cy1d-3hnL
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 06:20:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745475638; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g4ZXJoPrb+24H0QzTpCpAXUjnh4cpDujKSrt+Vs8YSGt0cEwjqvcX8GP9qbW0fpuGqCr/f2tWKNlKyc1cfuhChuqWLmfKST7L8CtAm4LHobvigSLYDVCilhyUDSU0LGwRri/RBgG3gOTb4cpoEChHNksL4avR/pW5mc/DHWDro8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745475638; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yCYzlAh9kSuErrhhEc/Udz9PQzNnvyNC+qUoV6xkhr0=; 
	b=bFee/xfV9I3KZMtiVH+bjfRxCIsF5QbpMbmYLF+n0Xtcnwq5VaWjFdPbawdjkbCd4KDEHszr9B8QIzPIv3ouo1x9xXZvvIPDKw4jyiX7O5eG9HDdd8n0JNKVrlqh9O3oQu5YYSKB7CekLrJQwnrL//bX5ZqBOjhtHJBU4HEYBtg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745475638;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=yCYzlAh9kSuErrhhEc/Udz9PQzNnvyNC+qUoV6xkhr0=;
	b=hBO8klqu5eB5mxFUDI4u7WQ+8WEAO6x2lYfSG4Z8r9WG5or25HrG32lYBueq9pO4
	3QzRhLBy3SM7RajujKttrCU7Vpa34ivPFT5w1mhQmdcO14ZpAEf1bu1PPIhp5GMNXKC
	HAJ18ab5Ww+5/WRtTj1emC20fnZiJYX1u6oNdhqVe1/8XXvIKbpOOt24pNByi8TD0i0
	0R2dYg+RVDlx26XG48/dVQAD0IBXx0nuvY2Rg4WdKNkwAm+8a2Tm/ie9GpWh+ZnFMKL
	JwNj4Y0bop0lWt7vSWvYghb6/QFDFEMJl8kSg28OZNIls01+1Qutd+6LcvuzDIQDgCV
	/AotWYzZPA==
Received: by mx.zohomail.com with SMTPS id 1745475636355491.3825414260032;
	Wed, 23 Apr 2025 23:20:36 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add PAD_INTERNAL_* virtual pins
Date: Thu, 24 Apr 2025 14:20:15 +0800
Message-ID: <20250424062017.652969-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424062017.652969-1-uwu@icenowy.me>
References: <20250424062017.652969-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_232046_977477_65C5989A 
X-CRM114-Status: UNSURE (   7.84  )
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

The JH7110 SoC could support internal GPI signals to be routed to not
external GPIO but internal low/high levels.

Add two macros, PAD_INTERNAL_LOW and PAD_INTERNAL_HIGH, as two virtual
"pads" to represent internal GPI sources with fixed low/high levels.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
index 3865f01396395..3cca874b2bef7 100644
--- a/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
@@ -126,6 +126,10 @@
 #define	PAD_GMAC0_TXEN		18
 #define	PAD_GMAC0_TXC		19
 
+/* virtual pins for forcing GPI */
+#define PAD_INTERNAL_LOW	254
+#define PAD_INTERNAL_HIGH	255
+
 #define GPOUT_LOW		0
 #define GPOUT_HIGH		1
 
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
