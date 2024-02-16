Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EA0C48BC4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 00:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkOb60BQA94p9SNg4DM1A0zWrHGamdPS1rvIvHGN5Rs=; b=guYovqpfK16NrP
	0K52RAj/K9rbtl9Qz/i3W4+hLEtpFOyJzhW2ojDNDfQg04MMhYIwZPmySFpfA/P8fcsuWCX5mjI2G
	0loD+BuqErpXSoq8vGa7hb7iU9dSLJN+Mwc6ScnG55Hjw3tkeXwOboSsk+3Syr/9g4Z4kuGDeU2wq
	vjlMkGds9ObAzMgKQLiNKF4bR5G86B8BuncjiENTd+GodWWlozhe5gDQ6zzh22e4Z5lTP8juECkVZ
	cS6R7o6z7p0SqSr1cHB/MnKB4JJr+b3Or9rey3iBW4etNJ8CDQVxX8q2OXW+34Sr0Zi1oXAMZVWUB
	umya1r468xDv1F+8mAhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ralme-00000000YcZ-0gl1;
	Fri, 16 Feb 2024 00:08:52 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ralmV-00000000YYO-1UBU
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 00:08:44 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d51ba18e1bso15097225ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Feb 2024 16:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708042122; x=1708646922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oULp81TNDm6rtXJp1+1NlVw8kUN7N6Lx6G6xlg9BNVs=;
        b=juz9ECDbLTUJLK/MIS9qE0PrCoT40x3AhrTXbwF7oFt7Wjm//4ffwzDVz0zVOC95FU
         Gqyidum2Dd3aVexh+DOfELrgS0pmxpse3NTS2EVzGx6uWS7YjBmpnz5T6+zQnD5cI0qf
         TUYs+MjVUulZWfwL8Ux48hnOns9tbD8sWVkWRQWdxKMhJOfq8w6k8r/reuRwU/Rkb64y
         KyTIu6POGB+s58Uajl4kvjBNhh5jti/OEtJQ2QunjOOv9xG1svMJJT4Soq5Vy2mwfNR0
         8/+iisaH1r/BQrL+1rF/oNIFFfZ5KxnTUYsdDFDH5OffhEDd8FFUJ+/y8x+90/bPPOLh
         mMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708042122; x=1708646922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oULp81TNDm6rtXJp1+1NlVw8kUN7N6Lx6G6xlg9BNVs=;
        b=P4v8Lyn7vRy9b5PpsFiqvh9gcGSnvMshPBMjK2vBt7cXT8PXeIqlmKoRv7oVF5E2d8
         63O+aATm2m8MGoLbeL2R2XoZe7pwsj/ZaVDLb88K7uB0mT8BPLghmYiq3FH67gdDP5+N
         /Mml6bzFmRfbOnRWRPEozJSQ3TgBy4bI0Mcvszx0uKlgaIAEFxPPfsN3zYKiJKUj2ON2
         xz+BffL6TAEAlG4konltPZ/EN4Hli5NcNT/u0SRkuLV+L0xrbHdSFVse8AMo8m8NwKnc
         J6Jyn8MeOzwJVBqw2t6mhHWr9BqAj5Y2dvqdqtejKNi6/+UrUHzr48kVd1cdDgRCSP2f
         ct1g==
X-Forwarded-Encrypted: i=1; AJvYcCW8kb8hQ1EK6cPguiK92z2SLb1/LIsg6+xWYvWRVLiAje4QY/Tk9AKA4DSUctzM8ZGzJkWc11CAUAzIA7fWDOjyf5sKxvjbAh5P/Ega+MnH
X-Gm-Message-State: AOJu0YxDxHbRkwSxtZQ14ECHm6VgvdHnwQRMvC2WWMZtYY32oJ/cGFry
	+IyDO0bsople0VWeKHaOEdDlko9JNXgOTzos65yTIbawVvaA0CmPpbEtP8/dFK0=
X-Google-Smtp-Source: AGHT+IG7WoMFGu0/RfCzt3XOL546mMsF4SOL7oXhsNzvqoggBob9r4cZ+ZAFJwFNFVhaS4ZZGy8jhQ==
X-Received: by 2002:a17:903:1212:b0:1d9:14fb:d142 with SMTP id l18-20020a170903121200b001d914fbd142mr3570668plh.32.1708042122114;
        Thu, 15 Feb 2024 16:08:42 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bb6-20020a170902bc8600b001db3d365082sm1789486plb.265.2024.02.15.16.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 16:08:41 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Eric Lin <eric.lin@sifive.com>,
	Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v1 1/6] dt-bindings: cache: Document the sifive,perfmon-counters property
Date: Thu, 15 Feb 2024 16:08:13 -0800
Message-ID: <20240216000837.1868917-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240216000837.1868917-1-samuel.holland@sifive.com>
References: <20240216000837.1868917-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_160843_400674_B89DD884 
X-CRM114-Status: UNSURE (   9.12  )
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

The SiFive Composable Cache controller contains an optional PMU with a
configurable number of event counters. Document a property which
describes the number of available counters.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 Documentation/devicetree/bindings/cache/sifive,ccache0.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
index 7e8cebe21584..100eda4345de 100644
--- a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
+++ b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
@@ -81,6 +81,11 @@ properties:
       The reference to the reserved-memory for the L2 Loosely Integrated Memory region.
       The reserved memory node should be defined as per the bindings in reserved-memory.txt.
 
+  sifive,perfmon-counters:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    description: Number of PMU counter registers
+
 allOf:
   - $ref: /schemas/cache-controller.yaml#
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
