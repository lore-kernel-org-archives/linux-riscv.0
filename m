Return-Path: <SRS0=PPu9=5B=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9F2C10DCE
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2020 02:43:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02EB205C9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2020 02:43:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j3vYsUgR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ogu0GllG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C02EB205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mw++Ar00ojiDTJw5sgio8f+eM7HbcH/KjK4o8oksM/g=; b=j3vYsUgRcqS+zF
	Wz6wklOxEcKxErxMuWaqfMjifWINOpNF5wwULHf5SGPlQRlN3FI6KoKXTGpyz+qOUdki5DJXjQVgS
	zZ9UIshzf8zI1p6OMZXUAtUh6bInASLgK+dDMolsz/ne2cSvmEeOtUEM5L4SqPaa3eCv7Yc+6ZarM
	VYLRQ1NiA18n5zndRaRFl3lqjkjBH4VevakAyI4zWvjEdEM+p2Ry0IFbeZrOy8nN4rMA0uYQy0D5X
	I3Lzpijdibn4+lJgaFCf94aeVUuyvmPHNDsnhQgJeVTmxaLiEgz7hg8aMDaJ7HEL3iX6q8NYLtYlN
	m73iJVHsYcEU3aLyWkUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDfjM-00063c-US; Mon, 16 Mar 2020 02:43:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDfax-0004AM-Kv
 for linux-riscv@lists.infradead.org; Mon, 16 Mar 2020 02:35:13 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B19B206EB;
 Mon, 16 Mar 2020 02:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584326111;
 bh=B7VCjfXUJJnPc9HcAd5IjQF9bDnM9fbTDTAhWgmBR34=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ogu0GllGWjbmAqEozETsKu62fX5wNH6x/Aoje9FjXXjbaF1CtyNy3SJWXMAtNBfyH
 +fytoFxuqHxlAOzVidQcjOhzk9hGED3wPSlZ1zWVtvJADCqas1AR7skDqf85NMURLD
 SnZjbzwxFbt8y43NY4xEHU2kii0YhyEAcBPrwbqs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 14/20] riscv: avoid the PIC offset of static
 percpu data in module beyond 2G limits
Date: Sun, 15 Mar 2020 22:34:47 -0400
Message-Id: <20200316023453.1800-14-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316023453.1800-1-sashal@kernel.org>
References: <20200316023453.1800-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200315_193511_830729_51DC489E 
X-CRM114-Status: GOOD (  11.71  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Carlos de Paula <me@carlosedp.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Vincent Chen <vincent.chen@sifive.com>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Vincent Chen <vincent.chen@sifive.com>

[ Upstream commit 0cff8bff7af886af0923d5c91776cd51603e531f ]

The compiler uses the PIC-relative method to access static variables
instead of GOT when the code model is PIC. Therefore, the limitation of
the access range from the instruction to the symbol address is +-2GB.
Under this circumstance, the kernel cannot load a kernel module if this
module has static per-CPU symbols declared by DEFINE_PER_CPU(). The reason
is that kernel relocates the .data..percpu section of the kernel module to
the end of kernel's .data..percpu. Hence, the distance between the per-CPU
symbols and the instruction will exceed the 2GB limits. To solve this
problem, the kernel should place the loaded module in the memory area
[&_end-2G, VMALLOC_END].

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Suggested-by: Alexandre Ghiti <alex@ghiti.fr>
Suggested-by: Anup Patel <anup@brainfault.org>
Tested-by: Alexandre Ghiti <alex@ghiti.fr>
Tested-by: Carlos de Paula <me@carlosedp.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kernel/module.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 7dd308129b40f..7c012ad1d7ede 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -16,6 +16,10 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/moduleloader.h>
+#include <linux/vmalloc.h>
+#include <linux/sizes.h>
+#include <asm/pgtable.h>
+#include <asm/sections.h>
 
 static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
 {
@@ -394,3 +398,15 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 
 	return 0;
 }
+
+#if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
+#define VMALLOC_MODULE_START \
+	 max(PFN_ALIGN((unsigned long)&_end - SZ_2G), VMALLOC_START)
+void *module_alloc(unsigned long size)
+{
+	return __vmalloc_node_range(size, 1, VMALLOC_MODULE_START,
+				    VMALLOC_END, GFP_KERNEL,
+				    PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
+				    __builtin_return_address(0));
+}
+#endif
-- 
2.20.1


