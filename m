Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E027EC43460
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 15:49:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9079561279
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 15:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9079561279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7LOcbC/E72ZiOXtp521mp9w/Qv8jta3vvk9Jcx+Su2k=; b=Y0dcn884YV6io7APvK8DYJumD
	Uy57rN6XP+WQBhVcOvvBYr72oC0zLy1RAs8kyYu62b04z1WoxhpRWahw3eM5+MsgTHxWdoYn/IWv6
	YloTK7/+dSmq45e2HkrP6xlzmVbNSEwbcbqJQLcJDUWwP4M0gAHEWp2hIoBz7EkdGPz+uH7cUfabB
	YQlTdap61U+Y1Csrhz8if8xMbkeeNB0O5dqRfm1OkZaz6tGcJwOxDKb/iorR1Fg5FeI6Z+d0Qdd6o
	Ht57ihpn6lghh8SksnLxkigjAsuwuEjbd3oWVEQ5q1d3l/1NV3Ozu1UqcFE+ApwaydWQn/dqWa5wb
	OpOWvvTGA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUAR4-005K95-4z; Wed, 07 Apr 2021 15:49:42 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUAQy-005K6m-JG
 for linux-riscv@lists.infradead.org; Wed, 07 Apr 2021 15:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617810576; x=1649346576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8bPZB2L7R8T1buTkfeAuMShi0HneoMFPN1eodPMED7Q=;
 b=PPViBj1h4suEIdWlO+0BCg/6yAZKEXDyxoZADrJGLp437WWVxRKOH/Rs
 BgziAv8xXtKL7PaSIu3pxlebT83tsuZt++mcLXBB6OhDlRrU8AMcwUEFA
 vznSZHsl5FjaTk95ykBAAlD0zO9LUD+sTVlMtxje4ahyjVytv+xEqs3SZ
 ipfIg8JfpL2jB41BCn/46XJskx7xt8wVct/BPL9WdfjFqqrkxifi8k4iA
 Ref//6DJZWBN+eq+aWb5QhIglAfWX2QWk9f12UBeTzB3rXHl6XQKkUavZ
 yAZy1abrEngBXRu9GjCmEzWzvyziCRCK8U/5gcWVLpjxi9AQq0X53WFFL g==;
IronPort-SDR: sh4tJ8J4m51QU+v3WQkuvmc7C7a+GvA3ykFiFvFdI1wCS5FsQgUSw3UxqfiZQ9Ynt28x6mEdS9
 1i2TJTrvwOW7M3cdo15BU/m2ghi4RpV5jdm306OEDEVzoT7zTueny62MDwqlTiKvEY7WaEN2iY
 /Nywjy9WZVKpT9+N0Gebjz7H5YGxiEYTOuLynlB98DjZgvXxzfR4O8oc2mxa5JM7d7bQbwGlcX
 7sZeXAZikOCk+NdeUpa52HgMRpqtHXoqfR3ITxo1lQIiEAuLsoiHVq8mn+u5WlMIVv7fjVc0oj
 +pw=
X-IronPort-AV: E=Sophos;i="5.82,203,1613404800"; d="scan'208";a="274931687"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2021 23:49:32 +0800
IronPort-SDR: R8cOzH1JgDS+ITyW8Hl2/wnK+sK62YkM2wgXKIxLn7bWzG88hB1M1aFULDCdT3yBYcH/b0xbGf
 nwcrCx+5t5XdRvZIk6OffYmHSOIiM86jXX2/WPfHBAaZRPRcZkyVPCDRWd9ROu2zIfm8oNhhwP
 YPQu2oWy4ZS44PObKn+Lb7qh/HmBn2Bz2miBqOZY/92TzjosYiR4wtRWnHS0pjVieePbAc0ZC/
 kUAnTJ9BDyo5q27iCtQ9ct10Vg98YJmfjQodnlx0sZDRd/VlMZ+vt5SP4Hpg+X2soLQG3DXvQB
 17xyaO3pv5Dzrt2VB3fE9uFs
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 08:30:51 -0700
IronPort-SDR: XDqFuqXsTFsEzpoFJzIGKLZmNG5O14ubW4TIYD+RljgELR7moJ3bqrV6xZmHZD5ZMFa7O9QJbt
 cB/lPo7rcuB/2GKL5mqn7lfnEUV8hlvwRHTeuw591XN2+LDfABn5s2IxKKvrd+bA91KeuBslqe
 x4juyDYvE4MC5kz9AKm2TQZ5++HBeNZh7n34bzVDMeTiPRbRcUzwDDJJpOsnxbSd5Y8Kvlh2+E
 A7TFcs/86pxa9KpsYvtoavvmaApGdfewJiCqs5vMu34Zp02up07LqfL28k/hPdihiPWHIKZq3+
 YOQ=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.90])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Apr 2021 08:49:31 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Anup Patel <anup.patel@wdc.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 1/2] binfmt_flat: allow not offsetting data start
