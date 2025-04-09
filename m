Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A870FC36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 17:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLDvmWruDcLSsRF1+l/abNKKgJ/ZalNT8aX2ZDSpZnI=; b=dkTSKSzYpl30bE
	+4jxU40N7hUIxunU3NSH+w7lFsnH7qxnnfu/Hv8zD7qJizG2M9Upsg/vEXJ13lUlDAMsxAGdrIV2U
	1RH+G5DMe3KTG8iyVtWrMLJhVOF+RkmAaMFx+OTW35ub5jHmsah7QPydkgTpIVHRSIeFP+GIciS28
	QzChRykCniAtoq9XrTmxZ0q3tpaIC7UGhXmHIVegManF5GPQA/GEVFXZfva/uJHAeh0iwnp7L8W21
	i9B9ZHWk+Je4wpwtL8wwi3l05btDn01UETwpcJxZwt1BU3o+MNPZC/gs6s0oP3jHTUyWY/G6unPVk
	0XKEezH0gVtIxAPNx8uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Z1S-000000080xP-2Jr6;
	Wed, 09 Apr 2025 17:15:34 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Z1P-000000080vm-23Zb
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 17:15:32 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-af51e820336so6753527a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 10:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744218931; x=1744823731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFPrlzz/n+RwD8yf+7zZ/+ii8EhBJMcDI7KV/D+3zyI=;
        b=b2gJuFAnmVnsGaORL+M/+MqLPjlZue0RF/rxb4hB0KgPb+KtUPBjHdwpga0aueyf0U
         IGkfU4HlymfO33nCGKI6/9cuni3dkEaxSvcrtlxNQwwhL9GXmwEExt5N1flaN9MfRScm
         aXhuB0g2C9IOYsCzLx9P4Wy+XK1O+LOxvhzvCCRS4CoaLJuZdb/qxC/+dNV85yUwVoHp
         zQ1ErddjcflUqz+11VXed66PabLx4WOk58Dpess//u3vLqMnjaUQQPuJ3dCDDKXfJR1/
         k3zPkvmQ9jTwzrqTlj8ntnX3Sd4vHjwjpRf01uXfRh8kYkCpovaUR/AWkLno8lK8O57T
         WMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218931; x=1744823731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFPrlzz/n+RwD8yf+7zZ/+ii8EhBJMcDI7KV/D+3zyI=;
        b=QxAWgNSYLPaP8r6HWOjM16RwNx28wz3pFtBls2kr8bRDkL4nh5U6SwLr5T5AEAFMxh
         iJ1wXrhP8sAeMMLYUF8MMeIjMuE3dgpn4tG/ir6WBzjNn8+qQ4lXQWANdhZMnIxem+59
         DUrOYw0ud47KEKXJzJN3hEndmZao0lLpXUjci+RfbzYuenn4GR0iIi2PNRC/A/vJ/JrF
         NYabqMh8IdFZWKWOTkbo7cnRwLNTnEbcLSKk96mgPdjgbNKKjUsL08SxvuE7mwCE2Nmy
         OgF4f624G0PhDCiVVxt9rS2TRW4rxpcZXIPFvto+t60aDlnoM65ea9t9aKQ1TYpdX+ua
         6k9A==
X-Forwarded-Encrypted: i=1; AJvYcCV7n4Ng4o0Lb/skD+7cdGtEz+Cmte+3e36pgL9CT0VQSIvcbm1HNjJopAdv1/TwAniXZd+wRhA4igPJOA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/i3N8BAKiyimty8HsCWOeXAAq8yZjXuEGwG/4Io7O+v1X+C50
	EhR3yRaw2uEyX3YGxJiyU9q6HHXCojHj8HkHb6SMO+AJ3XMtDFaaJYqPnebslVEIGtlCWyrg8OM
	y
