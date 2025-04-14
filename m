Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848E4C369B2
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 19:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LG3slYx6eIb6mSZEGcawHjFcIRNEM2L5xjTR1TYQYdY=; b=XRqE9bvvjneI82
	HQWJRlEZbYZjZYHh1LLFVaNRA89RPNkj6m8am8V2BHW2nwbGLnrWkUVJofIfFrS4Fc15Sad9Pi5H7
	WikGrUO7g7+MbHJ9UB1rcL2VrfOS1sGOf13oy0EOvlr+Hq41tnp75cMFxZ9mfXkm0eBntX26LqeEz
	CV1tcitTuvCoU98ika1pgh7eKN6O9u1wH7NMHw/Wt5ofN0Etsr0TlPt1Sn3qzrWV6SdLsMg/eNND2
	TRCCmoaDNZwYrGC1cbA4k05ZE6O8e0YwebFIED2nGIBuTXtPKj/FqY78hKAWyq2pW6cO8ZDFGp0Z+
	BYB0TSD5WR8xF0xQYOLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PN3-00000003JZG-2Zj9;
	Mon, 14 Apr 2025 19:21:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PJp-00000003I2d-3gY8
	for linux-riscv@bombadil.infradead.org;
	Mon, 14 Apr 2025 19:18:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=; b=cLpHK26ly2+BUS9iaBGDqHZEHS
	KSSbYS7CDcvA1YMnuATbj8m9VKKB455cmE5QdZ4AhsM56nhRqDw9KAXSODS7pCeCgxc79+1Tpoa13
	P62mHizonMIaY2JJVA6x/OjZzLG71XsEaVPAz3U1UWkck1Ni4w2xpqOcN5Zazy2txa9NuxQkkatkV
	3/vTX26MCNkK75O2S8PhL68gvf6Se+LiTRZNyNrzkroaH6wO6O0WV/GqkEwp3Xdp7XAwFU8+DzQ5K
	vuyAZ7t3O06SbcETdzsN10mOvPijDkZ7y2zRdMzBZsvQjyNbS1wABRJbdqamQIBTT7VYpH6Hke3o/
	ieTN9YPQ==;
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4PJd-00000009l6j-2Tj5
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 19:18:06 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3d45503af24so44077645ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 12:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744658250; x=1745263050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=BJ7Vt7YmTiovrGlhHC1hul7n8BkEIHLiJ8R4lWcmINyfBY6stXsnkd3hX/A6Km16ot
         txSIZIu9TURsj2vfdCipHPfVHPCQBkKQPuTvf9n+eEYrr/Zxc9WxMB2nvl5mK3ieqNe5
         EZZYB1YXEDlRaEG0y5HirmtccHNuD3qRVdt6MYxFW0kS6uIaeJo9+Bw6njrBTPNoTJqH
         HvUhLhqzhOeKH5aU/OZT/2q13duatyOKqPh4Rtn896CQfNKY1fVIUvZYofQfbfVTBmta
         Kded4Uj43Oyng+pQ/rMru9KOdz5Qa2/w1m6pAVvty1nYYUNa+I7yXctbVmjxEf3SkZow
         dENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658250; x=1745263050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=UilWvpqnuBf2bZm7RDj1QYJWxHuCQ/Y2FoEFN7t7iZmoZvOFV/0b3kXgevyzezsTbc
         YA4j/kOzEQ8POaJCaITz1p5Ak+TIOjh6J8D23YHXJ5ZtOGQrfbQrQVuzxbu3yDhQNkZn
         lc2r7qJpz6tiPRL3qPJfAPT9PO6YwevozcSIzG1XVg08nP3l0Trs2/ALbaABQZDaYyfO
         JZn9Mn8fsEASVMBHNPMN7FKMRqrDg0MvvwmI0AVRicmlcHV3JVeFmrfz3yuWJjKrwQpO
         Bj6ojIsGS6lY+hePtsIJ+p89eF4VGDIHPbhPhcoEG7qPYP/slDJcwPDE1UfihFJlZMzG
         oIOg==
X-Forwarded-Encrypted: i=1; AJvYcCW0mJizrtIKYRIIRk1QuLhCgBjSRm9RVyPUmyiAbGBLLtaiRBHovMocrVNReyy91ZkizED0dMBfKg/0Kg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7SNcCjfJnMQHYU/oW58GWWROkIpp/eTfrNhof5ND1GR1E1VU5
	B2SVA7oAzU0UOzy54qI5K0eAoMTkTXYjpfAPmibkgWDI2l+zL46SxK+lyqXXu9U=
X-Gm-Gg: ASbGncsBMXnwIHJodaLndKiQtyz1aRa7Y8Rg6+n33WQAhR1APqTM+w8yZ3AhxPhoh+c
	JIdz6bRh/G6vGhfb560qDShgzf8tZn81xoG+0IS3fAaBriCmD7Jawwm56UuDpKi+VaYrGGkoovo
	8wkHSVlPeR5BWNaJq7JGPhSkn/WV8od82v47RdFswZ8pA+CN+PKTw3UY/YIgbvaN7fKL02q5K2v
	Sq7zFsnxH0r5fXKDCPmCarfhvbSGKlmI2rjeXsEKW2RTVG2FUJ8e1yrjEA4FRyEun/Wgh1e+1RF
	sYe0URPYmcwrXHFdk3zFsNjfySeh+oIj62lndzqDODuXE68QdOSXdi3nwGQU898yd6UK5qqnXDQ
	sqWNOAYeiuE/uVw==
X-Google-Smtp-Source: AGHT+IEU6Rd4B2MJE8zIB8lmAeawMSoY6sk0rn3tiUuI43W7gRnclnskoSuyT6dVIrc85c9v5hVyDg==
X-Received: by 2002:a05:6e02:304a:b0:3d4:70ab:f96f with SMTP id e9e14a558f8ab-3d7ec20237fmr158153915ab.8.1744658249848;
        Mon, 14 Apr 2025 12:17:29 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e026d1sm2715662173.94.2025.04.14.12.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:17:29 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
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
Subject: [PATCH v4 7/7] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Mon, 14 Apr 2025 14:17:14 -0500
Message-ID: <20250414191715.2264758-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414191715.2264758-1-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_201757_730686_669DBD5B 
X-CRM114-Status: UNSURE (   8.76  )
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
index 584f0dbc60f5b..491ab891788b8 100644
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
@@ -514,6 +526,12 @@ clint: timer@e4000000 {
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
