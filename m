Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE440C11F64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 20:06:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 708DD6140D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 20:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 708DD6140D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Gh7DQ63VHrFwLLtRi7+0mwqmdBAtkwMaQd346a7QBWI=; b=KLn
	VghBotKedfKmZfH3F5brMqJpUOyQfrGMdq66nYqvET0LMLQZaAvK1UKRrZ8yYgvimGQzURj7nq8cK
	j13QP/OsQFJ2IDSkP/y3tyK0tUoh4Q6wP9Tor6sTAK2RtePIrxr0BdVQ7LJ4z/MCNja7/mMq5f4KG
	2oyrQAvqGtYQeiuGDanYP2Vr6eWXvlQ3UnKcDmEddiGhid3CupoV9CGWnBlw8aY7CgRmcvXhYaoZh
	vjChrOkbCzdrPNMro1I+/hnzhld39UT2WXWI7ERNdqjNGMesUdvPlLcGV1VPuq1xCsL2YMksKzSQs
	qBBF5VXGnG3pY18y1vabdIQyUGE6fTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz2xA-000ytY-JY; Thu, 01 Jul 2021 20:06:28 +0000
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz2x7-000ysA-4K
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 20:06:26 +0000
Received: by mail-qk1-x749.google.com with SMTP id
 e9-20020a05620a12c9b02903b429a77b4cso4523586qkl.5
 for <linux-riscv@lists.infradead.org>; Thu, 01 Jul 2021 13:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=Zm3VMH16iGKr7rpa1UnB4+yqcdqybw2ZiN/OuZmenR0=;
 b=rjmNK8L6t1QnCy05qXiWRCzBMnT7LO5Qv33Nix7wHo1LC/Yi4OI3FBgZfUFm0azIvF
 uTom4hnh6KdA3gb1DTWnKLbn+k1Al3oTBLWsdB68EdPrZmtyis1WLwTuipHLmaA28NtW
 KmVN4Xox1vJQ/kcuexkboK+83m2bqx/+pLsf8VOPH03Yq4mlNLCJ6cEJR0589xbCV2Pl
 YiGCAdyGirIFi4kl8LuBUyjU14MJy8VWumFfDMhYVXJuJBff88RFpBm02n5uAurIK9Xg
 8DK64WdOAYcaj+s75mfM9/hrabPtwDQxLRYlSdQEiI29eLjlj2UY6czl8sNdfy+ue9TT
 UTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=Zm3VMH16iGKr7rpa1UnB4+yqcdqybw2ZiN/OuZmenR0=;
 b=mWNsmYPjJrkwFSwRfSM1DXhBfwwSCVNQHQY5Ao7xRb0JXzI8xAKKPT0pIV3mHhJCwJ
 9Pe1R6anLifRRFBOfReHXWLlNnGsfdhKLt1ArBuAvQaPPc16Uqih0xsJ1saBGRkymNaw
 cPFQT96o8oZ61PNKE7cZ2UdBmaR08VYihhXa1Ir9EHBE8JnWGD6qKRO+Q/3ocYG47PCr
 1FDC1X5rFA2CNm9+K6P2McvBnmiPU7ENs+BT4CtG3J3fTRMuir9I6dxmGHsqansvaJ7k
 FxO7r8lvU+/np34o+1Jxgoh8JHhIn4EBMxnyw6p97EbBiQNLFvcwLCVxby7yDVrZvQBM
 /fdA==
X-Gm-Message-State: AOAM5333EIv/I2f/LhWc0iwiTeqaSWFC2oaW4G3NnfbWW0rCXI/T37sF
 j57Fto3UjR/WZLVrJMXRblfKHHdtWqr7ZxpXwmeYCDCjOzuVTPi9r2UrG4DU2C8Wekjg8HkuLBZ
 5zeMB89ASCYtWDVR0ec2cKQZXRdPYvnrWmpl5n0w67S4Ip7XkWFVS427fnyfyIBS1yLQD0cTW/7
 b1xCk=
