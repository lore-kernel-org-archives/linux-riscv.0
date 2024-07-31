Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B44C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 19:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F2Dj9pUZml7mbgOJToJtssCX6QrVij0UlVxju/xRcx8=; b=0bj3DC5Cwcu63o
	8BniG/FPU8pMpB6B/5Kn5pEd3AOvVF62yVa+9VoPP90b5sgEsP7D7tu72Nz6/IN/LSpCaFNyS2dha
	CuVnRHcenMAD1bdCIT5iLkfgvvrfwItdWF4uVj6sZLnRGDI7zaGrRXHIfZSyiRLvHG9BFAFapZKpg
	FyhDOTE9aX9JwqIxSOAahDsyJZgBItaKunzZ7fn4sSFU+lccYicBJpGAIzuLULWQsHnQSDYC29QjH
	a0DqdX2DSu2AynwKVkg731rZPEV5YP1kWePdUYT0tlYTU8/c/dA2EFmcNAsuxGP6/rttrVr7DOaug
	WrY25elQrOlM+4wy/SRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZFOl-00000002NOl-3cVr;
	Wed, 31 Jul 2024 19:54:11 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZFOi-00000002NNy-2nIq
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 19:54:09 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fc5239faebso42615915ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 12:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722455647; x=1723060447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+cTd6ZUEKI0K5FwC0UZmoEYNNh1a3wBYwKN3A31jyHM=;
        b=T8Jo4LS5EiTB/wLYVtmgTTsczNmA5rARF84ZCnru3tqTMlIK5plHtQeMQ+OzAbwRk7
         nSdfS12/TgiSc+ExLgWa7dM8Hzj+WGXW+aNauVWPrN7LbjlyeUa0HRN6cgPCSV0l4Xrp
         wXkJqPkIa2jKsagN3Cc+BpiV3AMlHct1ML/bb6bjHsya7FQO/ifCGgBYiHn0UPGJKf/A
         HryN7PXIzIPgmmUlewU1z9l7rfj8WPXlfo+4CmnYfLRv8MWHaKDMP3G7Lext98QEDQNc
         fMkx2cEDExaEMvSQMlePPVAiHvU+OmpHPB8nezBn4EteIwhMoDiBqOXJMjdQB5BZj9PX
         6dNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722455647; x=1723060447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cTd6ZUEKI0K5FwC0UZmoEYNNh1a3wBYwKN3A31jyHM=;
        b=xFB1Oiig5qSpNG9w6TF3OAFZsKM+irM3Sm16DC9DAKtJpqvhCcrJVCiMaZOs/O9K01
         cXjH8wcPWEuEezF3kvmLittLH4Xsb82bcO7g2OzcA/pY298lmA118I0yvI0urxzUPYoB
         EMIEvxk3KM3/B+OwbDLnU/DP2+5f7f6lKINhGhhPdlRaqbkxReGFUDMH1XkQr4+6qUjp
         a2RZd7kaHCb+LA6cUKL81KySgioV9hYgHVUC2HsKU6b9/jTvLrEFwKGHj5jUGHKhyLTx
         Zaxffr1/fljZf3+z7Pmu6yW+IbRaCyQnPU9/6cGuakEp3Rf9EySbKMNwL5WADunC3FOo
         GcrA==
X-Forwarded-Encrypted: i=1; AJvYcCUKgNPGKUFBg8eXD4qMpcBdSWKjXEzT0pBYeQKlBQOezM8LEjZhSYWhyp6FrcB9waVgNegxHA6BaVIhPZfLP6AYuKYAO7OrY80MwenPfwPY
X-Gm-Message-State: AOJu0Yxm9fM7kg5/PMkpSVlk53RJos+LLvOei3cY4ICAKrEclrn6CoHw
	qrpDvJwPGXAKjAcVtQgARtL7iRoCuxPnBdClVskePrrfckUzESht
X-Google-Smtp-Source: AGHT+IHX3N++3mRwHioPQRvEg3ehAUj2ckiXrOUBBfwUEkGVAeWEfuL65Ft+bMObHK+8K9wf3ZAe8g==
X-Received: by 2002:a17:903:1108:b0:1fc:5b41:baff with SMTP id d9443c01a7336-1ff4ce47ce3mr4268925ad.3.1722455647095;
        Wed, 31 Jul 2024 12:54:07 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ef238dsm123895195ad.180.2024.07.31.12.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 12:54:06 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] cpumask: de-duplicate assign_cpu() API
Date: Wed, 31 Jul 2024 12:53:54 -0700
Message-ID: <20240731195355.97488-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_125408_729765_51806FC5 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Charlie Jenkins <charlie@rivosinc.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We've got cpumask_assign_cpu() function and assign_cpu() macro, both
doing the same thing. We need to drop one to avoid unneeded duplicatioon.

Now that underlying assign_bit() implemented as a macro, it would make
sense to keep assign_cpu() which is also implemented as a macro, in sake
of unification.

This patch also removes __cpumask_assign_cpu() as the function is
unused.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/riscv/mm/cacheflush.c |  2 +-
 include/linux/cpumask.h    | 16 ----------------
 2 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index a03c994eed3b..fa136627ccaa 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -171,7 +171,7 @@ static void set_icache_stale_mask(void)
 	stale_cpu = cpumask_test_cpu(smp_processor_id(), mask);
 
 	cpumask_setall(mask);
-	cpumask_assign_cpu(smp_processor_id(), mask, stale_cpu);
+	assign_cpu(smp_processor_id(), mask, stale_cpu);
 }
 #endif
 
diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 801a7e524113..f896c6ffa78e 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -534,22 +534,6 @@ static __always_inline void __cpumask_clear_cpu(int cpu, struct cpumask *dstp)
 	__clear_bit(cpumask_check(cpu), cpumask_bits(dstp));
 }
 
-/**
- * cpumask_assign_cpu - assign a cpu in a cpumask
- * @cpu: cpu number (< nr_cpu_ids)
- * @dstp: the cpumask pointer
- * @bool: the value to assign
- */
-static __always_inline void cpumask_assign_cpu(int cpu, struct cpumask *dstp, bool value)
-{
-	assign_bit(cpumask_check(cpu), cpumask_bits(dstp), value);
-}
-
-static __always_inline void __cpumask_assign_cpu(int cpu, struct cpumask *dstp, bool value)
-{
-	__assign_bit(cpumask_check(cpu), cpumask_bits(dstp), value);
-}
-
 /**
  * cpumask_test_cpu - test for a cpu in a cpumask
  * @cpu: cpu number (< nr_cpu_ids)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
