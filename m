Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7620DC001E0
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 14:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1lRTXYl/b4paB/Rf99ic/BCV316/TOro3T27epiKcK4=; b=pS+USIXXhjKubT
	pZexHVO/EXysdKtUBZZUOfrBd5Mh0AfDks22fHHeDKZUPlokwn6bOBKtzIVRLqueSdSSRuISVyM4t
	NfajZp3t5Uy31VBBfPT0Cw4LFI0CIwS3ffg3hN7M+uEP4PNfxs8nbiDWrVBQAT5Lu18SFLyTOX8FH
	IaggMA+IC6CwgwY5byjzZm9+snlHBrtSUH00zrw92cWyCJLq0HIkppHIT+OCVKYe0BEF8sQRTiaDj
	2agzkFm6cCubG0IzhW0iHe0aDZ4S/fQxtHlJkpbZvJBWKHFvEozbNquDEQS4/ebVXXWhMpf+VlNfp
	8FUhBkWeJtzRbKNodUgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP1or-00F504-0b;
	Thu, 27 Jul 2023 14:18:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP1on-00F4u4-1V
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 14:18:18 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fbc244d307so11132945e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 07:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690467494; x=1691072294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NmnsqQcLcAcVyns3syLHoHVHQj0n5HXKDOsH4jqkjI=;
        b=cw4QPNr+KRTkqBfUl09eVKywkJyVBIIbls5qU6tgjai2Q+mltKyEq6s+YNGOkL0v50
         zHgxupgjLcJvEwDqGUK+MpEiGLmjBDydlZdLLFqczKUC/vcJ6p8i4ou2mVIKt8N/K4Cz
         PQRh0B4EkaM8AJyraBjtd2/Vy6YqPfIAZLXPu9wJ/pcjhMLAiclOGIcH3funcREbZrSk
         ZDnOY8Jyd6MiUcgKQpBlLJ2R+FVSSi0/WzE7qRm7KQJGUMEVvhTOpX/QQxOv+3Lj2jaK
         qze77T5yV1Q7OZ2ygxybUCkHJIPHoWcZuwVE+aLzBe/oDFyXUo2dvMc7A0Sdnbi1HnuJ
         MtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690467494; x=1691072294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NmnsqQcLcAcVyns3syLHoHVHQj0n5HXKDOsH4jqkjI=;
        b=b/ejNvNPN8ojYwXFsvdbPlqKC4O0U6FFbAEZkrmU+/QgpcJY3ztf8xgeoT/Tb4uFo2
         giiTN4r6DbUyn9D3yGet/qQGB6RKNbkM+vmOkA2upUkvwAbs7EXOWG5QikVwHCZ21Xsv
         SA4w1Kl5YMMUMjRYbeMrYoCBQQ2FgLb2l3Xy6n7dOb9tNz/smLFyrNvJ+KeSAb81hdeB
         Hi8mJznmD/Q+ZhlWwVUHEJmzqOQdyCfnVjgFdyj+eTlmqNYI0JHwZ1dVDKyGWypGP/8Z
         eUXLp6sdpwB3QLXVl90sWrjNwdoYMLNQHSGHi/c49SA7pcgC9wpwTMRSc9ixNYQ6CuUV
         TgPg==
X-Gm-Message-State: ABy/qLbkti/sCqZYKnb5SuusDPyv8HNxyd1nX6XMdHrksVktCJpR8+19
	2l8X2kHZ4/0ViolKjcWlnBj0ow==
X-Google-Smtp-Source: APBJJlFcK0DHqPtDZhpEqc3VCknaUXpHURGMn4XFTFIMukq9HJ5GlH1YzutH1Su47Mc0J/AukGiQYg==
X-Received: by 2002:a1c:f704:0:b0:3fa:934c:8356 with SMTP id v4-20020a1cf704000000b003fa934c8356mr1710900wmh.10.1690467493682;
        Thu, 27 Jul 2023 07:18:13 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bcb96000000b003f91e32b1ebsm4841104wmi.17.2023.07.27.07.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:18:13 -0700 (PDT)
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
	=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 03/10] riscv: Make legacy counter enum match the HW numbering
Date: Thu, 27 Jul 2023 16:14:21 +0200
Message-Id: <20230727141428.962286-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727141428.962286-1-alexghiti@rivosinc.com>
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_071817_521959_73CE0C51 
X-CRM114-Status: GOOD (  12.44  )
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
Reviewed-by: Atish Patra <atishp@rivosinc.com>
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
