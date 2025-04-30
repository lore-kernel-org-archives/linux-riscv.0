Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD7BC369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 03:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOETwflBVpUh8FSQZRJb+xK+w8i/MA4rfLGogkSNCMs=; b=viS0OxBfuzcSuK
	G8ggVe9ydJ0usx7bLKytyA+lxt1zDTbEuRWRxKCz2jjgY0UCcgPY4/svQIumHgvNZCrbRHOh12Qjb
	UkiSuTgiIaT+lmT2LFDRpSPrWghrQbF6k5rV3Jtpaggf9NzIXfqM+LFlcavbENZgYkFCOO+a/zpze
	45fT2az2yqE4v9GumrA1VsletOHb9XCQPlFlpagYhKE5ZFAEqg8SaVf5RELRWEsjv1BM8ICQtgKUH
	VrHvm1X1TkH6n5Kq6cXAM9RBGvbgt4LU+4pstumrdbAS4QgHdBVhGX6CXswJv+f+cMXIXam2HsJrG
	hFFA9kYyndJjtEcdYSmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9xvo-0000000BZZP-1q7N;
	Wed, 30 Apr 2025 03:16:20 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wta-0000000BUpL-0Gwb
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 02:10:02 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6e8fb83e137so67050986d6.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 19:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745978997; x=1746583797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGoCd7OSsBB4HtUz1a10Keba+9sPV43ld/cxoPbEVBw=;
        b=Q8GyyDt7avvJbDA7R1DeSDqZW0xXUNpZujTJfQLU1DOiki+oWdJCqRmiBoY/nhFvfp
         P1QfSGog8r8ikc3d5BFfRmhbNOUMsmnamvkPEnf7pQD2fB4eKF3i0BF5ahxVN0dRKVwk
         MWSZXmmXc4yBArfG1cBO58zXM8z/VV5u3hC6CNo3Nx5ogGXVeUMJLVx7eo7X7li5LqOD
         yvrxx1bZ4mxod7z86olJV8qdUj1sEGb/eQE4ajzIr70JoIY+K6JFI/EKpyyz1a1dY2xT
         g1K2+k8ZLHWQDy/VQLKIBmfieKMFSHKrpN30FJ2XvkjvWTfiKmVJMPTeNAqZUAUgSlLi
         aTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745978997; x=1746583797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGoCd7OSsBB4HtUz1a10Keba+9sPV43ld/cxoPbEVBw=;
        b=A5EoAm6X2Q8qhH7/0f4CC/BUn8svPU527t2QdLlcUv1/hMJ7SWBx9tcjt4sTyaoA8s
         i1rsEMXqYoTCxigKjaiuJvPzgPqIXoG1OT933FpcokvLDyZR1r+WIQIZIrnH+MM3/+gx
         dFB2Y3BKrgY+a69qypJJh7xAVOOl3GhK5y9FukmOCaffQFmw7amudzh29/wWEsPUO1r4
         Mr8exvgaQoO0i2wGKdeZLhvU1NPRiJAqHk6T09kVIBylAUdsr/4QmhPQLzt94zoy4BHr
         IldnvzHSz/hWfdGYSBJtuKAxdikbt+L9iMvV9f8QaXLA13OA1CF7ZCwWAfUBRCyaZKoW
         C/vg==
X-Forwarded-Encrypted: i=1; AJvYcCVHl/z0ICdcsHQhI9qJpME/nXNe8A7W3KRMXWrFprBqbO5plkI/pBXyM2hbYZEIhfhSY3Za4MS3N4NS0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLokzH2W8Ys34rUF4/aFfd9iIdFdAyA35WLqp2OP8IUMdht0wr
	LPUNPSTNmsZU1vQ5ZpT5xWVWGqp8+kSeyoQkXKI9sAnpt55fUJt3
X-Gm-Gg: ASbGncudNYTri8JYDF5WahHc5uihR9mOa8zP/QlwVsaIIAGrYZVkWWl0Yh5jJyiIfgg
	gN8R7gxufutAuxyeWPuD+4YvZViPPDLdAPhimFLB4gwLqH1claQPCUy2R0peZsNUlWU39/yc9fF
	X9+bb0YnJ48HN2I5WQJJVn6pwCJbCSZppIRTW4+PAqVmR1ripujNnh1EMdivOqDGXOmApFLdUQe
	UPt9XsMCTUkrrzTj9LHv4QBMFnUWWHbb/yRkRGH/d++R/fpTWF6mcZLz0Ej91A2Azi2HtUz8dir
	SlndRQJ7tOiZNCe6
X-Google-Smtp-Source: AGHT+IHQemqa+wENz6ss6VRn1kahd8zYA9nlmzIMb5bTDRj/D2NDvM3mr37ZArAISihcQ9zANLGDdw==
X-Received: by 2002:a05:6214:5096:b0:6e8:f8ef:d659 with SMTP id 6a1803df08f44-6f4fce5d21dmr30912426d6.10.1745978996814;
        Tue, 29 Apr 2025 19:09:56 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4fe87df48sm2764316d6.120.2025.04.29.19.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:09:56 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/3] clk: sophgo: Add support for newly added precise compatible
Date: Wed, 30 Apr 2025 10:09:30 +0800
Message-ID: <20250430020932.307198-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430020932.307198-1-inochiama@gmail.com>
References: <20250430020932.307198-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_190958_105458_9C49CE25 
X-CRM114-Status: GOOD (  10.83  )
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

Add of device id definition for newly added precise compatible.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/clk/sophgo/clk-cv1800.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
index e0c4dc347579..e10221df6385 100644
--- a/drivers/clk/sophgo/clk-cv1800.c
+++ b/drivers/clk/sophgo/clk-cv1800.c
@@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_device *pdev)
 
 static const struct of_device_id cv1800_clk_ids[] = {
 	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
+	{ .compatible = "sophgo,cv1800b-clk", .data = &cv1800_desc },
 	{ .compatible = "sophgo,cv1810-clk", .data = &cv1810_desc },
+	{ .compatible = "sophgo,cv1812h-clk", .data = &cv1800_desc },
 	{ .compatible = "sophgo,sg2000-clk", .data = &sg2000_desc },
+	{ .compatible = "sophgo,sg2002-clk", .data = &sg2000_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, cv1800_clk_ids);
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
