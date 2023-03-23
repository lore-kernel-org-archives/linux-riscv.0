Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE112C76196
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 15:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKS71QHu+BVDlT10/XKukzXelczkg107SD3eEsVZ77E=; b=ibxKiWac3Q6xL1
	9NDcUUKHkyCi2XXPndHUV+qvDtxJGZfuTcdHV5bZo2i54v6CndhwSRhov4vMnqKYXEGLixWwp0c0A
	6/UIUS8983+twzPt08nHItv/keeTizNBTHULOGs/eicVutPo2+UybFwmuoTtZdutKVikQyWcyilUf
	fWStFJDV0PpHLAOeMb9CWDV997rKHo+C0eUSPf+HeCOknEKqzvRfjdMK6y44t7EnLk88U8LS5hnj0
	Z8339N4A7VzWjAx7o48+XndLXC+aDsnRnbgnErnJ46PDVrWYgIh9RuMDTbGg86gL8qM9TvgUHa5lr
	OYCFFW1XKrCRgmpDt84Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMRZ-002HmP-2i;
	Thu, 23 Mar 2023 15:01:33 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMRU-002Hir-0m
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 15:01:32 +0000
Received: by mail-pj1-x102e.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so2220758pjp.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 08:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679583687;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vtoGGjKeMirMGWzivkA2ddkX532xxY9JlIIZ7C9ExVA=;
        b=LP/ip08TU4mj5NiGXR+IDitS9xcZ1lrJxRBqmYgILXm/2WMj6AuS7ovyakecDS9cah
         l0rkl15XxJiJfG1UqvnRw/+BAWAnppVdkzjFU8Zu8FVB+lWTZHWgY6SDKFGSsxUUOOMB
         0VHGRGiOwcQgNzEJaa9LaNYMT8BxDNaZ9rKXpzIP1asHGkFMWOEAqk8waZgrOnvDa7Sx
         vkmJVjA/9CRO6gv0aj4oTv6lTWMaE2psbeTBGXEZwk84BAGsOg+MWHoKzwX7aGv+NyAj
         RM+gRv7r8HOGdqyjLhWxOFhB1OmPgkdg++IDwfqJH9h03f7By9rIQUiCclMhLICHBFiS
         iAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583687;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vtoGGjKeMirMGWzivkA2ddkX532xxY9JlIIZ7C9ExVA=;
        b=pydUankF2r4yva0taXbCALkXzRTxYybe48I8kVPD6wFTvtozRoayxWoP11983YSpDx
         LK66q0xNyncINwXArn1lIg0Yf+tvk/58mqKOJx389s6ZEo3cpjlcopYPGSyfwHEhoG5L
         aXD95NZvNa3BE9HxKYR75skh+NOdN4U77PQSuluX8Nuvhxe8vMbIuudgMd2QpwsKsHOq
         N+4aRVG3RTuMjODkycd04cOOQvmpteZ6NBEgRmo+j4AbPq5vBFF2G4MacXZyil1IHJRu
         Mnxy8DWtEDmdJs20wy1NZ60nQVCIri29Dvpsi7A9yrlPqmHGlj9kK8PCb3zgbG8Wg/ud
         lAjw==
X-Gm-Message-State: AO0yUKWpQDQ68QOEqYMSV5yfW7pK/8YjO+exN1GD4dSvNHPSN1yuZC9z
	XcqEVucpl8lpoUn7DGyF4VGTSvqQykSFcJystWjZfYMoePUfPo3E1oYB+zp31GelfAKvZkaYFsG
	Jl9vLU1DBg4IsqiMv0g3wuNeGJSrZvYByYG1/oj5RgczvLEnrBEFvAQDumTF0wDRAsdbadMfLJb
	WLrQFNQZCfQEE6
X-Google-Smtp-Source: AK7set8RGVbK2oSYU+p7FyEM2ztkMqRmYkTbXOwkaqPpCfw5FseydH8YU6eaCSf0Vcc60jPrXr193A==
X-Received: by 2002:a17:903:2846:b0:19a:a9d8:e48a with SMTP id kq6-20020a170903284600b0019aa9d8e48amr5745288plb.22.1679583687163;
        Thu, 23 Mar 2023 08:01:27 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902854900b0019f53e0f136sm12503965plo.232.2023.03.23.08.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 08:01:26 -0700 (PDT)
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
Subject: [PATCH -next v16 20/20] riscv: Enable Vector code to be built
Date: Thu, 23 Mar 2023 14:59:24 +0000
Message-Id: <20230323145924.4194-21-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230323145924.4194-1-andy.chiu@sifive.com>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_080128_284476_19C91850 
X-CRM114-Status: GOOD (  10.66  )
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
index 4f8fd4002f1d..0e0377b5319c 100644
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
