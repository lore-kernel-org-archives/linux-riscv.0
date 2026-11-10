Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032C1606A321
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 20:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n4JAGJld;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=CI9oM+X7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rwsZu7pefSXFs8aJGHZKgonZ2lnjyZueJi5xFxIDkKg=; b=n4JAGJld2dBnW28McuEwKtut1b
	BW/mOj/4y4AoxrOp/01ycuCa8SIVknsuerKJVMX5vGeQ7Fy/OU+vo1R/+RYjTjL197BYvwfsEank3
	xJ4I1KR1kXPdwY7RjkoUTvsDHKSi/hkvWqfVGbq5tnUWa/NcMdI9z5yrMbtv8RanTO+3IykyrpzEh
	8WYryayi/O29oTqREIqEOTnJugWK3rC4usPqf2qrRoT/eseb+0K6BfP8vYUDUQTRa9jWuIM84wsGs
	7WrQuAtWAhrQPZtke1fEk/OX7Ds113rGzbZRQFv+ZGtcw3OFke6iOAog9kfvd9NJkShYXPTXuTJhO
	6uoYwGVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQs8f-00000004xS9-2CQP;
	Tue, 10 Nov 2026 20:08:17 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQs8d-00000004xR9-23t7
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 20:08:17 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-8b2d14968c9so27785307b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 12:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1794341294; x=1794946094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gsXvf2h1CNTp3VGqWRFKVAimxkBCIcbxcnBBsyengw8=;
        b=CI9oM+X7kPyag4Ka6OikOqmP+GV6p5bMj3Lu7U0+SmDJ9XHK4UoD9VKSd4ADXM1dIH
         QbjEL9Qzv6+ndFKSMIKIBoJY6YtaGqyI1bcZlD44Cdwx/bN0EwsQaTDy5Jt13+RMTGZ5
         17tjbCgBGFMsurasMCrrErEKDu5jXYgexYFvxVRU8TsRQng25FHOV0fnafMZkmEi46H7
         uyS7e6buwigvmTOhjXWFHUQ0SedzTR02QduaSfSDZ2VJqGuS7Rco/ZxJboYDc+dw9bRD
         nLLqpaQG7Ms2rUUgQp1QQ7PsGXnhy0NfDs7sbx/F8duoGu6DZCkw2309OwixZmbHK8r/
         YMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794341294; x=1794946094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsXvf2h1CNTp3VGqWRFKVAimxkBCIcbxcnBBsyengw8=;
        b=2tbGbixAzvvD4kwaD5H6DCTS5YZvyBioiC770X6/7k0q1tUX9IKt642oh0mC62lc/f
         TvfXL/eBSFH2SV2km/l4wufKQjzEa/w/9XXvC9j0IOvg6PqKkRHZr17QvRexWIJ6o+pL
         C2k3k1b25zpcIlGFk8m0eBjyvuLwxQk8ZMADxCYaP/VSm6iWb7AjhFm/M5Hy5irCzyZZ
         dMt89IEdT1aG7ruF1+k2QGiKjMhY4ixCe36/0aSlEeM4VYctv/uE1dyKR/6AdPMzfw3m
         F/muqoXw7PeMg9rbB2mcSpef2lSizvpvVJYBMX6PPi/eiaeaczTDQuHqI+nCTCyaulHC
         qyLw==
X-Forwarded-Encrypted: i=1; AL+hErFG44OvFfkXDmVMsOZmtyO0HK1uMcYZLg2AWrdACUNyXMGcH0E6LUXjdH4RHFohsr8I+DFokIe3GWC0gA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9SnsWZYP0+V5QyL5ikjtB4ROP/82yZY3SCScagpzhVychyQ+ie
	8IZwvNf0VqKCHm0lvrW9NzahTInCY8BPOMyl4CjlBXn/HaJ/wj7d2MjfxBMgu+S8rxs=
