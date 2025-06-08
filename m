Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8140BC5AD49
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 23:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=De4JjVELbQEgKWVELYYJvqzRVwhmeqTuO+Wdx47GuZ0=; b=hEcx6inMuoeleH
	laVugr2kvbMvTSIv64CGo7AlQPuYM7EEMPyNI0y5vLjeiSrk3AyV7p3/pB1dr2nYpKI8BerO2PEJK
	u8CqBJM/3IPeH4c0U4XEHd3NOBMuqhPSFtJlypqoeZgFlbGCaqtIFydMwlIc4qhzVabiVHFlLlo6Y
	pv99ZOMVekKHrsUj0sBISwvUohA6REjwo+9tIIGi8egHkO9t9Mpwd83omPwAK+JUeUkPV0iEWMy82
	BGP3BGu+SvKNCc3sN6YnahC9mUsEe0NP9aEnmXjm4ZWabsN33OtDx05bahOzqPkWQyYUUjkkoels8
	4mbywMwcdaMsElfm8hbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSk-000000037LG-1y4h;
	Sun, 08 Jun 2025 23:30:02 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSi-000000037II-0f8L
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 23:30:01 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4a44b0ed780so46949821cf.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 16:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425399; x=1750030199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIbMjxTvPEYfM1wLVh1S1rjKcW/pphi5tKLotbN01b8=;
        b=m6s/jh6gtfWNEcsLfIHYUxrqhQk2sobXsPlYoLnZf9WHPE8m1ietQTxUxJULTSbkR+
         1o2hhPLWQmazrjGTful2ji/cEt+nglbUfXUHI9k87kGYnWgEjfoWH61/LZSXBTNbp4wX
         mxJPieg1/XeC78J39Yf18pvY9RoqmJf93I5Ojet95AlvW3IphCp4Q1rAmZn4OXbNoblz
         5m6uxCRptFnt6ZK8d6wKNhOACMK8VtxuqYclM2GuVWnavyStGo8N0Vhgtj83eRw51E/q
         wJcDft1oqABMMEy0BtWn302mm6uwbw7hysl3PCu6mLj0VE/CwGB1rLZI6hIimqOyLfoG
         BtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425399; x=1750030199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIbMjxTvPEYfM1wLVh1S1rjKcW/pphi5tKLotbN01b8=;
        b=oh75x8IYqLWAReRUUaKLYiVYuE0tLh1dyLpR7zjX7BP2RXvk6MhytVaY+gMJ3pM6Nj
         5feJKrLWnZeeNI1dGFFHmj/XWVO+fDE0wcGT3tfG5z7hVIZxzlgOBcH0oENNLv8BMzDJ
         FCBAZvZYBAz0eUS2VJho4Z4wCxt8/X2GWDMwV5gXkyl8XRZ5bSxF7vMBOOY4gGLgkinS
         zJGvK9QxSleV3/O/EtUg3DyV5ENNI6BIJ2dAYHycvZyw6fw+SjPieVEDiVUSgEgVvr35
         Jbbg3ED6E7w7t2N65+TiLke1jOhpcxz4JkssOs1fxCzTddL6gnE1qgF0vgvoJwNwEMPe
         q9Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWMZ0yrU6IIQzV58wSOWcNipQ3e6BQrf0Cnfpupfq+/mQdvVTG5C936aCVh1nIpehWVzeyJgFdTHG/Qjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOUvyy3etuzEwi5M7ipvnOkNZdM5hiUxeXpY/dD5kk9uej7dQO
	AGGwH7Hpwd9np4BbhOuv5UNksAMExu0mUGsELZdMLZrHsDTl7u8UeZ6B
X-Gm-Gg: ASbGnctdxVABE8onN+rj5BzF+j8JL40ibk0xNlDV3kG9Mo9MJigHQ5SxJ3GGVjvfc12
	0UXRooNC5kZsV/cZafTsgvDEAlbKVUXi2ft7yirlSOuk1iq39K/Rowd7Otlt2Dus+X6jQWCiR6U
	Mfd6iej9T6Kky1dNp5qxY93NRxzKCsK2KWSqJF2J2Mje4RywlF2J0J61gIczWzH4qrAkqiord7c
	LUXMoNJUfRVirJ4vkGsFnKHCgUMIuRc8u2mIp8QuUDtN01r0iT2MTBfEb4UPAripGSB3QDfqjCK
	7jKEDIBmtSxCyQiLxWYHQRG7b9h9zSlCzvIvf53yfXsMr5zx
X-Google-Smtp-Source: AGHT+IGZUz6F5c0pXbN6o8Jj5csJX5GQPNNaA7JPElzs5JJ3JB4U3Aw34Dkaijp9bRjqsXUX+NbBgg==
X-Received: by 2002:a05:622a:5c87:b0:476:9474:9b73 with SMTP id d75a77b69052e-4a5b9da89c4mr211494501cf.42.1749425399168;
        Sun, 08 Jun 2025 16:29:59 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a61114ff23sm48697571cf.15.2025.06.08.16.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:29:58 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 05/11] riscv: dts: sophgo: sg2044: add DMA controller device
Date: Mon,  9 Jun 2025 07:28:29 +0800
Message-ID: <20250608232836.784737-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_163000_200879_5D57C812 
X-CRM114-Status: UNSURE (   8.25  )
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

The DMA controller of SG2044 is a standard Synopsys IP, which is
already supported by the kernel.

Add DMA controller DT node for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index a25cbb78913d..a4d2f8a13cc3 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -31,6 +31,26 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		dmac0: dma-controller@7020000000 {
+			compatible = "snps,axi-dma-1.01a";
+			reg = <0x70 0x20000000 0x0 0x10000>;
+			#dma-cells = <1>;
+			clock-names = "core-clk", "cfgr-clk";
+			clocks = <&clk CLK_GATE_SYSDMA_AXI>,
+				 <&clk CLK_GATE_SYSDMA_AXI>;
+			dma-noncoherent;
+			interrupt-parent = <&intc>;
+			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <8>;
+			snps,priority = <0 1 2 3 4 5 6 7>;
+			snps,block-size = <4096 4096 4096 4096
+					   4096 4096 4096 4096>;
+			snps,dma-masters = <2>;
+			snps,data-width = <2>;
+			snps,axi-max-burst-len = <4>;
+			status = "disabled";
+		};
+
 		uart0: serial@7030000000 {
 			compatible = "sophgo,sg2044-uart", "snps,dw-apb-uart";
 			reg = <0x70 0x30000000 0x0 0x1000>;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
