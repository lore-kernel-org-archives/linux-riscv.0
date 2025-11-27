Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A69CFD2F6
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 14:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EqhGqtpOiIlYpZEXybi1v5Tbo8ZoONhPm5sXtlCyFH0=; b=BBN4E2J23OE6fB
	CJZYpeduf10B2wG4xRiYZK3InY1IsTtdadbYAhVmWENV5tyacdvuY/JgruSUerUMVOBxEhA9eWNH7
	FXbim1tM+EHiKF4/nhMOFqqh308hDdCWEDjdHb+IYgHXXWSG8YnylcXL8f21cCerz11uvW7BKAhEK
	3sJNcS1tMhcy+rn9j09aRWizmTaU2un3ceSoaXvUAksAPRUvfWi/btwFt3/i+oou79054mV41K4tV
	95I78QiCtrdqulx9cPlWVunxV9UA1f8SX4Gl84qo7lM7xp0l5qOROYqleOJaZCMqyLftHlk/1/Am2
	n1niP2Q700aI6baJPPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcjm-0000000GkkD-1m60;
	Thu, 27 Nov 2025 14:12:46 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcjj-0000000Gkhg-2DD3
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 14:12:45 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3436d6bdce8so859358a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 06:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764252763; x=1764857563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7glhrA2/bhcJ3C4rVIYMtSTbP/A3a+HxT2eJKeURbio=;
        b=O2qXcxJEHEArisrj8E+wkA+Mqa/RCPxu9GQSSiWbABLJd2XKl803lC7KT3KEWombtq
         SVkVY7M1Lbvb+PXXRmDihUkRrqbKZx81d7B2MWEWbo2pRS/EhqKBLfx+Nexp87Ty0aJ3
         aOEL3z0g+Zhor/O9GZQzbEh/UvNsqRnNJhy+k2YEas7KYtPIr3C7GV4eowWIEtAm5rHr
         nMXPNuv+H692tc6OF+zZpnaQcCJW/M3YXjYRz1lmarA1MlWaqBtwLPwJjMzpTiLQJ4dT
         XEcxVI+UtAIGCXOQAlqQxktaDxPZn3VKilUR4AQhzq2ZaCl0qyL9OZRi188nxhubXUs4
         rc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764252763; x=1764857563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7glhrA2/bhcJ3C4rVIYMtSTbP/A3a+HxT2eJKeURbio=;
        b=W24Sw2qg3yEZiwgwy6E0st40zY772ZVZ7NwiXEYpreY4JJ1sBOeWmdkpBqlz9uujx2
         DYgv9sZdgw6V0XhDnrxPb7GyucKy6EzDNxLWbWdVlx0JyAaRllwqL1sFo/GckLUzJzAk
         vebx6Fsl/fOuiRyGVXC9QItCCI6R9FZnxTBeCNP3CQRI/88dS88HAq1Ahv2Vgdpkhcw6
         HEXg+uRf9STG4GX7chqgD9A3mWi4Nih5WNp9Carkk6n3vjVbo/WgwKC7nOv6anURMGSs
         GBCR+3VYRBlutoBFvoNQHPLVBNoeenF9pS0BgzdgJGouiYWw2fO3NDRx6p0m/SlG/jqx
         AjTQ==
X-Gm-Message-State: AOJu0YyCiAz5kxYwcEjmpvfyfLoMzTsKxG+dwfiNYj/eBrrgZHMflgAq
	bNRkMypX0/1GD/fGQdicSfFyfpHmfgnqne6i7MbbbuxUXsFlGGvsp5YEAPkdMW/dfaM=
