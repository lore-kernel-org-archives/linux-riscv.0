Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0B8C61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 01:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQuKemOUoWG6ZhOtkkMqpseGOSldcmUZePuabmzjUIc=; b=Jp2ar/OwjBfPxg
	PzGLAyTTlHHt5dyZdt3IL2Azk+826XWXLJwdo3fvpIEqxi0R9JzrXpj24wzhIkzKYdBuFRRkOizOH
	x37uliPivCPYXXx+8L0iUclsgGNthbKLd9dpGHV97bwyrKcbx4FnOAgPE678C+UdUlBVSPf4I4EBQ
	EbLnLUXDWDIj3er/edrpM9/oSXbFIZh/BfJ8nGnppvqvWbI6sTkjvVIbTwyWxhFd5PuHllL3lBmoO
	P79/0dxe4s8n3Ol/Y8+0ADvKG1FQzZKJkMZUecALrnM9DUy5+qQN1HqZWKu0q3ErO9Ww2O1YcuYfi
	/n2dog3JUvwKe6pxOJYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bj9-000NCU-1i;
	Wed, 22 Nov 2023 01:08:27 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bj4-000N8K-2g
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 01:08:25 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6b20577ef7bso5508896b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 17:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700615301; x=1701220101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvpOAl9p0Aiam4sGuchXKDW+3q/tf43lzqxId4c/moI=;
        b=ikbktjTG/B5LtFPgV3jkHwZm4h+bBL0FEuMOUh41hY91sBeLGk4BqbRzqIY9x0sknX
         4zNdFgU8F3UJdTIUn6DfrUnTlAczqZw0npLa74nwKqBzR9Q9jbhJ1+eZ24iteHNUkUcc
         uMvuoFQc2LhBwHh62ty2CgivNKAB1hhbevCC/YvR6kz4TWH2Lv1g404IHk58lbmlz/El
         1p6NYxUIy8Q+ESjCrGW3VnQhkN8TLnoKrYnQmViAaX49HlgpBuPupBHRl58jYDScyCAu
         FBNmpd/CPNE2HsZ5b96OLvtzg8o2B4Kh9vSoR6oDkkwiTy7a86L9cmMWeZayZszEFJ8I
         AVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700615301; x=1701220101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvpOAl9p0Aiam4sGuchXKDW+3q/tf43lzqxId4c/moI=;
        b=fzgfz51wkqMeamGi9cBZ2GqHXpuVivAQvnknEVexd6eI+pYqf4p2U4mykqVwcSgvR4
         mVAHc2/eVCED6zcEOkrHlXExtIn1eTeNtYqsuzHVY6h3tD7eU4iNHZoe22W/QJMJSKac
         2NwhqhK82Opj8SaqChP48O0+ozdY/A+bSbTDQQH337ytFCxcLmYvbOmGjwxBZYOCURzE
         v1iE1XJP0SavxLxflCJa/ghmhyoorbs4LZCjxHvrG0/qMPOw2gnFjJO8Zf1hulzqvRK1
         IPZq74Jlf8KVT3N0lGc6d+ecGVknDqp3LyDFyxWL0JzrDo4p+4LbCPRfvcE/GnyXxRrz
         w+Vw==
X-Gm-Message-State: AOJu0YzQMv56098aoUZ7psHJs9QCBmlP+uqw9FVKGgC41lrMt/gNlj6q
	rbpxcV8452NKUvFY+ls7l25GyA==
X-Google-Smtp-Source: AGHT+IF9d9fQIS/asTDDunhMGjFlgWHJ5Uekq1PrtWCEzSD057jeC559ik7d8wrAC6IaVqDr4/Nfcw==
X-Received: by 2002:a05:6a00:3927:b0:6c6:aaa4:5d68 with SMTP id fh39-20020a056a00392700b006c6aaa45d68mr871292pfb.27.1700615301365;
        Tue, 21 Nov 2023 17:08:21 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bn5-20020a056a00324500b006be047268d5sm8713961pfb.174.2023.11.21.17.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 17:08:20 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 3/8] riscv: Avoid TLB flush loops when affected by SiFive CIP-1200
Date: Tue, 21 Nov 2023 17:07:14 -0800
Message-ID: <20231122010815.3545294-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122010815.3545294-1-samuel.holland@sifive.com>
References: <20231122010815.3545294-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_170822_873810_49D6B487 
X-CRM114-Status: GOOD (  13.24  )
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

Since implementations affected by SiFive errata CIP-1200 always use the
global variant of the sfence.vma instruction, they only need to execute
the instruction once. The range-based loop only hurts performance.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - New patch for v3

 arch/riscv/errata/sifive/errata.c | 3 +++
 arch/riscv/include/asm/tlbflush.h | 2 ++
 arch/riscv/mm/tlbflush.c          | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index 3d9a32d791f7..00e011d78866 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -42,6 +42,9 @@ static bool errata_cip_1200_check_func(unsigned long  arch_id, unsigned long imp
 		return false;
 	if ((impid & 0xffffff) > 0x200630 || impid == 0x1200626)
 		return false;
+
+	tlb_flush_all_threshold = 0;
+
 	return true;
 }
 
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index e529a643be17..3b393f765805 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -62,6 +62,8 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end);
 #endif
+
+extern unsigned long tlb_flush_all_threshold;
 #else /* CONFIG_MMU */
 #define local_flush_tlb_all()			do { } while (0)
 #endif /* CONFIG_MMU */
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 0feccb8932d2..27b3744b5673 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -11,7 +11,7 @@
  * Flush entire TLB if number of entries to be flushed is greater
  * than the threshold below.
  */
-static unsigned long tlb_flush_all_threshold __read_mostly = 64;
+unsigned long tlb_flush_all_threshold __read_mostly = 64;
 
 static void local_flush_tlb_range_threshold_asid(unsigned long start,
 						 unsigned long size,
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
