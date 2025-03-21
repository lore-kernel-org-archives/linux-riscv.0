Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E77C36000
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 15:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c1M+rSUL9izvkcsZH10lwone6btc79s6AudkWlNWTKo=; b=BIDUhnjClaF5vc
	i7XrAo28cYH47/Mv4vhTGZcpBd4cbaS8gGjsh9/wZKNCPsb+rHBBzQI/pqv/wM9bdDjDP1r6Cpuh3
	f8r4DWs2rJWdidZpSAr3K1Rk7LShMzjR+0cWacN8FwzTlozBNaDaXXEjxpOe8ZzXdVJBIS5xYruuH
	/CfWBHbPACMUaYsTEqCo0ZgUcWAOXJkAR4rDNCT++y9eMSG2qz8MA7CBfb7a7itByS2edgTJ2RuTX
	6ssmv32Lkh2cgmdfZMDR2lb4NkHso09IvtF52+AT3vUMFvnPgOv2yJ1qt3SbsOWo1Uz74Jz0xeq1f
	RowfjCGysv0mRkqBjMAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tveA8-0000000FHdw-2a7u;
	Fri, 21 Mar 2025 15:19:56 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tve8z-0000000FHOA-0eUJ
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 15:18:46 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-85df99da233so168635639f.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Mar 2025 08:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742570324; x=1743175124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nY3+cr8LwPrnwPUbr8ZQVdT4sW06Crewhjj4AmYBWuU=;
        b=KXXVUnxBbiX/rk/VXfA9gjyQsoJZl0EDZiHTEpJDOW60DgFWr49IKJZtroF9CqVung
         H/47yV33700Jo0E1jpTin1nR3P3QyUi2QnopIlBAQP1njLaXHNAROWFnD/9TzCnlEgOY
         yWJt6Zk/9ezDyrJvDf/a/+6YNPcwipjpdDbA7BEWqaAUYGBDl1zLi93s8zFg3JM9repT
         ovhOc5zemzCZjCRlLTmkKEyEfYhDs1WihM2exAoMhM1R3uvLVLCzCNEhfnGM7kUsVGW3
         XAkKlyPBX7kYy2HP3v/Fku7mBhMGXDGoThm9bdRGbImfzQhnG+atnLA8qrAyu91+OOgV
         Jfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570324; x=1743175124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nY3+cr8LwPrnwPUbr8ZQVdT4sW06Crewhjj4AmYBWuU=;
        b=Exy+bwBj+uf7ME6DApsUCUwRPZNs+H8nTYq6CijYolObSr0zOQDMMYKY2ok+QY/rEX
         osyc1DiPEDjBJjET9Qojy1DSLWq8E2jkOqQ5sF4N/wty8RakJWVvCyjHo6pYn/Z2U2m/
         bEZYw2PwbCj9b2D3vhFBJ8l4TDdMCG3rlmuM1J4THVSGfOHw3RIqX24VhQQKi+gcs6mb
         bAIadMEqw7HIiBzgcrZvorqP5JYX/EbfofQUmSs4UNTFmvK6GSHf7eTttmmYNz0dQFsm
         C/J4mQW32tgGg6lTtT37BnOYck7LK9kE34tFYh6momYqIWBCfalBKvSbp/GBG7rRHpv4
         +YRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfTCRKUAv4P99uT2qWhDQY2lR4nHujuAHiBEQDZ5RHB0sufapAuQUu5VjSI9olo3vyNoy3HaPTImPCIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjKDOoSakzYv6PdIZn16lEMh7+IyrOCG8OWE5tX4wSx3yxVmXD
	hwvdIaZo6blkiowLotUjHYHemqYcO7Vdbr71MiCfcu8h5x/5jHhEZ5qjyVIonHI=
X-Gm-Gg: ASbGnctbI7X3kjr9DPYtwaoExhb7Ym+scDUHCWD2QGcsVU1J8K0e/ON2ezkQPcVM9sz
	56poBu5b39ncKtHgP2/ivILtbFCxDHtJsuK4p3S9O8SErGDLOd0wjPzy42jkm581J1dXaza32CG
	JLe5Wcu+ODcVNcBFy808OFiFKBOYHz027TCqSowoamj5GMH4KdBsaA98beTtrJLQgVbfhr1+2aO
	3rUuzgeDWfWYaETj+wqY5k+ew28p0OAu2JWInj+3AcdcBocnEB2qDBNjcrbIj5eTe5YXxfpX9gG
	rGFOvvqCe0ERU0Eau0Ann5THBoTZCgTTQ9GnXwp/WITE999LJ9ZzaWgySqMSUymYvVkG+07IGWX
	Cqt6/f4/UI+DxzBfm9gBjr4OF
X-Google-Smtp-Source: AGHT+IGguI55dL71gHl0tK+hT91rVomg7KnVgw+/XoVslENUEzuEPRHi4KDVzYnSZRrU4EihCkbgug==
X-Received: by 2002:a05:6602:7512:b0:85b:3c49:8825 with SMTP id ca18e2360f4ac-85e2ca62dd3mr380237239f.4.1742570324050;
        Fri, 21 Mar 2025 08:18:44 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbdd0a21sm475553173.41.2025.03.21.08.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:18:43 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 7/7] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Fri, 21 Mar 2025 10:18:30 -0500
Message-ID: <20250321151831.623575-8-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321151831.623575-1-elder@riscstar.com>
References: <20250321151831.623575-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_081845_186830_A162D69F 
X-CRM114-Status: UNSURE (   8.03  )
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
index 09a9100986b19..f86d1b58c6d35 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -350,6 +350,18 @@ soc {
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
@@ -518,6 +530,12 @@ clint: timer@e4000000 {
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
