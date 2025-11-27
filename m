Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29575D11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 14:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oycPcne3mTxjEqmG4mmXeD83GPaYOat07Lfl1LZ8VF8=; b=lc9g0BJCafT50o
	ySSOQC/HBYW/5yYIqYOL+wVr4NVHo392ScENM+wojG44mqOrUGsYmEINzXJiIbcnT92wH0mMNVdnY
	YViXlQiEw1CJw7cWjwjuc+wMGKWNkgzv1bI197WQNxV4bVYNqKypJlazrIcx61gEbYb/Z8t4ESNxP
	XFs7S6t9dVkI/znlByzDGSvOM9IiIQGVJ2tkRZECZv7Fjr5eTsvtOoStLFhTlab5kYegQxeeYIPSu
	WuOAO5/vUkDwISx4p0jE9WxQNjjL6Wy0fpbM73zInGiWfN6u0rnJTKPiFIYJpCk0m3gnuL+jKKGFh
	znf4M/znZIPZzd/ejhYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcjw-0000000GkrD-0Fjz;
	Thu, 27 Nov 2025 14:12:56 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcju-0000000Gkph-2tDD
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 14:12:55 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-29853ec5b8cso11177705ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 06:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764252774; x=1764857574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTb9aibo/K/jflPv0dS9O1eEwweSl7PPeR+/A9D7hw4=;
        b=hbfTGnt3g/nxoV4suehD/KeM4xecyuEBpieSRs0zJtWad46s3LQ78J4a/2Yp5FKNck
         VirRLIbFkoJMgplwnb0/2cMW13iVTeFXCsLr1lW6RbdzoFyfFVuMUhuDEzwP3ruEih+W
         IlL0cLHjCLDK0uk1A7xPa5XL4oq4RcX5wekkPHys+xTvdR2/8AK46k1MPDmt1Wf001ia
         UnYuIrnxvpNy5rCD75beSKIJftI2fyNN8pc2g7SzBmHUPhLyG8N1MvXKh+EUg2ApDb/y
         MdA6gh2j+be577j4BwXze7SfAiOnfJd7rWdXtYJqqv8+tyDmHPMnVhx3vwtSHGfHzcPx
         D/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764252774; x=1764857574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hTb9aibo/K/jflPv0dS9O1eEwweSl7PPeR+/A9D7hw4=;
        b=pPXKvIIadq9M88NRWmpa7y5E5ndOff+kaz+OB/2XsvbzkqGfjJPZRqj8hUqWuUyzSt
         Uvxg6uJluFlDyn0lrprjEeMuj6zt0RhqOuU6LPNyB8mx0jf5J6OEKXGKlpYh7EP6PcBB
         9iZDmerGT77ApYPk8x3+FORmX2YUUgvaSqt5b6J2hOXWia2nTQ8qfsfC/MqOaLtAUihQ
         thjZ7OIIL7inFWWKNOgX9HEfaB3kENVfVjSr4H9I0Qa/APoB7eF2ydW/B0YeY6aVvwpC
         daQk9TZiauW+duVqdZ5gHEnUUXIY7EeXyFnmr0MOtQ0TbAziN2DyZrkXpLbM9kfI/XXZ
         ItCg==
X-Gm-Message-State: AOJu0YycJgrNd5CJFOf46okqJImrEKTCt5jENjH5+AlpsAUb1c5uX1+J
	6cZ5DOZnwzJNP5FadslA+M54AyXvaotxxY5ttjRirt3Q3s2Uo28bAP98RyG8xtoZHSU=
X-Gm-Gg: ASbGncvGL8BAGGZm8yrADDI+W7JGNjcmExfJcqv33sxzJEQZl0aViEsIYdUVdz3kENO
	M+ww7RtOyM2SQpczfNeRhPPmdSLbshYBOi+gncUDlmlswnnoPK7n25piwrFIjyF+zSPtbITKbXZ
	1MmIKMjX3AbPBOzJsAmvWkCeFDHZSSwoPm5DGcD1CwbIWIds5+ZspYVDVkj6WkmLjBRocP8BGa4
	N3Vygke3kkVCo70D0sTt8We+oh9o/5DrD7hoNqgPrAB0k0wxCeEcnrad5ZBMjp+Rxn+810XN/8p
	d6zuvKOYFjEwnWSOqgE7IVLbteu4agEx8dSmiKt+7hy75lTiYA1w0Wlz7v11BUK/gtjOVSskbZ6
	x5jNwLtYK3M2TzZGE4mI1gJUxohYiGhBPyLREaIV0brJqvG0n6xyONe2x9TLDS0NxSj3dkNr89v
	zXsr5vejHRI1O5iDk3f0Crc2r4e3XsZys4q7fpJX9UmxGmYhQNifHLM0CXGGbgXyLYWus5xo937
	PANQmiS6PN8