X-Gm-Gg: ASbGnctsRGQIyjOxd3NTahboVT7wUNp5ymXb6xEKVQS4fqpResytRzEbAvrm3emH5xd
	o9qfrt2DwwgOu/UfvbCknz5UAiuo2Kk4418G334BhnfcM3EXYvws0nrU9fOkyKtGzYlQ1ZjgGH/
	vK2B/1QieiESlp9bCli9+46/i5Fz2CH9qX1g/CLeuCz0R1KMFhNGS67g3vSwXLWQOQXVvoRPFRn
	3IAk+MWl0diiBnQWaI+MXXOD0OIZHeym4f73n45TeIWAQ7MgJsDmV65J+PaS/mVSihVIInXDESF
	agtdniNO0YQB5bKjRmHOpMgRXcxzyGBNVMgVcrIROHMPTVXpqkMeKNfb/umdb1EynmZj9aPhwlM
	IVaQIL2snWs99rT5cpnwWPpzAZsuSEdGOW3DNRr6PvLBm5cLHxlBT6TN3tEV3GZ4zvz8cYrwcMt
	CJmxNXAt4wOXbQkumb3YxhqtxFhywOlNDNSydt3fC3w0WEAHGSULmiDp/HnHfqKtndC5zdNlQWP
	g==
X-Google-Smtp-Source: AGHT+IGJodAk35vvTSCefFgpwaOAVIMesvU7l7N866cJmylZ3F8YVFLaZ662o0Sa9lutX8QW3ovQ6w==
X-Received: by 2002:a17:90b:3502:b0:32e:a5ae:d00 with SMTP id 98e67ed59e1d1-34733e72350mr22757635a91.13.1764252762612;
        Thu, 27 Nov 2025 06:12:42 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b7341d2sm2030249a91.11.2025.11.27.06.12.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 06:12:42 -0800 (PST)
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
Subject: [RFC PATCH v2 7/9] riscv: mm: Defer the TLB Flush to switch_mm
Date: Thu, 27 Nov 2025 22:11:15 +0800
Message-ID: <20251127141117.87420-8-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251127141117.87420-1-luxu.kernel@bytedance.com>
References: <20251127141117.87420-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_061243_606552_BC1AADB9 
X-CRM114-Status: GOOD (  13.97  )
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

Since the TLB Flush IPI is avoided when the modified mm is not running
on the target CPU, next time when target CPU switches to the modified
mm, it has to check percpu TLB Flush queue and perform TLB FLush for the
midified mm.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/mm/tlbflush.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index b5a2d9874d62b..0083fac87c2bc 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -365,8 +365,10 @@ void local_load_tlb_mm(struct mm_struct *mm)
 {
 	struct tlb_info *info = this_cpu_ptr(&tlbinfo);
 	struct tlb_context *contexts = info->contexts;
+	struct tlb_flush_queue *queue = NULL;
 	struct mm_struct *victim = NULL;
-	unsigned int i, pos = 0, min = UINT_MAX;
+	unsigned int i, len, pos = 0, min = UINT_MAX;
+	unsigned long asid, start, size, stride;
 
 	for (i = 0; i < MAX_LOADED_MM; i++) {
 		if (contexts[i].mm == mm) {
@@ -387,11 +389,36 @@ void local_load_tlb_mm(struct mm_struct *mm)
 		mmgrab_lazy_mm(mm);
 		victim = contexts[pos].mm;
 		contexts[pos].mm = mm;
+		contexts[pos].need_flush = false;
+
+		queue = &info->flush_queues[pos];
+		atomic_set(&queue->len, 0);
+		queue->flag = 0;
 	}
 	contexts[pos].gen = new_tlb_gen(info);
 
 	write_unlock(&info->rwlock);
 
+	if (contexts[pos].need_flush) {
+		queue = &info->flush_queues[pos];
+		asid = get_mm_asid(mm);
+		if (queue->flag & FLUSH_TLB_ALL_ASID) {
+			local_flush_tlb_all_asid(asid);
+		} else {
+			len = atomic_read(&queue->len);
+			for (i = 0; i < len; i++) {
+				start = queue->tasks[i].start;
+				size = queue->tasks[i].size;
+				stride = queue->tasks[i].stride;
+				local_flush_tlb_range_asid(start, size,
+							   stride, asid);
+			}
+		}
+		contexts[pos].need_flush = false;
+		atomic_set(&queue->len, 0);
+		queue->flag = 0;
+	}
+
 	if (victim) {
 		cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(victim));
 		local_flush_tlb_all_asid(get_mm_asid(victim));
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
