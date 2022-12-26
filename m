Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBC9C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Dec 2022 18:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PmmYDB49+tmgYRGyxS+WhgsfdUt3GH6iYqLnui6uCE0=; b=dgnLEdlw/q6J9p
	NLKmv12jDNHaTEJ7DvzLiTYj+lCQ1+o/RH2t4H82Rp9GUn+XJYZWSe6BhIcUGwvC0Mns7VyDhEiok
	bOhV4jwHKkfjhgA8UG70a0wutHw9JMemLhG2gFHB3IzFrcn79fZQFRaAruzqJEEd9NLFgjqjLvUat
	SrGssWmz/7cIua/6RgbXv/f2+iOyetFRVZnAnBEVhwhXpoKNRCGBqTYTz129GjSMVdXXPKDajl3dk
	M+/Ymr/eTEjJprbRyjUKFA8Iv4EVvcWdmZjeCJ6/tfOE4v2ODdH75zQfWU/Ru1wtdqZpiKwqy6wEn
	ffC6DV/s6ZKgC2Ailkew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9sUP-006QkC-C3; Mon, 26 Dec 2022 18:46:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9sU9-006Qds-0c; Mon, 26 Dec 2022 18:46:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 320F560ECD;
	Mon, 26 Dec 2022 18:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8DDC433EF;
	Mon, 26 Dec 2022 18:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672080361;
	bh=11fqsHGDwlwZxXJ1I41qluVDDxZF3poiwCovlkcoHk8=;
	h=From:To:Cc:Subject:Date:From;
	b=FYKcKWr0aibziaNfZxLDzsqJAbxmWqPqNL9fzxTN/GiM2Es+IyAru6i78RMDQBZLE
	 AJUFihUysrNIL0HrQ7zpLpvvkdPgE0VYc5vBp4fKBFnNNQlMhrbm00lvDfpgtSLKKg
	 eim1FHPTBoPExSY3hwYvEfmjXyOtt1Dj67HK9QqTjVJo+p9qc5cgbAewgJVrZCOzT4
	 0tHVbx22psxKKIAqN+WZbenpOIcf+3onOeOwXutik0uK8+veuaP18Ac4NPX6bRlKWt
	 SyA2x9mAeRdasCG3zdQ0tBnmM0ej0+jVoZ/9M/lHcope8kbXIpFPT6m44J+tUvdMjC
	 F/6LEe+RzHNJg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-arch@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Dennis Gilmore <dennis@ausil.us>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2] arch: fix broken BuildID for arm64 and riscv
Date: Tue, 27 Dec 2022 03:45:37 +0900
Message-Id: <20221226184537.744960-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_104605_139184_9149A7A1 
X-CRM114-Status: GOOD (  13.72  )
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

Dennis Gilmore reports that the BuildID is missing in the arm64 vmlinux
since commit 994b7ac1697b ("arm64: remove special treatment for the
link order of head.o").

The issue is that the type of .notes section, which contains the BuildID,
changed from NOTES to PROGBITS.

Ard Biesheuvel figured out that whichever object gets linked first gets
to decide the type of a section. The PROGBITS type is the result of the
compiler emitting .note.GNU-stack as PROGBITS rather than NOTE.

While Ard provided a fix for arm64, I want to fix this globally because
the same issue is happening on riscv since commit 2348e6bf4421 ("riscv:
remove special treatment for the link order of head.o"). This problem
will happen in general for other architectures if they start to drop
unneeded entries from scripts/head-object-list.txt.

Discard .note.GNU-stack in include/asm-generic/vmlinux.lds.h.

Link: https://lore.kernel.org/lkml/CAABkxwuQoz1CTbyb57n0ZX65eSYiTonFCU8-LCQc=74D=xE=rA@mail.gmail.com/
Fixes: 994b7ac1697b ("arm64: remove special treatment for the link order of head.o")
Fixes: 2348e6bf4421 ("riscv: remove special treatment for the link order of head.o")
Reported-by: Dennis Gilmore <dennis@ausil.us>
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - discard .note.GNU-stack before .notes because many architectures
    call DISCARDS at the end of their linker scripts

 include/asm-generic/vmlinux.lds.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index a94219e9916f..659bf3b31c91 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -891,7 +891,12 @@
 #define PRINTK_INDEX
 #endif
 
+/*
+ * Discard .note.GNU-stack, which is emitted as PROGBITS by the compiler.
+ * Otherwise, the type of .notes section would become PROGBITS instead of NOTES.
+ */
 #define NOTES								\
+	/DISCARD/ : { *(.note.GNU-stack) }				\
 	.notes : AT(ADDR(.notes) - LOAD_OFFSET) {			\
 		BOUNDED_SECTION_BY(.note.*, _notes)			\
 	} NOTES_HEADERS							\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
