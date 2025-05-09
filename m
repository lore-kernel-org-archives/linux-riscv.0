Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8002DC3ABCE
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 12:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nt9Weo+8vfn8fpD8NKBvDqWLeC9PnaFFdzIHslmv+yI=; b=gYnpQ/JVpwDSRD
	OE7w+vpzPCnm2wauC4mZyR+FWbaVJPnDJvTIliBKlN+IEst83BNhDINqHwJO2usVQuSawV03FflVj
	98dvrorI3MwnITWevksdm3bqOZ9oLhZ+G/XahAlujV66K8CwFslEbi7uxeM/9pCJsOeUIV7YBelPT
	gkZe386Kwsiv0vH6GrSqfs6U+B8CFRjwXypD5FoK0bqJ9JYVl67AKxkyTPMmgR71qYnaWgd57TGoz
	8X+7qPThikI5JvoYieGWgHEZqr5+MXsB7bT4t3qyrqCmjF/deuh57ysfRs/fCqvyIOdAjNikI3ZXg
	RES2rmI8djpG1xvFoY0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMlP-00000003ZTj-1ydY;
	Fri, 09 May 2025 12:23:39 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLmk-00000003Ptr-21eF
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 11:20:59 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3feaedb4d2cso1561749b6e.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 04:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746789657; x=1747394457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=Q4PZsQnYP3Vn3mwsEs+58L1k32fetyf8H770Z89OeE+4Zttzk4zTWrKdKop8OtoHhj
         rQj8kgDBV3EoXtbFJEjsXx8tK7YK7M7wmKGCuxDdXSUW8lzICWp8N+39J4tgVv9O9RWL
         v5fg1Yx8WNsUtFfVolaK8rMhtRgm65ZPSR4cz8Q4D/XrFpbUok5UvTJKDbtTmiefTPSv
         8G+vy5ccuBwPFUsdd9XB+FwsP4XbdQaE1La+6S6rYHP9Hu+XjkrDtqAxY2AS9EYtNCdv
         pf7lFFXRixJaWzvHjjTTyZL1g/GZLoZAgz0Uab/E2reN6Ya1UnNZ7QCGX0qqIl1Ffy//
         0b5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746789657; x=1747394457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=WrnURmgJeo1W7ONpxNPtkf+T5Xo3f1eo86ST/uPaOF5xbqBBGMaStCjj8g4+2sD15G
         Arv03kbBG+lUQwbDuie56WEqzHSMareg8AaKBQO2HL3UXxS+Ma7jyUIyKtBWUIWu78qF
         gMfSP/XwGxabIMcg4P52pcbNux5JlYqo6dnZi4I4wfwBxcgb/Gi6EcqnkxXstYErNxd2
         ed8mfwqnYmKgP1VIyoaIAisCsJLQ6RiIdBIF4YIn3c3efDeihXlLzIksEfkN7JVOEzSS
         WTJBAgEZfuFlRi94vxX776IwF+86tgvunY5Tw81Q5UHglIuECAIpA/ARSXxnB03I1H7L
         8WRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvONaY5qMkrR5pRMGbSeUMvBTPIBjO9B6GJyZugiXuYUoCxpf7ENjD6qCNvOZUC1FEeGscXuGhdDPUEw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx07oF8tnUba3HUmGkcI3TC3fl9aN1sahJXn18XVTHQ8NYDGbi
	ZSHrByB/kRGg9ExnpwfyiTs00/K46efEZ88wBxiWCiWxWo7JahGH00PlIbaFWehGc0m5yhriYIm
	F
X-Gm-Gg: ASbGncuTACGfdtwp7Ht0o3Hguc0h7eryImGW3atg+seFiFAFc6EAJmHqT3T1qi5Uxbh
	DtqApLEBB8+t4O8GT/oZ3oFpDo0lU+Y0RJfSeQU96Q2TOGqTrWGtDWDUKjXXp1fuy8p4KMF0UW9
	TgHim6x18I9OS3JZNxJxxh9d5rKgh+n6U9hT/PtYys75lEz7tGb2OfUFSQ623mCMkNW6M9vsYCC
	we1EyJNp3cO1kbmJIbNNYiM7lDc1Bkh+MpFSjm2QNdwXhnyA/Hr1WxGh4bdDFpOn4pEg57YBixR
	a9VvbKQvePKMsMO2mx67hYmDok3JxhKw7DyeKUDasYNqK347K4Z23hcdwo68kAyJ2NxlbGVFCio
	J4X02HsqZjQFkGQ==
X-Google-Smtp-Source: AGHT+IHhcPDh8pSsBNqyKD2nWRDYn4h+n+ZvD9Pi5ASi8e+tMvfh3KEcYvhc33cDnA1c1ksabwra3A==
X-Received: by 2002:a05:6e02:198e:b0:3d3:f4fc:a291 with SMTP id e9e14a558f8ab-3da7e21748bmr40779945ab.19.1746789647038;
        Fri, 09 May 2025 04:20:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e10549fsm5136325ab.23.2025.05.09.04.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:20:46 -0700 (PDT)
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
Subject: [PATCH v8 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Fri,  9 May 2025 06:20:31 -0500
Message-ID: <20250509112032.2980811-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509112032.2980811-1-elder@riscstar.com>
References: <20250509112032.2980811-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_042058_513128_D997FA89 
X-CRM114-Status: UNSURE (   9.25  )
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
