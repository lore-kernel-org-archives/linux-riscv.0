Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F12DC61D99
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 15:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8f6Ncaw3QxtggdbvCIK586Yv2nxCC9g2bxpbqtCYXw=; b=1erXPwzJyVEoy0
	BmkkJTKSWNI+oiE8aB5io7LYCWH+ZAafNkLWquecmsC8K7iMszYBcywwdPseeJsvCtU4SqO1Kk+kK
	EnqkXlX97NFTa9lZQDYsHu1/zdCpOwPmhhyZZUK6h0ZsQiQpM1W50X8bG+q31pwLKFh5g1WdrXrPz
	rEMMd4a/1uvQd0gElPj13WfuxGwBA3P8c07s5p8oP3nunXhMQ3Qgaj8S7v7LKIjq5ZPD8aKKFRl74
	Nl9KqJyZso19e7wNA5FR9/LpyRFuCcNL5k/z9IAnxhmQ3xu5UVG319FqHQWL7TBh4M+DcMx5zAgOy
	8sMoJzeqlmliNR9aF1EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5pDg-002GgT-2M;
	Wed, 22 Nov 2023 15:32:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5pDd-002Geh-23
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 15:32:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F353C61E02;
	Wed, 22 Nov 2023 15:32:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90940C433C8;
	Wed, 22 Nov 2023 15:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700667168;
	bh=fWiSFMfDLokE0fHpF4fY2qrcsRxAWpAbxo0BBd3jFug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bi4xC82UvOxmgWDSddxzp+EZzsxihguuFoKXKYYw+Yr/iI8oxUNDaekSuwfNXmZdD
	 gqb/0AjGTrRRTwr2ixtT45nG7LfpEPbnuOdwD/33C4SA/NpoIOIKZdoGpuqc5Duy35
	 u5MfaZqzAh9pqa8HEgw+7OpTwitCRBmYDLkoSAyG6Ziz5kgTMvaj3GuXBpqEJZ1bQx
	 NMdXunVfPA6pFVKCNOAz2Afaehz5Ks2G2l64v01LUop4QrVxIcuR5FJaSRfC7dOYZJ
	 Uc0h86kTCUrsG3vr4Sb6jC+hC9vF/G5opttEvmHJ1xWzncvsbBmLLt+c3SjYey6fHa
	 CQ9r8VWdLZVlw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-kbuild@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 11/17] modpost: fix section mismatch message for RELA
Date: Wed, 22 Nov 2023 10:31:40 -0500
Message-ID: <20231122153212.852040-11-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122153212.852040-1-sashal@kernel.org>
References: <20231122153212.852040-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_073249_716315_9FB871E2 
X-CRM114-Status: GOOD (  10.02  )
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

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit 1c4a7587d1bbee0fd53b63af60e4244a62775f57 ]

The section mismatch check prints a bogus symbol name on some
architectures.

[test code]

  #include <linux/init.h>

  int __initdata foo;
  int get_foo(void) { return foo; }

If you compile it with GCC for riscv or loongarch, modpost will show an
incorrect symbol name:

  WARNING: modpost: vmlinux: section mismatch in reference: get_foo+0x8 (section: .text) -> done (section: .init.data)

To get the correct symbol address, the st_value must be added.

This issue has never been noticed since commit 93684d3b8062 ("kbuild:
include symbol names in section mismatch warnings") presumably because
st_value becomes zero on most architectures when the referenced symbol
is looked up. It is not true for riscv or loongarch, at least.

With this fix, modpost will show the correct symbol name:

  WARNING: modpost: vmlinux: section mismatch in reference: get_foo+0x8 (section: .text) -> foo (section: .init.data)

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/mod/modpost.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index b3dee80497cb2..ac4ef3e206bbd 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1496,13 +1496,15 @@ static void section_rela(struct module *mod, struct elf_info *elf,
 		return;
 
 	for (rela = start; rela < stop; rela++) {
+		Elf_Sym *tsym;
 		Elf_Addr taddr, r_offset;
 		unsigned int r_type, r_sym;
 
 		r_offset = TO_NATIVE(rela->r_offset);
 		get_rel_type_and_sym(elf, rela->r_info, &r_type, &r_sym);
 
-		taddr = TO_NATIVE(rela->r_addend);
+		tsym = elf->symtab_start + r_sym;
+		taddr = tsym->st_value + TO_NATIVE(rela->r_addend);
 
 		switch (elf->hdr->e_machine) {
 		case EM_RISCV:
@@ -1517,7 +1519,7 @@ static void section_rela(struct module *mod, struct elf_info *elf,
 			break;
 		}
 
-		check_section_mismatch(mod, elf, elf->symtab_start + r_sym,
+		check_section_mismatch(mod, elf, tsym,
 				       fsecndx, fromsec, r_offset, taddr);
 	}
 }
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
