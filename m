Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1638C36010
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 02:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tynzbZtidgTuBjegEYhC6mPDw+Vr6Qq/kRZHlFqP3I8=; b=xecZEih8AgGqrQ
	AJb+fFUYw0nIIFQjDzSrfhSD+g+XT7Nc1GdY+kxe85wfMqTcQTtemUvX+nGX4obWCQXmZGufRgMc3
	T+ggB4SZM7CfZHdH/ZR5xNotuK8wW0ZdrObKQXr3FqTDY4LkxcG1MMZ6IbkF6p3F8cMWr6tiE+Pnp
	SwvXxCr1CI3+L+VZRNdD1ZfTFa4TQhfRoDZM8oOkGNdg/5QuOJdrRiSUooExMMx76x3tjoo/rOUfp
	M7fk0BpP8NPQEr5k51Oxg7RL7gqa/3ujb2EppYmh7FpHK60/i/lc4OGctvP+BOnGfhctn4SjOZswH
	+6cMoK66926o5CEfK4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2LRT-00000005xoZ-1chZ;
	Wed, 09 Apr 2025 02:45:31 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2LRQ-00000005xo3-2Wgg
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 02:45:29 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-af5cdf4a2f8so4608294a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 19:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744166726; x=1744771526; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9nsdNo0PEJwcz9AI9dBxmI9czrIQQTsTouDYT/msKPQ=;
        b=eTop81AkTV/dBOJsCOi4qIO4jY54Mg1TkrYtHVH0G4uOdQCRUsJ0dgb9tENObGfegJ
         DkUTa9qWWvQLUs09xAlr+w3HWUiW7j5Yz9nDfP/47bZIZtIXcARvvVF1zNca7PhL0/Zu
         lgaVgQ7FMCcosdDxtfZTLeFABWi71AIsyoULU5RRGBJHgBtEZLbJQgfYAZn2Kn7G6CkE
         4lbpnZtM5FisIKaWRmXAYuxmcEjAIdF41i3dEZ6N9nZWV8ky8ctXx5ArJJ7dqyixsl+S
         1wlwqpHmWLzGlFz3UYHsEpayh/7KmvoCnncHzL+XVCPJHzuyNSuJoFBQCTIrYOGfufvB
         1gKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744166726; x=1744771526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9nsdNo0PEJwcz9AI9dBxmI9czrIQQTsTouDYT/msKPQ=;
        b=hmwt65mFk2u+Uj9kVnnhW56et5aq2h6feaVZ3nERL02Rz3MyNyPAEmYF6MGBjuQO7r
         mOTwHUrBaANimaHk5WLX1nvqnyAFvGHFI42dC7BwmuAtJANxXvc8NHeod8WYNNK2Ucf9
         h7oFIJdNyVQ/3GCjqjKM32qx+4LonCqytUY5Y1QmGmV+yAfnCXr5SRqtQfiBg9wGG1uQ
         e9nJHp58dNs7KL5VNP7ssuaSdVLPvy7ZVTugEcJPhrUHf1jiQmfY6zoZt4PLuVkG0TBL
         luS5e4vACr7QBAC2F1o5kCUDWf/IkoMrUc8w526QHgjFeZqDjVCDU+IdKBblGQ95y1/W
         uJuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5xQpytXK9pB1cVyq6ujEyMMZZ+3zuxr+b+o1DI3/R58yTpmeuH2poWewv5veQND8sXjdqJQHu6RnSIg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5BbZnwpyzn77qs6qylU/3f6wERmQ7RQPmhz1qZMrvIEvfXWk4
	smUqq5QziM+39WWxiywSnT6vxJGzmxccsH29REXkIvakkCQ089WEH1h/HoVhJjohTHc2NkE5bxk
	1
X-Gm-Gg: ASbGncsTDSFaDdlIugdm6+kjzFAWWAd5or/tmLdDwkWaxean0MKfINIkQkUWNzym7vC
	Ke30vpB1tdqonNqUELPhz5vGJ1M/YojKIGuaEqsBSz2e7cwDz1r9zUG5OTBt5IapiZp4chTckQI
	B9SyfTtX7ZC8cn4ajzRPAbzihJfcJtKTYYl68jp2c6U6MtJlNxZoHaBkLYasD2ix8PCtGk7tdI5
	LqMCnLBNQsHgnz3QhaYMNcxetcJT3Kevy++1curr4U6y77bdc9XnEh1dUIsnxnUPwyTLDF/OLuH
	cEMU7SqY/iLrwz4Pe2pXrjblJ5hRBfeAWxSnDsKL+Sm3ypU9KIWXlzPq/AiLSAFSZT0=
