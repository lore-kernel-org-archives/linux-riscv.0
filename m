Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D1CC54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/SiJiF+S1PfFfSXLHu7LViVN+My225iPSC67vzp4r0=; b=miM9BExrToRdHU
	PU8Bp19skd2koMui8jBOv01ysr6UcVV39S8v3QxMazxOnAimBpTODt5fe6RGR0gOcNH+l3TQIacpX
	8yd8cPRWUquNwo4+uHbbL+UozW69lk4KPgHoDGNMSxaQLN+BkadAm7vrv0ot1EhX/5Cmr38uJ8W+N
	KFE6eVUnMJh4p34XhjaUnRsrd/3aNt9L29ohAnOBVM+GzkeYl4zAxN+JyX8p44BtGAS6/ZNoRWDzZ
	0Dg4rKX7acMs6OXaswsl9d5HDMqHnyzdquKrSzhWmq1JgdTV7akdUsuqfE7tt5iFj7fS0Pfas45RR
	HLBFPcUJnU/6MPvl3YHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYqJ-004y33-Bz; Mon, 30 Jan 2023 18:25:23 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYo8-004wxh-L0
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:23:10 +0000
Received: by mail-pj1-x102e.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso16394774pjj.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucIkerkqr4QmI5UkdMXW8uEBrl0PvtR2G4Rv/JZMzew=;
        b=GhrwpBT3N31+nOt/CtgKmnAGMi653hgs/75GWs74Cqht6JG/AUohZ9ARL3pkvdkfmj
         GGOZc26wqFHqO7mxkcg3Ji/bn0HnDTjs+diwm80n7Jus44aORApx5bQiKn82JGyfTCYv
         hLqZbyZnw2mPfz9cuau3/Zw6fHKe0n82KCiDP07hBTERsyddqX5tlDZsMxgaTW1bTNpo
         KxuF/f6QYreKfafdgIWZX2SL50FtFfyns379QlTz0qZo60LNmMpt4E2ApfVNvqyuC5TA
         bTk7rP8MGgWtYVewzHcJEdMTwddvaOYKbkRdF7nMfjQRFzmhTRP94xlgUWzIEO/hT95a
         UI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucIkerkqr4QmI5UkdMXW8uEBrl0PvtR2G4Rv/JZMzew=;
        b=6EHsfwbCuw26cQNYgPKlgCeEZsk7XcWVzs9+YXWNGMX8zPcZH5CqXMyFb68TTYAlp8
         cQuHdYbx6rEr+DHXQQkKhT8oD4/i0k1Hzl/xfBMHwfCPP0qnvBdrEezhwt76ChkikVy0
         /IF5Lfg9l87jKwUV0U5OaADsyeUZUDs0uMDLcf8dgj3zz3A/SFlkurDAB0H7zGLmXvhh
         BzaF4v+Ta5V+LsXarQlMOpz3jkTn6666Oto+8g/Fpgb9ojSnd/PyJ0wQOEdWiNGgubCJ
         Qu3tQbJjWgzFv4/1B1N9/rJF6jNnM8fw4orkZkrUCwT8O8Nr+AwlafaChZk53YxY1gte
         fz/w==
X-Gm-Message-State: AFqh2krZdMTjdE1vfKuZEPLERioO/+Q6+WyuQ4VHGYFANn6xxAmclQl2
	aG8hWTvpAGMIzUYVwwU1hc7p4g==
X-Google-Smtp-Source: AMrXdXuB44m0KVUm0j9aNOAU3dJJ68bswZ8ULTfSewfLquMpMN9Q/ZK2SmPbqXYnMOJ4+lGGcK7FKA==
X-Received: by 2002:a17:90b:348e:b0:229:5cab:67a8 with SMTP id kd14-20020a17090b348e00b002295cab67a8mr52332355pjb.24.1675102986650;
        Mon, 30 Jan 2023 10:23:06 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:23:05 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 07/24] RISC-V: ACPI: Enable ACPI build infrastructure
Date: Mon, 30 Jan 2023 23:52:08 +0530
Message-Id: <20230130182225.2471414-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102308_745332_018D86A4 
X-CRM114-Status: UNSURE (   8.22  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable build infrastructure to add ACPI support for
RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d153e1cd890b..f664350679bc 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -12,6 +12,9 @@ config 32BIT
 
 config RISCV
 	def_bool y
+	select ACPI_GENERIC_GSI if ACPI
+	select ACPI_MCFG if (ACPI && PCI)
+	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
 	select ARCH_CLOCKSOURCE_INIT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
@@ -598,6 +601,7 @@ config EFI_STUB
 config EFI
 	bool "UEFI runtime support"
 	depends on OF && !XIP_KERNEL
+	select ARCH_SUPPORTS_ACPI if 64BIT
 	select LIBFDT
 	select UCS2_STRING
 	select EFI_PARAMS_FROM_FDT
@@ -703,3 +707,4 @@ source "drivers/cpufreq/Kconfig"
 endmenu # "CPU Power Management"
 
 source "arch/riscv/kvm/Kconfig"
+source "drivers/acpi/Kconfig"
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
