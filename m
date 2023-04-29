Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F59C77B7E
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 15:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GzuZIlQA2zNBhTNqxSxtJmsT+2+rw5ldxqhYfC7qA9U=; b=FyneYVUI3VNSEG
	j59zn/9oz9mGWczJB0baacGtwiMc9gu744rnQp+3+1oDkOpFjCHjbexI+nldZ5n06XXZ5E5nd7JIL
	lA57uyj3CXvWjyxGWgzaBc2YewtUiaYRhrR3KrnASWrTWfRZUwtwocpfnJ7x0/L5IyvirkKS+SG67
	cRp5TjosaPMzMwPz2p+dtVOsY7IGW+CAwbnEE4OL9IbdQ0fqxSsJfqQ/ANI7mgj1tyryeFa2t2U48
	bVd+kMsd0DkUWblVGyNHJkccEnCkw0q11A9uQo7PHglLliAp0TNEhUP0iElSLSbPF/xe4Ura2htsE
	4uur6rSP7mh0q/74mFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psmsT-00Cruy-22;
	Sat, 29 Apr 2023 15:52:49 +0000
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1psmsR-00Cruj-3C;
	Sat, 29 Apr 2023 15:52:48 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Evan Green <evan@rivosinc.com>
Subject: [PATCH v2] RISC-V: fix sifive and thead section mismatches in errata
Date: Sat, 29 Apr 2023 08:52:47 -0700
Message-Id: <20230429155247.12131-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
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

When CONFIG_MODULES is set, __init_or_module becomes <empty>, but when
CONFIG_MODULES is not set, __init_or_module becomes __init.
In the latter case, it causes section mismatch warnings:

WARNING: modpost: vmlinux.o: section mismatch in reference: riscv_fill_cpu_mfr_info (section: .text) -> sifive_errata_patch_func (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: riscv_fill_cpu_mfr_info (section: .text) -> thead_errata_patch_func (section: .init.text)

Fixes: bb3f89487fd9 ("RISC-V: hwprobe: Remove __init on probe_vendor_features()")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>
Cc: Evan Green <evan@rivosinc.com>
---
v2: use corrected Fixes: commit info (thanks Conor)

 arch/riscv/errata/sifive/errata.c |    8 +++-----
 arch/riscv/errata/thead/errata.c  |    6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff -- a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -82,11 +82,9 @@ static void __init_or_module warn_miss_e
 	pr_warn("----------------------------------------------------------------\n");
 }
 
-void __init_or_module sifive_errata_patch_func(struct alt_entry *begin,
-					       struct alt_entry *end,
-					       unsigned long archid,
-					       unsigned long impid,
-					       unsigned int stage)
+void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
+			      unsigned long archid, unsigned long impid,
+			      unsigned int stage)
 {
 	struct alt_entry *alt;
 	u32 cpu_req_errata;
diff -- a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -83,9 +83,9 @@ static u32 thead_errata_probe(unsigned i
 	return cpu_req_errata;
 }
 
-void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
-					      unsigned long archid, unsigned long impid,
-					      unsigned int stage)
+void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
+			     unsigned long archid, unsigned long impid,
+			     unsigned int stage)
 {
 	struct alt_entry *alt;
 	u32 cpu_req_errata = thead_errata_probe(stage, archid, impid);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
