Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DAEC433B4
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 11:57:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 786F561139
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 11:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 786F561139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p+jEZZf9m8ZLdj1cRjWJshHokdpI4Naec19sQoxFWT0=; b=mifQnAMooTUJM+SmWih4TOax2
	+ZO2V1Cm0ziLvpYZTGiEsIadifsmfJSRFW9XMjMQh8d54LGMRTdPKZ++ztcqy9AZWY2CQtLQ2+abo
	GZAjPzPDvt9aJ0BtiBuBoLuO1ovZQrN50eAB/egl5ABSYsysGblg01GteinCAIZkt3UuOzmC2YdS3
	wA5yTAxk8hnGciR0eoiAqq289MzgK7iZdsSaj2r/asbLw1qKHBvUSr32ybPaPHPtV1YW0kJA1WafF
	Jgm25//UHHQ7irWyJKzOTGSv0xF+/OFvxFNTTQ36dPmx5i7qdoF1NYvr4TAtrMcOe1f9HUXHVao2u
	+LGlUbPVA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU6o5-004vXT-QI; Wed, 07 Apr 2021 11:57:13 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU6nv-004vVq-E6
 for linux-riscv@lists.infradead.org; Wed, 07 Apr 2021 11:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617796623; x=1649332623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TyfOh8mJ7OPn6qhfH6Ryl1SvZ+awCxnRWrTwDJ9ElKQ=;
 b=o38Y51xTHfxyATUYvDn3/tYW7vAByu1mQhkPhy1uB6ooTDXC7z8+mBRC
 cqOUgIRsVzaIQOjHZLioGhKfiqoenH4LiLFnX323oJhMP1m33m+gS1hl7
 pKDu5cwc8fD4RimcQKUfLaIHCp5YCKi+1HErRsyy4Oie1RIy+Ms5rnvSK
 pbKvY2M7+4PkRzePRnHi7FtSLeR7COV2Mo3l4dOd1webVjpAl8QxGAkST
 4iBhfnT83e1LRnM30gJMAzNVftOVUg7jtBxz1Nl8B7cvz+kXAhIruHf3w
 ZJb70jnr7/p8kc7/mZQ8w2jKr8NdeYrW9Sa91AsbrlJr6EmLvgIDoyiYX A==;
IronPort-SDR: jbP15LTaaVvwDPnzFZjPqZ/OcjJhqt27uNJgE32J2MjZ8GRcxRD8Kft/FXk4zHky+K/WddDTDw
 SwQ9Zq+UQp94i642FFNj3CJKy5f2GGic+WxLgLZ/W1V1nzi111mv8Dsv7UHW4m2AT01689to7X
 qwd4eZV3YZ4MuNpOXRugxIJJ+8kRcj828GcdNO9tzSqBT9atP+5pjc9iqsKl2fEIbBEYkPGFRj
 aCdPxOr3ghLtj4F3NMY+OzWevLGwDdnwuUaDXrTXmpWNG1L6uIrsmKZs3zxLpveS45NqKTZ4VD
 ekM=
X-IronPort-AV: E=Sophos;i="5.82,203,1613404800"; d="scan'208";a="164061569"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2021 19:56:46 +0800
IronPort-SDR: 6ZgSg5JsBER1jMF90y+istuUCL9LJrcQ2g7FfkNze5r2bLgsEePCCD4/ceNyJosqHJOCObezV/
 A2PW2neM2p43mJRuwCyUXFj1H6MR0N5RKXD4sZj2g84IwuEFN6RdMD+saAYrRhfnFZ3f+RbnFR
 8DikVNuIbYtkl5oN/0t2dmW9qYuBLAIohvPCMcmXLOIp/bib50o98XAXcHMRk86CvGlHbX8hyC
 KIjk9VmKFRpkOifhxk3QrMaPWqunbyVnKUSYYmDhdeDRrJYHi4NCC0MIG2SmZjOyhz8YeeF4Za
 FDhshEj/ElvQlsyK52zLhWU4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 04:38:06 -0700
IronPort-SDR: vvzMd1q7ccIG2Fj24WATyo39smazcLM+7q6JNW/spiaEZLmVJJUp5t73mIwIMZ6RCmoxoj1IEW
 ZJXBdOmPgEN9QD7VDjxuh+8ZCMP5tBBwuQttdhzQOMpHIYqRcBO+STn1zczJcbdlTXtv5qFY5B
 T82CXEgiNkSu6CywTyCoSqjBdU0ypnibeohraiigdxAgBW490UYvoz9SXiormPT0/0qhI9gSbB
 C9fU9vnEQpSX/ce7x7eaVwTW4phW3R5hSVgPtbFJoDXq5+hMxE+TkAlzsu8sn8UTi/TncktR9q
 MSA=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.90])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Apr 2021 04:56:45 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Anup Patel <anup.patel@wdc.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH 1/2] binfmt_flat: allow not offsetting data start
