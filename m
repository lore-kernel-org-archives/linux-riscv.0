Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBE9C6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 18:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vd95Do8Qu6/Rk/f+CnOrH/Ztk2joOCyoH7sihroM7oA=; b=eJcMiZRKFM/wYp
	66LNMzeKzoWG9SFM4tWvs5hw+SGBvMW6qjWX6Dpz9vaL04puWS7x1Epl4WLDrlI8GaM8V7XvXoPs6
	4kPHMGjMzZ9LPEshAlOItsv8JbJuvmxzyvbTulgp7Iby/pqEtBU6itCW9GvC6qvZVQJLzrwA0zo/W
	AjnON+Gd4/V7RooHLDnZonjpdWYwg66jKp8ptOnKSffCuYg+YD0GdAuAuC4wpRJ7nlrXaerYC167z
	lXRg4Ra1AO/cc+IsCiOmfhW8fPIlPKUyl0JWlZeOdJzOYkyywbSjDeIuNJ/pvlSMoQTyPkuVuKy27
	PpwjHLs4/UQZ5hSsqFow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgr8r-00Byaf-04;
	Mon, 27 Mar 2023 18:00:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq3I-00BlL8-2b
	for linux-riscv@bombadil.infradead.org;
	Mon, 27 Mar 2023 16:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=N6sthDjw4vtxdvhOKIkR5X0eOJXk5+GMCZ4mTQ3uH3I=; b=Jkt02B122N/6GozXqjIu0+FIF1
	4gOCSu5VHhRXYrb+aj8n3OGhX6JmZhNm/MkaJdtqz6flvYnMPjJkrEL7+xGXYZZwnu5NhixuKfi8E
	KhJtVCSsz/QLx6AKCgIiVv/UreTDHKnVui6XaKEAcrZRYqRsos3iK2i7JefpALChX5HswReNj/NzP
	Nv8JatjpVdzAY4fgOJkylEuqTcc9c6oF7hFnFOQIE6OoWmhbb/UoUCrB+qMwKeiocY6cge1Gb+tMG
	qg6LQUDvuEhoam45fiNFdnkxN/1s8VP1+BL0WCL0f9vRDtspDwmSeqkU9MrrWp5fmL8uHY72l0e2T
	8qPbpqVQ==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq3F-006EPk-19
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:50:35 +0000
Received: by mail-pl1-x632.google.com with SMTP id ix20so9019751plb.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679935828;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N6sthDjw4vtxdvhOKIkR5X0eOJXk5+GMCZ4mTQ3uH3I=;
        b=hyfL3p5Zx4BC1YGV46tkxRRFY1JI4uKQXaB6Sj1JY3obGwCHKHGSaVzHl8qpQDk6hJ
         txcpi/4v9Bpj1bq/KCjgl2VjwXyixOEXfi6EdbysJovJNuO6Cy3ssWnp03yrYG8se3jl
         9uu3/OknqS3LVqDYU1ZyI+GjwjUjdCnxkzvfvzzB3tjEn2SCazpnuwfWmLOTbLpDkEiM
         0R9ozqEPnZICWywp/lvIHghpT/1kxr9cOTYpgmULsUmI0IjUhRECeBSrJNscz4LQdbNA
         g7yRccRUV+00apCH/Pjvrt/+VJBbKMPrx/vlN5Dv1clBY1r8o1iZKrBVZEN6YUBa/BM4
         Iz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935828;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6sthDjw4vtxdvhOKIkR5X0eOJXk5+GMCZ4mTQ3uH3I=;
        b=bviOmJX2Tq+MWnLIW97R2X2x0nQL96Oji8S/g+bXCAIbdR04yYfBCWwkQ9cUOOfQ3g
         bmNUx20RV4BFTsGPSgsewq00U1k9FNCdxKpJG9IdHJI2tY4CORAYfgZqOwyAEmfYn+hz
         AcTcajb51uN8OwbDw6Ll02t7iZvHRuC9PTyjcTxtem52FWpDPJtdcVyytA8Nuj1CrAnD
         8UiNUZjc3F6qINm5Totc4P/u3TOQkLy63yjzCgqRTnGO5chcPAb117xKYaxnGuDbAaLi
         s/onuxHVvw8w0T/EymxCdIxoFyTSSIuapgI+6a6xwhEQ3MPsqtFGCvGQ6RrLoDEVLuOx
         oHcA==
