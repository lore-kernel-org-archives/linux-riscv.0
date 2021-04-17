Return-Path: <SRS0=TuAZ=JO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E66C433B4
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 01:10:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 821A16113D
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 01:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 821A16113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VOaxuGN5zaVwmtxuCFnAgnwJ9VfkiIBHpH7j7vPtrLo=; b=Nbwd4fNkh79N9fx8CKsl3B39I
	aT2/S1epQ+RinzoYZ7/52Wb65gVzj1XMxv1ebz1rU3AJncacsQnWs0vRRY/oV9j2Kf1xu4+K4E4eC
	nCB9VVWNEDvfdwUSN46tEDcOICdpdH2+BudIG1Xt/7S4FaXBNv39qCVsJ06EmO0hkVQGhyIap4aZz
	ayoJxoaex0Dlnd60XxrcbyIR5EOoZzttOWxKQYaZVJCA0dOikLnaA5XKYZByenXhChU/d7k6zjxE5
	6fH0Tk1acrKye9C3QBik8B7JOBtwNlD/ntaNlU+ptIlrIiu2jwb9IZ2TFciI4HHnyyaZGLoAMKLOz
	Rldn/0vtw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXZTi-003vih-Rx; Sat, 17 Apr 2021 01:10:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZTc-003vha-3b
 for linux-riscv@desiato.infradead.org; Sat, 17 Apr 2021 01:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ZR+aG5j1FNcb3RPFeyHK8OGi97A18JTT5VCIVA1ghVs=; b=bNDmx6JZt8FFw/Au2uANQ+5zrB
 5/tE/wJGUadgeMtBJlq3ZMtwUG8M9cBvlPDcwrOOHrCkcf43dRg3fbeGkunUOF+xr5BURR4C+ZP8y
 Qn5s/UXHwMw9i0kcIuSx1lJ+qVvlljJvK52OaKVkYsg908UE2zU2rQ185oWcchqLac4ijO1pr+g2S
 tDP8M2YaLI5AQ0A+H9295L+I6uU61NNt5ALp+pXI5lMK76A1AjZJ2YEiX8nnLlXF/6GLnGroq3nA0
 UAE2n/1tHcsy8aHeSm+TLlDJDgAMuKDAs2RCYR0PpwwAGtBKepuLMj38F6wszzcHtVjIhrPUWKC5t
 rwf+xXeA==;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZTW-009owP-Vy
 for linux-riscv@lists.infradead.org; Sat, 17 Apr 2021 01:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618621818; x=1650157818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ONje5diYFTfuoHw7Q91T2ek/0x57ALfBBrINovIdSps=;
 b=VUlF9+Q1HO/FLl853hdYrjcl6+ERfeOownElhcDD1c4nlKd3c+zx/K+i
 Hn0gSrF5vuvMgP4zA/nX3SO70x5X85HYFBM0evuKFLJNcd+3je6QZ2ZKF
 Lrx0GFJoH4mDa5jlju7qDPMXqlxaQX+dxoL8ioETxTDH5Elg0T91EF5Dv
 DkfKVqvSqx8c1ogkLrFAwhBK4vKn1uVt6ZN5NTgQqkWIA9VL4GsFGkfz2
 LMFULZSZPs+DXO7wkERocyfIaNuKnItWHFmcNqyVPVIwdRuOujpXP1/DQ
 3R5/RMMk5LR8RBlRwM+xo7x67Yb6dS2iQPDLA3h4nLuIyvLblZ1Px+DMs g==;
IronPort-SDR: 1Ae+oxd1+avgNdGlWCL545nK/GQk0XGXzoO9zk9KAX/kDVPxdA1hYnwLiykA8TXls1EDQhdwp5
 X0oLuJYLDqmJvHJ4eSUPbflAyFb3vmmmcfAT9c66Od8242dTl6pqqOG204JPQYWqgTfRYexdDR
 ANDdtr8kQY6Wdske0PGgiGji6JPDZEjt8vxOUnYCDpV3qluOA/digHnHHvHXfXIfespZyv/YK2
 9jUGuUxKnhJtFeubHRLMdRfSqZQBQqBfaxj8mqCoMiGhlNcgAjmxYYUyM0QQX3foYHg/nLlwk/
 F6Y=
X-IronPort-AV: E=Sophos;i="5.82,228,1613404800"; d="scan'208";a="165185056"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Apr 2021 09:10:17 +0800
IronPort-SDR: 1yWn3QJEtH/HoUqF0sf6hphmow03kpZk5FZ3M4XsO/gpLeBb27XhJXvvSDx6eok5OFjabnzVZT
 jVeYTIXsUod5U92AAyRCJl1m8V8+p3R8st7zgkykZVW99m0zDoqEtnDdPtjH+RqBCV41cHRhFQ
 KAxqyv2+d6X7gliVK3Vc8KlJZH3N8InuiDn8H+G5HLEd2zHpB9rvN4vQBI98+nlvBGaNTjRZwg
 f8KzaK+EzL7flopWdarwK20SpkFGKk6xxWkqnXau/0Nhp8regu+WqfKF8p5x19FtbpM3dC52ee
 1RI+9U27RTAv3NEj0Tqi7JLY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 17:49:31 -0700
IronPort-SDR: /Mpcyl00NWrrMVw8jjb+KQQpaXYt2uHMvilpjvH+sh0oGNKNXGXWtcNNdz5nIzOnFpY1ENd+iI
 um12RaVkSGx8uC/+4QWQG2o/14uHCMNJbfE37OCBdAdYc4cO7YCQhRBHlEbjl8Jivvl5C+4Hqd
 008sngSKp6/xskw9zNJsYd2wOOh78pW9QWpzdRIqvqeOZFKWhKurLQ6p3vHAK2C7vNp/4mHDAY
 LMxqPyoCGgfoY2ZlOTFY3iSMbEGnxnYXIiKkK4qRMj8czsWvffQVF3EEgS8Su+i8xIrv/Iqr/3
 T7Q=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.5])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Apr 2021 18:10:17 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: uclinux-dev@uclinux.org, Greg Ungerer <gerg@linux-m68k.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Christoph Hellwig <hch@lst.de>
