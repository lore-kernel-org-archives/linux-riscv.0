Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED237C04FFE
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Apr 2024 00:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5rtZLhEYJyQyhZ+KHlPMXgwRX1Qe7fVb1OORI4JAJvw=; b=TawmpA+OzCJw/c
	lUWDz3TyBH27jzO4AAMD2HBY/IfRBG8KIu/0kCbV1rtNgGn92EHC3U0U87LDx2DQ8Uv6QKT/B1FcT
	1SPFQXp4tsdbMwrU8x9g0Uw33SEBP6lxn+tHPBSF7RGG3PqlCCa3H3X9Ez6DbN3jFY1tHHqnIjP+0
	Ajy9alN+2HAmZXzRtYfqR6tOBUdiEmjBwxImUoq2RIhQAcrA7eJtk+FtXxUojrfraNseYZrz2F1gQ
	RWobfmF0jjt3/HxFlLwPpoPVxe0b9yjDQEttyroh6kXGLkRBqgywB28SKjlDNT15/PShay/5Jd8Ag
	j6ca2y81Tdlln7izSmLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Veo-0000000ERZT-0hQa;
	Sat, 27 Apr 2024 00:11:10 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Ved-0000000ERVm-2n0z
	for linux-riscv@lists.infradead.org;
	Sat, 27 Apr 2024 00:11:02 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ed0e9ccca1so2636454b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 17:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1714176658; x=1714781458; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5ki95UEfr2z0VC3x180o/+jUI7myGNjHePyoD0A2y8=;
        b=aMzyfez71v77mQRo+uuqUfRxKAg6c6HgOM6VA7IpUHa0pTF/5WlJx17zncA90D72Yw
         M+sIKCB5SACYBfVIwi7965LtGS52sRvRTIOp8qM3IU7ph/HejQv8wX7KwDJLlm+HGqyp
         X43Eq41eJj48a+94RD6vrlBwzTD1AAaEN0XNfwJTPeARB+DprvPxf0dvzNOul4rWzXVc
         2iguaQVFexnHW/nRz688rMpV90g1FTnEjnObmoxy9rTDQDnD89SKVc/TNMoOESwRG+co
         amQZMFowTjYj0PXgvALtga/M42kQOGJBo2HoFoWnEILgiixpoK6JH+sefcokYgd4O0sQ
         2w0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714176658; x=1714781458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5ki95UEfr2z0VC3x180o/+jUI7myGNjHePyoD0A2y8=;
        b=oyYDxOrvwwdfkAT4ciI6ZkFRynt5hlq1KHr1P1ms8qApeFor/EAjKsSAN4bUPcWbpv
         aTv3kfoKXuDgeP+eJW2xlHKxsSHIwdijw60iJLS2lz/cIx3Ve1hdIfqrrk1oblF1WLLj
         u0TFZeiMD2v5bgD2BzrsMR2y2NUfYx7PfbEWVLBABIsHJufCHU1n6NfgGmd+LcwVMGWV
         sryXm9MpB/nUX2xvcosrqsASqMsCO9Xzt1+v3q0s+LB8GhrS2wPpuSgj87rJfj9xhY7d
         oGoXtgYhtgijATuLZYXcImsjgo4Lon+dxbEEE35VkKYnHSQ3Z3B7lgwsBizKZtGynaSy
         6bmw==
X-Gm-Message-State: AOJu0YxEovLJ0HUcLL0Dt86Prq2vjq1eQxmCP3VjHrc10DEOrSGLFHV2
	88x6sMeCKgd063uIaR2f7VFtCE2G7FnhuIATqoTpOusUFCgZBfcuXRCEFIVg4rA=
X-Google-Smtp-Source: AGHT+IFAgfIAI3/KuUTKpVzyvA9o5IQ/hm2YlS9fAPFKU/vAHWC7oo96mJ9J807N5OowZHBwaZ13Dw==
X-Received: by 2002:a05:6a20:918e:b0:1ac:6762:e62e with SMTP id v14-20020a056a20918e00b001ac6762e62emr5665000pzd.30.1714176658577;
        Fri, 26 Apr 2024 17:10:58 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:3569:7ce4:94b8:1691])
        by smtp.gmail.com with ESMTPSA id w1-20020a6556c1000000b005f3d54c0a57sm6061883pgs.49.2024.04.26.17.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 17:10:58 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Fri, 26 Apr 2024 17:10:36 -0700
Subject: [PATCH RFC v2 3/4] riscv: dts: thead: Add TH1520 AP_SUBSYS clock
 controller
MIME-Version: 1.0
Message-Id: <20240426-th1520-clk-v2-v2-3-96b829e6fcee@tenstorrent.com>
References: <20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com>
In-Reply-To: <20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714176654; l=1160;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=WiDmXN+gE+Oj1XaVtmKA94ORr86HXlbvJPY4osUU3RM=;
 b=z+fbT5Gr7t67Rr88wnhdlVKhPZX1zS0AMbe6NxbQ9g3D2bhGOs+5SSpgPoUawGn7P+ESJzWYz
 lpFXBf7p6AYCVdX2h0+d+CLQ+0v9Pzv0a2iF2lJ15sroJqydTVVDZ+6
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_171059_829147_996B0F28 
X-CRM114-Status: UNSURE (   7.46  )
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

Add node for the AP_SUBSYS clock controller on the T-Head TH1520 SoC.

Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 8b915e206f3a..6285cdf91bd6 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/thead,th1520-clk-ap.h>
 
 / {
 	compatible = "thead,th1520";
@@ -161,6 +162,14 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		clk: clock-controller@ffef010000 {
+			compatible = "thead,th1520-clk-ap";
+			reg = <0xff 0xef010000 0x0 0x1000>;
+			clocks = <&osc>;
+			clock-names = "osc";
+			#clock-cells = <1>;
+		};
+
 		plic: interrupt-controller@ffd8000000 {
 			compatible = "thead,th1520-plic", "thead,c900-plic";
 			reg = <0xff 0xd8000000 0x0 0x01000000>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
