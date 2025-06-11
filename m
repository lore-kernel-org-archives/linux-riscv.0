Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62B2C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HAjdf4fZbPA0TdcdM0eMpQ/WY+cWfbPyz6XVEuTDT0c=; b=LVdEXrU8T9kaSQ
	w3vkNeKXaE6TBo4R08kwXmlWyJ4L/f+LiPNHDDIEkQeybbUFYdFM0sXVNw/xOu+O9a7yFE1poqpCk
	iXHt9D7oFobqbwJdDdse0dapFM5Fy4+KiwOZvB4Vc5ILA5BwtvAa5xoWpCrt357S4ZhSfodgsH6xD
	lUQWaZny7zmAfFu4rdeWX4GNhny0z7tyhfNTH4FvTF9+9DMwY9GMNGI7yrkWePYNRC4gNT/MeOmbS
	MHbrAOxyxfq8YNSIsoi5OEKN32DLRXb+fY63zU9Kz2HQjCuHPQpF8FRmoraZEYPOmwkiSwK4bnFB9
	5zUZ4GEeA8KtXNyDLcmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGwU-00000009I7w-0vTd;
	Wed, 11 Jun 2025 08:36:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGmj-00000009GOs-2HPq
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 08:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Mtdf9qP9cVV8qWLubtpWpim66gLvZ/7SjvLD52kK9W0=; b=GcWsrQOqvGQtI1FWmoeWmVega7
	OsQf+klb+bj3nVc++cCVRGzsQ2QkuHNDcwLQIN6OTBWyhX5FOsjswvcHBtEm8bORZh1IVhYFd+f6a
	++Qby625c42fMjEJRqyxK6zpfsBSug5l8V9ScKTLITZ5SNc6CVnQGWelMtuwtonziISzTx/QN94oF
	nmNuVYHjbY0CXDi1dl2xXeRaMFzoKRag7Xo5e2iw8qhCwE2yN/jeH6ZBOVBiaMqZJFhDryml+nkPW
	I0gPG4JKvnF0coCMt4+cuS7ixg4cs8NhdsoCcLHbqF+rtQ6le1iR9xzbaYx77g/HT7bnTMO3IIW/O
	A+g4dP2A==;
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGmh-00000002C0V-37QP
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:26:13 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4a5903bceffso82412021cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 01:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749630369; x=1750235169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mtdf9qP9cVV8qWLubtpWpim66gLvZ/7SjvLD52kK9W0=;
        b=FDtQvTGXfnAPxRCBRhgtUBSZQ+yJb7bwe5QG2siopop1QzJEYeMfnx2VFSkUqyDRBi
         FN858VZk5WqX0746adE/HnubyLCQdyXstC1lxK0/2tPRkmmJkzNp3F9YkJGrflc+DV5Z
         whC9Zt8kzFgS45H/cOqnhiFCqMiP+kKYLL5lC4Wx+84kLU/L2DExAIUePxxP27J038uZ
         73FqjsLUm0uerREdCeInPC2y6Y3Q6rrGqQ2F8GwTrBIlAjeDD03GbvHerVq3H52n2DtA
         jQvTmc8r7pvRNV6lKWCRBV3oU7naIpa0HCgW9U9sSGlvNb9P6WEyQn3QbOpm/rqgvMeE
         zVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630369; x=1750235169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mtdf9qP9cVV8qWLubtpWpim66gLvZ/7SjvLD52kK9W0=;
        b=oIOdGeTUdxjaWXId9tSmRmHokUrFm+B3y/uqBQ3uU/fpUrWKnBwHDNlzfSDF2VSYCR
         YAixYxEiHAPDZ4hkMvPy1ci9RRIKJwZ6VG5qhhRW0n3CbGh0x89phqwrBd5VMyzQQJm4
         reCTTNjIbtZKcQo6EZlqAJirpwRmln2gTLDlBZQ/4sFXCUFh2iZcnc+W7ZLVJ4nhHR2k
         BIgFa+ZcBnWi6CxuNa1JYPqhEccjCpUnZg1oG5MyxNwX2xTbMj0uL4DA4+CsWH70xM3a
         EzRBxbzu1Zch+KoI8XgYCWe0AkMAI7J7LRHRl8F4DtF80iEEj1ijmUJb5+t7yrjmqRx6
         nySQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1u6Y+10GAYaoyYZu9lzIinntZAAE1mSN5MoX/XtVTlKKyYrU1T9oAqNbS6bFyrj8kBALwLiF22V63RA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMCilpgoNIQ2GXqXsLzb8RDilzXKirzE/KOcNxUxKUJFwDAZ7W
	P5WWbtJZsI7fseiwiWs0G1EdEZgc3ui18GUArOljFgRf0GEF9j4JPJ2J