X-Gm-Gg: AYBFou1Mifp12LzLRbDhECy+W2OmL74htVBxv0dT47A6r2MZA/TG77n3wrIRb+PP8rx
	sHulXkTYS6HA+ds9pcnwm2F8Fvkl341oSf866R8vz01nw3fnruFx7tuNZPgG5oPyjbejrQu3FAY
	d2tIKSrO1BKJwtfGEMNYLpnBINo2CDayBvefRC8txka0YGyuVH474sOJM/Ku6QnGWB1M75vkBHw
	eBUfxS9MPpdlQ8cytKdS0F2ryiheRHqLhsr/WEO12Ibrls7g+4wgoy7ujl9A0au/z0+ctyyi3D6
	oGE/6oMo96v0FxyG2w3KTMPxrclwO6jJzE3BeAoIEAYZrFkrnLOeesT6vZRycbGqr2YVZiFA8CL
	LBDz6QHVfLPSYRIY67n6y4tlTLsZi+WWE1VjxUh/5rJA3nDiBsw4s5YSEUgl20xK1rOfz57t2tx
	OafrL49BnJewaFcuzSfOouewyzkMXpBZf40MGcIITgZiDHLZgRiXxPwGOUjuPTeGjCZZEPt69zY
	H02nLvnJXopsy4KzKk5uyMHkC9txaouBaaN6zp1ce1sBNXs3MHFfbWsCBbCFI41q+ksqQNTSr7r
	6C36tGuHFvflIx8vLqMp39WXyqzf02cBP45mJTCW21es3ckhnhjiVZkKiZheHGK407r3gg==
X-Received: by 2002:a05:690c:c4f9:b0:8b3:4b5d:b26c with SMTP id 00721157ae682-8b3a7ff8374mr2430837b3.13.1794341293547;
        Tue, 10 Nov 2026 12:08:13 -0800 (PST)
