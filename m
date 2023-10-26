Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C89C25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 14:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UcmP+A5kgFQM00vu7/yYaLkoMlJ1u0p0KgK+Q2L2oys=; b=EqU/9t5ItuTCeA
	jhGJndJgWos15CHozcjcM5B8T4v38+OtNuKxfFaGz5so1bJo1xeYncXBymUmrLjvxQ1V5yyz3r3u2
	vo+7NDxZo6jK3J8tviai0J1AL454y82C+9h9x28T6S5vpPtqBYIOCMrCQ82ugv+8BcHDCGLFncDrq
	Yh2waanq3YJtCAOJAGTkWVecl3N4J/Ni6UWaNnNAPHFlJatlebwvrWOZKvhF4qAWe+gt+K45ifyfy
	XHMLro4jFzhACtpeQz4vs3Ne8v/QrRJWBY4zKgvj+9qcmbwikf8DWgGHJVTVEt9pkmbZK8NqJdBTp
	7chfQag9biZSjn4SwxSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1m9-00EkPi-27;
	Thu, 26 Oct 2023 14:55:57 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1m6-00EkOa-2U
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 14:55:56 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-58441865ffaso582478eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 07:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698332153; x=1698936953; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=xQSowzYBu/brUHbpJnJegcfAN9lML8q0chNAt/YME+Y=;
        b=P5gIzK4A34O0I2xVl77/Gv5/lQ1Yjpu94qropKwLnrB1aFMXy5GrjDr6EEB5TDAoHD
         eSkzp90an4HaaLnS8IJDZWWrtHM+c/aVpxmJ2OmB6vx5roeG31PEWe9Vgn8xREGXL0gO
         pX+5TquV/Yzbb213PcQLkHrSNZhPw/qMnH1ZAcjU35+5ewl7C4McTV4OG2dl2u6YiVJj
         e/Y9+HqGro/g42OMtjwW0IAk5IxjOJ9HgtgwpXBy3UK6CgUHIebKNFjXEm1LNfaag4H3
         2v5zv3GRsfB7qMZIQTWFsWbhrsDQM3dBkCHHsAuOPiYWRnKc0EPtTmhU9P4ZrGybiSIQ
         hecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698332153; x=1698936953;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQSowzYBu/brUHbpJnJegcfAN9lML8q0chNAt/YME+Y=;
        b=r8K53gryawgejgOwOP6zgqjoKaU/hbRjV8EOwHBH8Z39fJavvC7wKuvZ8Deu9eGY41
         wbCFK37hNfhdewime0sXO3jkU/3i1KfiAXH5eLZDzT8orhGQIr/NYk3gOp4Q/xr/swQk
         MCWLHiHzEtwi7zvLTSqOTH/VSFA7OO+5lSNO7MK5jMT9BwNGWC2JjgKazlWPuSrY2VsN
         u1vbwnGvr716r/dYXzTYZy8+54pxfLMUUj4wjHPsw6O/pTJTy4DhOEzofrYlrRkcARLs
         F3Z6fFDRQuXgTJ2lT5s/WNMK0Bx3tRysRI4KZwa7B9D+EC3mhk69dfzpk8A+CPZOeAd7
         Cifg==
X-Gm-Message-State: AOJu0Yyucm28b+5ahML8HHMtytrw8B+1Xl+Tau7ggYWsFnMHQCCYNZ/Q
	tCSNQCAPiwDHvOnBMX8cWWoxXZUkAEXmkNjIo9Y=
X-Google-Smtp-Source: AGHT+IFu5wOaIWbdPi12Tg4Zzkt9GVpwUy6TKZm+0i0bU4TWnO/+lh92QZydLs9cbi3Az6XXscEMTw==
X-Received: by 2002:a4a:d397:0:b0:586:b062:f3d0 with SMTP id i23-20020a4ad397000000b00586b062f3d0mr1340385oos.7.1698332152907;
        Thu, 26 Oct 2023 07:55:52 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id r125-20020a4a4e83000000b0057b38a94f38sm526149ooa.12.2023.10.26.07.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 07:55:52 -0700 (PDT)
Subject: [PATCH] RISC-V: Fix implicit definition of flush_tlb_all()
Date: Thu, 26 Oct 2023 07:55:16 -0700
Message-ID: <20231026145516.25866-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_075554_806772_0D143313 
X-CRM114-Status: GOOD (  10.06  )
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

Without this I get allnoconfig builds failing with

      CC      arch/riscv/kernel/asm-offsets.s
    In file included from /scratch/merges/ko-linux-next/linux/arch/riscv/include/asm/pgtable.h:117,
                     from /scratch/merges/ko-linux-next/linux/include/linux/pgtable.h:6,
                     from /scratch/merges/ko-linux-next/linux/include/linux/mm.h:29,
                     from /scratch/merges/ko-linux-next/linux/arch/riscv/kernel/asm-offsets.c:10:
    /scratch/merges/ko-linux-next/linux/arch/riscv/include/asm/tlbflush.h: In function 'flush_tlb_kernel_range':
    /scratch/merges/ko-linux-next/linux/arch/riscv/include/asm/tlbflush.h:60:9: error: implicit declaration of function 'flush_tlb_all' [-Werror=implicit-function-declaration]
       60 |         flush_tlb_all();

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/tlbflush.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index a947ae3afd28..440cf8f176d4 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -11,6 +11,12 @@
 #include <asm/smp.h>
 #include <asm/errata_list.h>
 
+#ifdef CONFIG_SMP
+void flush_tlb_all(void);
+#else
+#define flush_tlb_all() local_flush_tlb_all()
+#endif
+
 #ifdef CONFIG_MMU
 static inline void local_flush_tlb_all(void)
 {
@@ -34,11 +40,6 @@ static inline void local_flush_tlb_page_asid(unsigned long addr,
 	ALT_SFENCE_VMA_ADDR_ASID(addr, asid);
 }
 
-#ifdef CONFIG_SMP
-void flush_tlb_all(void);
-#else
-#define flush_tlb_all() local_flush_tlb_all()
-#endif
 void flush_tlb_mm(struct mm_struct *mm);
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