X-Google-Smtp-Source: AGHT+IGPqPAMlGbhX5jEp4J3UbDXeLl8BWDll8WVzM9luwXo+j3LxoGVrUXUo4r4lcoq2Ou8dpHZEA==
X-Received: by 2002:a17:903:2c07:b0:295:f1f:65f with SMTP id d9443c01a7336-29b6c6865a6mr282588785ad.31.1764252773816;
        Thu, 27 Nov 2025 06:12:53 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b7341d2sm2030249a91.11.2025.11.27.06.12.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 06:12:53 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kees@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	akpm@linux-foundation.org,
	david@redhat.com,
	apatel@ventanamicro.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 9/9] riscv: mm: Clear mm_cpumask during local_flush_tlb_all()
Date: Thu, 27 Nov 2025 22:11:17 +0800
Message-ID: <20251127141117.87420-10-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251127141117.87420-1-luxu.kernel@bytedance.com>
References: <20251127141117.87420-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_061254_735082_B034E2E8 
X-CRM114-Status: GOOD (  13.78  )
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

Now that we maintain an array of active mms on each CPU, when
local_flush_tlb_all() is called, we can clear current CPU in the
mm_cpumask of all active mms on current CPU.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/tlbflush.h |  6 ++++++
 arch/riscv/mm/context.c           |  2 +-
 arch/riscv/mm/tlbflush.c          | 31 +++++++++++++++++++++++++++++--
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index c9630267c58cd..fd62b27172d4a 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -108,6 +108,7 @@ DECLARE_PER_CPU_SHARED_ALIGNED(struct tlb_info, tlbinfo);
 
 void local_load_tlb_mm(struct mm_struct *mm);
 void local_flush_tlb_mm(struct mm_struct *mm);
+void local_flush_tlb_all_mm(void);
 void __init lazy_tlb_flush_init(void);
 
 #else /* CONFIG_RISCV_LAZY_TLB_FLUSH */
@@ -119,6 +120,11 @@ static inline void local_flush_tlb_mm(struct mm_struct *mm)
 	local_flush_tlb_all_asid(get_mm_asid(mm));
 }
 
+static inline void local_flush_tlb_all_mm(void)
+{
+	local_flush_tlb_all();
+}
+
 static inline void lazy_tlb_flush_init(void) {}
 
 #endif /* CONFIG_RISCV_LAZY_TLB_FLUSH */
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index c381c4ed46bfb..b6657681948f9 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -194,7 +194,7 @@ static void set_mm_asid(struct mm_struct *mm, unsigned int cpu)
 		  satp_mode);
 
 	if (need_flush_tlb)
-		local_flush_tlb_all();
+		local_flush_tlb_all_mm();
 }
 
 static void set_mm_noasid(struct mm_struct *mm)
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 88a1e45bcf508..73c0a7ef61cb1 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -89,13 +89,13 @@ void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
 
 static void __ipi_flush_tlb_all(void *info)
 {
-	local_flush_tlb_all();
+	local_flush_tlb_all_mm();
 }
 
 void flush_tlb_all(void)
 {
 	if (num_online_cpus() < 2)
-		local_flush_tlb_all();
+		local_flush_tlb_all_mm();
 	else if (riscv_use_sbi_for_rfence())
 		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
 	else
@@ -461,6 +461,33 @@ void local_flush_tlb_mm(struct mm_struct *mm)
 	local_flush_tlb_all_asid(asid);
 }
 
+void local_flush_tlb_all_mm(void)
+{
+	struct tlb_info *info = this_cpu_ptr(&tlbinfo);
+	struct tlb_context *contexts = info->contexts;
+	struct mm_struct *mms[MAX_LOADED_MM];
+	unsigned int cpu = raw_smp_processor_id();
+	unsigned int i, num = 0;
+
+	write_lock(&info->rwlock);
+	for (i = 0; i < MAX_LOADED_MM; i++) {
+		if (!contexts[i].mm || contexts[i].mm == info->active_mm)
+			continue;
+
+		mms[num++] = contexts[i].mm;
+		contexts[i].mm = NULL;
+		contexts[i].gen = 0;
+	}
+	write_unlock(&info->rwlock);
+
+	for (i = 0; i < num; i++) {
+		cpumask_clear_cpu(cpu, mm_cpumask(mms[i]));
+		mmdrop_lazy_mm(mms[i]);
+	}
+
+	local_flush_tlb_all();
+}
+
 void __init lazy_tlb_flush_init(void)
 {
 	struct tlb_flush_queue *queue;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