Subject: [PATCH v4 1/2] binfmt_flat: allow not offsetting data start
Date: Sat, 17 Apr 2021 10:10:08 +0900
Message-Id: <20210417011009.54569-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210417011009.54569-1-damien.lemoal@wdc.com>
References: <20210417011009.54569-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_181019_059180_968FEE5A 
X-CRM114-Status: GOOD (  16.54  )
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

Commit 2217b9826246 ("binfmt_flat: revert "binfmt_flat: don't offset
the data start"") restored offsetting the start of the data section by
a number of words defined by MAX_SHARED_LIBS. As a result, since
MAX_SHARED_LIBS is never 0, a gap between the text and data sections
always exists. For architectures which cannot support a such gap
between the text and data sections (e.g. riscv nommu), flat binary
programs cannot be executed.

To allow an architecture to request no data start offset to allow for
contiguous text and data sections for binaries flagged with
FLAT_FLAG_RAM, introduce the new config option
CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET. Using this new option, the
macro DATA_START_OFFSET_WORDS is conditionally defined in binfmt_flat.c
to MAX_SHARED_LIBS for architectures tolerating or needing the data
start offset (CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET disabled case)
and to 0 when CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET is enabled.
DATA_START_OFFSET_WORDS is used in load_flat_file() to calculate the
data section length and start position.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 fs/Kconfig.binfmt |  3 +++
 fs/binfmt_flat.c  | 19 ++++++++++++++-----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
index c6f1c8c1934e..06fb7a93a1bd 100644
--- a/fs/Kconfig.binfmt
+++ b/fs/Kconfig.binfmt
@@ -112,6 +112,9 @@ config BINFMT_FLAT_ARGVP_ENVP_ON_STACK
 config BINFMT_FLAT_OLD_ALWAYS_RAM
 	bool
 
+config BINFMT_FLAT_NO_DATA_START_OFFSET
+	bool
+
 config BINFMT_FLAT_OLD
 	bool "Enable support for very old legacy flat binaries"
 	depends on BINFMT_FLAT
diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index b9c658e0548e..1dc68dfba3e0 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -74,6 +74,12 @@
 #define	MAX_SHARED_LIBS			(1)
 #endif
 
+#ifdef CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET
+#define DATA_START_OFFSET_WORDS		(0)
+#else
+#define DATA_START_OFFSET_WORDS		(MAX_SHARED_LIBS)
+#endif
+
 struct lib_info {
 	struct {
 		unsigned long start_code;		/* Start of text segment */
@@ -560,6 +566,7 @@ static int load_flat_file(struct linux_binprm *bprm,
 	 * it all together.
 	 */
 	if (!IS_ENABLED(CONFIG_MMU) && !(flags & (FLAT_FLAG_RAM|FLAT_FLAG_GZIP))) {
+
 		/*
 		 * this should give us a ROM ptr,  but if it doesn't we don't
 		 * really care
@@ -576,7 +583,8 @@ static int load_flat_file(struct linux_binprm *bprm,
 			goto err;
 		}
 
-		len = data_len + extra + MAX_SHARED_LIBS * sizeof(unsigned long);
+		len = data_len + extra +
+			DATA_START_OFFSET_WORDS * sizeof(unsigned long);
 		len = PAGE_ALIGN(len);
 		realdatastart = vm_mmap(NULL, 0, len,
 			PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE, 0);
@@ -591,7 +599,7 @@ static int load_flat_file(struct linux_binprm *bprm,
 			goto err;
 		}
 		datapos = ALIGN(realdatastart +
-				MAX_SHARED_LIBS * sizeof(unsigned long),
+				DATA_START_OFFSET_WORDS * sizeof(unsigned long),
 				FLAT_DATA_ALIGN);
 
 		pr_debug("Allocated data+bss+stack (%u bytes): %lx\n",
@@ -622,7 +630,8 @@ static int load_flat_file(struct linux_binprm *bprm,
 		memp_size = len;
 	} else {
 
-		len = text_len + data_len + extra + MAX_SHARED_LIBS * sizeof(u32);
+		len = text_len + data_len + extra +
+			DATA_START_OFFSET_WORDS * sizeof(u32);
 		len = PAGE_ALIGN(len);
 		textpos = vm_mmap(NULL, 0, len,
 			PROT_READ | PROT_EXEC | PROT_WRITE, MAP_PRIVATE, 0);
@@ -638,7 +647,7 @@ static int load_flat_file(struct linux_binprm *bprm,
 
 		realdatastart = textpos + ntohl(hdr->data_start);
 		datapos = ALIGN(realdatastart +
-				MAX_SHARED_LIBS * sizeof(u32),
+				DATA_START_OFFSET_WORDS * sizeof(u32),
 				FLAT_DATA_ALIGN);
 
 		reloc = (__be32 __user *)
@@ -714,7 +723,7 @@ static int load_flat_file(struct linux_binprm *bprm,
 			ret = result;
 			pr_err("Unable to read code+data+bss, errno %d\n", ret);
 			vm_munmap(textpos, text_len + data_len + extra +
-				MAX_SHARED_LIBS * sizeof(u32));
+				  DATA_START_OFFSET_WORDS * sizeof(u32));
 			goto err;
 		}
 	}
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