X-Gm-Gg: ASbGncsxakr8dJRxHjwjyzZk0gtU0ix70GCx9M0Urh2GO9KlT0ULtAQtJUXoWU7LqAN
	K2dS+gGKCfGRwXdHoDjdeNjYlasB4oG8FRupt4yq4AzYNKVx4nb6nsH/uDuzWw+jibDFM1bHm0c
	ybfizaTq5BN3BDyRWWQ3eU0MKAjKPWhO76Xs51r42atHCvv33RCWb6JDKrF4scTgDIAESQ3GMK8
	4jAe5aDnfW8Q0W1dK06OovBjeuO5pumBu1aSuICRQ/D3tj7uiGrvWptgPPXuWdJ4oqqkiES7L9H
	Anubcn29URA5XiT8mYafPlLPz2ej0NwZ93MTSlzTINcYKPwSf3N+jqraqQ45Q74=
X-Google-Smtp-Source: AGHT+IHRP9hWpUntdSIJBZZcXEjgmEnfTQCM+e2p6uXonIEb6B+dADlcAwWwWKuA1sQVweJt1rEmuQ==
X-Received: by 2002:a17:90b:1d4f:b0:2f9:c56b:6ec8 with SMTP id 98e67ed59e1d1-306dbbae06bmr6262426a91.10.1744218930725;
        Wed, 09 Apr 2025 10:15:30 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df400ab7sm1721650a91.47.2025.04.09.10.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:15:30 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] riscv: module: Optimize PLT/GOT entry counting
Date: Wed,  9 Apr 2025 10:14:51 -0700
Message-ID: <20250409171526.862481-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250409171526.862481-1-samuel.holland@sifive.com>
References: <20250409171526.862481-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_101531_529026_BEE1A432 
X-CRM114-Status: GOOD (  20.64  )
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

perf reports that 99.63% of the cycles from `modprobe amdgpu` are spent
inside module_frob_arch_sections(). This is because amdgpu.ko contains
about 300000 relocations in its .rela.text section, and the algorithm in
count_max_entries() takes quadratic time.

