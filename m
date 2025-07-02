Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFADC83F09
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pgmUHtLpyyhb5Lxago1/OcO70krDgC0DtfzkuRdg5WI=; b=boQKmII6omT08S
	5AJYy/fPrvRV3zJd19r6Vm2z2dbdAJh+Gp3pKPcCZJeWsLHtaMdnbEaLGsCc9j7lFZ1lhWMGVVYey
	mVjURLW86YeHldWmhCMkA71p6ThQ8nRWzIPepXbWLyu4olBl1vRGGAoU4bteRTBfdqFfFY3N2L06G
	cutNGtuF7M5/o4VjkXTfb2X+ZCHkFql44YpCI2YSLhTrE9b5XPj6HjUnOk3z5ZtzNRIRTAUtX1usk
	cwuuP5daFX6n0U0STpcxdLOftQQDgOQ0z+AhbbDhTvBLr02ENQOVHZf/jORyihz6A1RtZ0Hkg/eBW
	DQsbTZTe0HCp4bc/nZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwVA-00000008Ikq-43U3;
	Wed, 02 Jul 2025 12:23:48 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvmF-000000089cr-1o8z
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 11:37:24 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6fb1be9ba89so43853286d6.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 04:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751456242; x=1752061042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoP1pXdfqtHiiOeYolqOqMKK+HZ6JiOVPla39TeeGl8=;
        b=3cx1rXRxCpK1uHjlbb7qoUujtAHZWl4UlINUlO4iULtLkaB/9WLQdvVq1m3LXmjxmo
         QZTLCILh3oBwCuBpabNGR7z7jB+9UPCqTHub36+zZanOU/cz+YQPANPeoFMRLAyex9wW
         0AmDe7zSN1UQSul+7UvUORjASpWioBxyn+AKfpkz6GLmBUduAfvr4f3+lSd44V6Ld7HO
         c7965aLGc1dfwGxRDver9V94/56n1SfJkeZvHJfhTUnTbTzffk2C9r92egs96uZH410r
         jNVM8zz3URgM5Wyy8LqkQOGESauJ4QmODS0hJE4e7f9w3t4c3R3RrAW/gGUXcKFmgI9j
         CeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456242; x=1752061042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MoP1pXdfqtHiiOeYolqOqMKK+HZ6JiOVPla39TeeGl8=;
        b=QFK5J7XSnvU9hkThJcgK13Hqa8rCkE9uA+Hic2DpxG1/59OaF5aj4zU9EXPSORf5m+
         780l/eUcxTeO2zWUwxj+HqDr4Wp/PtsshyFAhPqX9NEPUOv38Mvx3G4oxo2he8d4Rdgo
         61ETaYyeaW0Q3d4XRqNoDo2ZfF0vUShv5eGHZEqSxVsK/9cyE24Cmwn0knEM4zLRZBq/
         eMCnriv0Lpq4/9d4/MTSPSdhDvQDa7geEafRJmuu/4y5dzurOJRPGttkVI5BsXM0nSe2
         JxK6oNlKYUIiZZGDbP/mhsdK3HILqD8DrZKKPEDnH8NcLNjLx+Kpw4QVuGYLqjh9qEGv
         e10g==
X-Forwarded-Encrypted: i=1; AJvYcCWJ9xuRzWMXAKHJxvt7KZ8nog/tLC8ixLI8ONtrT+xZXgxm7UI5wJ0ni+F0AGSxUDZ5kfDGGxg3JFdt4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFDNYE7aSE3ncX2/RlQrvPNFvqJQQwCDm94ClXHzayVvuvvb1n
	TQcVKz3INGUuBmc5c3UINKvweuyiyssgSRV/Ipu48dQmP3CeS22tiSPbd0dlRwEuQWo=
X-Gm-Gg: ASbGncuyqyCiEAo7ApXYm2ObeQLPYz16Dkl6FBKdNEldRkrr/7BRyt3zv2ZlTX+kJvN
	4TumsxohqY8pvObF3MPHgqlGQEp4qbUfgNAvnVSWv2M7+ddfbwbCq8miauRBUxp4feUFr50Bopv
	UcJiYxnPpp5BckdTfyv9Gyn8DJyvi4fjkpG8iPQrky+A1bn6krjreKclDAn4Nz83q3MeGAV+Ufj
	kGQLSEu2tfS9QS3GwNIsheI3xU0C7yT3d0k22ev7mARC9CRuY+gCTUY5HOqySUlziA6/rzNiTtq
	/dOLaPLP4pt61kqRNRoH+qrD1cqCM67sU5hJaYz1eS8jLlS0q+UTsbHIjr0B78xIUO9miCe9ejl
	o1ZgHulcDAc8hA4N1G3ZNj7lqBGoGByfgKhJwwPA7e8ZwqQ==
X-Google-Smtp-Source: AGHT+IGVzvYqyb92eSOlmx/sXh5kUAYoEUgvaX7Z5vlbrOx+1z7amBVysl7FNglINMkR5+bJnESH7g==
X-Received: by 2002:a05:6214:3006:b0:6fb:6040:5d4d with SMTP id 6a1803df08f44-702b1bad9e2mr41519016d6.28.1751456242594;
        Wed, 02 Jul 2025 04:37:22 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730ac6csm99218046d6.103.2025.07.02.04.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:37:22 -0700 (PDT)
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
Subject: [PATCH v12 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Wed,  2 Jul 2025 06:37:08 -0500
Message-ID: <20250702113709.291748-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702113709.291748-1-elder@riscstar.com>
References: <20250702113709.291748-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_043723_466013_1A7BE439 
X-CRM114-Status: UNSURE (   9.34  )
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
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 14097f1f6f447..4bc69bebfebfa 100644
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
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -562,6 +574,12 @@ clint: timer@e4000000 {
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
