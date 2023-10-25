Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FB6C25B6B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wNhUgLCqvinDW4y3DyjLkXmAouRgTRawC6VnjAd4kxw=; b=mmnLETZ5pqlkNs
	Lz3NkHjW7NhEGnQ2oDwDB06JvyPSWXQqYutvqIK5zh0+YwEU2v1suo0sUFz1NoFOebqL4n65QAGj0
	zT/PbNLZwMdIYWiEHMKARxAd5oPQ6ms78WlXS8vMJQxFwX+6CuKzHb04gRf3amyW3yt+aXn49wmun
	y+sZi2vlm/h5N2j0xqV3FWCmbQWLcttHMy5oSg4FTSI5ZclXWO14kcrMNBxQmQ6dCn047M7BhLiAB
	WK5fLsc5/JgcqoxpEWBUFC4NTjKhAeU/OE9epAPU23jCR34Th4jwtx4LTI+OPbts/0hO5ic9RcQo8
	BxM4H+Tdrkd3y1uwb+yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkQc-00D2dL-1X;
	Wed, 25 Oct 2023 20:24:34 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkQU-00D2ZF-2m
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:24:28 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6b20577ef7bso124559b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265466; x=1698870266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8oe0TQ1+zZd/3zKJQAEE+us/MvQWSBihayeSKyJW3A=;
        b=o0i0JxzCorSz1gKZL4H+AVqDeZ0IoYjH26SiR7bV2+xcnX93JQiNt6YngyIes7nKHs
         BVg8NVQsMkOHMqucPo6hUR0UBWBgNAaO+HglsOwZ4ZU8rGDDqmv8CXF0fM2o+l+gbsuK
         N+JzxghpJRohGXJPsuYh9B2W3RaeFw6M9Nkl4IttZwymyawOaQL6hJ1Xb7SVcuFwOGLf
         +gaxDUzwPa32MTOCh1HQ2xIb1knDKy0ww4dx/84DhFGaZKRekd3gFhM0p3WqNNovM9Xn
         kL+Pt57XP9X/zFGl02VWhypMLJ3WXC8HSbEFyV4yHLe2HXQJNGJf52Wfcqut0UBHLwf7
         dipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265466; x=1698870266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8oe0TQ1+zZd/3zKJQAEE+us/MvQWSBihayeSKyJW3A=;
        b=B4/hJu7e/JCMJc3tD3Ys1GakmAK9C9dpdL4BYle0bKSJM4LZQmBALwFcCg+XBqtokH
         rRjGkJbPvK/ntD53H99l3DxGolabOjl2lvEfW/hII8UsFPEdaFVJYzJpsTVfHyiDr9fM
         788miUn0JRQIhGyC75ZvwQxwrlU7RYqYNwWQ016CXKyK/yeVVSNSMUkVYNG629cpAOyf
         TiHZQSEGMPa8ro2xOb001Aeg7SncedQi4KMqJ6wgmpzvUEdz6p9BVldxQMvpK1j7LW5V
         SCnc/DTC7q/1IHI8YDxVTBbwNrNoqQHcifsySh8lwhFezbum4IWcaGmlUsLExHSKTCzD
         3FGQ==
X-Gm-Message-State: AOJu0YxnFm7pVOUuRUMDtOlcl3Tts7SuzcXemKRwI+ctb80fptRD2hYn
	DtKD2cLgl5sTmpF+E+7MwLIiLA==
X-Google-Smtp-Source: AGHT+IGK6pQK6oEdjKlIa1mcimdR1pYjb6u2hPifw5U79lxb+nCirP606/eGPYNlPkAaYdn6n6fpUw==
X-Received: by 2002:a05:6a00:12:b0:6c0:52b9:d448 with SMTP id h18-20020a056a00001200b006c052b9d448mr905573pfk.9.1698265465988;
        Wed, 25 Oct 2023 13:24:25 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:24:25 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 03/21] ACPI: Kconfig: Introduce new option to support deferred GSI probe
Date: Thu, 26 Oct 2023 01:53:26 +0530
Message-Id: <20231025202344.581132-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132426_900102_90807D3A 
X-CRM114-Status: GOOD (  11.19  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On some architectures like RISC-V, the interrupt controllers for Global
System Interrupts (GSI) are not probed early during boot. So, the
device drivers which need to register their GSI, need to be deferred
until the actual interrupt controller driver is probed. To reduce the
impact of such change, add a new CONFIG option which can be set only by
the architecture which needs deferred GSI probing.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index cee82b473dc5..4399e793f1d2 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -51,6 +51,9 @@ config ARCH_MIGHT_HAVE_ACPI_PDC
 config ACPI_GENERIC_GSI
 	bool
 
+config ARCH_ACPI_DEFERRED_GSI
+	bool
+
 config ACPI_SYSTEM_POWER_STATES_SUPPORT
 	bool
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
