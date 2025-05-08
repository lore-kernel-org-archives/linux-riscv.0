Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACC2C3ABC6
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 19:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nt9Weo+8vfn8fpD8NKBvDqWLeC9PnaFFdzIHslmv+yI=; b=3OnKOMgVFsmGFE
	imnkBmc65SL2ZfBMupJkIxYD/aKw2yfVjQ4QQKE1X3uwTdqz2IRnnpL2GPuMQ++0Yt/AVc/V0jRkm
	smPdYXLM9N1E+WRNIlAS9/e8OQUwwDIlmxgLXtXSkWicrwVxysV5/ugi4WnviRcR++ANUiMBWxe8i
	OM6p5RVzZ/dAI7+q4sqmccztTYlJMWLZXTXuGVtDjAbrrePGwtVBUC9ZWMB3GgOSFBC6rfOs3u8lw
	NhqwNBvH2LeCnsOstdKaiURLlfszuEueFRCKwnRTPvcuFm4ShLtvr1jzDKZB3kj+eJz6M9FW8drXb
	gpyAN3YHZcJKbKXrHVAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7K5-00000001hIB-2wBa;
	Thu, 08 May 2025 19:54:25 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7K3-00000001hGL-44zy
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 19:54:25 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3cfce97a3d9so10931505ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 12:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746734063; x=1747338863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=jVPnD54oDgmJFJLM7HbYWe3qMw8SaQaaUmAKckoJEM/e2yXUYUrwGZKiJxAQl2F+aN
         597LeU+S9Olyo/R7vXdn8n2HVI3bOkdMKjTUybf8P9q76BeQxqenogE82byjTx/SKcaf
         rKdBcbjW9i3g+oG0IY0wsoK8WQg0SI4CStJrRl5f9h1aYqJjbHFUQoJcv0B3ylIQYkSx
         c1GclZt8obYWifq+hxaiVcicEaczJ1SORMcHGhhcxuVNhyT38MwmAm8xUNa3OMNpZfxP
         ijXh01HRT9xmFydMbv2Dim4nfvVFmzfGH/M7s/uroQs+fRQZLTFnREakHgzG/Xq/lPPT
         AscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746734063; x=1747338863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=xUBJJrkqMMqUMNbjGIYPG4fe3wNnyfM3P6jACSu9bHyQcAeZWQk2OUtc3m2+SbaZOs
         FROGLg+rY0XZZkRlu5Ywo6+++pVGLO98g4Jxn0JON7sW+0ZSTS1Mm7KtKe9Z0nKJH4W5
         dWWmfsTJb/e1CtX1YiTtkIehD7aWo7pNE8cJuB75oKKVG+EjhFCEmU5mtN3rdbY0hX99
         7FFB/PTIybXWPA5nDv9PzpdLz3ZKvyFDlmoXNea1T3AO9Nn6HFxpS8++5IW6zayfoP2R
         7lPviizE96Kpn9jzfvLk9VBjArZOGuzUvF5Y0HyixVXEDjjju52GwXWkjAcu9J4PS93B
         1Qfg==
X-Forwarded-Encrypted: i=1; AJvYcCUETeBoKvcwYUe5e8geF2sSIvlsBDs3JvxegYHRWFMcvZt55j1m4rVRnpf/EV+/QNvYgrFA9F8kgPV0dA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYJDh3lF7UYFUNv599Sysh2HjBKanweOsVQHxMYMzcYN9Myg45
	qkX5OkFuiJ/KFzKePU1Fw/OrQ246t13Ency4Vv2N9oO6YkYXYK0XNxCoQK6zdaY=
X-Gm-Gg: ASbGncvkeZAxYs4fC5MXrzgBzWUsvXorW0eJ1RdC4xMSGw74Uoq8aufpDAVSWjzQ8NQ
	1g6YPG/jUcPH5jb82jFrkXE9GdcYwJS7A+OHz6cPKsjn+IjlZm4sh3rUz9AZPHo3EVWMTxyP0f1
	ARJ7OCAUBBJ8yeQnjbC8mVTfOF8jecKPxJYwBt3IFQtYnT3Zdj29HggKboVo5KelqTb3TRrVQOh
	rn5CGtlxWLuuTOq9necwB7FSo12hzhnDVoIcLB0SKxspP3OQ44JyVJCBiaIkyXw4/tazRRE3Ttf
	wgXQ4FF04cukymtt3ud+dnC9IgwQmzCCOXRbjdBJrq5iqFGPRf3DMdp4h7luFbaoq3Z/YYcRM3J
	FREHWEjwAFvKGDg==
X-Google-Smtp-Source: AGHT+IHxa0h5ENM9DziETWmuFGwasgRig2JIzf55dVO2uhr/X5qFkUD+e9t5JjAw/tigV8feMiv7Kw==
X-Received: by 2002:a05:6e02:349f:b0:3d8:211c:9891 with SMTP id e9e14a558f8ab-3da7e1e26bfmr14255055ab.2.1746734063073;
        Thu, 08 May 2025 12:54:23 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa226850e1sm93983173.134.2025.05.08.12.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 12:54:22 -0700 (PDT)
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
Subject: [PATCH v7 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Thu,  8 May 2025 14:54:08 -0500
Message-ID: <20250508195409.2962633-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250508195409.2962633-1-elder@riscstar.com>
References: <20250508195409.2962633-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_125424_011221_72BC003F 
X-CRM114-Status: UNSURE (   8.94  )
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