Date: Thu,  8 Apr 2021 00:49:23 +0900
Message-Id: <20210407154924.1557489-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210407154924.1557489-1-damien.lemoal@wdc.com>
References: <20210407154924.1557489-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_164937_292134_1FE33558 
X-CRM114-Status: GOOD (  19.76  )
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

To allow an architecture to request contiguous text and data sections,
introduce the config option CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP.
Using this new option, the macro DATA_GAP_WORDS is conditionally
defined in binfmt_flat.c to MAX_SHARED_LIBS for architectures
tolerating the text-to-data gap (CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP
disabled case) and to 0 when CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP is
enabled. DATA_GAP_WORDS is used in load_flat_file() to calculate the
data section length and start position.

An architecture enabling CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP also
prevents the use of the separate text/data load case (when the flat file
header flags FLAT_FLAG_RAM and FLAT_FLAG_GZIP are not set with NOMMU
kernels) and forces the use of a single RAM region for loading
(equivalent to FLAT_FLAG_RAM being set).

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 fs/Kconfig.binfmt |  3 +++
 fs/binfmt_flat.c  | 21 +++++++++++++++------
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
index c6f1c8c1934e..c6df931d5d45 100644
--- a/fs/Kconfig.binfmt
+++ b/fs/Kconfig.binfmt
@@ -112,6 +112,9 @@ config BINFMT_FLAT_ARGVP_ENVP_ON_STACK
 config BINFMT_FLAT_OLD_ALWAYS_RAM
 	bool
 
+config BINFMT_FLAT_NO_TEXT_DATA_GAP
+	bool
+
 config BINFMT_FLAT_OLD
 	bool "Enable support for very old legacy flat binaries"
 	depends on BINFMT_FLAT
diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index b9c658e0548e..2be29bb964b8 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -74,6 +74,12 @@
 #define	MAX_SHARED_LIBS			(1)
 #endif
 
+#ifdef CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP
+#define DATA_GAP_WORDS			(0)
+#else
+#define DATA_GAP_WORDS			(MAX_SHARED_LIBS)
+#endif
+
 struct lib_info {
 	struct {
 		unsigned long start_code;		/* Start of text segment */
@@ -559,7 +565,10 @@ static int load_flat_file(struct linux_binprm *bprm,
 	 * case,  and then the fully copied to RAM case which lumps
 	 * it all together.
 	 */
-	if (!IS_ENABLED(CONFIG_MMU) && !(flags & (FLAT_FLAG_RAM|FLAT_FLAG_GZIP))) {
+	if (!IS_ENABLED(CONFIG_MMU) &&
+	    !IS_ENABLED(CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP) &&
+	    !(flags & (FLAT_FLAG_RAM|FLAT_FLAG_GZIP))) {
+
 		/*
 		 * this should give us a ROM ptr,  but if it doesn't we don't
 		 * really care
@@ -576,7 +585,7 @@ static int load_flat_file(struct linux_binprm *bprm,
 			goto err;
 		}
 
-		len = data_len + extra + MAX_SHARED_LIBS * sizeof(unsigned long);
+		len = data_len + extra + DATA_GAP_WORDS * sizeof(unsigned long);
 		len = PAGE_ALIGN(len);
 		realdatastart = vm_mmap(NULL, 0, len,
 			PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE, 0);
@@ -591,7 +600,7 @@ static int load_flat_file(struct linux_binprm *bprm,
 			goto err;
 		}
 		datapos = ALIGN(realdatastart +
-				MAX_SHARED_LIBS * sizeof(unsigned long),
+				DATA_GAP_WORDS * sizeof(unsigned long),
 				FLAT_DATA_ALIGN);
 
 		pr_debug("Allocated data+bss+stack (%u bytes): %lx\n",
@@ -622,7 +631,7 @@ static int load_flat_file(struct linux_binprm *bprm,
 		memp_size = len;
 	} else {
 
-		len = text_len + data_len + extra + MAX_SHARED_LIBS * sizeof(u32);
+		len = text_len + data_len + extra + DATA_GAP_WORDS * sizeof(u32);
 		len = PAGE_ALIGN(len);
 		textpos = vm_mmap(NULL, 0, len,
 			PROT_READ | PROT_EXEC | PROT_WRITE, MAP_PRIVATE, 0);
@@ -638,7 +647,7 @@ static int load_flat_file(struct linux_binprm *bprm,
 
 		realdatastart = textpos + ntohl(hdr->data_start);
 		datapos = ALIGN(realdatastart +
-				MAX_SHARED_LIBS * sizeof(u32),
+				DATA_GAP_WORDS * sizeof(u32),
 				FLAT_DATA_ALIGN);
 
 		reloc = (__be32 __user *)
@@ -714,7 +723,7 @@ static int load_flat_file(struct linux_binprm *bprm,
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
