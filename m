Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CFFFB5EAC
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 03:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mE+sQhhZXG57+OZplmoU6Gad7yCt1ZuXHhwcjW3Pljw=; b=LN59pB1R6pdGjB
	TyKTwWGxaJb0OTQWthl9kb7E0pMvXBmAePUFTJI+ahBaW84Y5vncNksdE6Vtu9CsIZLN4Lmhj+9h4
	mqykZqinB8tBusdNnzdBJZh9++o+eka9lUfdkQAJOf6BvMaDC0mBRNkPaQfQ52pwE8/QpzM1MK2bi
	qjDFEHveBI/mNOTCJOE4xxpSjV3axazynzGWmWcnIpSfw7YiKj37+2kpwzJlTEb7ggoSh80+D0Hk/
	FiLD5aDqtO/BZUfLO1zjp8VyBQu/aVUT/9KCy11c3FadrUIHJBiKm+dFXkNUbqlgiWuAghdC08ueL
	mjTpBtv5cp44TDEOIdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LRL-00000005LUl-33GZ;
	Tue, 17 Mar 2026 03:49:55 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LRH-00000005LUC-0SkF
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 03:49:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1773719384; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=xWngtpObbjeyx2KTcz5ogpg82L+5SXTyDpUJYBAyjEY=;
	b=blnVpcflqqKjRHhoxjVygC7zwIyCjcvctbs0C3Kfvk0Y/rAsSonOHzMAf4wUV2rP8TOJh3ImgIaY70mA749xmR7xuYHi9WIWlkvUiD35CDuXb9iOinVMODIOMKROae9iEThKvxTCn7lqTwUuttPjQhGBY8SjPjoN92JEziOvMn4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R481e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0X.9XpQ6_1773719378;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X.9XpQ6_1773719378 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 17 Mar 2026 11:49:43 +0800
From: cp0613@linux.alibaba.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com,
	pjw@kernel.org,
	alex@ghiti.fr,
	guoren@kernel.org
Cc: linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH] perf symbol: Add RISCV case in get_plt_sizes
Date: Tue, 17 Mar 2026 11:48:47 +0800
Message-ID: <20260317034847.4136-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_204951_870114_392D7A1E 
X-CRM114-Status: UNSURE (   6.74  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

According to RISC-V psABI specification, the PLT (Program Linkage Table)
has the following layout:
- The first PLT entry occupies two 16-byte entries (32 bytes total)
- Subsequent PLT entries take up 16 bytes each

This aligns with the binutils-gdb implementation which defines the same
PLT sizes for RISC-V architecture.

Update get_plt_sizes() to set plt_header_size=32 and plt_entry_size=16
for EM_RISCV, matching the architecture's standard ABI.

Since AARCH64, LOONGARCH, and RISCV have the same PLT size definition,
they are merged together.

Link: https://github.com/riscv-non-isa/riscv-elf-psabi-doc
Link: https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elfnn-riscv.c

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 tools/perf/util/symbol-elf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
index 76912c62b6a0..806936d95523 100644
--- a/tools/perf/util/symbol-elf.c
+++ b/tools/perf/util/symbol-elf.c
@@ -372,10 +372,8 @@ static bool get_plt_sizes(struct dso *dso, GElf_Ehdr *ehdr, GElf_Shdr *shdr_plt,
 		*plt_entry_size = 12;
 		return true;
 	case EM_AARCH64:
-		*plt_header_size = 32;
-		*plt_entry_size = 16;
-		return true;
 	case EM_LOONGARCH:
+	case EM_RISCV:
 		*plt_header_size = 32;
 		*plt_entry_size = 16;
 		return true;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
