Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A44CC433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 06:16:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17E5561494
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 06:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17E5561494
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kDGoGnj5aRtFMQ/v7IR92mFgqvqY4sv5CNhfPMirowI=; b=RN1xhgUcixz74JvYXbkHldL7P
	Z3DSdqmGxMzR6cgX1Ujm5AeA7d3oDPERpLvo0qu4AkxIONtaC81e41pgyXdwG1BSSTH/bZenQpFkl
	Ka9yzpu/cHM8VO0goUsI/3BMw+skSJQbKWfP5HFhJ6f4Jzer3jPs4fe4cMxeHYNt6q774BwwfTBFo
	MQiZYiFhnbOnJKrUbQMBIGZSIucOXA8YrC09zU3BDjgL454QKGxYGMiNmVGFXNKNx2Ygrq5Tm2bAx
	iL3x/FddRL6cRkPhW017P0fci2GKoa8jEAPuE024XjA0CbsgrNakXtqTQqFUsyHWA+HVBVkYIZiHx
	qBL8GA9sA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWvI3-00F1yO-Cv; Thu, 15 Apr 2021 06:15:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWvHq-00F1vY-OQ
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 06:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=fEBTJPsLYV2a52C83aCsj7QT/Sjw7dGwhWL0sj08pd8=; b=zTPv7/BPSrO8qMcPcoBkjo/5XS
 6uIE/tjGImyoHIyhOT18+gp4KhJ/8zGsfVCk3PZRB9ccYsdEOgltPNwtyg98z0SXms59C1OiriUjy
 2LbGXCWxs5emWw2Iv7OcqS/0Pr79cOGbtt37tZKo/BGFiKZlJB0tSxrhDHMUELss2/C89XyxPTv/b
 NBiTzLSEze6THYquSY4npKAWT9tlWIAepsjoiLGa2fvP2kVksoelJDkADbZONMBTUhALYmocM5CUb
 ovOyI89YUpNNYeCDX5CmIZSdGYv8yWXm1T5Ya6fQVhVbVhGygoEGq1v8Mgddg3E8RhRLWG8XZaU/F
 v/46xGtQ==;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWvHo-008Iy5-34
 for linux-riscv@lists.infradead.org; Thu, 15 Apr 2021 06:15:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618467332; x=1650003332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=99YqRFeFwdpr17CrSNx90Z9RrdjLX1ZBgCLkO2RczNA=;
 b=Qxzx81nTBrum4gsWEteXTk2uAgSsBxqnd9FOHkWKuLP+LRbLzaz4vn2u
 vm3wAZdxkYrH/kwTCKnGoP5FUkZbiwdDI5QHwR/QvxhpufkOnj195okJm
 AjIYlX/9+IVwq2oz3mTO+p73LRr8RVWAL8eCvaukskm1ps0WwQ9RhaBuL
 ZAoPBGgI7pOecSpsDr+WDFD7EnDC3j+cwgu6L9tGhtPMhCr72Yy9Q0xUo
 hGLnaMCuAtLaTmjX7PjYdEml+DWXeKcDJtUvu3S/JmSkopnafenNeLVfA
 aFmATR3kLG7s8MNN/PKl4ScAq6bTAuMJVJqpOdHgRX1T0rnxvR7FvwVOI Q==;
IronPort-SDR: 9OSpL26VvOE8lDXsk6HzSRPYylTURy5R2Yb60v/gZpHT9Z+SZvf2eVAmDTRb8X+Nqby3AzzECd
 6fcvGOmv8W12U4AFewpGFquSWwbtZKm9hgAq1Isz1OnCu0qqR4Z2ATKDit2KEABZJt+4CmfN1G
 GBcEJOvZpnsjuep24s0uDMvWpGaOPvlANzz/saH/S9QH6Px6XHeCXFk43fYdMtmdv/RgiQQAE0
 lHZZVcfrZDjAbp7quTz1MbfPZbx0/3/zJT2x6Gv/FjT05aeER+Wxcfwqtkzc+nA3BT8K5S9J84
 YPA=
X-IronPort-AV: E=Sophos;i="5.82,223,1613404800"; d="scan'208";a="169391942"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2021 14:15:12 +0800
IronPort-SDR: T1IH14oBI4vPP8EecFpH5tHcwRzBQGHbrf+PQI0fnguJx/9PfuhjTAvEsTUg4Z40MkH7FH/KVN
 +xvlwoNc4dx0KMAteR68ErgG8Kh1pWB91l+2GZ6ZncQB6Ski7MukRfCdYDtJqQSB7Pvat7xKm8
 r+55I+EmxDS+nCcPhW3Zqct5kNb4oBT9wUjJvm76Kt9cmyq4mw26tW7tKWch1kZgt3WmRT3GK9
 vWq5T40XEamFdS/Y0ijuLDUNAH9W0wQPh3+bbAELdQIEDEgtChnmb0n+Jco6U+zgwMpfyslVcF
 fdpOoersRh7gvlxGy/viz91g
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 22:56:09 -0700
IronPort-SDR: ENfL3KYS42ufbWY1UVWeZgsh5THbCn08O/380jE8JNKmNqJ3J5o5DYOWvlbb73BgO1r0T0x4i/
 eD+glBm+9naTQOZzYV+Lg4C9GApCMVycrfJ8r8mojOuv5wLrhc6428ZGUF9erwX7Kb2ROc9xbP
 1f1sukAGDB5sGI8e8q97ShYImlJoySUixATh3nDRR+g4JuWU8NuAZcgXcLLDPG6Xcjyx0Vlz8I
 mKhzXlz/fznfeWm9bVs4cN1PIdMdHOjKDNatoLyiEXNuSk9NgKqMlZsKPzLEaad9s+b0/vT3jE
 C0s=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.118])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Apr 2021 23:15:11 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: uclinux-dev@uclinux.org, ugerg@linux-m68k.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Anup Patel <anup.patel@wdc.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v3 1/2] binfmt_flat: allow not offsetting data start
Date: Thu, 15 Apr 2021 15:15:01 +0900
Message-Id: <20210415061502.7248-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210415061502.7248-1-damien.lemoal@wdc.com>
References: <20210415061502.7248-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_231532_160723_75919CCC 
X-CRM114-Status: GOOD (  19.17  )
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
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
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
