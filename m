Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35969C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 16:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3c6zG/eX8JLfkQzS/VvavecQgutzVG8EiKL6F1m65g=; b=nBX+u+DrB+rcTO
	xxyFvWwPg4nX6mwmAhKzBnpZWkSEU67Q+UMhB5SehGDjFizG+icijHrp2nIW993RlrL8JJYOQ3DGX
	7DmQYOiR4OBCkP5e6TBUJk3mlV7M/cVmkvXUnsc6BI1+VdFpSTK9pQVA8XndokhYy8dfPQ6tdsgGp
	pgr3vDsUA+yC9Z11xwwrT6zvvyY5wHblH7lbujkyA4D0HrHoKLEEb1t5ML+RbzdOL0fWUExJEwBR1
	uKgthQ8cIlW5UwT4cVemZt3WV2e4YJcB/TV6CxgGEJBnzvqUJuimYpQQOUY5h2Kyn4E5EZPdAgldg
	tTW3JFQS4BMyvxCR5mWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgg0-00DUxO-0T;
	Thu, 18 May 2023 16:40:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgfz-00DUvv-0Y
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 May 2023 16:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b1b0xsw8eifEcqL65SiaBPERh4ugWqVSP6XmDavWWMY=; b=Wb8v0r4pncMDboqQ1+8qOz2E5/
	9Ln55R37FPdOxIx0CTXrNugUcKUbJxF1p6+MmloCpy62oHZTN/57bIy/wNn5g8sahN0GhIAlmoWyU
	8VnsL9E5/sILIdjUh5mpC6m2A8/ICJBznje7UF+QiSrnsMfadj04iXT1ogFck7PxARuv0fhMC4sjb
	M+RFv/aXX3cquO4iYtxLUf73uRjPy1ijQTpTD3bXpBqk+6mK6+t+pm+Luz3kOBeQA5AgDsdqCe2bJ
	bWHfKxEi+NpKjIZ5JyZ19dwjYY3zQBuJfMtbbLEWo15IIKSsxELfXv5rMDBixkZqQmlx1pgrSYAsi
	cNqkq1jw==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgOb-00ErRN-2J
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:22:31 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-64d2467d63fso470348b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426947; x=1687018947;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b1b0xsw8eifEcqL65SiaBPERh4ugWqVSP6XmDavWWMY=;
        b=Bu4ilTdIWMMLwOpy8XcilklIFvmsG1OLuzriOCTkzbwfTbqiNCEtaBOhxbztiyfwBt
         CjgHcX+6xdognvyr8lvQr2KMYLXtUuXQITKj2rzHK1dNcc8lzlqwzC5RRbA7HHfDX3eT
         Kre9Fg0TQW7jwPTdwt5kOtnYMCa8JQpx8J5ZfIMuWgpmuMAwh8BOrpYliGHVT4ZIkWze
         JB3W3ALQUJLceu6qiy/n1YkCe538v+FxM87UuRBPcmm/gbmpK9w9wiDu4+yP0GDLqTZ1
         b2zmmu3IiCEJiJ1dN71Og53pP9cypGH7kXje3Jx3lyeU4NYBucj7SKB367wODjVB9d2Y
         vqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426947; x=1687018947;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b1b0xsw8eifEcqL65SiaBPERh4ugWqVSP6XmDavWWMY=;
        b=aKlzJlaeydO+deIq2eSEvToTNBQvqWWmaEX0/UmEHigoQQHDvQujVSyHxrz5fgaTCj
         z+Q3rqfR81V7UPoNQRZpQDFQD9Untu31rhpvQRFOjrwCyd1PoiR7C+zWx2w+7/93aWo6
         el6tCtBg8EJ7cLaz4xBbpAhD5Q/DEe+8velps/tZkOezbynKufbbbCbdDYnRD4oxG2qi
         bR01DkwipAWgF0M75d9L0Hnrrw8z0ZV2tMMbN6it3elH1DLu6dfvjIG5f94vUsEJjStv
         wA8X1WxzwavpcSbVPpsWKFbe92lHlhke0GJxNu9gKTHj0uF16j19i+yF51mwxRB+S7jV
         4djg==
X-Gm-Message-State: AC+VfDy6HDIlJT3Q+irzeg1hsNG2jhVYLAFPIC0D8+7sDnLcbzP+0TO1
	J5GNPF6G9Ii1xoIRTQxZRh3XeLRU+Bz/hPJb+lkmyB25VnA1xY6uglkATSVeIm9VM/fHX4TI8ri
	LeEXpQ3skQV0BCROnKSf4fkKaSl0O4q0iqYc4js/Vz7NUOqjg/4F3yismEUNKMwgvIoi5wxNoso
	ztRTOCpxpLm0ZSLQc=
X-Google-Smtp-Source: ACHHUZ5GRXU6Qwibs9ZDmbkxXzE0v0HGP/aPJjeuRkEgLEfzKhZeZnfeHFwA+sFaC/31wIIPeoVRnw==
X-Received: by 2002:aa7:888b:0:b0:64d:fd0:dd1a with SMTP id z11-20020aa7888b000000b0064d0fd0dd1amr5499091pfe.16.1684426947363;
        Thu, 18 May 2023 09:22:27 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:22:26 -0700 (PDT)
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
Subject: [PATCH -next v20 23/26] riscv: Enable Vector code to be built
Date: Thu, 18 May 2023 16:19:46 +0000
Message-Id: <20230518161949.11203-24-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_172229_853457_D53C48D6 
X-CRM114-Status: GOOD (  11.58  )
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

This patch adds configs for building Vector code. First it detects the
reqired toolchain support for building the code. Then it provides an
option setting whether Vector is implicitly enabled to userspace.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Suggested-by: Conor Dooley <conor.dooley@microchip.com>>
Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v20:
 - s/RISCV_V_DISABLE/RISCV_ISA_V_DEFAULT_ENABLE/ for better
   understanding (Conor)
 - Update commit message (Conor)
Changelog V19:
 - Add RISCV_V_DISABLE to set compile-time default.
---
 arch/riscv/Kconfig  | 31 +++++++++++++++++++++++++++++++
 arch/riscv/Makefile |  6 +++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 1019b519d590..f3ba0a8b085e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -466,6 +466,37 @@ config RISCV_ISA_SVPBMT
 
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
+config RISCV_ISA_V_DEFAULT_ENABLE
+	bool "Enable userspace Vector by default"
+	depends on RISCV_ISA_V
+	default y
+	help
+	  Say Y here if you want to enable Vector in userspace by default.
+	  Otherwise, userspace has to make explicit prctl() call to enable
+	  Vector, or enable it via the sysctl interface.
+
+	  If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 0fb256bf8270..6ec6d52a4180 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -60,6 +60,7 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
+riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
 
 ifdef CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 KBUILD_CFLAGS += -Wa,-misa-spec=2.2
@@ -71,7 +72,10 @@ endif
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
