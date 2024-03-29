Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDE1CD1288
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 08:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5EXxQKH955yOAGl5ITHokCUpXVE1vhHbLYw04DL2X0=; b=O2PjRx7yQocwww
	K3/t2ZXGBhKfl7QOrVAEuaxGZQ/tGq58B065GkeYYVvLEFbT7Dka51TTRrF7cedvH2Dkgky+MqwHU
	QNosPH7ZXobPKydXuVFY2fC7tYICAc+14AhrVVtQ8bZ+n3bqE1p7TvN/eo73IbI+Zn7Yh9sQfLqRI
	6eToI3LrAuX9ahpywUiEd+HC0SJNftAG4EU3++byy8SFx+8PBduL+HbVDB5nQQMTnCgF00yyh5waw
	wIrOMhMgD9mx4wNg1u2QESlOx7FlYTVqxRqESUpicCtStJxrN7+Ksh3mTM3kw18hJ/L2CLU0xNMdq
	E426wUwZnMGnPPcbw4SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq7gf-0000000HKcf-2NjQ;
	Fri, 29 Mar 2024 08:34:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bj-0000000H8e9-0oKY
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 07:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=F18yE3QV4MW8RCzD1e25jw8k09/j20Bb+PnplrzhdA4=; b=WJe+UgjFUuiIToPVsZKBothm+7
	MyqSy1d8Dcmsr4vA2fkZA4fNs/qKk6yyB+FsD9Cz+unZrmtKXwuMN0U/vsnADA7goAXVW5BHGzP0B
	cE8E47zW6hlBmG3XTsjLwbmhE5ugg/O8QsIXxKT7dBbWPs+pY5k+CMCh5aUJJeE56vIABDp/JHtKv
	SeI86YYJ6epX6bnrl/S4SSBnhqooNcL2WCZ8KcB85CpJOspIwIAzGT9o0ZJqjQ3AMwLJP2buFYZ4Z
	X7E2/tW9b4R8WjKy+z3KgzdMxWLDA7snKHSY8fnaVIKJ8Thwf/rpmKBVgD030Um5zSyUyH7IkdQBU
	Y4+19ZZQ==;
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6be-00000001QqN-19ms
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 07:24:57 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5d3912c9a83so1029772a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 00:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697092; x=1712301892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F18yE3QV4MW8RCzD1e25jw8k09/j20Bb+PnplrzhdA4=;
        b=Cj0KXSlw+sd4e2g0lmtQtL12wgmcoGQFIpUtognY/FeJDsuevRfGodaiqSo7H5n3VG
         g9vh23pixD75i+mOybqGWu0TGAYxR81w5vHkb5ZE4rtu72Rf8zoXOKQmc1EMMfcpO7WJ
         zu3ijwSA+gLmlvqmc/R3lbolrxm+HvDT8zdcLeAZjrxz+xFiBUA7DMdX+x50psrp+L00
         mKbvns+SGQErZ4IJj/ixp3KC1w8z9VDok1PYvyKzPCEiUZlmqicMmCz8T06zTVARyPig
         hPoItwLHivHFSFzqgX6CBFLILoWHVFg29NOmQDuHJKjlXRwdpP08J4BV/HzNICmDc7hM
         LADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697092; x=1712301892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F18yE3QV4MW8RCzD1e25jw8k09/j20Bb+PnplrzhdA4=;
        b=V2vUoQtP3bAXrM4TxxM4pvHzAJEqUTk94SNtQUD/Yz97d4DnMkKXp/vA8SmPB6BMKs
         6mQamtRSMYCoqIxRwn6/kSNOSgfneY8BhGLBOqC0wCOI54UUMoI+bS7Jh6YAkchra97l
         DgEzZ2lSnILoGXMLiHKYAb/9pLE+vfplD8wdhbcCDhcpbkm8hPYomLFv6SP+XuY0Fuhb
         0SuvfTZezlyRrvutyvek1RKLWmoYJOXQLKE6WXGfPmYSQaFdHNAMq7TaeylyyfeJZ8ut
         2dpd1vYaHUMMq7BytL+xUSHSYke0PqVP8+cNm/cqvQ0EE4koc9x2zxWvh8bXhmnBDe3q
         5SsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmhiiWoN6PAruWHS/felHXPYcvF3HhycDmkszA7z2+8Y4CezVgskakwzsmE8pAMs2fdUBL505duJt8c9XWR4hYQfEK73QMwZtWWz0a5eig
X-Gm-Message-State: AOJu0YwJxsylggNYpnD67e8Ap/Um/eoljmAAN4wEQMntVh1TWMsphYWy
	Lh8KgJv3SfxmY6pCPtnz9LpJuvtwqw3aezDRJ2+m3mQRi80Tumnz16od7TnheEM=
X-Google-Smtp-Source: AGHT+IFY/yzEzRZYFdEySbj/sKHZJd/DWAHR82okZCfCkYYQ9Rz+9YBmaRZXyDE1LpyvvN0Ey140hg==
X-Received: by 2002:a17:90a:fe85:b0:29f:ea48:25dd with SMTP id co5-20020a17090afe8500b0029fea4825ddmr1492025pjb.33.1711697092415;
        Fri, 29 Mar 2024 00:24:52 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:52 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>,
	WANG Xuerui <git@xen0n.name>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH v4 07/15] LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Fri, 29 Mar 2024 00:18:22 -0700
Message-ID: <20240329072441.591471-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_072454_502337_E9061357 
X-CRM114-Status: GOOD (  12.07  )
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

LoongArch already provides kernel_fpu_begin() and kernel_fpu_end() in
asm/fpu.h, so it only needs to add kernel_fpu_available() and export
the CFLAGS adjustments.

Acked-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v3)

Changes in v3:
 - Rebase on v6.9-rc1

 arch/loongarch/Kconfig           | 1 +
 arch/loongarch/Makefile          | 5 ++++-
 arch/loongarch/include/asm/fpu.h | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index a5f300ec6f28..2266c6c41c38 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -18,6 +18,7 @@ config LOONGARCH
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT if CPU_HAS_FPU
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_SPECIAL
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index df6caf79537a..efb5440a43ec 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -26,6 +26,9 @@ endif
 32bit-emul		= elf32loongarch
 64bit-emul		= elf64loongarch
 
+CC_FLAGS_FPU		:= -mfpu=64
+CC_FLAGS_NO_FPU		:= -msoft-float
+
 ifdef CONFIG_UNWINDER_ORC
 orc_hash_h := arch/$(SRCARCH)/include/generated/asm/orc_hash.h
 orc_hash_sh := $(srctree)/scripts/orc_hash.sh
@@ -59,7 +62,7 @@ ld-emul			= $(64bit-emul)
 cflags-y		+= -mabi=lp64s
 endif
 
-cflags-y			+= -pipe -msoft-float
+cflags-y			+= -pipe $(CC_FLAGS_NO_FPU)
 LDFLAGS_vmlinux			+= -static -n -nostdlib
 
 # When the assembler supports explicit relocation hint, we must use it.
diff --git a/arch/loongarch/include/asm/fpu.h b/arch/loongarch/include/asm/fpu.h
index c2d8962fda00..3177674228f8 100644
--- a/arch/loongarch/include/asm/fpu.h
+++ b/arch/loongarch/include/asm/fpu.h
@@ -21,6 +21,7 @@
 
 struct sigcontext;
 
+#define kernel_fpu_available() cpu_has_fpu
 extern void kernel_fpu_begin(void);
 extern void kernel_fpu_end(void);
 
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
