Return-Path: <SRS0=1Rer=6F=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90450C54FC9
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2020 03:34:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 628302084D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2020 03:34:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h/gri1pJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="jTikW79U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 628302084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tttd728ZR7pfChiGqdkLPg42rQ3qB92mFJUxcj2QtZ0=; b=h/gri1pJ5GRGR3
	VxbDGrGQ3Kt9uju65vVgu5whEQfE8/n4Bj4QasvDuHBq0xsMLQilYz/Xs98WfjSPd/ElMVkU4dlEd
	mRTaROvLoiKRVZEsDqv+O1a9Q8punrl/W2GwfiZ108TvXIxtAwyvWqXnhZPCuzukJ+3S4kF0MeOg8
	//5eASNcDOYsGLEgRWES320BLWGvHb1imNbZBOEJNGVsFXVDOCbLYt5+owrllHW2ZmmonuV9r8QrH
	BmYNmxYgH8pK49irc2nGJhNw3ZQboCWXy9I+yeJh4kW/aYYV4ZOuu0ewHXBgQ8eNWdMJIs/9rWCQ3
	uNXy6bzmeRF1zSvOafxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQjgS-0005Oe-PF; Tue, 21 Apr 2020 03:34:52 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQjgN-0005Hj-Ew
 for linux-riscv@lists.infradead.org; Tue, 21 Apr 2020 03:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1587440087; x=1618976087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I/GiEGyOV5rt1rc9GnsBz8XcyhOtNk7wcIG4+FIGGnk=;
 b=jTikW79UnrqXbHmAbyAsFEwx7kvqoXRKcwvJiAF54MuPh12xWkBLP490
 UezPaFroap1wU39fnuPBnbm8ZknFBBKqGDRb5xZHBJeXsusBVG9RlT/6z
 VA34hhxmJz+3IagLvssYgUBVIn1+kOOCsRw3ansfs4x6Hw5d5+RzllKGd
 hhb5F3Ixa8rWyRmzPRmHnrreVIrcocouXc09ES1vv4z0u8f+toL8lNufP
 quwMjD+aHJvhYfkutnLFwAVpz9JdrbJuio1CpoEceV48LwzmrLNXRZN5Z
 KoWbRwROX0v08kpI2aVkb6QgkX9lAnHTnuKo3pAiFKYkaLONC5KwI+DWp Q==;
IronPort-SDR: kVdBuVZC1HClqzI8WNiO8d0bTGD0yEW3QA+Cd8BijxKYn+k9VJE7/iJvOz+NfwVbcgw7+fgmDQ
 zO/enCeXTkJL4A4zuR2J8VW8Dt/8h42e8Dxnk23of43+TrED7VnKPF1qlW1SHplOKcooIch7tc
 5qE1Z6W9awgqy1dhRtFgVhIWzFPWdTuvR5HbdfIMatUa+MygS0bO8/JstyxBwdxVZM3v0pNyb+
 gp4ilCboj60wbuy22OJNzPJgvm8bTMemDZtPkTiKIMJpbA7OZORskTVXwB7yNTJdxBW64Ri93y
 MbI=
X-IronPort-AV: E=Sophos;i="5.72,408,1580745600"; d="scan'208";a="244467799"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2020 11:34:40 +0800
IronPort-SDR: BwMsO/QgjNrHhnvigliJSju+ZR5EDWJdCtiA4k01JwwMUP6k97+OweqjZLDv2l5mLhQM4pZGSb
 EIYvobcRl1CgLvznaJaRjZcDA4h72gq44=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 20:25:33 -0700
IronPort-SDR: JHXhkEYX0dItTAnPSBCVKUVOxNJyRjpf94xhTOczzjC6ML719tFFoZzHv1IQxaqLAidjFJO2SL
 S55lxNyUI0SA==
WDCIronportException: Internal
Received: from hqe220030.ad.shared (HELO jedi-01.hgst.com) ([10.86.56.34])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 Apr 2020 20:34:41 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [v4 PATCH 1/3] RISC-V: Define fixmap bindings for generic early
 ioremap support
Date: Mon, 20 Apr 2020 20:33:34 -0700
Message-Id: <20200421033336.9663-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200421033336.9663-1-atish.patra@wdc.com>
References: <20200421033336.9663-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_203447_512330_F94987A5 
X-CRM114-Status: GOOD (  10.77  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-efi@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

UEFI uses early IO or memory mappings for runtime services before
normal ioremap() is usable. This patch only adds minimum necessary
fixmap bindings and headers for generic ioremap support to work.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/Kconfig              |  1 +
 arch/riscv/include/asm/Kbuild   |  1 +
 arch/riscv/include/asm/fixmap.h | 18 ++++++++++++++++++
 arch/riscv/include/asm/io.h     |  1 +
 4 files changed, 21 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a197258595ef..f39e326a7a42 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -68,6 +68,7 @@ config RISCV
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select HAVE_COPY_THREAD_TLS
 	select HAVE_ARCH_KASAN if MMU && 64BIT
+	select GENERIC_EARLY_IOREMAP
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 3d9410bb4de0..59dd7be55005 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+generic-y += early_ioremap.h
 generic-y += extable.h
 generic-y += flat.h
 generic-y += kvm_para.h
diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 2368d49eb4ef..ba5096d65fb0 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -30,6 +30,24 @@ enum fixed_addresses {
 	FIX_TEXT_POKE1,
 	FIX_TEXT_POKE0,
 	FIX_EARLYCON_MEM_BASE,
+	/*
+	 * Make sure that it is 2MB aligned.
+	 */
+#define NR_FIX_SZ_2M	(SZ_2M / PAGE_SIZE)
+	FIX_THOLE = NR_FIX_SZ_2M - FIX_PMD - 1,
+
+	__end_of_permanent_fixed_addresses,
+	/*
+	 * Temporary boot-time mappings, used by early_ioremap(),
+	 * before ioremap() is functional.
+	 */
+#define NR_FIX_BTMAPS		(SZ_256K / PAGE_SIZE)
+#define FIX_BTMAPS_SLOTS	7
+#define TOTAL_FIX_BTMAPS	(NR_FIX_BTMAPS * FIX_BTMAPS_SLOTS)
+
+	FIX_BTMAP_END = __end_of_permanent_fixed_addresses,
+	FIX_BTMAP_BEGIN = FIX_BTMAP_END + TOTAL_FIX_BTMAPS - 1,
+
 	__end_of_fixed_addresses
 };
 
diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 0f477206a4ed..047f414b6948 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -14,6 +14,7 @@
 #include <linux/types.h>
 #include <asm/mmiowb.h>
 #include <asm/pgtable.h>
+#include <asm/early_ioremap.h>
 
 /*
  * MMIO access functions are separated out to break dependency cycles
-- 
2.24.0


