Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C085C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 04:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RNfHB3lnGeDc+Uc4S8hFq4VzLyDRQka5WXdTgqf7M1c=; b=AXnULGUH3nJtJ3
	/AvUKuUiA9k2CK5fQccOsCMNGjRR5Lc++R/VHBpLvIsnTnI6mRu3Z+uhujlq9dmlX0hy435JMSksY
	4NqiMAb8B6PyoiaR/cAAAglJPaBeAstdR3IsQBme2k7I5RDf4EtiNOq75my/PMs4hXCkuwIgfxo+V
	U+qHkmAxAQv2EU9eQ37YWLa9Az9s4WFPaPpWUOI2GRm6Lrq9McE1IiyxpENJCcqdzTLwfC5XnmJv5
	wHVAu0+8qaRs15oAI/Xbj4S3ovl+nC3+xz8IzzGBcc8h29jjpY3hwagk3cQe8WRwWG8+H8x8SkuOE
	Zlrh5bY2+EMElrgxLwBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phNtT-00GcLu-2y;
	Wed, 29 Mar 2023 04:58:43 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phNtR-00GcL3-0f
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 04:58:42 +0000
Received: by mail-wr1-x42e.google.com with SMTP id v1so14339658wrv.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 21:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680065919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSs9kTLEr3gcw2nAKoZU9JNtCpmjcd0KenqM1ZfQgo4=;
        b=lO1y4yq1PwBxe+8AJb6u6BDoMPFaCMy/BL0GvwPGmyd2EIze0IcibTOK/QPflRVmnA
         hFY/Ukba0Dp3YB+iOiOOfTTbrDUDqxk57w8qLlZaBwAVPw6orKn+jDfJTUabT0vjO0Gs
         MfPreJqaqCjbjpaep9XRh3Fz1bImQeDyizQ6Au5kaxkj2sVzhTrc2F4yTwlM9Y6JNti6
         3AGBBA0b/J0E8pFGlRtm4995Qb3cbWvFO5oIp26KsHCaNh2+toBq9Ct/1yIrbic4HaBy
         WkA3LLbqfJ8UkkYCF0H5KXjY5f/NBPGG0LChQRG7/6oYxj54WKXo7p7eTNs+mi7QSLNx
         xG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680065919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSs9kTLEr3gcw2nAKoZU9JNtCpmjcd0KenqM1ZfQgo4=;
        b=aPBg8PlvvKw4/jZq/7eOkBhNS6XLE42Ueo/GoLsLsR5CNYBQuTi146jZr6jpCOhRmm
         lshtkZnpgFiL+cEwIy5sD1AMQA8Sed21O3dkijKu+8XH6R076NISrwd7ZhlA7PccqeUD
         eHVY7sRnoMvzCOcaIAS9s0w5u1RQjQrF0DMMldqRxoLdWF4U4ElX85oNqRdNIvruIWZk
         jnk5YJHRamqLhdfHJg9Bu8Bg9/kUvlxamnW8X4zNHQcqOc3kgqNpI2v78vTPQ4synQta
         fzAPZjBlE6qa3KEDPomShgUyfeluaavu27igWPPOThZMNtd3QMF3UQBndYCRfYs/3qKx
         ieqg==
X-Gm-Message-State: AAQBX9fA+kOAwPzMvuEFQJUmD9DNZZZ96fyZW4nCL4wKKRVvwwJFo+VX
	ukm9o8pcb548bgz45gVw7WQZvw==
X-Google-Smtp-Source: AKy350Z51j1bBKrXk97y5JX1wSgTTowVMS1BaZOjNaHlHomGdJnrKLmbOfwk1rsbLBsYnb7mc20NEQ==
X-Received: by 2002:adf:eace:0:b0:2cf:e3d0:2a43 with SMTP id o14-20020adfeace000000b002cfe3d02a43mr16161943wrn.4.1680065919124;
        Tue, 28 Mar 2023 21:58:39 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p12-20020a5d48cc000000b002d431f61b18sm27284287wrs.103.2023.03.28.21.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 21:58:38 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v9 5/6] riscv: Check relocations at compile time
Date: Wed, 29 Mar 2023 06:53:28 +0200
Message-Id: <20230329045329.64565-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
References: <20230329045329.64565-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_215841_242558_2651E888 
X-CRM114-Status: GOOD (  14.45  )
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
index 000000000000..d5de8d520d3e
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
+include $(srctree)/scripts/Kbuild.include
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