Received: from lima-default.tail89d63.ts.net ([108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39324bbf5sm27563437b3.1.2026.11.10.12.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:08:12 -0800 (PST)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com
Subject: [PATCH v1] riscv: kconfig: enable -mtune built kernel
Date: Tue, 10 Nov 2026 14:07:59 -0600
Message-ID: <20261110200800.1073859-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_120815_657679_E653200F 
X-CRM114-Status: GOOD (  17.18  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On a machine that supports native unaligned access, enabling unaligned
access code-gen can result in a significant speedup on certain workloads.
As the adoption of application-level core increases, it has become
essential to build a kernel utilizing what's available on the platform.

Here are the examples of throughput improvement when the build is
configured to utilize misaligned access code-gen:

LZ4 compress: +90.6% (Ascalon-X), +35.1% (K3-X100)
LZ4 decompress: +9.8% (Ascalon-X), +76.6% (K3-X100)
ZSTD compress: +35.4% (Ascaloon-X), +19.4% (K3-X100)
ZSTD decompress: +26.0% (Ascalon-X), +7.5% (K3-X100)

btrfs create: +7.4% (Ascalon-X), +4.5% (K3-X100)
btrfs unlink: +7.2% (Ascalon-X), +2.6% (K3-X100)

To enable such code-gen, the build system not only has to remove
-mstrict-align restriction, but also needs to set the proper -mtune cost
model to emit such accesses. -mstrict-align is gated by NONPORTABLE and
RISCV_EFFICIENT_UNALIGNED_ACCESS, and -mtune=generic-ooo enables the
code-gen to emit misaligned accesses.

Add an entry in Kconfig so it allows the build system to select different
mtune options. Also, select NONPORTABLE and
RISCV_EFFICIENT_UNALIGNED_ACCESS when building with "generic-ooo", and
"tt-ascalon-d8".

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
 arch/riscv/Kconfig  | 62 +++++++++++++++++++++++++++++++++++++++++++++
 arch/riscv/Makefile | 14 ++++++++++
 2 files changed, 76 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e7891a2a89da..d53225fead4a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -980,8 +980,67 @@ config RISCV_SBI_FWFT_DELEGATE_MISALIGNED
 
 	  If you don't know what to do here, say N.
 
+config TOOLCHAIN_HAS_MTUNE_TT_ASCALON_D8
+	def_bool $(cc-option,-mtune=tt-ascalon-d8)
+
+choice
+	prompt "CPU tuning (-mtune)"
+	default RISCV_MTUNE_TOOLCHAIN_DEFAULT
+	help
+	  Select the microarchitecture the compiler should tune the kernel
+	  for. This only affects instruction scheduling and cost models, not
+	  the ISA, but some choices also assume fast unaligned accesses and
+	  therefore result in a non-portable kernel.
+
+config RISCV_MTUNE_TOOLCHAIN_DEFAULT
+	bool "Toolchain default"
+	help
+	  Do not pass -mtune; use whatever the toolchain was configured with.
+
+config RISCV_MTUNE_GENERIC_OOO
+	bool "generic-ooo"
+	depends on $(cc-option,-mtune=generic-ooo)
+	select NONPORTABLE
+	select RISCV_MTUNE_FAST_UNALIGNED
+	help
+	  Tune for a generic out-of-order core (-mtune=generic-ooo). This
+	  also assumes fast unaligned scalar accesses.
+
+config RISCV_MTUNE_TT_ASCALON
+	bool "Tenstorrent Ascalon"
+	depends on TOOLCHAIN_HAS_MTUNE_TT_ASCALON_D8
+	select NONPORTABLE
+	select RISCV_MTUNE_FAST_UNALIGNED
+	help
+	  Tune for the Tenstorrent Ascalon core (-mtune=tt-ascalon-d8). This
+	  also assumes fast unaligned scalar accesses.
+
+config RISCV_MTUNE_CUSTOM
+	bool "Custom"
+	help
+	  Pass -mtune=<RISCV_MTUNE> to the compiler.
+
+endchoice
+
+config RISCV_MTUNE
+	string "Custom -mtune value" if RISCV_MTUNE_CUSTOM
+	default "generic-ooo" if RISCV_MTUNE_GENERIC_OOO
+	default "tt-ascalon-d8" if RISCV_MTUNE_TT_ASCALON
+	default ""
+	help
+	  The value passed to -mtune=, e.g. "sifive-7-series". Only
+	  editable when the "Custom" CPU tuning is selected, in which case
+	  it must not be empty or the build will fail.
+
+config RISCV_MTUNE_FAST_UNALIGNED
+	bool
+	help
+	  Selected by -mtune choices that imply fast unaligned scalar
+	  accesses. Forces RISCV_EFFICIENT_UNALIGNED_ACCESS.
+
 choice
 	prompt "Unaligned Accesses Support"
+	default RISCV_EFFICIENT_UNALIGNED_ACCESS if RISCV_MTUNE_FAST_UNALIGNED
 	default RISCV_PROBE_UNALIGNED_ACCESS
 	help
 	  This determines the level of support for unaligned accesses. This
@@ -991,6 +1050,7 @@ choice
 
 config RISCV_PROBE_UNALIGNED_ACCESS
 	bool "Probe for hardware unaligned access support"
+	depends on !RISCV_MTUNE_FAST_UNALIGNED
 	select RISCV_SCALAR_MISALIGNED
 	help
 	  During boot, the kernel will run a series of tests to determine the
@@ -1002,6 +1062,7 @@ config RISCV_PROBE_UNALIGNED_ACCESS
 
 config RISCV_EMULATED_UNALIGNED_ACCESS
 	bool "Emulate unaligned access where system support is missing"
+	depends on !RISCV_MTUNE_FAST_UNALIGNED
 	select RISCV_SCALAR_MISALIGNED
 	help
 	  If unaligned memory accesses trap into the kernel as they are not
@@ -1012,6 +1073,7 @@ config RISCV_EMULATED_UNALIGNED_ACCESS
 config RISCV_SLOW_UNALIGNED_ACCESS
 	bool "Assume the system supports slow unaligned memory accesses"
 	depends on NONPORTABLE
+	depends on !RISCV_MTUNE_FAST_UNALIGNED
 	help
 	  Assume that the system supports slow unaligned memory accesses. The
 	  kernel and userspace programs may not be able to run at all on systems
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 44f5a439741a..08f1a32228ef 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -89,6 +89,11 @@ CC_FLAGS_FPU  := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64i
 
 KBUILD_CFLAGS += -mno-save-restore
 
+riscv-mtune := $(CONFIG_RISCV_MTUNE:"%"=%)
+ifneq ($(riscv-mtune),)
+KBUILD_CFLAGS += -mtune=$(riscv-mtune)
+endif
+
 ifeq ($(CONFIG_CMODEL_MEDLOW),y)
 	KBUILD_CFLAGS += -mcmodel=medlow
 endif
@@ -149,6 +154,15 @@ KBUILD_IMAGE				:= $(boot)/$(boot-image-y)
 libs-y += arch/riscv/lib/
 libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
 
+archprepare: checkmtune
+PHONY += checkmtune
+checkmtune:
+ifeq ($(CONFIG_RISCV_MTUNE_CUSTOM)$(riscv-mtune),y)
+	@echo '*** CONFIG_RISCV_MTUNE_CUSTOM is set but CONFIG_RISCV_MTUNE is empty.' >&2
+	@echo '*** Set the custom -mtune value or pick another CPU tuning.' >&2
+	@false
+endif
+
 ifeq ($(KBUILD_EXTMOD),)
 ifeq ($(CONFIG_MMU),y)
 prepare: vdso_prepare
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