Date: Wed,  7 Apr 2021 20:56:37 +0900
Message-Id: <20210407115638.1055824-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210407115638.1055824-1-damien.lemoal@wdc.com>
References: <20210407115638.1055824-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_125704_132980_6907583B 
X-CRM114-Status: GOOD (  17.48  )
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
always exist. For architecture which cannot support a such gap between
the text and data sections (e.g. riscv nommu), flat binary programs
cannot be executed.

To allow an architecture to request contiguous text and data sections,
introduce the macro FLAT_TEXT_DATA_NO_GAP which can be defined by the
architecture in its asm/flat.h file. With this change, the macro
DATA_GAP_WORDS is conditionally defined in binfmt_flat.c to
MAX_SHARED_LIBS for architectures tolerating the gap
(FLAT_TEXT_DATA_NO_GAP undefined case) and to 0 when
FLAT_TEXT_DATA_NO_GAP is defined. DATA_GAP_WORDS is used in
load_flat_file() to calculate the data section length and start
position.

The definition of FLAT_TEXT_DATA_NO_GAP by an architecture also
prevents the use of the separate text/data load case (when
FLAT_FLAG_RAM and FLAT_FLAG_GZIP are not set with NOMMU kernels).

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 fs/binfmt_flat.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index b9c658e0548e..2bfa05ac5cb4 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -74,6 +74,12 @@
 #define	MAX_SHARED_LIBS			(1)
 #endif
 
+#ifdef FLAT_TEXT_DATA_NO_GAP
+#define DATA_GAP_WORDS			(0)
+#else
+#define DATA_GAP_WORDS			(MAX_SHARED_LIBS)
+#endif
+
 struct lib_info {
 	struct {
 		unsigned long start_code;		/* Start of text segment */
@@ -437,7 +443,6 @@ static int load_flat_file(struct linux_binprm *bprm,
 	__be32 __user *reloc;
 	u32 __user *rp;
 	int i, rev, relocs;
-	loff_t fpos;
 	unsigned long start_code, end_code;
 	ssize_t result;
 	int ret;
@@ -560,6 +565,9 @@ static int load_flat_file(struct linux_binprm *bprm,
 	 * it all together.
 	 */
 	if (!IS_ENABLED(CONFIG_MMU) && !(flags & (FLAT_FLAG_RAM|FLAT_FLAG_GZIP))) {
+#ifndef FLAT_TEXT_DATA_NO_GAP
+		loff_t fpos;
+
 		/*
 		 * this should give us a ROM ptr,  but if it doesn't we don't
 		 * really care
@@ -576,7 +584,7 @@ static int load_flat_file(struct linux_binprm *bprm,
 			goto err;
 		}
 
-		len = data_len + extra + MAX_SHARED_LIBS * sizeof(unsigned long);
+		len = data_len + extra + DATA_GAP_WORDS * sizeof(unsigned long);
 		len = PAGE_ALIGN(len);
 		realdatastart = vm_mmap(NULL, 0, len,
 			PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE, 0);
@@ -591,7 +599,7 @@ static int load_flat_file(struct linux_binprm *bprm,
 			goto err;
 		}
 		datapos = ALIGN(realdatastart +
-				MAX_SHARED_LIBS * sizeof(unsigned long),
+				DATA_GAP_WORDS * sizeof(unsigned long),
 				FLAT_DATA_ALIGN);
 
 		pr_debug("Allocated data+bss+stack (%u bytes): %lx\n",
@@ -620,9 +628,14 @@ static int load_flat_file(struct linux_binprm *bprm,
 			(datapos + (ntohl(hdr->reloc_start) - text_len));
 		memp = realdatastart;
 		memp_size = len;
+#else
+		pr_err("Separate text/data loading not supported\n");
+		ret = -ENOEXEC;
+		goto err;
+#endif /* FLAT_TEXT_DATA_NO_GAP */
 	} else {
 
-		len = text_len + data_len + extra + MAX_SHARED_LIBS * sizeof(u32);
+		len = text_len + data_len + extra + DATA_GAP_WORDS * sizeof(u32);
 		len = PAGE_ALIGN(len);
 		textpos = vm_mmap(NULL, 0, len,
 			PROT_READ | PROT_EXEC | PROT_WRITE, MAP_PRIVATE, 0);
@@ -638,7 +651,7 @@ static int load_flat_file(struct linux_binprm *bprm,
 
 		realdatastart = textpos + ntohl(hdr->data_start);
 		datapos = ALIGN(realdatastart +
-				MAX_SHARED_LIBS * sizeof(u32),
+				DATA_GAP_WORDS * sizeof(u32),
 				FLAT_DATA_ALIGN);
 
 		reloc = (__be32 __user *)
@@ -714,7 +727,7 @@ static int load_flat_file(struct linux_binprm *bprm,
 			ret = result;
 			pr_err("Unable to read code+data+bss, errno %d\n", ret);
 			vm_munmap(textpos, text_len + data_len + extra +
-				MAX_SHARED_LIBS * sizeof(u32));
+				  DATA_GAP_WORDS * sizeof(u32));
 			goto err;
 		}
 	}
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