X-Gm-Message-State: AO0yUKURS5Vaii3uAB2REudJIgxtkuCuXOEie92SjICf6alw8wgUC2vd
	qJp+/aTBd8ahMNLxwTJ1MNMrBRlvZFNfJcxQzetWagaeeE05AhF7j/DJv6dnnxefNcLaLqUtTmF
	o7rEm+YjxalyUjYJA6CRCpRRdABeOZdxv/6wE8zUPFHhD0ss3/6gmA24rmET8T/y2By6moRJoaq
	cJybiPYiqMc4oB
X-Google-Smtp-Source: AK7set+HTiH3bTe7e73jKAH2xQz5pm4TlSvwviQzdS0shICWtkwJECuVyMeWQarDFMOXapXsK8LtYw==
X-Received: by 2002:a05:6a20:a82a:b0:db:1b41:704 with SMTP id cb42-20020a056a20a82a00b000db1b410704mr10369163pzb.16.1679935828496;
        Mon, 27 Mar 2023 09:50:28 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm19310550pfh.22.2023.03.27.09.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:50:27 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH -next v17 07/20] riscv: Introduce riscv_v_vsize to record size of Vector context
Date: Mon, 27 Mar 2023 16:49:27 +0000
Message-Id: <20230327164941.20491-8-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230327164941.20491-1-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_175033_553011_1B120497 
X-CRM114-Status: GOOD (  16.23  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

This patch is used to detect the size of CPU vector registers and use
riscv_v_vsize to save the size of all the vector registers. It assumes all
harts has the same capabilities in a SMP system.

Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/vector.h |  5 +++++
 arch/riscv/kernel/Makefile      |  1 +
 arch/riscv/kernel/cpufeature.c  |  2 ++
 arch/riscv/kernel/vector.c      | 20 ++++++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 arch/riscv/kernel/vector.c

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index dfe5a321b2b4..e433ba3cd4da 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -13,6 +13,9 @@
 #include <asm/hwcap.h>
 #include <asm/csr.h>
 
+extern unsigned long riscv_v_vsize;
+void riscv_v_setup_vsize(void);
+
 static __always_inline bool has_vector(void)
 {
 	return riscv_has_extension_likely(RISCV_ISA_EXT_v);
@@ -31,6 +34,8 @@ static __always_inline void riscv_v_disable(void)
 #else /* ! CONFIG_RISCV_ISA_V  */
 
 static __always_inline bool has_vector(void) { return false; }
+#define riscv_v_vsize (0)
+#define riscv_v_setup_vsize()			do {} while (0)
 
 #endif /* CONFIG_RISCV_ISA_V */
 
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 392fa6e35d4a..be23a021ec32 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
 
 obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
 obj-$(CONFIG_FPU)		+= fpu.o
+obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_SMP)		+= cpu_ops.o
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 923ca75f2192..267070f3cc9e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -17,6 +17,7 @@
 #include <asm/hwcap.h>
 #include <asm/patch.h>
 #include <asm/processor.h>
+#include <asm/vector.h>
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
@@ -263,6 +264,7 @@ void __init riscv_fill_hwcap(void)
 	}
 
 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+		riscv_v_setup_vsize();
 		/*
 		 * ISA string in device tree might have 'v' flag, but
 		 * CONFIG_RISCV_ISA_V is disabled in kernel.
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
new file mode 100644
index 000000000000..03582e2ade83
--- /dev/null
+++ b/arch/riscv/kernel/vector.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 SiFive
+ * Author: Andy Chiu <andy.chiu@sifive.com>
+ */
+#include <linux/export.h>
+
+#include <asm/vector.h>
+#include <asm/csr.h>
+
+unsigned long riscv_v_vsize __read_mostly;
+EXPORT_SYMBOL_GPL(riscv_v_vsize);
+
+void riscv_v_setup_vsize(void)
+{
+	/* There are 32 vector registers with vlenb length. */
+	riscv_v_enable();
+	riscv_v_vsize = csr_read(CSR_VLENB) * 32;
+	riscv_v_disable();
+}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
