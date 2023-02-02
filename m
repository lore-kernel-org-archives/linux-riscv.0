Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EAEC636D3
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 23:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X2GJXizQz86RYnvk7raxhPfgTevEraN3R92gxO23s6E=; b=wf0Uy1hLIlbSjz
	4ub/1+5xNabe/jq6BStMJw7Wu2NLaFm/xxvkKxtduYT3/X4xLcokSbxC6wy+elxqlz39GjMWCfsjw
	qSTu42h9q6rVlh+PRGoBNXvtrZg6WN/8Sr/nDNaN/wvwj7mA+wFesXrSwxf6QUI/CmzM7EbTOTolB
	VyJe4UebQIqhr6cckk2H55xm4Mt9Sq0L4i/dHIwJDlwTy9O7n5WdsA7Ne7t4yTTrZkpbXY4QQxvZP
	F+2sIyaMpECG7+rcAvoa608fBoNoOBBVv1FJaw3WaZWygabHtqhIQaNhMdd1A16W3w35o1Ex6OudB
	EaA792BWVP/UChSV2Xgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjAM-00HPz4-OE; Thu, 02 Feb 2023 23:38:54 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjAJ-00HPyO-Ej
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 23:38:53 +0000
Received: by mail-pj1-x102c.google.com with SMTP id o16-20020a17090ad25000b00230759a8c06so402705pjw.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 15:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=iU0fNYb0bFVTITpgmxclCoyEFt6RwuwvQQG9yk35z1U=;
        b=IxzbN76vJWRIjh6ZigarfTZpwKEe5CHl4z93UGSdqyGsu6maKPcNnlitc8FO9aI8uu
         h97+Hbz+9sOltcFKraxlQGwbzeHV/78z3ilKQIxjG3hA6FWSOJQ2LHrlYmAnIMyL11+Z
         s56/Ficgb29Gp2ztiW9fwFojdatuluJlL4ci9O/+YKU03rgIW4/9KFeJbgePDtyccbQU
         SrHaKvITaFBlkTN6awdz10qtO31veI3Sc6bQ57M8bxiB3iClOqo+lTfIpYjehrjj1ULg
         i6PBE3VvtIUoKu+4hsAoVxtAEUInRIp2fNkGxI+M9qN7OPZvpEr8u3AHrMQiMfTBBt7l
         0VFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iU0fNYb0bFVTITpgmxclCoyEFt6RwuwvQQG9yk35z1U=;
        b=tUC993MCi7JdvyFcQI8xYj3yP7kquJqsHdEN/0wUuYB3IDKZNgt0d6fk5lH+TN8Gsw
         iM0N1/0q5JWgB0HCdojpNtI/OGODMsCRW7kcxIIbwPCNMOOkIvcM0yk0ACGLzdyoySH3
         Y+CLl7ZnHum/V05enxJiDsigEWFlA/dtMA720ZkeKzmsmnVosRpExydRcDveAGekQcN0
         Nnu6hOuoSwqAVjBvv+1v1USifpumM78882X2tlojnW4Jwjt0DAX1TP5vHcWefxL9/lVq
         bgZbq9sutQ7f6yWvNJaQUQ7gM+r+eJCcDqamYKWgb9wOrjGyjtJ1ZopWkMJ44Qzed3oJ
         ixtQ==
X-Gm-Message-State: AO0yUKU0dFaiihKmLyloT0YtKaj5XvwLmChjIGaMnVTaCoeaH7O8W6kJ
	7MbfjEV+HB7ihuxY2mwbHC0anMxIbmYPLvNo
X-Google-Smtp-Source: AK7set9cnulMzBN2gSKmprVDK33cDaDUFGYWFQY6jh07rSHL9snAqe3SwM85pi8VBU24mBw7UyeB5w==
X-Received: by 2002:a05:6a20:3109:b0:be:9893:fd61 with SMTP id 9-20020a056a20310900b000be9893fd61mr7960394pzf.28.1675381125112;
        Thu, 02 Feb 2023 15:38:45 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id a16-20020a056a000c9000b00592d16e9a12sm237860pfv.135.2023.02.02.15.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 15:38:44 -0800 (PST)
Subject: [PATCH] RISC-V: Only provide the single-letter extensions in HWCAP
Date: Thu,  2 Feb 2023 15:38:32 -0800
Message-Id: <20230202233832.11036-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_153851_717664_56608027 
X-CRM114-Status: GOOD (  14.42  )
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

The recent refactoring led to us leaking some HWCAP bits to userspace
that didn't make much sense.  With any luck we'll have a better scheme
soon, but for now just mask off those bits to avoid polluting userspace.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/elf.h   | 10 ++++++----
 arch/riscv/include/asm/hwcap.h |  8 --------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index e7acffdf21d2..30e7d2455960 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -14,6 +14,7 @@
 #include <asm/auxvec.h>
 #include <asm/byteorder.h>
 #include <asm/cacheinfo.h>
+#include <asm/hwcap.h>
 
 /*
  * These are used to set parameters in the core dumps.
@@ -59,12 +60,13 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
 #define STACK_RND_MASK		(0x3ffff >> (PAGE_SHIFT - 12))
 #endif
 #endif
+
 /*
- * This yields a mask that user programs can use to figure out what
- * instruction set this CPU supports.  This could be done in user space,
- * but it's not easy, and we've already done it here.
+ * Provides information on the availiable set of ISA extensions to userspace,
+ * via a bitmap that coorespends to each single-letter ISA extension.  This is
+ * essentially defunct, but will remain for compatibility with userspace.
  */
-#define ELF_HWCAP	(elf_hwcap)
+#define ELF_HWCAP	(elf_hwcap & ((1UL << RISCV_ISA_EXT_BASE) - 1))
 extern unsigned long elf_hwcap;
 
 /*
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index ee9c80fe0062..831bebacb7fb 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -52,18 +52,10 @@
 
 #include <linux/jump_label.h>
 
-/*
- * This yields a mask that user programs can use to figure out what
- * instruction set this cpu supports.
- */
-#define ELF_HWCAP		(elf_hwcap)
-
 enum {
 	CAP_HWCAP = 1,
 };
 
-extern unsigned long elf_hwcap;
-
 struct riscv_isa_ext_data {
 	/* Name of the extension displayed to userspace via /proc/cpuinfo */
 	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
