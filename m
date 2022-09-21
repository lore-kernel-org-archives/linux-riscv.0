Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C80AC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 16:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=baY4sJ0azBfLKFQoZ7SH9gQlD+zXZ0MJjl128nDCbGY=; b=owgj76F5g67qco
	StZ12/Qvrh5Atpppxi2BFy9tQr+2hedbJb7S2tbTzLpnxpnAHNcqChxksqobXYvUkaJxImJL2AGyY
	Y1ZIrBkoJPZKj3t28bsZMI8Lhftrc8fpTiCcWVBYndC0J2CuXoTrnBLdhZSppR7XIqHpBTN59c4xd
	MU+WZ6U6cNObsLytdhZKvuv1QAH+lmLc+UYpvSj2hw/sLTEBuGAx+SPcN6xD81PwH5VeBtWk4tI5s
	jG9/oNJk32nO9GWsJ1hpC9Y8mRstx/00Hu2Dpmo9USCaBQTYpuIYgfHvh2Gb05jR2ROUH+AUPHTcf
	W1J/yNzbZydZzZsgN6KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2t2-00C2dV-40; Wed, 21 Sep 2022 16:47:48 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2sz-00C2bx-QW
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 16:47:47 +0000
Received: by mail-wr1-x42a.google.com with SMTP id t14so10850740wrx.8
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=OQfg0vHlGZAcqp1vCrJ92OrmG/vN4V+b6Jsl+hTmAIg=;
        b=pdGoYuOwx5DRYGSfzFyEKt1SIzRLSlYt0AH/lnNM4mV/nAeBTrPtNki0ju9YvB9Pov
         DvB83tOQJgt6ktyTzTzh7EWL8/1Llk4t+Pw0/737ZQX4kJZoNU2KAFws7BmD+DW+kEh4
         8BU9Yw/mUeHca4reinffWHDSH7QgzBU1D/0glbo7sMQUsPWs7h4e2Dz9WtEAEaM2mX4R
         aJJz+Krd6wW8DUL3KJNdNzGANyaz9U1EoqiTtwhjvO8c2wwWvoMWXR2UwE9bHyomVYj8
         mgf/gg/EL6L1fIwG/qsJi8RYYSK7//zhEBsoui2ItB3kxOW8OZPUfYaYFDjXf2witTMd
         GWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=OQfg0vHlGZAcqp1vCrJ92OrmG/vN4V+b6Jsl+hTmAIg=;
        b=y8UWvgGPK+CnJkJjrNXNbxKFdfYhf9yM9N1J9J7osLJDrjRYzktPIhH3dvEzHXC1OI
         I7bxXwqL7iMZtKwNLVDwz49vD+rpn6d2GLZeIV0mS6bPWDMTsLpMMbuAsdzDgzVE//yV
         Rg8MAO1lA1dKT8TcEmDh5nx3KLiYulkw4uVwKmzFGbpqFmtaFmGMpYNtG5FiIvKJig0E
         6nchHGEKTPpLCNBlW6WVeqwVUt4sdGTCHzsQEMu61LkMOUXDwIt+ygO7UIJRK7fIVgYg
         /NyfeyRQ72ZcCWC9QWGUF31pDkXYJ8lwPWfKPkUov3bGGdckx4cVrHn21o3up/Ovpp4I
         wM2A==
X-Gm-Message-State: ACrzQf03MyTxPac+Tl6/VFjvUJsvvRfVlevWxO8tdOeyZPHc+C4HzS3L
	leow4fBppEWYD33z9EICmMRhntMELHY2WcvusyCGLyFy96IEaA==
X-Google-Smtp-Source: AMsMyM4k1FZ5lHKI9gbfA8Xh+YXoymj5pjr6SD3REsoCNgCjzEpjNlpjR28QJXxV9kzeLeR1TLCDBiQkwS2M+QR07Qo=
X-Received: by 2002:a05:6000:243:b0:226:d241:11e6 with SMTP id
 m3-20020a056000024300b00226d24111e6mr17453615wrz.187.1663778864114; Wed, 21
 Sep 2022 09:47:44 -0700 (PDT)
MIME-Version: 1.0
From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 09:47:08 -0700
Message-ID: <CAM2SziULUhiERdo2m8jSHu7jCN9bHXUmvjPO1P_MP1wLrD__Xg@mail.gmail.com>
Subject: [PATCH 04/17] riscv: Add vector feature to compile
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_094745_884649_72F19C01 
X-CRM114-Status: GOOD (  12.08  )
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

This patch adds a new config option which could enable assembler's
vector feature.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/Kconfig  | 15 +++++++++++++--
 arch/riscv/Makefile |  1 +
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ed66c31e4655..e294d85bfb7d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -432,7 +432,17 @@ config FPU

          If you don't know what to do here, say Y.

-endmenu # "Platform type"
+config VECTOR
+       bool "VECTOR support"
+       depends on GCC_VERSION >= 120000 || CLANG_VERSION >= 130000
+       default n
+       help
+         Say N here if you want to disable all vector related procedure
+         in the kernel.
+
+         If you don't know what to do here, say Y.
+
+endmenu

 menu "Kernel features"

@@ -556,6 +566,7 @@ config CMDLINE_EXTEND
          cases where the provided arguments are insufficient and
          you don't want to or cannot modify them.

+
 config CMDLINE_FORCE
        bool "Always use the default kernel command string"
        help
@@ -648,7 +659,7 @@ config XIP_PHYS_ADDR
          be linked for and stored to.  This address is dependent on your
          own flash usage.

-endmenu # "Boot options"
+endmenu

 config BUILTIN_DTB
        bool
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 3fa8ef336822..1ec17f3d6d09 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -50,6 +50,7 @@ riscv-march-$(CONFIG_ARCH_RV32I)      := rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)       := rv64ima
 riscv-march-$(CONFIG_FPU)              := $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)      := $(riscv-march-y)c
+riscv-march-$(CONFIG_VECTOR)           := $(riscv-march-y)v

 # Newer binutils versions default to ISA spec version 20191213 which moves some
 # instructions from the I extension to the Zicsr and Zifencei extensions.
--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