Apply two optimizations from the arm64 code, which together reduce the
total execution time by 99.58%. First, sort the relocations so duplicate
entries are adjacent. Second, reduce the number of relocations that must
be sorted by filtering to only relocations that need PLT/GOT entries, as
done in commit d4e0340919fb ("arm64/module: Optimize module load time by
optimizing PLT counting").

Unlike the arm64 code, here the filtering and sorting is done in a
scratch buffer, because the HI20 relocation search optimization in
apply_relocate_add() depends on the original order of the relocations.
This allows accumulating PLT/GOT relocations across sections so sorting
and counting is only done once per module.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Include R_RISCV_PLT32 relocations when computing the PLT size
 - Accumulate PLT/GOT relocations across relocation sections

 arch/riscv/kernel/module-sections.c | 81 +++++++++++++++++++++++------
 1 file changed, 65 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
index 91d0b355ceef..75551ac6504c 100644
--- a/arch/riscv/kernel/module-sections.c
+++ b/arch/riscv/kernel/module-sections.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleloader.h>
+#include <linux/sort.h>
 
 unsigned long module_emit_got_entry(struct module *mod, unsigned long val)
 {
@@ -55,44 +56,70 @@ unsigned long module_emit_plt_entry(struct module *mod, unsigned long val)
 	return (unsigned long)&plt[i];
 }
 
-static int is_rela_equal(const Elf_Rela *x, const Elf_Rela *y)
+#define cmp_3way(a, b)	((a) < (b) ? -1 : (a) > (b))
+
+static int cmp_rela(const void *a, const void *b)
 {
-	return x->r_info == y->r_info && x->r_addend == y->r_addend;
+	const Elf_Rela *x = a, *y = b;
+	int i;
+
+	/* sort by type, symbol index and addend */
+	i = cmp_3way(x->r_info, y->r_info);
+	if (i == 0)
+		i = cmp_3way(x->r_addend, y->r_addend);
+	return i;
 }
 
 static bool duplicate_rela(const Elf_Rela *rela, int idx)
 {
-	int i;
-	for (i = 0; i < idx; i++) {
-		if (is_rela_equal(&rela[i], &rela[idx]))
-			return true;
-	}
-	return false;
+	/*
+	 * Entries are sorted by type, symbol index and addend. That means
+	 * that, if a duplicate entry exists, it must be in the preceding slot.
+	 */
+	return idx > 0 && cmp_rela(rela + idx, rela + idx - 1) == 0;
 }
 
-static void count_max_entries(Elf_Rela *relas, int num,
+static void count_max_entries(const Elf_Rela *relas, size_t num,
 			      unsigned int *plts, unsigned int *gots)
 {
-	for (int i = 0; i < num; i++) {
+	for (size_t i = 0; i < num; i++) {
+		if (duplicate_rela(relas, i))
+			continue;
+
 		switch (ELF_R_TYPE(relas[i].r_info)) {
 		case R_RISCV_CALL_PLT:
 		case R_RISCV_PLT32:
-			if (!duplicate_rela(relas, i))
-				(*plts)++;
+			(*plts)++;
 			break;
 		case R_RISCV_GOT_HI20:
-			if (!duplicate_rela(relas, i))
-				(*gots)++;
+			(*gots)++;
 			break;
+		default:
+			unreachable();
 		}
 	}
 }
 
+static bool rela_needs_plt_got_entry(const Elf_Rela *rela)
+{
+	switch (ELF_R_TYPE(rela->r_info)) {
+	case R_RISCV_CALL_PLT:
+	case R_RISCV_GOT_HI20:
+	case R_RISCV_PLT32:
+		return true;
+	default:
+		return false;
+	}
+}
+
 int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 			      char *secstrings, struct module *mod)
 {
+	size_t num_scratch_relas = 0;
 	unsigned int num_plts = 0;
 	unsigned int num_gots = 0;
+	Elf_Rela *scratch = NULL;
+	size_t scratch_size = 0;
 	int i;
 
 	/*
@@ -122,9 +149,10 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 
 	/* Calculate the maxinum number of entries */
 	for (i = 0; i < ehdr->e_shnum; i++) {
+		size_t num_relas = sechdrs[i].sh_size / sizeof(Elf_Rela);
 		Elf_Rela *relas = (void *)ehdr + sechdrs[i].sh_offset;
-		int num_rela = sechdrs[i].sh_size / sizeof(Elf_Rela);
 		Elf_Shdr *dst_sec = sechdrs + sechdrs[i].sh_info;
+		size_t scratch_size_needed;
 
 		if (sechdrs[i].sh_type != SHT_RELA)
 			continue;
@@ -133,7 +161,28 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 		if (!(dst_sec->sh_flags & SHF_EXECINSTR))
 			continue;
 
-		count_max_entries(relas, num_rela, &num_plts, &num_gots);
+		/*
+		 * apply_relocate_add() relies on HI20 and LO12 relocation pairs being
+		 * close together, so sort a copy of the section to avoid interfering.
+		 */
+		scratch_size_needed = (num_scratch_relas + num_relas) * sizeof(*scratch);
+		if (scratch_size_needed > scratch_size) {
+			scratch_size = scratch_size_needed;
+			scratch = kvrealloc(scratch, scratch_size, GFP_KERNEL);
+			if (!scratch)
+				return -ENOMEM;
+		}
+
+		for (size_t j = 0; j < num_relas; j++)
+			if (rela_needs_plt_got_entry(&relas[j]))
+				scratch[num_scratch_relas++] = relas[j];
+	}
+
+	if (scratch) {
+		/* sort the accumulated PLT/GOT relocations so duplicates are adjacent */
+		sort(scratch, num_scratch_relas, sizeof(*scratch), cmp_rela, NULL);
+		count_max_entries(scratch, num_scratch_relas, &num_plts, &num_gots);
+		kvfree(scratch);
 	}
 
 	mod->arch.plt.shdr->sh_type = SHT_NOBITS;
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
