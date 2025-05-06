Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0B4C3ABC6
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 02:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nt9Weo+8vfn8fpD8NKBvDqWLeC9PnaFFdzIHslmv+yI=; b=WQ2tGwfTKtVANC
	RMCXANpwWF15EWFIK3NmC85mn5dHkkg7sOdOluHTt2GZk++YZrC5nJCu3+kL6A/maw1Iu3xtAb6Lx
	uwmn/Eyk2Pz692qIi0Dw7nLB6F8KHcjkJDZXhknkyRSuEu9oFG2PJUyPuBlUix3bS/7gB7UjkOjwp
	N2IUPrp+nYEtolW5dPGbojntovJ62Fy6lcEWXbGeC7XErbkztB8uqwLxTvOduFqcEEfRDUeuLrgYQ
	sNoY4SwAL60L3ySDUsgOMRZS0TTl3N3iKgoIpdFF03TL/ERe303qOdPZfuHY5PgwJeNeLUEERyiyi
	0iNpLHEaH1V8OQyfTLRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUbL-0000000DvvF-1wbh;
	Wed, 07 May 2025 02:33:39 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPV6-0000000DPK7-27h9
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 21:06:53 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-8647e143f28so497688939f.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 14:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746565611; x=1747170411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=jFpdkxEqjvlDS2Q0pJr7MqpLNkvQsxucrs5ZlIhU7yHr7l3KDVvMnZ/yHe4AWiReDm
         ITNMPWVLbJdVG8eiTqMQG24aKUz923oR9D7AH+jvOzOmkVwWpsy6+LzdG6Z4FalO1vRB
         Yor05bZDZlv0WBjQHKxRApEfR8fWgz77LTsrG9p2iGQ083aJlgz6Q4icY8Hz7rXcQ870
         FnBaQ3n6rF0h/aFvYNcP5hQ4jfgbJuRWfQxmBGzLOaWEllHyUzL6hG1+3yWJ3pYffDw5
         t/FEGgtnTaiyhL7JXkM/swnwfMBXGyv0FjeDvT4aqJkvNmDe5qKQSngAntjq0AYT7zxD
         4JnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565611; x=1747170411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=PdBii0sPARj226dEtiCahoXrpiCeOXlhpap986WoZ9YAh7RvTL7cHniOboiEwNrGwE
         rs5nEM0uP5axIUEoP4d8vMmbC0e0q4A7A4bmj2ajDYQ62WVL98RlN3HLHfnHYzjetGGl
         /gASnnYb+suBV9dNW7ZxlXgdhgFbeOGW+0Am944CuXk3mbFCGtJucxfcFupoSQM5J9QL
         T7wSHwyPKPU8gk259BbWli6cYzK3UbveEIqfhKtjlwXLI7abhZTsJ3YUq755CRYoAxCa
         sC4OdBY3e0t5xjBs7F/YbKnFu2SdvW3q7hkAq7ytYs/o0FbPogtktDEmfgXxTWVXny/I
         FKCg==
X-Forwarded-Encrypted: i=1; AJvYcCXZVD9H0tSDexOJAnLLHoovFd6A0FvK76DszAyJtHjUjW5FLijN1BVnQr+6cKBCQ0XJNq6aXsrXoXoR8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEzZbKrsuCI8o3mCSl+6xBPowE4oQvGeLNvkLHyArz1HTtBttg
	fcbU6hg2HtJy1ENtoZfpZuQ8qmUXktoDarah/z5Wy9tbD2Rek/JXw2NQbML+iB0=
X-Gm-Gg: ASbGncvoYgaKoqsTMakvkkbwhtzWV0/PLSPx0v+5sAY2n2OYW1zjZw3p4UmJ8ChfUEm
	OoQKJWwrtbtSWV8k0oQBzOgtDQbddyYYI0kNzGCm17zaCv8Sd7W7LuTxSDVFLkj1Tv20t0DOge1
	jk1EhX958VtdKmntkWI2AXKIrlpOgM4GTMrepYYQ0FDQtjFfebb5T+Tcky/Bv6PGHCleZx/v13m
	LCy4bRyxYJnFx7fGldyq8TbToWEynaGVHCIFo9KYiStPDUE2hxkgjpuFbDAwApdDCMcbqfXjE0e
	IFKjUDaN508OZG8BzdYa6hH9owBY0E/c2HHldrXHioxObmujT1Jx9087ACV911uJwLNzwfenG5Q
	gdnr0mLW+kWaA0A==
X-Google-Smtp-Source: AGHT+IEul28rdtLnf24eQSg9o53hrAPhvZHN/Ndz1HzML1us6xJoFlvoRMcUFOXYOR8J/ANloTh/Jg==
X-Received: by 2002:a05:6602:1350:b0:85d:f316:fabc with SMTP id ca18e2360f4ac-8674731bb70mr129539539f.8.1746565611497;
        Tue, 06 May 2025 14:06:51 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa588basm2419559173.79.2025.05.06.14.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 14:06:51 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Tue,  6 May 2025 16:06:37 -0500
Message-ID: <20250506210638.2800228-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506210638.2800228-1-elder@riscstar.com>
References: <20250506210638.2800228-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_140652_545795_F7036E44 
X-CRM114-Status: UNSURE (   9.04  )
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

Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
currently support resets but not clocks in the SpacemiT K1.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 6eec6328c26fe..f4afb35dc6bc9 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -346,6 +346,18 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_rcpu: system-controller@c0880000 {
+			compatible = "spacemit,k1-syscon-rcpu";
+			reg = <0x0 0xc0880000 0x0 0x2048>;
+			#reset-cells = <1>;
+		};
+
+		syscon_rcpu2: system-controller@c0888000 {
+			compatible = "spacemit,k1-syscon-rcpu2";
+			reg = <0x0 0xc0888000 0x0 0x28>;
+			#reset-cells = <1>;
+		};
+
 		syscon_apbc: system-control@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -553,6 +565,12 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
+		syscon_apbc2: system-controller@f0610000 {
+			compatible = "spacemit,k1-syscon-apbc2";
+			reg = <0x0 0xf0610000 0x0 0x20>;
+			#reset-cells = <1>;
+		};
+
 		sec_uart1: serial@f0612000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xf0612000 0x0 0x100>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