X-Google-Smtp-Source: ABdhPJyRzyYf+smvmr8BOc/VQwHIxtG/UtnR/gtz6WquYYVYLA5f5ltAf6CNYpHP6jsAO4BBQUigZVl2QAEJeQ==
X-Received: from abdulras.c.googlers.com
 ([fda3:e722:ac3:cc00:24:72f4:c0a8:41e1])
 (user=abdulras job=sendgmr) by 2002:a05:6214:76c:: with SMTP id
 f12mr1644705qvz.3.1625169982626; Thu, 01 Jul 2021 13:06:22 -0700 (PDT)
Date: Thu,  1 Jul 2021 20:05:47 +0000
Message-Id: <20210701200547.355742-1-abdulras@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH] riscv: allow building the kernel with medany and lld
From: Saleem Abdulrasool <abdulras@google.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 clang-built-linux@googlegroups.com, Saleem Abdulrasool <abdulras@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_130625_221106_48F3A748 
X-CRM114-Status: GOOD (  16.61  )
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

The current implementation of the `__rt_sigaction` reference computed an
absolute offset relative to the mapped base of the VDSO.  While this can
be handled in the medlow model, the medany model cannot handle this as
it is meant to be position independent.  The current implementation
relied on the BFD linker relaxing the pc-relative relocation into an
absolute relocation as it was a near-zero address allowing it to be
referenced relative to `zero`.  The constant offsets relative to the
image base should be just that - constants.  However, this takes a
slightly more tricky approach of rebasing the address against the text
base (`PAGE_OFFSET`) and then accounting for the image base at runtime
to allow us to compute the VDSO relative address for the stub function.
This allows the symbolic resolution to remain within the range of the
pc-relative relocation, allowing the kernel to build with LLVM/lld.

Thanks to Palmer Dabbelt for his assistance with this!

Signed-off-by: Saleem Abdulrasool <abdulras@google.com>
---
 arch/riscv/include/asm/vdso.h   | 2 +-
 arch/riscv/kernel/vdso/Makefile | 2 +-
 arch/riscv/kernel/vdso/so2s.sh  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
index 1453a2f563bc..1240d3790abf 100644
--- a/arch/riscv/include/asm/vdso.h
+++ b/arch/riscv/include/asm/vdso.h
@@ -26,7 +26,7 @@ struct vdso_data {
 #define VDSO_SYMBOL(base, name)							\
 ({										\
 	extern const char __vdso_##name[];					\
-	(void __user *)((unsigned long)(base) + __vdso_##name);			\
+	(void __user *)((unsigned long)(base) + __vdso_##name - PAGE_OFFSET);	\
 })
 
 asmlinkage long sys_riscv_flush_icache(uintptr_t, uintptr_t, uintptr_t);
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 24d936c147cd..384f1cc8e044 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -68,7 +68,7 @@ quiet_cmd_vdsold = VDSOLD  $@
 # Extracts symbol offsets from the VDSO, converting them into an assembly file
 # that contains the same symbols at the same offsets.
 quiet_cmd_so2s = SO2S    $@
-      cmd_so2s = $(NM) -D $< | $(srctree)/$(src)/so2s.sh > $@
+      cmd_so2s = $(NM) -D $< | $(srctree)/$(src)/so2s.sh $(CONFIG_PAGE_OFFSET) > $@
 
 # install commands for the unstripped file
 quiet_cmd_vdso_install = INSTALL $@
diff --git a/arch/riscv/kernel/vdso/so2s.sh b/arch/riscv/kernel/vdso/so2s.sh
index e64cb6d9440e..9e5afc2fcc07 100755
--- a/arch/riscv/kernel/vdso/so2s.sh
+++ b/arch/riscv/kernel/vdso/so2s.sh
@@ -2,5 +2,5 @@
 # SPDX-License-Identifier: GPL-2.0+
 # Copyright 2020 Palmer Dabbelt <palmerdabbelt@google.com>
 
-sed 's!\([0-9a-f]*\) T \([a-z0-9_]*\)\(@@LINUX_4.15\)*!.global \2\n.set \2,0x\1!' \
+sed 's!\([0-9a-f]*\) T \([a-z0-9_]*\)\(@@LINUX_4.15\)*!.global \2\n.set \2,'${1}'+0x\1!' \
 | grep '^\.'
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
