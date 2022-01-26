Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F49C2BA4C
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jan 2022 11:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKsQ+f0OX4/f2B1u7FrmfBgaAa08+bvwtocYE77I0i0=; b=xOF+uV3p/EdB/v
	XC4xhQtVznw1jkirpDeMXh2slmS57A7R2KA+DEjWglep9nEc8PYJIly76dhOPhzWaQpeNJqncAgG7
	v1xS7jJ50FABldrnE0B4BulLuKXa+znTE1I7aI8A23D9ZnGv87ollBQ++FUUMu+krRe8FLT+Di4Te
	Gm+arhyooK9Wr//oqsUXYMEnyZEoQwiFPm2y5ytORfTWTYFMVP7dW7nRQXdcROwDZ9gLW4XrhCi7U
	iO21u1Qr2KRGpujqv8FPVd0uAiC0ZDuN9D3AhTc92nhHA0J9OPWUHLepa0/kTvqB8Ub2kjvSo9sM0
	rfqw/lbgBLj/9a/fA86Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCgl1-00BYIt-Sg; Wed, 26 Jan 2022 11:46:35 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCgjq-00BXn5-IE
 for linux-riscv@lists.infradead.org; Wed, 26 Jan 2022 11:45:25 +0000
Received: by mail-pj1-x1031.google.com with SMTP id o11so5736913pjf.0
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 03:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+fhSSByGJ1StCm+oVdHQ6+iIgAeqBD8uGJ6nIDfD98Q=;
 b=Xh3abpUhKWutXSa5R1ZrcfayK4Iv8eorhSc5LPbUtCDbBFaBPa9kqT8qgAN7Phl8nU
 CgRXNkYUDQunBNy0SQFPU3KtLxi4nxKVsgyw1npo+bSHe/H7aRQobrLmSB2TwnU35k0O
 kju0hA7bIzlfmUL+MIGzuQRxAyP7rssltUN/QqFgxic+7sxSz+mSIAiJdpRhO7PRMd0y
 D8S7aUCAtEhuYBJecE11TgvnuE1237Ng9D32dCvoYNw57D5ci1E9lQVlxqJ9KARV940R
 J6qOe/dlg9eb1lWi2yiYIJ7wIzyN2rKRIw57gUVIFMPfEA5Nb41eT7R8VPyeoD1tCqX+
 azcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+fhSSByGJ1StCm+oVdHQ6+iIgAeqBD8uGJ6nIDfD98Q=;
 b=wRL+WxY8cUgX3vH2gSi5Gwhuo3NcuKZJ+3e0DyVShp9X7JsHyShI3S672eYRHVFsNv
 nr8uTlAFI3E6qXimC1/HCQq04D7TbOis4JfR868mesuXXtxmHabSLOjNOc9oYuoHEfdP
 lsIwtFwFeq45CEt6rFfTdeVp7N0Zf2b5gEjbd3Nh6E7kZQYQdgLaMpX/aVOa/WWQO9RE
 ARzneZN12P/vGuyc8E8niPRq4ie4/1UOk06My7UQYObJ0IWllK4qX+nah8HwP6IU5Kdt
 18FROH9dt21+hsPb4gEGDzyTZ78vXDhlHyVeIUTwl6iyKjvlKVzVFtUybXPSG3GVIVCB
 pgiA==
X-Gm-Message-State: AOAM531WSnkjVoIGvKimUO15yn83Yr/lSsBjD2ADZWMpaOYjbY+/xS5f
 3Ydo0bQ+oe+Qyh1L7lipIaE0hg==
X-Google-Smtp-Source: ABdhPJyRC3Dl4A/e6StezF1hozEQZSpNbbOMa429zzx/OGkYNb3FFKnDfVLh7Pv/0LpuLfdKVLTI3w==
X-Received: by 2002:a17:902:8544:b0:14a:bea3:1899 with SMTP id
 d4-20020a170902854400b0014abea31899mr22998561plo.143.1643197521827; 
 Wed, 26 Jan 2022 03:45:21 -0800 (PST)
Received: from localhost.localdomain ([122.167.221.23])
 by smtp.gmail.com with ESMTPSA id nn2sm2994976pjb.35.2022.01.26.03.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 03:45:21 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>
Cc: Sandeep Tripathy <milun.tripathy@gmail.com>,
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Liush <liush@allwinnertech.com>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvm-riscv@lists.infradead.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v10 2/8] RISC-V: Rename relocate() and make it global
Date: Wed, 26 Jan 2022 17:14:46 +0530
Message-Id: <20220126114452.692512-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126114452.692512-1-apatel@ventanamicro.com>
References: <20220126114452.692512-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_034522_643239_BBCBF428 
X-CRM114-Status: GOOD (  11.68  )
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

From: Anup Patel <anup.patel@wdc.com>

The low-level relocate() function enables mmu and relocates
execution to link-time addresses. We rename relocate() function
to relocate_enable_mmu() function which is more informative.

Also, the relocate_enable_mmu() function will be used in the
resume path when a CPU wakes-up from a non-retentive suspend
so we make it global symbol.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kernel/head.S | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 2363b43312fc..5f4c6b6c4974 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -90,7 +90,8 @@ pe_head_start:
 
 .align 2
 #ifdef CONFIG_MMU
-relocate:
+	.global relocate_enable_mmu
+relocate_enable_mmu:
 	/* Relocate return address */
 	la a1, kernel_map
 	XIP_FIXUP_OFFSET a1
@@ -185,7 +186,7 @@ secondary_start_sbi:
 	/* Enable virtual memory and relocate to virtual address */
 	la a0, swapper_pg_dir
 	XIP_FIXUP_OFFSET a0
-	call relocate
+	call relocate_enable_mmu
 #endif
 	call setup_trap_vector
 	tail smp_callin
@@ -329,7 +330,7 @@ clear_bss_done:
 #ifdef CONFIG_MMU
 	la a0, early_pg_dir
 	XIP_FIXUP_OFFSET a0
-	call relocate
+	call relocate_enable_mmu
 #endif /* CONFIG_MMU */
 
 	call setup_trap_vector
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
