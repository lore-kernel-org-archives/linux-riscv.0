Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7816C77B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 17:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lwcx7N9I5Z5lkqCbbrYzKnWLE26Ub7oM0i02O1kz0Fg=; b=nYdlqJZaCXg39j
	JB/1f1ddVSmVsojLGQ15qbFQtJ/XoRgQFZYyZn59uoHKSgyYYEMIIjrxsbKz+wa0sSmv6mYD94L2z
	j3TlLWl/7K1VdQJovNF1nGy3gloaSqdneCsoabAg+mqRrWc+L2ikvmcA9Le411yyQ8/gXB3Pr/5j7
	SRl0YjNvdjCUG07BrI8B3t7akAgi1LS96DOvSfCK1ZsNXO9TNaHVl7Jja1Yoa7lOlDCyr4F4A0xza
	1tiVn0ZV7BYNrlAFcXc+T9RIgvlg5fFjvhy4McknPKvotjbMbrc/Ji7zDAm71mw8XhITt/IdKTsoe
	TNRhnGw1dAiCqhKpebow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnMnU-00ABOt-14;
	Fri, 14 Apr 2023 17:01:16 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLqz-00A28I-0J
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 16:00:50 +0000
Received: by mail-pj1-x1031.google.com with SMTP id hg14-20020a17090b300e00b002471efa7a8fso5413114pjb.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 09:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681488048; x=1684080048;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E9XECObCyZpUedK9knyGwZy3BMqflVOS6gxHGxGLKTE=;
        b=gkc5s6HPzym+RHUm++bVdfv9jb1/AkXmpyekQHGNyDGRRDRYGjsm+T5pPdbkIedgdV
         ZFQ6LrmUfO+1WkSx2IgoF4ZBZCNi62pkkDd2LecWTiR0dGThihYtuuKD3qAYYgyp4scN
         6dSaca2jMax/dpE1eRXkip1mPWJVjhnFxU4OsG9dCgtR/38nce7UO6rc31M/0niyugTY
         OGZBDUSrCItNQk5ZhcxqJNi+vl4rQPEd4dLts6y+fkwyPmztt2QGc3F1zJKebU4pVnFG
         0z5VwwXgPyU4CL8P1dX+GDezKB2ciU51Yp3dyrXKzingm/2BiEBojiIbxgZVrF+8FpuD
         77VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681488048; x=1684080048;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E9XECObCyZpUedK9knyGwZy3BMqflVOS6gxHGxGLKTE=;
        b=TGq75Y8Fp9d4Mv3lDQJSB4k1/gMk4ulpEPYPeMdltQyZTlMdYriaqylvxyZHPPgPOi
         C02zejklTEX4zz6uE2QDMu128HwKZY7TyTbICAlKYaszUU+xO+t8TcEtAW78lL+uYwTr
         GwBbtKoCgleaVhiQ+r+Y8je01UBwZU7VJnxLJngpQkBoSJBgOXA4u3QbWwVgreF+f/Uh
         lnjH7CuOP618YBv89EUorhuL4nov4czhxthQPONWlCzBoW15jcyb+t8CW2iItmhNxEB4
         AVddEUEtj7nSVeC6ZqkOkvFoDldoJcWbJ1v++NNLK0EzX3mhOqulDD5jUtDedGcnnulk
         krXg==
X-Gm-Message-State: AAQBX9dkQpg8n9Qw8tCDtgl7l62zC+9VCdVzH8SSfMpA2jD7/nszzIA4
	7LGJp6Mt3I/EB6mPFnUtpxMsYI3J9luprap+2JhkOZVR3LWu/dRpunA1CvYqSwkdfxWnbxmlR0z
	01NLwQSmVmF9OqmG5yErXTWJ6RXqS4HQFTqPmIG9/y0gZl9PVRxJB8o+ebRMpzYI3IjapNzFRLx
	l3lbxl4XV8+sDr
X-Google-Smtp-Source: AKy350bAtaGvhnaI4rhSGJ+v1XE5PL7wflyiii5/XGq5ELK2D7RWeVxXUPMbdb1aQIpE7CzaET8gZQ==
X-Received: by 2002:a17:90b:f0a:b0:23f:582d:f45f with SMTP id br10-20020a17090b0f0a00b0023f582df45fmr5745324pjb.1.1681488047968;
        Fri, 14 Apr 2023 09:00:47 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id br8-20020a17090b0f0800b00240d4521958sm3083584pjb.18.2023.04.14.09.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 09:00:47 -0700 (PDT)
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
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH -next v18 20/20] riscv: Enable Vector code to be built
Date: Fri, 14 Apr 2023 15:58:43 +0000
Message-Id: <20230414155843.12963-21-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_090049_131330_9510DC6E 
X-CRM114-Status: GOOD (  10.64  )
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

From: Guo Ren <guoren@linux.alibaba.com>

This patch adds a config which enables vector feature from the kernel
space.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
Suggested-by: Atish Patra <atishp@atishpatra.org>
Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/Kconfig  | 20 ++++++++++++++++++++
 arch/riscv/Makefile |  6 +++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 205ce6e009a2..5edfc545aafd 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -442,6 +442,26 @@ config RISCV_ISA_SVPBMT
 
 	   If you don't know what to do here, say Y.
 
+config TOOLCHAIN_HAS_V
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64iv)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32iv)
+	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_V
+	bool "VECTOR extension support"
+	depends on TOOLCHAIN_HAS_V
+	depends on FPU
+	select DYNAMIC_SIGFRAME
+	default y
+	help
+	  Say N here if you want to disable all vector related procedure
+	  in the kernel.
+
+	  If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 1b276f62f22b..94684dbe3b36 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -56,6 +56,7 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
+riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
 
 # Newer binutils versions default to ISA spec version 20191213 which moves some
 # instructions from the I extension to the Zicsr and Zifencei extensions.
@@ -65,7 +66,10 @@ riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
 # Check if the toolchain supports Zihintpause extension
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
 
-KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
+# Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
+# matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
+KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
+
 KBUILD_AFLAGS += -march=$(riscv-march-y)
 
 KBUILD_CFLAGS += -mno-save-restore
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