X-Google-Smtp-Source: AGHT+IFLGZtI/XCiZ2AL0Lvh6GdIpSXkAOPiu5RbDBnTMtlfSsuznoWsv8v3/hpYMe1aXDhC1J+4Bg==
X-Received: by 2002:a17:90b:2e8e:b0:2fe:9e6c:add9 with SMTP id 98e67ed59e1d1-306dbbc41afmr2426502a91.18.1744166726572;
        Tue, 08 Apr 2025 19:45:26 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df401ac8sm175285a91.45.2025.04.08.19.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 19:45:26 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: module: Optimize PLT/GOT entry counting
Date: Tue,  8 Apr 2025 19:45:16 -0700
Message-ID: <20250409024519.454828-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_194528_653633_3300CC6B 
X-CRM114-Status: GOOD (  18.84  )
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
total execution time by 99.57%. First, sort the relocations so duplicate
entries are adjacent. Second, reduce the number of relocations that must
be sorted by filtering to only relocations that need PLT/GOT entries, as
done in commit d4e0340919fb ("arm64/module: Optimize module load time by
optimizing PLT counting").

Unlike the arm64 code, here the filtering and sorting is done in a
scratch buffer, because the HI20 relocation search optimization in
apply_relocate_add() depends on the original order of the relocations.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/module-sections.c | 66 +++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
index e264e59e596e..91d4f0fbd0af 100644
--- a/arch/riscv/kernel/module-sections.c
+++ b/arch/riscv/kernel/module-sections.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleloader.h>
+#include <linux/sort.h>
 
 unsigned long module_emit_got_entry(struct module *mod, unsigned long val)
 {
@@ -55,19 +56,27 @@ unsigned long module_emit_plt_entry(struct module *mod, unsigned long val)
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
 
 static void count_max_entries(Elf_Rela *relas, int num,
@@ -87,11 +96,33 @@ static void count_max_entries(Elf_Rela *relas, int num,
 	}
 }
 
+static bool rela_needs_plt_got(const Elf_Rela *rela)
+{
+	unsigned int type = ELF_R_TYPE(rela->r_info);
+
+	return type == R_RISCV_CALL_PLT || type == R_RISCV_GOT_HI20;
+}
+
+/* Copy PLT and GOT relas to the scratch array. */
+static unsigned int partition_plt_got_relas(const Elf_Rela *relas, Elf_Rela *scratch,
+					    unsigned int num_rela)
+{
+	int j = 0;
+
+	for (int i = 0; i < num_rela; i++)
+		if (rela_needs_plt_got(&relas[i]))
+			scratch[j++] = relas[i];
+
+	return j;
+}
+
 int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 			      char *secstrings, struct module *mod)
 {
 	unsigned int num_plts = 0;
 	unsigned int num_gots = 0;
+	Elf_Rela *scratch = NULL;
+	size_t scratch_size = 0;
 	int i;
 
 	/*
@@ -132,9 +163,26 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 		if (!(dst_sec->sh_flags & SHF_EXECINSTR))
 			continue;
 
-		count_max_entries(relas, num_rela, &num_plts, &num_gots);
+		/*
+		 * apply_relocate_add() relies on HI20 and LO12 relocation pairs being
+		 * close together, so sort a copy of the section to avoid interfering.
+		 */
+		if (sechdrs[i].sh_size > scratch_size) {
+			scratch_size = sechdrs[i].sh_size;
+			scratch = kvrealloc(scratch, scratch_size, GFP_KERNEL);
+			if (!scratch)
+				return -ENOMEM;
+		}
+
+		/* sort relocations requiring a PLT or GOT entry so duplicates are adjacent */
+		num_rela = partition_plt_got_relas(relas, scratch, num_rela);
+		sort(scratch, num_rela, sizeof(Elf_Rela), cmp_rela, NULL);
+		count_max_entries(scratch, num_rela, &num_plts, &num_gots);
 	}
 
+	if (scratch)
+		kvfree(scratch);
+
 	mod->arch.plt.shdr->sh_type = SHT_NOBITS;
 	mod->arch.plt.shdr->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
 	mod->arch.plt.shdr->sh_addralign = L1_CACHE_BYTES;
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
