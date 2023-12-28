Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D03EC46CD4
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 01:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Phn7Pf+lSDryyFMWm++aW6OI0bQIZnTCa5iik2u9OY=; b=jjqVRzXOaVrTcE
	NHENDyULQtqTM+fg1DT0X2C72WArY9l8yHJMx18w9X99mVtK7DqLl2UcWJrknwxynpTpcxvDQOenN
	AJD2HlDfUIedv3rWPj28baLzRylxEaEU0m6b9yB/2MYNtAxSoj+7C3EbRdfjf7DA8KBKnbAus/U5+
	YdM3ory3+PEd1wQPDQYT7tg9U8ykCaKtEfxN8rRx8rFZbEDdpHMMpmDcgz7p+y5ij73/3xFrMTfqo
	q7WdBvvavdEob0cPOz3w24hYTEUsNPSnzOvVIDBVXBvlu5Sw26nOi9AusmexrCu+v6fZ+45zHSjY2
	b9PgOPBisLgPXIuyxH/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfQM-00FsFj-2p;
	Thu, 28 Dec 2023 01:43:02 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfPq-00Fro0-2F
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 01:42:35 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6d9b51093a0so2268797b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Dec 2023 17:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727750; x=1704332550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jd6BNzjMN3b9R+N9FmyfxlTWIL2mCpzUIRSa4mv1F0=;
        b=ei+qQh+Mhinnda5sG5ZDYgK6J1hbU1PZF5EurPHUChrXL7SAkNdymOz3mUq7lGwanZ
         GbW+h+SotZ7Udcz71qYp7RplsGCpQflv8UNfmhqYp6ui+b5ILy4wetuou7kK0WBTl3Hr
         r/HHz2spFudYQudC6jbGxlva7a5cHuiqVGs3MdZEDBMUNAfEAkwmEhmLHR1wG+jIsLwZ
         QGOJBYxIEWqidiAE8UJNGLPkLuArFmeHeTZwAfaDPM8b8OquNoF6eytkHDgPELPr5bMY
         qHLGuhpdPmf8y0ZvcCGz56eqxDf+z3GRDh35TGB2k1jRHPNKHM2J0wLDmpNZ0kIiFfZB
         2SYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727750; x=1704332550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jd6BNzjMN3b9R+N9FmyfxlTWIL2mCpzUIRSa4mv1F0=;
        b=tVNmSlmXIIb7zrzRMRZqHRBLSOHU5Xfv8hULSif07EEN8wesZ1NDNfYlu4732m6Bol
         +DKcJvoiRYU84dm0y9PR6t9eoGs+aOGiwx6YZN14mAWs2DYILgSj5SRPo9MLIuRRIVQR
         WuB1K+6t8ptM6ABzd0OyMxO3DmKEZ8f/IBAPuAyadnSo6yfdtSA3ID0UY17QN03RvN/M
         kAEvd4vNlzxU2J7PfXtWdONhzJAttnZ3xrq2PMkOACgNwN+Tsdt3i3XMXsUHY5ZesHZJ
         MZGQZQCJly16Gd57qGTNVRzAVEEVPIA/GnoTCRPPnpr6b2eQYpJggRPYFyJDXo0B68j5
         wy5w==
X-Gm-Message-State: AOJu0YwaaKcXhb3kuIYdtQmiLXCCKDciupuuPDtUWhyjGw7gIeWZeNfp
	/haxdVhPkR0jBst/bJC90hdSLA9BuLVY+Q==
X-Google-Smtp-Source: AGHT+IE0nmjtDXMxXkCsxA9jA/OWEHDhYnPM1dnj251PyNU2gTBGhxX93h+FmlGsyJJp6FOxSnIuVA==
X-Received: by 2002:a05:6a00:214d:b0:6d9:f66a:b5f6 with SMTP id o13-20020a056a00214d00b006d9f66ab5f6mr2059083pfk.34.1703727750207;
        Wed, 27 Dec 2023 17:42:30 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:29 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 06/14] lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Wed, 27 Dec 2023 17:41:56 -0800
Message-ID: <20231228014220.3562640-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_174230_759658_93F4AC1F 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

Now that CC_FLAGS_FPU is exported and can be used anywhere in the source
tree, use it instead of duplicating the flags here.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 lib/raid6/Makefile | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index 1c5420ff254e..309fea97efc6 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -33,25 +33,6 @@ CFLAGS_REMOVE_vpermxor8.o += -msoft-float
 endif
 endif
 
-# The GCC option -ffreestanding is required in order to compile code containing
-# ARM/NEON intrinsics in a non C99-compliant environment (such as the kernel)
-ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
-NEON_FLAGS := -ffreestanding
-# Enable <arm_neon.h>
-NEON_FLAGS += -isystem $(shell $(CC) -print-file-name=include)
-ifeq ($(ARCH),arm)
-NEON_FLAGS += -march=armv7-a -mfloat-abi=softfp -mfpu=neon
-endif
-CFLAGS_recov_neon_inner.o += $(NEON_FLAGS)
-ifeq ($(ARCH),arm64)
-CFLAGS_REMOVE_recov_neon_inner.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon1.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon2.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon4.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon8.o += -mgeneral-regs-only
-endif
-endif
-
 quiet_cmd_unroll = UNROLL  $@
       cmd_unroll = $(AWK) -v N=$* -f $(srctree)/$(src)/unroll.awk < $< > $@
 
@@ -75,10 +56,14 @@ targets += vpermxor1.c vpermxor2.c vpermxor4.c vpermxor8.c
 $(obj)/vpermxor%.c: $(src)/vpermxor.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
 
-CFLAGS_neon1.o += $(NEON_FLAGS)
-CFLAGS_neon2.o += $(NEON_FLAGS)
-CFLAGS_neon4.o += $(NEON_FLAGS)
-CFLAGS_neon8.o += $(NEON_FLAGS)
+CFLAGS_neon1.o += $(CC_FLAGS_FPU)
+CFLAGS_neon2.o += $(CC_FLAGS_FPU)
+CFLAGS_neon4.o += $(CC_FLAGS_FPU)
+CFLAGS_neon8.o += $(CC_FLAGS_FPU)
+CFLAGS_REMOVE_neon1.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon2.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon4.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon8.o += $(CC_FLAGS_NO_FPU)
 targets += neon1.c neon2.c neon4.c neon8.c
 $(obj)/neon%.c: $(src)/neon.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
