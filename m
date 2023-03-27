Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5418DC761A6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 17:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5H2uxISOW7bjoFBNszutLTBzQ5xUuvsAAUh33zcN8J4=; b=dkwXNhLhNUauf+
	BD7ZZgSzbPIiSax/3UMrbHRpdnXIn9/k5zkYCUz7dUlnMxvGi/Mp2GHlAFyysFIQKoV7MRA8L9K1V
	Y3ncMy5XUTfsGo69RscvIpVgRjERrZ03Xcv4PO7vBtEFZ3nOl18DAnsBTgRvxx8u8D23q9OGNzUYt
	A25bQ2f+J8G9s1A5X4yIM2lJWJrzS1cRnU83az8dROn3g81Ye12+uAQKU8y3fKINVeB5W9Sm0Wrqf
	puBEbZRK6+jHOuGzKBHn+gXBKtynQdlv7MPyP+V/rqXjt01pS6W5RmZEH4UcsvM/Ebq/cgth9Jrhe
	jnXF/1ABLs0EOiCCoiZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgquN-00Bvww-2N;
	Mon, 27 Mar 2023 17:45:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgquM-00Bvvy-0q
	for linux-riscv@bombadil.infradead.org;
	Mon, 27 Mar 2023 17:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3o5PKVJouT2SvH1Nibwj1rRN/GByxiY77LUZdMPikJ8=; b=GO0OCmEOqFOIdcvVHFfLzV1zJK
	RzNr8WP1L74qulFQd6EqPdX7g1KxxtiO3mNeEMDIGQnGKM8VX9le1ycl4q5WfW1Y3qdt2Vcfwtlpt
	T44i5EKKA+GXLSqfYN500uXzinLvxO8PSmnNzqIdIVA9j/qhEz74xizYOQWfmQJeRnw7AE4eK0Dya
	vG7l5iD+4WY7Np3MA+VmQi3akvJMVB5Boa/Gd73E6BRNRB92bRPxr4Kuj6x9LzFyvfKoQ74p1Y5pF
	iXMRMojobtJE54fPhjRzcSYhAxTqCm8cUA6ezh1yqffRUOMXFkFmMKkY95eg5PMRM22grZ73m585b
	kDw9riqw==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq4L-006ERe-2t
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:51:44 +0000
Received: by mail-pf1-x434.google.com with SMTP id i15so6121706pfo.8
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679935899;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3o5PKVJouT2SvH1Nibwj1rRN/GByxiY77LUZdMPikJ8=;
        b=G9khAgwEOxm9Jl9drKB+OMaSZOAPIgBWTmXJhCJ1EcK3DDiDpYQDSwWbc3kv52M2Sw
         3gIsTeGkCcaHtRmroHdv80+g6loP4Bjg/cku51fqD2RoQcUl7WxHJQSUXUKzT4HOVmPw
         ANWIANcuf1rVowl4s9sAmbjIn+z+McyPKcvQR+OtJGh4+Z79ED6Wb8Oix+GWaqf4OpL/
         OQ4HBCJsXkznnfy2xni6s6KPZV1618ycrBCPkfWA/mCquWP0mOCcO+ynLOtepjQbjY8t
         OMOYiAk4DR5yJkouFNzFnA0ItMZvUQ9Q5HOy3+oKNQcUmbfusmfL2C0JAkdgai6ycW31
         C2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935899;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3o5PKVJouT2SvH1Nibwj1rRN/GByxiY77LUZdMPikJ8=;
        b=tzocxxqGp2euIQE1Zff3dqrTLPYA3JuwYPLzX+3bc7Vfp+RUkVodVVHC3yfjYUa16N
         CY7gn2iZJOrAoZBUhAICqLmsGOrPqLQ5rmCj1SJczZgHTEXm1PIQLn6wRsuqmIQZf5k8
         Tqv9sd13Kgq3mI9yZu83/3zv1QNUmQnnkrcad3WkMbHNonoiv5XU2NRcqNa0NYHJTJxO
         ymRUdKqAP68zYzBhWkkhJ1cV+9hj4tuqyh5XWrja/kFzj2J6nQNW+MCr7A/sm/qjNkPr
         XcKAg54Umg4G9CukLeqkD0AMVFSjQKY4LplXwdOUi0WfsrxkiQbELPAdgENpAg8qFRqn
         l2+Q==
X-Gm-Message-State: AAQBX9d2FyQsqmI0uJfGuWPsz59mlVNfTs9bNr+oPuhueMRHcdb31/C4
	tEYqTBrA0x39NuydPOd423zHFz2IGol2Fhx107LP/6uWV1NtRKVKcpRXO0fhNGdMO/QThBBRh8r
	I3FJ9tWTmozJZhZ2jXEBJ2BHh9PkCSqDCtFZFUVZ+NZR/YVte2dtom1fo3FScgY91JU6/VSkV0U
	9NmkKkZYEHN4Ow
X-Google-Smtp-Source: AKy350YP8LuXdyAO3EhfMm+8W/2ANf4fDQt1KF0UR5mCV9HkbaS9xfiIYB3fD122c4G835W2exXKbw==
X-Received: by 2002:a62:1d51:0:b0:622:ece1:35d3 with SMTP id d78-20020a621d51000000b00622ece135d3mr11696525pfd.5.1679935899291;
        Mon, 27 Mar 2023 09:51:39 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm19310550pfh.22.2023.03.27.09.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:51:38 -0700 (PDT)
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
Subject: [PATCH -next v17 20/20] riscv: Enable Vector code to be built
Date: Mon, 27 Mar 2023 16:49:40 +0000
Message-Id: <20230327164941.20491-21-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230327164941.20491-1-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_175142_160193_49AEC2C3 
X-CRM114-Status: GOOD (  10.65  )
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
---
 arch/riscv/Kconfig  | 20 ++++++++++++++++++++
 arch/riscv/Makefile |  6 +++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 91d5f2731f06..d95245311bf0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -443,6 +443,26 @@ config RISCV_ISA_SVPBMT
 
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
index 6203c3378922..6f32c0ab32e3 100644
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
