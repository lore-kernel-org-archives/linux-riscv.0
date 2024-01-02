Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7781DC47079
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 22:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxextqT6+s4SnCLpRzGYJXl0X87N89GWg68rIw3Q/48=; b=fGBSANTX+v8kiS
	1Z+I0DyDm0KytOqENe9JNssG9h0pHR5LwCiqTHe8qbcSls5F0TMloSbJLY02O71rdFA3ByOWv+4uJ
	cvtPgAV/nL4TKP9sQA6CcFfmDprFS0GoGbHRiPzQLTwT6hgv4w8oAlfygL2XqQtSXEz6XmLpaCQTo
	qImjoj4IT1TTMWc2l0I/XWbqMBTzlhFgahvQ8+wk7+JDMu+x9EdIHvl5TCJ/CfSaFfbbYQEK/dXM1
	jvGCOGbSDxMxLA8IyX7IdSDMRLBo55YeDoVX/GaV4cOF8lS3lIYKQyrKaC9nQMxfg3dv8x6fvmOQA
	KjJQ4TdJ5UOM2KptVhiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpZ-0098Ul-14;
	Tue, 02 Jan 2024 22:01:49 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpS-0098PD-2s
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 22:01:45 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5ceb3fe708eso151271a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 14:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704232901; x=1704837701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDpWqQ4mc+jX/Roh6ocibeJ1LmLlK7pqWIKc4/L4AE8=;
        b=LVC8ZIbUTtTWg+I2pMGYo3NGPoicU1EHMxQO4qtoQb9yNqQjXdM8bRNxt3dACH8Fgi
         SYEaTRDZXP41Qy+zGZmwqzAQMQa929S9ztIcXwaaL8l+qLUL/w2GhDKcaA2EEvbsbvPz
         WbUapkY3A58iii431igJQNWj6ThK206oRvQZgbfnu5LxFoswg0CX3wPaMhBVOS42tcFK
         khyI8tI+qcHU3j+ZZZMwJakqSc8sGhdVhDuvCRs2J+sypCAd5w+cRnql1nzuqls/bhaQ
         qqhXz7Jr4xzth2xj16aAyOChQfnTFm5r8lmd/U6OfTwV4IQvd6Ig1Jk5nzl+if5RdUkH
         PjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704232901; x=1704837701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDpWqQ4mc+jX/Roh6ocibeJ1LmLlK7pqWIKc4/L4AE8=;
        b=q7wbq1OasL7lsx5MuwMGO3fwhV6TlA5Irq9F343AtJ/5JuoxKDd6LWtgEFYgBe3M3m
         IrUwzcb5+0yzt5PHnjmXtUuoq7yEwUMFts4UmWl11Uj15ZsiTScSycf/VZ3WoI6F+ezp
         0dVLgjUY3lLRwb13XJ2oaURq7Lo4UZtzD+C1mftC7bexJwdxTNKOcifCkGqMNuVzTEA0
         izKCvc5m9dbYN4RbR0qXVJUdXJ4Ng4N+bZuj9FtQDv40W7tfEr0kWFpFC50PJ7OcyPBI
         9ADekdiaR5m2t5DZAXp8xiY8TyPf/Vg03xY0Q2mtsjmCTU6+H+NLEjc5cMVfMjL+0dPB
         RHWw==
X-Gm-Message-State: AOJu0YzywGDDSaO8/SofFajg004UrIe9y25eWGumUtclRPx6Nqf64T2E
	DuLmQWi4fGrwK6PFEehS5G/6d+lZ27VR/A==
X-Google-Smtp-Source: AGHT+IGhgK6idMxI6CkoCNiy9Y4cs5Xn9ml4r4H30wFrLDF3Z3r2uMsg0CAIjypKVmYj0k77Mk3d6A==
X-Received: by 2002:a17:90a:6ba6:b0:28c:640b:ce0b with SMTP id w35-20020a17090a6ba600b0028c640bce0bmr4536054pjj.33.1704232901387;
        Tue, 02 Jan 2024 14:01:41 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id r59-20020a17090a43c100b0028ce507cd7dsm101724pjg.55.2024.01.02.14.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 14:01:41 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 04/12] riscv: Only send remote fences when some other CPU is online
Date: Tue,  2 Jan 2024 14:00:41 -0800
Message-ID: <20240102220134.3229156-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240102220134.3229156-1-samuel.holland@sifive.com>
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_140142_965737_9B38C86D 
X-CRM114-Status: GOOD (  12.25  )
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

If no other CPU is online, a local cache or TLB flush is sufficient.
These checks can be constant-folded when SMP is disabled.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v4:
 - New patch for v4

 arch/riscv/mm/cacheflush.c | 4 +++-
 arch/riscv/mm/tlbflush.c   | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 47c485bc7df0..f7933ae88a55 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -21,7 +21,9 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
-	if (riscv_use_sbi_for_rfence())
+	if (num_online_cpus() < 2)
+		return;
+	else if (riscv_use_sbi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 2f18fe6fc4f3..37b3c93e3c30 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -73,7 +73,9 @@ static void __ipi_flush_tlb_all(void *info)
 
 void flush_tlb_all(void)
 {
-	if (riscv_use_sbi_for_rfence())
+	if (num_online_cpus() < 2)
+		local_flush_tlb_all();
+	else if (riscv_use_sbi_for_rfence())
 		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
 	else
 		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