X-Gm-Gg: ASbGncu4JmQoICsKNb4M6f4WsIy8sThYxRcp16iQylBbbB9nj+rDV2zKXu7km9ynUXw
	S/bJkNcf0oHXO8V6sEl2ZlCnQQwMJgyOEXAluTMBT4Mq4uzmnk40q+kp+46eXSOSC1NHNc/w1ja
	dYF+y57YN3kfWEei9wLpIGdkec8VP9zX4/M7czW0VeUWRukf0a55ZHuoUG9/SAXV11cX4fdctjM
	YAhE1NEkf9FwBE5lSh7knAD4Wtb0vYACjve6Z0JId2j9g76/g7m+xZjihfexOGjd8a6K5XNOmi/
	J487THCWreeMJntm7l4eqKPP409gXcZ13TT0HA==
X-Google-Smtp-Source: AGHT+IH0qLFsfBv1pQpQxKIbPeTxFHffMKW+/k5Ks09G+LGGw9rZi9lUb697yViqAisSUqzJw3Gi1Q==
X-Received: by 2002:a05:620a:1721:b0:7c5:a41a:b1a with SMTP id af79cd13be357-7d3a8804592mr364704585a.10.1749630368821;
        Wed, 11 Jun 2025 01:26:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d250d7c399sm831902985a.24.2025.06.11.01.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:26:08 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH RFC 2/3] riscv: dts: sophgo: Add syscon node for cv18xx
Date: Wed, 11 Jun 2025 16:24:50 +0800
Message-ID: <20250611082452.1218817-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611082452.1218817-1-inochiama@gmail.com>
References: <20250611082452.1218817-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_092611_872177_584103BB 
X-CRM114-Status: UNSURE (   8.00  )
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

Add top syscon node and all subdevice nodes for cv18xx series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 929864ba1b26..65eceaa5d2f8 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -25,6 +25,32 @@ soc {
 		#size-cells = <1>;
 		ranges;
 
+		syscon: syscon@3000000 {
+			compatible = "sophgo,cv1800b-top-syscon",
+				     "syscon", "simple-mfd";
+			reg = <0x03000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			usbphy: phy@48 {
+				compatible = "sophgo,cv1800b-usb2-phy";
+				reg = <0x48 0x4>;
+				#phy-cells = <0>;
+				clocks = <&clk CLK_USB_125M>,
+					 <&clk CLK_USB_33K>,
+					 <&clk CLK_USB_12M>;
+				clock-names = "app", "stb", "lpm";
+				resets = <&rst RST_COMBO_PHY0>;
+			};
+
+			dmamux: dma-router@154 {
+				compatible = "sophgo,cv1800b-dmamux";
+				reg = <0x154 0x8>, <0x298 0x4>;
+				#dma-cells = <2>;
+				dma-masters = <&dmac>;
+			};
+		};
+
 		rst: reset-controller@3003000 {
 			compatible = "sophgo,cv1800b-reset";
 			reg = <0x3003000 0x1000>;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
