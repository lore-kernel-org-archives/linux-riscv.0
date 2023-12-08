Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAFAC10F04
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 05:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V1JRZEgR/a43B126u55Ji+j4YX5L4LrRROGUagsLwT4=; b=FMWWAn8wEAnD2J
	OtBfsglZGgi2fyM5/mBR0O5e3vTC3qM1NM2Ufuv+m63BeXZJd1VgkdwE6c/SXdvh64T2xo3i+1LrT
	OYBivuZ3f6RW0OqT+NBrhE59nbpuvw6Mm2gavwJ27NVejWLccKMlXogVfs5VdmyfhLzYhEF0584J4
	mlDXeZgLw4JEzjXt7pEnPji4fQXdMotV4eUqeZ0pl4B+fRp6r0eyj4i86E17bTRkAAPTFWYG9ccTD
	Worj7R8Fwd0/V0ZYQ5m9NgnHgKUrVbyBpT0Dgpr9mWlI3gRNSZcYR6wzphDErnyNkSomwObonNGu6
	p/ZXIiuAW/SY0jT+dXGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpg-00EnnH-0t;
	Fri, 08 Dec 2023 05:55:28 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpO-00EnRH-1J
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 05:55:13 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6cedc988cf6so132700b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 21:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014909; x=1702619709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJ/tAo5hDwQPfRruz9afcRfXvkx00dxKddYKFVNcdvc=;
        b=jccfBESigWBjLCt/CBzQ5AFtMf/HijF3glv6eAocD+mJ2bzBWKnookAWCkrBs2BqR5
         +WzLQCEJURCdsFOHo1jG32gvs+teGNnII8qBdvveaobQ4i7bCZ7sHZtgehO8wa0MsVC9
         KPQa7PqTB3EX3M8+tEO5J+Hz3+Ou8uTFhEWpGCCxsBI3dis2yzdusKDiLxBSE8DqB3Ma
         oJkkTvC2TZjLNsmmmxSc6Wivcj5WjpwkhobmdS2gBQYA7nFl/EK5E3JKgNU24aXaduKk
         8cpTCKJhzdaXjNZWqx2N8/Yx/6J1Gz1QGeJv7siYcO5lyPF0KT0HZaLN7CAkcA9O8MQ9
         HsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014909; x=1702619709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJ/tAo5hDwQPfRruz9afcRfXvkx00dxKddYKFVNcdvc=;
        b=b1IqUAvbO+KxbHVDjm1vaBiV0hxAtnce/peKLpmP8IGU8RTJDC1ZyBdIOWPnBagE16
         Wp1oaXctT4NSmBm5e8CZeYwj4X6AKMjEC5IzRaHdnQQyk13cdAMOpK4OEN8/LLYOjqnu
         Yoc5kZu6h/h5LZgcDM/cuGXxhrxM7KCjEpwm1tEPWkFjU/B/vqtkrET40zMoIgk14fxm
         Z+nmLevrp7ie2J4SDwaOWB/5cMxA9Vj2hYx2BX9C8HY/q+Yakevr39YEwUZurXMAlg6w
         XTCgR12MHsf9Voprn9Sdycks6ONcoplkzYSmnNhStm+4O0XAlOLsAAGsLXMi0BTzVZ2u
         iHHw==
X-Gm-Message-State: AOJu0YwBlQB43+T3Bea7EAZDizhR9VZ7TBYtwQCH2iLv7lManJOLxqA0
	ITmwB/KAnlIqfryqqOV/iAVTSQ==
X-Google-Smtp-Source: AGHT+IHgMEmtold3cNsq0/10/gSamuXTn7dqDmNr7pkUJjR3cZZJuyMG6U/Bp0CgIPL33Lkbwgh+tw==
X-Received: by 2002:a05:6a20:4282:b0:181:74fe:ba83 with SMTP id o2-20020a056a20428200b0018174feba83mr4264495pzj.40.1702014909013;
        Thu, 07 Dec 2023 21:55:09 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:08 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH 05/12] lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Thu,  7 Dec 2023 21:54:35 -0800
Message-ID: <20231208055501.2916202-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208055501.2916202-1-samuel.holland@sifive.com>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_215510_478780_153D0030 
X-CRM114-Status: UNSURE (   8.71  )
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

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

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
