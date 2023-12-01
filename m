Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A77C10F05
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 13:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RlDfYzXXdJICsbwAYiv/o+x7A4jPJSpRwyf8J8A1bmo=; b=hqxLDCv15kOxj5
	5SIM5uIcvGE00g3o03azcYrDC09yJhT9gkgFUqo0gSriNGev9clQhmf6UedF+ynVZYaBeKPCQHhPW
	pS7nOsTSeYtr2SpJufKzIV4eSmlwrnkFK8fj9nFDcIVevORy3fChUpzcBLkVqBbNxsCimvA1fmxfC
	rZKcDJddk9igfSjUpB4T1H6pzfgnyyyo/+STn0jgrS70gshKjZHX+4Y6eqdyh+HRoEZyYk8rjQ/jg
	od6S11dCZgTU3mEU1la+QtEOtKaNVUeZtsXby6IM3bxa7wV6ftyh4cbzhi43WqXGzgxPvEup3s0zR
	Cybpg3c6Q5Ab44bTMI+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r93bZ-00Do6P-19;
	Fri, 01 Dec 2023 13:30:53 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r93Nc-00DhpO-2W
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 13:16:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40b399a6529so20610375e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Dec 2023 05:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701436586; x=1702041386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5l4PLs5fq2iOORKwjJCX/3NWfa03zarQdKsLZDtVEc=;
        b=T0RVerV0MUQMTKL2SqkC6d2rRMMHzy4N1S5B6FpWnEWK0+Te4ezP32oIobpCsafa0P
         AfEIlU4nR8j1dqNtnH17dMRZOMsiiPHvpEAJzSxiiAWYaPqmXDC4Y8fAKqwYq9ksmMAY
         ++3teV8yVRCK8yAFony0zefe4MdRNfcHqlC6WxwEoxIuLV+HEe/7m7zJ2lULx8zXJCk+
         YAhRuoWSRlabR8rnKdmOgqOw5LB/Nr1pGvMcNTOwVI+pbnGDgaxmfueSJ45kOxECWEwS
         8TwZJ1zf5PWvNqVgrgeqFo0RV4qVycMskZgLrAzmrhXEB+Ol/CcxJe6A7MPlx3JWtKPr
         2g4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436586; x=1702041386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5l4PLs5fq2iOORKwjJCX/3NWfa03zarQdKsLZDtVEc=;
        b=i4O0XS/lsxvSI06SDZjrciaO30ZQTdObPMXJEw5HInzhYaYYVbp62nj9GcJPc8cECZ
         n6dARHq251hrIqJbF5QYwt9oG2/QHhd/KJUrnlELrg0T7hOto+fy40VYqRV8GW7cvoMU
         M8ZpyZ1z6wiYwE8nIU0yrAyVmhDSKjPcfJr4h+JE4qJIAP8vVUrPEpF6ppC05Vn3c7no
         hQ0zssoVLPpfP96xMWlL8KVuNed9oAvc8Z+rhCauaiHxbdxxahkLXVhHFrKHqPD/0PHq
         z4D4CPoug1kVQ5yMYVkaB5+MpsXKRYXPH8u5xGtLBKQ1pGInXzaJqTljIneKmUK5RKWo
         Himg==
X-Gm-Message-State: AOJu0Yy+aV/i8F9a+E7ZEVV9A0rFT5owpFp04LiXaXISRTapVG+n4la7
	DRviEr2Bl2avzGccN5bzZT8=
X-Google-Smtp-Source: AGHT+IGFHBFbqH5osZlxZuBfMWde0sWWX+h48EXeHAzLRuF+VW+iOm/S1NzSCFL0u0ZDbGzQbWx3Dw==
X-Received: by 2002:a05:600c:21cd:b0:40b:5e4a:236a with SMTP id x13-20020a05600c21cd00b0040b5e4a236amr766057wmj.108.1701436586518;
        Fri, 01 Dec 2023 05:16:26 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:3c2e:cd45:f50f:f083])
        by smtp.gmail.com with ESMTPSA id fm21-20020a05600c0c1500b0040b3dbb5c93sm1451723wmb.1.2023.12.01.05.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:16:25 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/3] riscv: dts: renesas: r9a07g043f: Update gpio-ranges property
Date: Fri,  1 Dec 2023 13:15:51 +0000
Message-Id: <20231201131551.201503-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201131551.201503-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20231201131551.201503-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_051628_818375_A061D403 
X-CRM114-Status: UNSURE (   8.77  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On RZ/Five we have additional pins compared to the RZ/G2UL SoC so update
the gpio-ranges property in RZ/Five SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index a92cfcfc021b..09ef10b39f46 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -46,6 +46,10 @@ cpu0_intc: interrupt-controller {
 	};
 };
 
+&pinctrl {
+	gpio-ranges = <&pinctrl 0 0 232>;
+};
+
 &soc {
 	dma-noncoherent;
 	interrupt-parent = <&plic>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
