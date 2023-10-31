Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9D6C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 17:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p5q0HH0w6CpvwaxTs6dAxUBy2iV8oITcgmoHDlS8OQM=; b=kHaVbOu0KsKHdx
	hBzZYbaoB2w56rVYMXGvIW6ZrV9L1pG9+lxcvfpa9Yvsm9dKKxL5cOV4I+SCthuDfhRpsMYlaT6oJ
	jHWIrpS2n46nNbv80dWQ1k1KCxKAk6wPVuFGWDgWfBwqzd9I3riXtu7GUM7rlYTBORyujjUS+3Q1x
	QIJ9jfit0gtzwkbp7Hvhlf45YVbe4a2fsZaD8/maEyWr92YBBF12vsDCXqQ2oHzqCNs6JvUQMCUZA
	6GVqiDUiR70kH0RYS+08lsqCWbskk5db9nnvX70IcbhC0AJfbaUhfBJgbMwIyYYwWhmHXR1fU8bqA
	oEE5O/+Ehg6XDN9V95bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxsp2-005shd-0P;
	Tue, 31 Oct 2023 17:46:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxsoz-005sh6-2n
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 17:46:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B61B61059;
	Tue, 31 Oct 2023 17:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0AFC433C8;
	Tue, 31 Oct 2023 17:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698774392;
	bh=4IzIyIgoH1lhjy2rL7R+B3ys+T2C5XdwhNqqqjhol4E=;
	h=From:To:Cc:Subject:Date:From;
	b=iZzl3i4u3Z4lHJziJsiFVp5CwjwRspRy/Sn6vpFB+jZ1C6Y3IZKIMT0lu8bY/i68v
	 ttEgti0JQn33NvLIaRZZmxZcXakyseqtAJl+aOMbKjipWvIx9SuwF0rDROuRJLGa94
	 IECn7mdOuW4SbNsQdlr3hDYkcLgbxybb6fITn+CQ0epFyuWBJTtY0TyiO7skwSzaC7
	 2UwIFVeVYPU096QD4cjtdjY6XbOvTJNIuuy3K3E54BB7vKPXev7+lYlWnylZ8Iur02
	 d0gCSEL7LvdChiSs9S3Qi7gibTd2Nblxp+BG8aDtJsiMl6bZH3qjsfO+9gXYzaldhf
	 SkdMlijOmtqXQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] modpost: fix section mismatch message for RELA
Date: Wed,  1 Nov 2023 02:46:27 +0900
Message-Id: <20231031174627.684576-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_104633_944762_80B35C78 
X-CRM114-Status: UNSURE (   9.63  )
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

The section mismatch check prints a bogus symbol name on some
architectures.

[test code]

  #include <linux/init.h>

  int __initdata foo;
  int get_foo(void) { return foo; }

If you compile it with GCC for riscv or loongarch, modpost will show an
incorrect symbol name:

  WARNING: modpost: vmlinux: section mismatch in reference: get_foo+0x8 (section: .text) -> done (section: .init.data)

To get the correct symbol address, st_value must be added

This issue has never been noticed since commit 93684d3b8062 ("kbuild:
include symbol names in section mismatch warnings") presumably because
st_value becomes zero on most architectures when the referenced symbol
is looked up. It is not true for riscv or loongarch, at least.

With this fix, modpost will show the correct symbol name:

  WARNING: modpost: vmlinux: section mismatch in reference: get_foo+0x8 (section: .text) -> foo (section: .init.data)

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 973b5e5ae2dd..cb6406f485a9 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1383,13 +1383,15 @@ static void section_rela(struct module *mod, struct elf_info *elf,
 	const Elf_Rela *rela;
 
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
@@ -1404,7 +1406,7 @@ static void section_rela(struct module *mod, struct elf_info *elf,
 			break;
 		}
 
-		check_section_mismatch(mod, elf, elf->symtab_start + r_sym,
+		check_section_mismatch(mod, elf, tsym,
 				       fsecndx, fromsec, r_offset, taddr);
 	}
 }
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
