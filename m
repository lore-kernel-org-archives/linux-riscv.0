Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45D6C00A94
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 09:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PeaiRqYi/lDTVH2GKysJXs2SRw0Dj3gQNnLxCscLSy4=; b=4UH+99PCogQxJ+
	BiR7kSbShbEcYFb3dEWyOSxurAcfn822ySRk7h2ShRlmfSbFzbUgXyU3vE84rAh/v1irYzsMK+Yob
	FG4iPXrsyg3m1h3DB+H+7PVTjHP/gbwgkmygORC9oMP5P/vpZ9YaDrPStibBZ7tH2Az68bVNTsGGH
	AceTbE2FR10SguEFa3grM5WpfBunviVmw/0rt0qhF8Ds9qqKkUfoCXZx3mkgLb2xFKp4HrtY7AZB1
	aQAkjjcqOOKq/6pUwLRZCI2OXWYlFd8Q6vjtd8r8pPMOovcXHQmG/GDut3CMvAp6R2I15hcA/J5ga
	ExXy517A3F4k07vkaAEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJ50-00000007mqb-2s29;
	Mon, 15 Apr 2024 09:56:50 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJ4x-00000007mmU-0VgM
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 09:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1713175002; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=uKQrEiJDFuVgYKaCjACTRxFVEamjUwkGI79EoCthHgw=;
	b=JgQlN8jSUDD6LfMQZhtMcK02R+etceiMtjZmumDXqizqudkAjHSKh3gI25FzI9AVfXtc3GYiLsoBkxvslrCgiPsrKvzwNCNo3yPBwdJGTvTu3MB1kkyhzPqOPNFcfpUr/bwdprgUGHv+1AFQpNKTvYX9qgW9N8pQ+vvQF6DBxxY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0W4a9De2_1713174995;
Received: from localhost.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0W4a9De2_1713174995)
          by smtp.aliyun-inc.com;
          Mon, 15 Apr 2024 17:56:40 +0800
From: cp0613@linux.alibaba.com
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH] tools/perf: Fix compiling with libelf on rv32
Date: Mon, 15 Apr 2024 17:55:32 +0800
Message-Id: <20240415095532.4930-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_025647_575742_C76A1B7F 
X-CRM114-Status: UNSURE (   5.82  )
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

When cross-compiling perf with libelf, the following error occurred:

	In file included from tests/genelf.c:14:
	tests/../util/genelf.h:50:2: error: #error "unsupported architecture"
	50 | #error "unsupported architecture"
		|  ^~~~~
	tests/../util/genelf.h:59:5: warning: "GEN_ELF_CLASS" is not defined, evaluates to 0 [-Wundef]
	59 | #if GEN_ELF_CLASS == ELFCLASS64

Fix this by adding GEN-ELF-ARCH and GEN-ELF-CLASS definitions for rv32.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 tools/perf/util/genelf.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/perf/util/genelf.h b/tools/perf/util/genelf.h
index 5f18d20ea903..4e2e4f40e134 100644
--- a/tools/perf/util/genelf.h
+++ b/tools/perf/util/genelf.h
@@ -43,6 +43,9 @@ int jit_add_debug_info(Elf *e, uint64_t code_addr, void *debug, int nr_debug_ent
 #elif defined(__riscv) && __riscv_xlen == 64
 #define GEN_ELF_ARCH	EM_RISCV
 #define GEN_ELF_CLASS	ELFCLASS64
+#elif defined(__riscv) && __riscv_xlen == 32
+#define GEN_ELF_ARCH	EM_RISCV
+#define GEN_ELF_CLASS	ELFCLASS32
 #elif defined(__loongarch__)
 #define GEN_ELF_ARCH	EM_LOONGARCH
 #define GEN_ELF_CLASS	ELFCLASS64
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
