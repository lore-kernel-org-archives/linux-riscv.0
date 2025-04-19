Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1DAC369CF
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Apr 2025 03:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AqCV395shrdpDNQ6G+K83MrF/wqDT9T+E6n6A8mhNJM=; b=XGpOz75q39lJgw
	fAgia8y41r7AW0lu/d1O6bldIuggsDnEEemB0YaR/ple5u8Wdm+t0HL7coulebaVFPjTQJwTKgFnr
	UoHTCpdy1Cgug7UWXfWKdwnKy+Nf/s06bYRNYs9A9rnwgxofjtJZ0lMTpHzWWkf91SI0bQKQucUe5
	xqZW6U2lxsBoGILqrjBciA2X10OgVoKHdZ0ZMzshL6yYQ+o6OHCn6jW3/LDJps1cVyYRFUKqpvp4D
	FjkoMPyRKx7AzEpR5OvQnnqVnEAuucIgzxFb6+t9pr+iAw0KEt0uJ/GT3itJ1pZEWW8BA66yCnY4v
	KTp7ntFHSvgpVLaRb0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ywt-00000000mDz-0uLE;
	Sat, 19 Apr 2025 03:32:59 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ywr-00000000mD7-1DWe
	for linux-riscv@lists.infradead.org;
	Sat, 19 Apr 2025 03:32:58 +0000
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BD7FD343003;
	Sat, 19 Apr 2025 03:32:51 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 19 Apr 2025 11:32:30 +0800
Subject: [PATCH 1/2] riscv: dts: spacemit: Acquire clocks for pinctrl
MIME-Version: 1.0
Message-Id: <20250419-05-dts-clock-v1-1-1cce5d59aba2@gentoo.org>
References: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
In-Reply-To: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=809; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=1lyIFLBt62MDSyjlKUp7yZb6HXkiKK19zM19Y3kS9H4=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoAxlXK3lMEs/5J8RMMiYgvTqcW3mtjFu3h4ZoQ
 86T0ew+cyiJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAMZV18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277UQREACSNZDSsNl+LRlFTb
 UtR9eYCCQMVV0I4iMo9KDdPFvOnYfWgpfrP96bdR3uupMlozMUkqC62gPwGlPQf41dRhp4ommNY
 ZGDJyvTmaVZIG7sPl97v85vFvV2tEpEUTMWcvSPz2uJBXPpBbZ5GM5f6SBAeDQRjXEHGja3nLzt
 Y0FkkyPJluscwDOn5iJcYTG88AnIGAgUbrEG82ORvZ83MUW5p4j5TgNzWuPBSxR46f37ubP/KLC
 EW/fqMv+P9ywDYeGLRGNsttDX1PzC+hjJEROqBvDXe5jfoq7zv3jFbQOUF70qvT6+GBRw9zSx0B
 yhhap/fwp2k3bnj78AbUcgIXcCwHIUbRNYiDUiKy2g8GIe5MSbJ7/5LRbhEifNAqHDjN3/xIklW
 xseXpWhExw/KKm1B+ii/r8X5lJqEsZXKwEUTsjz9jg/IOIZVNqwQbMIXDGXnwN5fuHWxYFxCI4h
 SM1KNf/UtzNuwHvltloaDoyK6HWAnqv3AmPstgLs07tyDJiCy0/IaW+XvdTsykhYOZQVsYjAWZe
 OZ8kBx63xPd3GO9KkiDYl782tLlG8MiD2Ebf0d/zO024ROmPoZOBJreGrrEVIGFyZmPDyIAXyIz
 HJNJ8HDOZF4xow7qO6ZN89xzzUN2gmujPq4XUrLHMOHhOkIIsEt0RKgvhV1WhObtfUnw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_203257_355044_CBDE4900 
X-CRM114-Status: UNSURE (   6.47  )
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

Pinctrl of K1 SoC need two clocks, so explicitly acquire them.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 584f0dbc60f5b0d078c7127cc4021ad6022cb182..153fd1160182b42fe1a2f7f042c9c1da90f63b0c 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -450,6 +450,9 @@ uart9: serial@d4017800 {
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;
+			clocks = <&syscon_apbc CLK_AIB>,
+				 <&syscon_apbc CLK_AIB_BUS>;
+			clock-names = "func", "bus";
 		};
 
 		syscon_mpmu: system-controller@d4050000 {

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
