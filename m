Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621DCC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 20:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZAhGIjIAq3fAGJnVQXvjniyTYTwUBorIf5XtkNCKfMQ=; b=eFFaUF9AYKs3i3gV34FPMY4L3+
	YTRFPfl0Yjasbw1ULgf1UgmG1IV198lFaaeABg+WMeskw7hWfSrE36mb31+WZR5cWbiU4ZbVO3UyF
	rCicIyRDRZ32FrF6q8AVZczizPkgRNsFY7aVkA9miqOy2upBVkkCCuVb5+hHG2ppe2rpZOcmsjvzU
	AxxLk6We0rdET9HZXd4gfxEvn2TwuGBJDlRmV7ndNCFuEHX4oRkpsoXFJXRQXG+BmpaJjKZ7uAkpf
	LbAf8PslvmgAIXq/3cuZwGII8MBZYh5IGqCTflxsa5x0P5ggvCxcypukFV90ITLBVyWfKDbNTH+x4
	kpcNTcXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3NUh-00AghC-GT; Thu, 08 Dec 2022 20:27:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3NUg-00AgYd-6d
	for linux-riscv@bombadil.infradead.org; Thu, 08 Dec 2022 20:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yTAZyHH91Hz9k7OZtf9gLdlJIIrZMhdblzaFwMket5k=; b=ohdKWnP7Ti2lPActsUdTAi3SQ9
	2SGS4IwZk8MeiDgesizUu/CQykZOgHVWIxrQ7CZxW8cgqe2u6G1qgTJdbt6psR3TWBzmSsw9nHxle
	O/W/opl+2bsntFPXtF4BkH5vtBRTnRIbCG3JWyyLxcCb3AbRmnEfsxj7oFm+wX5u7UC1KxSJCXz6G
	FrsvqM5g8SQ4xrh9B4GuUBCKleoOcOd8+fwdr3ICi0KH9h7P/JeTfxpnysy9vb3jl7icPnFMBRAmo
	e+n08T4qVlvnVoelhJpFg2Gf260W7baVAyIu1HMmc4W1k0aPlzImqePtHjkqhRLo+neMIkeuo6I36
	LYToTdWQ==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mjo-008ZoH-Qi
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:39:25 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-3b0af5bcbd3so25222337b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yTAZyHH91Hz9k7OZtf9gLdlJIIrZMhdblzaFwMket5k=;
        b=GOQt4+sFqigGxf6Aa3fTvktBe1mjQiluGE/Jj6vv/IvtdV7LliPzUDKCSdDx4Qr+HY
         SefezSHoN8FcvlmM5v70XQPk/EyYEeJUQTBJUq5h/NPog1UINNQReWUqbVEFjNE5psNx
         aagqyJsONr1NaCPx7WLFrSAq/6+YU9H0nX9KZhJN95FCQM9/NOhRMdNzFnOuadNLctYN
         G+xWcIxFKNvCVcBGdVMIWulIdzku3X8ojhuncsVZJ/7ZuOiqyWG7OUDtS4/fr9vosjH0
         V6V8OE7BSYaG+WEMOpz2hhgLOVkbabsraMBHq3XN+o9hqQFkHr8FyeB1wUdGuE+kwW+d
         bbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yTAZyHH91Hz9k7OZtf9gLdlJIIrZMhdblzaFwMket5k=;
        b=6HuyO8JbybM2wf246Smxzjoy6X5HhJd/SrkL91GaM7gpmMTBwYgo2Si4yG3C1BZtlu
         5cuex1lav56s5K+Bw0IzmfhOACeDJehOG6Byks/6ZNABqiEpPDN+BT38e9Zkst1hDXz9
         8kHuaSQHrX8ek/2g2tgAVLNvymIL/rAo2Fgon+wlsN0wugcIQvPfalTJ9CqxJcC828HO
         HbSu98EP4xs74pOLRLqjre090d6RbgtJfgN+6XlEFIpx0n/HzQmeiabSxqDNwJCvsuFj
         schgx2SCa40aqj46yhFGLMm6ZstebiH3zfXOEXOCZ4tCiP1lJ/B1RcprY+MrvgcuyE80
         sA/A==
X-Gm-Message-State: ANoB5pmtiswZT1SGcm+KdirErOPD1D0UI9pJOl2ubC7RzG+Qs5KxEl5F
	Z1uhIKK04Kw7rewsPLQspZ58bSsABmCdVw==
X-Google-Smtp-Source: AA0mqf4+9oetgR3uKpdfVrPGzq2N3r/JU0sb91m8xpA2HrSBGD0IqxC3Vg4zr/dJJfrFDGejU78ci1LRJL+iRw==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:9f85:0:b0:700:f93d:c7cd with SMTP id
 u5-20020a259f85000000b00700f93dc7cdmr16638924ybq.166.1670528358851; Thu, 08
 Dec 2022 11:39:18 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:27 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-8-dmatlack@google.com>
Subject: [RFC PATCH 07/37] mm: Introduce architecture-neutral PG_LEVEL macros
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Matlack <dmatlack@google.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Nadav Amit <namit@vmware.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Krish Sadhukhan <krish.sadhukhan@oracle.com>, Ricardo Koller <ricarkol@google.com>, 
	Jing Zhang <jingzhangos@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_193921_004971_013B4A1A 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

Introduce architecture-neutral versions of the x86 macros PG_LEVEL_4K,
PG_LEVEL_2M, etc. The x86 macros are used extensively by KVM/x86's page
table management code. Introducing architecture-neutral version of these
macros paves the way for porting KVM/x86's page table management code to
architecture-neutral code.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/include/asm/pgtable_types.h | 12 ++++--------
 include/linux/mm_types.h             |  9 +++++++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
index aa174fed3a71..bdf41325f089 100644
--- a/arch/x86/include/asm/pgtable_types.h
+++ b/arch/x86/include/asm/pgtable_types.h
@@ -518,14 +518,10 @@ extern void native_pagetable_init(void);
 struct seq_file;
 extern void arch_report_meminfo(struct seq_file *m);
 
-enum pg_level {
-	PG_LEVEL_NONE,
-	PG_LEVEL_4K,
-	PG_LEVEL_2M,
-	PG_LEVEL_1G,
-	PG_LEVEL_512G,
-	PG_LEVEL_NUM
-};
+#define PG_LEVEL_4K	PG_LEVEL_PTE
+#define PG_LEVEL_2M	PG_LEVEL_PMD
+#define PG_LEVEL_1G	PG_LEVEL_PUD
+#define PG_LEVEL_512G	PG_LEVEL_P4D
 
 #ifdef CONFIG_PROC_FS
 extern void update_page_count(int level, unsigned long pages);
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 500e536796ca..0445d0673afe 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1003,4 +1003,13 @@ enum fault_flag {
 
 typedef unsigned int __bitwise zap_flags_t;
 
+enum pg_level {
+	PG_LEVEL_NONE,
+	PG_LEVEL_PTE,
+	PG_LEVEL_PMD,
+	PG_LEVEL_PUD,
+	PG_LEVEL_P4D,
+	PG_LEVEL_NUM
+};
+
 #endif /* _LINUX_MM_TYPES_H */
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
