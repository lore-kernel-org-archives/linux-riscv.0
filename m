Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71685C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 08:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqjYzmQgPxwzHQtoyygokJaK4h53GOdZ2lOw9pQogwA=; b=p+x4vCNA8nO/Tn
	Ry64g2axleO80NGDmxOy/zOUz5zBA7RGkdM46xsFmdgeIoIV69YYdHu134Ik7HEB5iG4/VQfPm5hc
	tbXx2Z5P3UDr9p1rK9c+Fs68z25nUqQVS9x+8RblhnDeBT1Csd5Kg6EHHFyaxPnbkVsYo77AYjEMw
	pnQIHtE8TZO5rNTkistFa2A5bRvmGXeMXEAgbJiX0cAu6JvfxWKK9KC31evN5LRfAzpKAQFyn57uR
	Q3o9yRDdc4KpxwTYK9yXS7dkEmxoFixuhNvvhYliislaJILXzN4T1EqnR7XecBj2S7hqugtr56ISk
	7znhPeNJUKsC4w2j+wlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOYU-00BO6M-2z;
	Fri, 12 May 2023 08:55:14 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOYT-00BO5N-0B
	for linux-riscv@bombadil.infradead.org;
	Fri, 12 May 2023 08:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6zC284Mx5M3d9WrVkxHAYpIwsSHj0B1udyIbm0+qXIw=; b=dkCeb4f1V+lNLlRRhiiHFdJzMK
	Q5SgrF8rwKwl+0/0HLeLdxPqpN5l1ySFpS5n2f0XLSqBdqv5kD+Q9iJ/ruMD5vUJZ3smcWgJjm/kK
	0qcU+25ZE2GnVIBrbqCE3hbyUwUQMErQjHz4EllYSDE3SfXhDPgJpB30jyGWhRRS8o1bMxYCT1YMu
	mzNVJIyaD4lV/J7lfYUnHoy6nHzrDb5ZXAvmqwt3VPeNxO//N9qsBmf9/hqPRscL1EM3Ey4rdg6ZZ
	KImNdUyYPvtXodQ8PtMuumS+N9T2h3N0M4d3qIi3EfTxfKFs0KqusVeQtZ5Jvpufy80y535Eze9/A
	mLRCTUkw==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOYM-00969F-2d
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 08:55:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f4c6c4b425so18476305e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 01:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683881694; x=1686473694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zC284Mx5M3d9WrVkxHAYpIwsSHj0B1udyIbm0+qXIw=;
        b=z44JIICsJ3FFmRv9/ChN1HSVSRV0MHsv5RbNUZGm/8+AuijyMI+HMBrhW1eDSp5v3b
         w0iMXFR0+HVV5NUmF191qH+N7+qxBY8TwTuOFXtbvH4n/3HY8EFgR3GYOZ7/nwLNSQ7C
         vCEkxCdwycPnXu67Oiw8yp09FtNQPxCo64ra48yGlduNuWNHR5VmHRSlQe8yNfTolfZi
         U9dYgsOwEsY0FzsHPjAAlCnfRLU7a0KLp9KO5DF4Mr34hM/azMOwBKS3r5newR9Ov8/y
         cTpW1quhiIeXGRQgbI8Aj3XZTkjzfQy1euYvkbBMoyXm6I8nIjNICS1bgMNlOuZ38Xgy
         ceqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683881694; x=1686473694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6zC284Mx5M3d9WrVkxHAYpIwsSHj0B1udyIbm0+qXIw=;
        b=MQAGhg7uQodmMsuwGBUg14TqoRAhX76QNFnFjUDjkfk5aTsEn3aKVEs5rxcf668BT6
         M1TsqS6LbgHS/okzM4ZECu5KX/u3z4/bnm2woN/x/MU2STfYLROBsvJiOxxQIKkF45u6
         0A+4BNWVpL/k6aboL36CKTrybQ3/eaxMxyqDpOQ6dTRo05McDjt0VB/bPXNxL7PfdqNT
         SQ53MJbKwMpN9dd4k9taiM1sfdph0dO6RrkleDqlRWo2nXZWDiRsRigJyMayt4jocM/E
         jH5t3Qky7nmDT9fE97jUXFhnJ0xwKNkSz77PXV/5rKPmNVR01iXMezbSM0PB/G5Zhy33
         kPAg==
X-Gm-Message-State: AC+VfDyxfS5E172bguoH1FS1kvUEKtOsSN8oFUPiSnuby/CeoS4RxfKR
	aS6mBksMRzFZoi8LOiLvaCrezA==
X-Google-Smtp-Source: ACHHUZ7yTqFGJSEOt4qvmG1LunFjlDzDAQO5Tm0YmvPi5fam/8fYjVc3Q48PRj/C9ibBB+6HaVTApQ==
X-Received: by 2002:a7b:c419:0:b0:3f4:a09f:1877 with SMTP id k25-20020a7bc419000000b003f4a09f1877mr5918180wmi.23.1683881693890;
        Fri, 12 May 2023 01:54:53 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id y25-20020a05600c365900b003f42456c490sm15098356wmq.33.2023.05.12.01.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 01:54:53 -0700 (PDT)
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
Subject: [PATCH v2 01/10] perf: Fix wrong comment about default event_idx
Date: Fri, 12 May 2023 10:53:12 +0200
Message-Id: <20230512085321.13259-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512085321.13259-1-alexghiti@rivosinc.com>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_095507_364420_9455DF0D 
X-CRM114-Status: GOOD (  11.83  )
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

event_idx default implementation returns 0, not idx + 1.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 include/linux/perf_event.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index d5628a7b5eaa..56fe43b20966 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -442,7 +442,8 @@ struct pmu {
 
 	/*
 	 * Will return the value for perf_event_mmap_page::index for this event,
-	 * if no implementation is provided it will default to: event->hw.idx + 1.
+	 * if no implementation is provided it will default to 0 (see
+	 * perf_event_idx_default).
 	 */
 	int (*event_idx)		(struct perf_event *event); /*optional */
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
