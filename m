Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16124C636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 14:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZHamTLdFIHVzs9jwrw3j239LpVvTWLLjNU9GaRDlmk=; b=nCBC7AElHqvNkD
	xnIZHATxfSrJoQBqbcogTqKeKL0rPUZVAFKe/3spi0Ubw1fzD9bu2nSWJQpI63D0yuIJlpvwFmcYi
	YB0mr8Tu+bFLp8e+mb8m8fugxEr9DD3UHVi5ytKWcB285QWWjjh7z3CqgbgHbaMiq/5UaudC7sqTx
	P6aY9YJnpuok3CK+eiaq9poyy1GOdSEhpdoQT71uTlliy7ppB/AQ2qIrDesZpAMCMTqGHDn8IUG39
	vB6823uGePQ6cZx6OWSPeHlgTPE7+E8ICAMnOkBKErTiRU0a7ExSZT9SzRyQzv3lT9JIjmcvUE67J
	2L0sNAyeJG898OKBWCAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSIwb-006Eer-B1; Wed, 15 Feb 2023 14:39:37 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSIwZ-006Ee3-BQ
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 14:39:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so1694350wmb.5
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 06:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yD/6wakyPf7JrmKHeHtinmHp6mBb9XsJjFS0GkJ6tz4=;
        b=BoSoAYbYFg8HdU2SNacDnaS+5CeQ0e207z74mrcLON9XyOg4vOWlNvHSHENHSz6AHS
         TXXPV6YKRrjTygMWgAH5NAsMBs8jkRVcXI6LfigB0xE0u5MZLmp8EkO8SHcrxWNVbu62
         dEn0JC0XCdThk6U+d9TbDA3VVwA2VC8IF6aM3dZElzHEGco7QFsuWyZ8ThCN/o0HWANB
         GpxRp3dCWcclSGpQlFOFRJ+0J1C17mGXIcCg06XWlyBsAgbWwbBTPlVe7R4fVdvNvWKd
         MPEmsaEiQRIQsIAsvMV3MeR3AIj3b88dHNxbEMFeSa1zGoYf4RYZYNcrFcougFJQPhtd
         atYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yD/6wakyPf7JrmKHeHtinmHp6mBb9XsJjFS0GkJ6tz4=;
        b=quuu5PnSHF4IgwtF61oqV3D4S8UOkL/sTASbC/6xjbERZohtikLN/wLU+sP8CALM5T
         kFOAAV5Ve0b2MF8EJAlis08igNRC5x3wmA3TGKYYs3PaV63U0PPuG5CgFiu2PxuDvL5L
         sVxsIPQhQTjegBeaxcIQt4m+qmH4PV6mUKgAn6sbtKOsHpGnUht7oN3UvXlmg7kyWKTz
         E8eu6ZUYY9qnU6N8tDxPJxGeE2b9F+TOAiDvdVulE6ha/kBKZ1hTYvdfQvcCHLhVLHem
         fpK9VJmqz9C2NZGqvYCGVg78vW66GQFWPMd83n2rJL3GltyK9eFI4Qg+IvqTnoIwlK5K
         HX7A==
X-Gm-Message-State: AO0yUKUgiKHQBrDl6061DopFX0fWBp0fjcOiI+RXkElEZJs0LquFI0sJ
	JInh8ZhgNPSliIeiK17+yb8C7A==
X-Google-Smtp-Source: AK7set8Tp8vvWaWc0e+MxOiR5cvSLBCg2Fe806RP1RqrzlGlekyMApRlk8+hhjLVM/Hil8sEckbm+Q==
X-Received: by 2002:a05:600c:2e89:b0:3e0:6c4:6a38 with SMTP id p9-20020a05600c2e8900b003e006c46a38mr2284134wmn.33.1676471971627;
        Wed, 15 Feb 2023 06:39:31 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id h8-20020a1ccc08000000b003e1202744f2sm2423115wmb.31.2023.02.15.06.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 06:39:31 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v8 3/3] riscv: Check relocations at compile time
Date: Wed, 15 Feb 2023 15:36:26 +0100
Message-Id: <20230215143626.453491-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230215143626.453491-1-alexghiti@rivosinc.com>
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_063935_415649_3731F4ED 
X-CRM114-Status: GOOD (  14.32  )
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

From: Alexandre Ghiti <alex@ghiti.fr>

Relocating kernel at runtime is done very early in the boot process, so
it is not convenient to check for relocations there and react in case a
relocation was not expected.

There exists a script in scripts/ that extracts the relocations from
vmlinux that is then used at postlink to check the relocations.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/Makefile.postlink     | 36 ++++++++++++++++++++++++++++++++
 arch/riscv/tools/relocs_check.sh | 26 +++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 arch/riscv/Makefile.postlink
 create mode 100755 arch/riscv/tools/relocs_check.sh

diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
new file mode 100644
index 000000000000..bf2b2bca1845
--- /dev/null
+++ b/arch/riscv/Makefile.postlink
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0
+# ===========================================================================
+# Post-link riscv pass
+# ===========================================================================
+#
+# Check that vmlinux relocations look sane
+
+PHONY := __archpost
+__archpost:
+
+-include include/config/auto.conf
+include scripts/Kbuild.include
+
+quiet_cmd_relocs_check = CHKREL  $@
+cmd_relocs_check = 							\
+	$(CONFIG_SHELL) $(srctree)/arch/riscv/tools/relocs_check.sh "$(OBJDUMP)" "$(NM)" "$@"
+
+# `@true` prevents complaint when there is nothing to be done
+
+vmlinux: FORCE
+	@true
+ifdef CONFIG_RELOCATABLE
+	$(call if_changed,relocs_check)
+endif
+
+%.ko: FORCE
+	@true
+
+clean:
+	@true
+
+PHONY += FORCE clean
+
+FORCE:
+
+.PHONY: $(PHONY)
diff --git a/arch/riscv/tools/relocs_check.sh b/arch/riscv/tools/relocs_check.sh
new file mode 100755
index 000000000000..baeb2e7b2290
--- /dev/null
+++ b/arch/riscv/tools/relocs_check.sh
@@ -0,0 +1,26 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Based on powerpc relocs_check.sh
+
+# This script checks the relocations of a vmlinux for "suspicious"
+# relocations.
+
+if [ $# -lt 3 ]; then
+        echo "$0 [path to objdump] [path to nm] [path to vmlinux]" 1>&2
+        exit 1
+fi
+
+bad_relocs=$(
+${srctree}/scripts/relocs_check.sh "$@" |
+	# These relocations are okay
+	#	R_RISCV_RELATIVE
+	grep -F -w -v 'R_RISCV_RELATIVE'
+)
+
+if [ -z "$bad_relocs" ]; then
+	exit 0
+fi
+
+num_bad=$(echo "$bad_relocs" | wc -l)
+echo "WARNING: $num_bad bad relocations"
+echo "$bad_relocs"
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
