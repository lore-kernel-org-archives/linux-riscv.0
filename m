Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AFFC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Mar 2022 22:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FtxN5IBWc1b/smAboamHoV5IhjnwEK05cR16yI9Wr6A=; b=SV642ytpihNB8H
	s2NsiNyEYEb4UnL8CmlXrK4BoYp+3JabpKs4Vr2DNP0K+Gyy0YjCq+u/UinKWaesNtB8yB6ZbM621
	CfEObzgsazAU+HtJ1nvDEsbMEnpswldJN9L2h56a3hpBjSYaNoY/JywaxaGWnIy1NgHYsBtLTtKZK
	pFdbo1kZAqrO6dH09LvECWKlugPq4i5fyh7SB8BPpZE7+URqiVcPWd6ziiTUOR41doBiBfiqxxTXB
	jGnPD5tBrv/4W1M4+qq1M/5cc7f9I/lXCMqyDvBIavRIB8/0xK7ue55HnsoLx3ynslUZt/AMrAz2j
	ZFp0iR18zt0evvLs/dHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYxTI-00AJIP-Df; Mon, 28 Mar 2022 22:04:20 +0000
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYxTG-00AJIB-PG; Mon, 28 Mar 2022 22:04:18 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>,
 Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: cpu.c: don't use kernel-doc markers for comments
Date: Mon, 28 Mar 2022 15:04:17 -0700
Message-Id: <20220328220417.25675-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
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

Repair kernel-doc build warnings caused by using "/**" kernel-doc
markers for comments that are not in kernel-doc format:

cpu.c:89: warning: cannot understand function prototype: 'struct riscv_isa_ext_data isa_ext_arr[] = '
cpu.c:114: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Atish Patra <atishp@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/kernel/cpu.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20220328.orig/arch/riscv/kernel/cpu.c
+++ linux-next-20220328/arch/riscv/kernel/cpu.c
@@ -69,7 +69,7 @@ int riscv_of_parent_hartid(struct device
 		.uprop = #UPROP,				\
 		.isa_ext_id = EXTID,				\
 	}
-/**
+/*
  * Here are the ordering rules of extension naming defined by RISC-V
  * specification :
  * 1. All extensions should be separated from other multi-letter extensions
@@ -110,7 +110,7 @@ static void print_isa_ext(struct seq_fil
 	}
 }
 
-/**
+/*
  * These are the only valid base (single letter) ISA extensions as per the spec.
  * It also specifies the canonical order in which it appears in the spec.
  * Some of the extension may just be a place holder for now (B, K, P, J).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
