Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E804C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 23:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qbD4tVatc4PnGqA+eQ5vWYpT5pSILCuLHSi1E8AV81s=; b=tpGqBakf9/LMS1
	mI/axY6v8Q0cCkf1mJGEC5WokUCwv5pcdZ+2emnjjwL9tE8i9d2t7yPamdCeQRbEyEm6KBbERwmjF
	wvDzG/Dl49AFjaqjjlkAxGQPazVupQwxdidDSiGUhXM9XykrYEU9CeRyZHztW+sATIs5eM8+px7FG
	2A8ZKh2xULwwrAJpC0VoRjXk8k6S9+pxHacXx5umX16yaZJ0jCKdATIFMTYCu7hZQVBn21d/YFX+S
	BU/lD3Jc0Co6hFj1LDjybEBWaS6FIZHWLV2n2uoqtfCrRqxD2qtjnauc/qIk+Hz9Z3K20Zu18l2yK
	wCXXNdbeSSqTmZ/bs1ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjV-0000000Fa52-2di1;
	Thu, 29 Feb 2024 23:22:33 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjF-0000000FZuD-3oPX
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 23:22:20 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6e56d594b31so866172b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 15:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709248937; x=1709853737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/3iO4NfkALka4Buc8Img0QDYdUTnf5/4SNG0fcN5rQ=;
        b=QD2HWwR1SuyjA5OJpKwB/3yeT2K8TVIkR7tuXfTrdkhMMR++uN3UhXIQeR1PDsD8EU
         NauFD2IL7t+6qn9KQw4MddRMx19jx5mXzNvek2Y+cZbQzAr1vvGT5gkrdBXl5VKwlpiE
         XHqyjrnXq9WAMrBIR0JvxygqgZtXROL1g5ZllyREnO9h9ufVrLAVbGVXTzUVj/qUPgkn
         qt5ZA2Zeq7C09ZU/C/Y4EMFgpYhOrLNkyAtOY3M3e6DFkIPiIf3JDQG2sAy58bejbZzI
         zDbie1J4h00IsvdEwKUBaV3zqIAoRdpQw8TKJrnHWN1J9U0TNL+LAoxNJLbNSBzxED6y
         ZXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709248937; x=1709853737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/3iO4NfkALka4Buc8Img0QDYdUTnf5/4SNG0fcN5rQ=;
        b=BsIF2xA7faTGUESgOItf/BGVWvo8JQ0auEYdb5pC+hKeNSPPqWMCnfRON2WbHdPihb
         6ouHYKqj+RkX8G9VZlQtPyAynrJJ/j71QnRVKbFFh1Tuxh1jJJa4FSG3qputbTj2bjRq
         B1zC66c2Kydv3vs0pPUlLZJHKgFPyUG5edLCLq8N8AXFwoMLvdf5ynf6aevmgWXv4Llw
         hRgCunMawdB6EwUYFf2A4102ZmN3Xp9ImLBOEG35GawJU/kZFJKa1AEHPZMM6X2nvlp2
         A7xaWMN7kAhxfm3bLAcctOkmqdc5Ssm+ZL6XR9UqURpXk7bqNJbwL43m3juknst6M/TQ
         8W0g==
X-Forwarded-Encrypted: i=1; AJvYcCVTQRh6EwxssRdg72Ca27vPRHD7lhdUwZaou9Q81OopyVL5al+SgmilBwcTjy8+5r0IPTxhQZgzZYBRLEcX3IXwUJrgtsX9cfA84V7xPzFY
X-Gm-Message-State: AOJu0YyGf1KK8wOz4YU5a99UnfheSQpN1nX+1yZlTMJisMW8LmrT4Qs0
	6devKXB25I1vDeAoh/As4utVds43NorLXzB4eLzLlgzj+ZVXpNRQ76Seii4fmC4=
X-Google-Smtp-Source: AGHT+IHEWuHXVZ/LoNCuQjq9ikFwqlpYM8ivEnjNJqMVh5lQ2hbDE0NnP51hssPDjMbEUOy86+sdSg==
X-Received: by 2002:a05:6a00:14cf:b0:6e5:a996:5201 with SMTP id w15-20020a056a0014cf00b006e5a9965201mr172471pfu.10.1709248937282;
        Thu, 29 Feb 2024 15:22:17 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id c6-20020aa78806000000b006e55aa75d6csm1779719pfo.122.2024.02.29.15.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:22:16 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 04/13] riscv: mm: Broadcast kernel TLB flushes only when needed
Date: Thu, 29 Feb 2024 15:21:45 -0800
Message-ID: <20240229232211.161961-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240229232211.161961-1-samuel.holland@sifive.com>
References: <20240229232211.161961-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_152218_044986_642677E2 
X-CRM114-Status: GOOD (  12.80  )
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

__flush_tlb_range() avoids broadcasting TLB flushes when an mm context
is only active on the local CPU. Apply this same optimization to TLB
flushes of kernel memory when only one CPU is online. This check can be
constant-folded when SMP is disabled.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v4)

Changes in v4:
 - New patch for v4

 arch/riscv/mm/tlbflush.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 0373661bd1c4..8cdb082f00ca 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -102,22 +102,15 @@ static void __flush_tlb_range(struct cpumask *cmask, unsigned long asid,
 			      unsigned long start, unsigned long size,
 			      unsigned long stride)
 {
-	bool broadcast;
+	unsigned int cpu;
 
 	if (cpumask_empty(cmask))
 		return;
 
-	if (cmask != cpu_online_mask) {
-		unsigned int cpuid;
+	cpu = get_cpu();
 
-		cpuid = get_cpu();
-		/* check if the tlbflush needs to be sent to other CPUs */
-		broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
-	} else {
-		broadcast = true;
-	}
-
-	if (!broadcast) {
+	/* Check if the TLB flush needs to be sent to other CPUs. */
+	if (cpumask_any_but(cmask, cpu) >= nr_cpu_ids) {
 		local_flush_tlb_range_asid(start, size, stride, asid);
 	} else if (riscv_use_sbi_for_rfence()) {
 		sbi_remote_sfence_vma_asid(cmask, start, size, asid);
@@ -131,8 +124,7 @@ static void __flush_tlb_range(struct cpumask *cmask, unsigned long asid,
 		on_each_cpu_mask(cmask, __ipi_flush_tlb_range_asid, &ftd, 1);
 	}
 
-	if (cmask != cpu_online_mask)
-		put_cpu();
+	put_cpu();
 }
 
 static inline unsigned long get_mm_asid(struct mm_struct *mm)
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
