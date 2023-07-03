Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97086EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 12:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Et0W9Sf80ClH3ymC7szGD0CFAXc0TKqZJaBC97YytW4=; b=QXwx7CkhzmSfi7
	R3MU6yy4873h7TF/OfyVnPp2ayBhU1rgU4pyx68OgFw9AAqmnqoYXmhx1zZ+5WoHfyM78qP/7Yqpf
	fPTYcLpAx3Rt1P94RRzl8DDI3DPQEmTFvciwsVFPKDscakYjCUFoPyHoydMq+O4rBg1T5pL2AEXBc
	pPNo/eGY9OwkyVCBZ3eDsW7TbP+5mTJddF1JeXPZE/zUm6DsK7xOGf0TWIvgVFVbvVCcJ0G5p/I8W
	SlIUuJtqyyDujT1AmVhMFYhwL06wHHcOh+81obyGUK7z0ZcrxyDP9eL9LBzxO/01T8CPmT5Ya2on1
	WGzV7oQ5J1CzguFho/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJ0B-00AXAV-0F;
	Mon, 03 Jul 2023 12:49:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJ08-00AX7b-2Z
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 12:49:58 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbd33a573cso15779425e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 05:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688388593; x=1690980593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZ/nerEaJdoYRd5ld9GUr9ghotX2eSIq7nKEUZxClAs=;
        b=VDQ8BEKOua2MPOeh7UBCA5TLJ/SQzpLxqtHvvtIg9IqrzRgS7zzfIxI4bW61B3TpT/
         MYsOJpsJcMfRcGvKTaEPdwM9HmFspVAwIChFvV8xQi9MAA9nH5gSHhp80hpeuCfLbGf8
         9/OhuweNy85U8eaY0Jm0RwCTxGVuVZPevxQQRXlfQX++Ypoahdq5JQYRcm7UHC++5W+W
         l93VRH6OcveCipTB6jLSZNnSNUII5M5aWbj8X325YjIIJJjL2CRByrBR4aOgWEsP0cUV
         smHrq0CD3JYoL/Ab9OgZfTvhxLFJyHAxAkJmtKFeFSubj0NjZvWaAVGpYRgSX99lLhAP
         Uk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688388593; x=1690980593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZ/nerEaJdoYRd5ld9GUr9ghotX2eSIq7nKEUZxClAs=;
        b=Meuex6ES0mR6gMYdecsitjqEYvGkbU6SkjjfC3WsNalfIqc3LP94OuIA+fNPZAx8PV
         Aucw/Scl2f0Onxl7hycARnz5d8Plil3IiZfnmiC6zQQ+V/RbzvIcSYo2yhDrNHVYXrMA
         YPDp5fNVy42iBYUcqFuXdonU9Ly+85abYV6KGbFQ0QMJRHBCtyoQKVjtYc6cz3xilGhd
         0nPTjQop0ViOGmdbyTktqnA7HDcVG1i3FvE1VmnvwaXWtWvQUqjHVVn2P2gQGFkkPg2r
         CvfKCIid99CCviz1t7pi/M6YJd02TNezpRMwS0vkfxj9zR/dy/XMj3rw8c+Jdr4ZiyRs
         R1zA==
X-Gm-Message-State: AC+VfDxRR5zoFuLFPf5oZvK0aC8jk47n5fILm/YAkMU+BLswJ6ThtwqC
	8ZkznrYAmCjQ374N1E8XlDnE/w==
X-Google-Smtp-Source: ACHHUZ62WvlA3047ray8oXCOSgpbSvwQjyuzYzr8ddqDY560e4nA5mtjjXKgLaeaLCURCwTViq3JeQ==
X-Received: by 2002:a1c:770d:0:b0:3fb:a506:5656 with SMTP id t13-20020a1c770d000000b003fba5065656mr7785924wmi.32.1688388592878;
        Mon, 03 Jul 2023 05:49:52 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id z7-20020a05600c220700b003fa999cefc0sm21128205wml.36.2023.07.03.05.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 05:49:52 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 03/10] riscv: Make legacy counter enum match the HW numbering
Date: Mon,  3 Jul 2023 14:46:40 +0200
Message-Id: <20230703124647.215952-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703124647.215952-1-alexghiti@rivosinc.com>
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_054956_837772_4C872BEA 
X-CRM114-Status: GOOD (  12.49  )
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

RISCV_PMU_LEGACY_INSTRET used to be set to 1 whereas the offset of this
hardware counter from CSR_CYCLE is actually 2: make this offset match the
real hw offset so that we can directly expose those values to userspace.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/perf/riscv_pmu_legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index ca9e20bfc7ac..6a000abc28bb 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -13,7 +13,7 @@
 #include <linux/platform_device.h>
 
 #define RISCV_PMU_LEGACY_CYCLE		0
-#define RISCV_PMU_LEGACY_INSTRET	1
+#define RISCV_PMU_LEGACY_INSTRET	2
 
 static bool pmu_init_done;
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
