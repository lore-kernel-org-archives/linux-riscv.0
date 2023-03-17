Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737C8C7618B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 11:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7CZLKecBmpu/1CCb59zOXlGompWOy6aIpW1WZQ+8ZeY=; b=1HLJehIx3ovskq
	9O/JSwQhbjHXtCofZPBOx9iqn/jKBL1rKHjz68tJl+wlY8NxQEufwCytoMCG6wWbpjzAYknrHYtq4
	vJfsxBU3/bzh3/OgavvSQa9UdNPKrYBx8pHC+IXt+r4BlnLmdTrDZpsq7SOocei1fOJQuuLLcoOM9
	59GJ+W+mZP8H4swMwc1eBTVGcz6y+b+ZvvDMnw4LIIXF+Z9tRo3igrGgBTUrQGyFIp31w6ayiLYaD
	+Uvl5xEFvfABRomKyj4xxQZM4Ofls3RfWgVhkOMjaDBR7d+tZxBSgxG9WDD7SuP6LVUpOyj48pHOE
	V3+RAcfr/xh6z3Rc8OxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8PV-0025vk-27;
	Fri, 17 Mar 2023 11:38:13 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8PQ-0025on-0K
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 11:38:12 +0000
Received: by mail-pj1-x1033.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso8643200pjb.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 04:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679053087;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7nse4H651gQWwjvfzxuALEV9PWCwDtW7Vpp5QzRUQkA=;
        b=KAJhzfoxouXhNmh0BnXcUeZzTs5NSiUJQMo1bTi4zg4ppXg2UPO0WxbHxP8DljsfXl
         d7ucZh+9Q7FJhsOArs9/u+ulxMpThUs/OvczGoUnzimq90pJX/YvQ7k5JCQfR1kNrOFq
         xzEhUVFRNgBZ6h2IN+NjHKnuBj0ApSNXYadrvVYeQLcqzMMILyaCjswPyFNpsnrD3gVB
         UUOQsxNVqGEr2f9TArWBY68ygO6Eic+F1OR6fVQCtJ1qdzzm9+YL0RDXN6sdwH16johl
         aAJ0qd3FolMzPuyNbO5iomX52JVZ2fLDRIm5zNtsUn7cPrBAIfIomd1OqvRmOFdlzpkL
         4zKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679053087;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7nse4H651gQWwjvfzxuALEV9PWCwDtW7Vpp5QzRUQkA=;
        b=i41pkEUcZw7Z62x4o5Jh1oUJdPmKvI8nez5QoYP88MzUqqJ0KOUVYsJgD95TzwgK7V
         4uayn/r6CQvMQn9Pf9i04wbDc1vaRDlDJ6IdLL2OQmEzgsNt/aGg7kprwVJQy0dGMflE
         yOTSuUWRrS2FS0+dQDxTlYXKr1u9c7DqDHwJJ5hLLlDxxmNPjfXqdx9uEO5CyambjZ+G
         vQCImpcDbtSdgGTbK+rrfHVWFEnsrJGqEMvYp5y1JzZPcxFgItW1ZGdIvFHdf22Lf5zG
         XBGFRZZnp5DluYUJzOkVQDXZ/IFdD155aczq32sYJa1d97ijXCXzGAoAv6uRS6xupv8P
         rC6w==
X-Gm-Message-State: AO0yUKWUJRUkFRBdNLeTzLhPV9phF36yrs9Mb9JODDO3cwfOzmxXg8Ws
	Pz+oEIl8Rg8WLt3X9MxlNOZLQuPdregitrkXcjBYG8e37ChDU5dMy5YWev1IVY9muH7V3zHJ2CS
	h+UPKMQtIx2T00thdNgZ/vMMctD/PjD5csmGljuDm3TAuGRV5rUBfDeluDy5SJ8YtAEhGloXihw
	a0pbtEDG5aq2LS
X-Google-Smtp-Source: AK7set9d9gXmb6m6eq9N88b1+NY1wOjkacSI7ZS9r8acOoqbX8Z+nye5qbASkA+KMYYjEtVhjDnjvg==
X-Received: by 2002:a17:90b:388d:b0:23d:1948:6681 with SMTP id mu13-20020a17090b388d00b0023d19486681mr8142191pjb.39.1679053087270;
        Fri, 17 Mar 2023 04:38:07 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a2cc500b0023d3845b02bsm1188740pjd.45.2023.03.17.04.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:38:06 -0700 (PDT)
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
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: [PATCH -next v15 19/19] riscv: Enable Vector code to be built
Date: Fri, 17 Mar 2023 11:35:38 +0000
Message-Id: <20230317113538.10878-20-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230317113538.10878-1-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043808_144546_EB873EF5 
X-CRM114-Status: GOOD (  11.34  )
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

Support for RISC_V_ISA_V is limited to GNU-assembler for now, as LLVM
has not acquired the functionality to selectively change the arch option
in assembly code. This is still under review at
    https://reviews.llvm.org/D123515

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
Suggested-by: Atish Patra <atishp@atishpatra.org>
Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/Kconfig  | 20 ++++++++++++++++++++
 arch/riscv/Makefile |  6 +++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c736dc8e2593..bf9aba2f2811 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -436,6 +436,26 @@ config RISCV_ISA_SVPBMT
 
 	   If you don't know what to do here, say Y.
 
+config TOOLCHAIN_HAS_V
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64iv)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32iv)
+	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
+	depends on AS_IS_GNU
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
index 6203c3378922..84a50cfaedf9 100644
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
+# keep non-v and multi-letter extensions out with the filter ([^v_]*)
+KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed  -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
+
 KBUILD_AFLAGS += -march=$(riscv-march-y)
 
 KBUILD_CFLAGS += -mno-save-restore
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
