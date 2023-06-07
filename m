Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA17C7EE29
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 11:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lTS2hQsSiBUp9m/U3GygLHwgfYNO6JtrYQFhDMCOD/A=; b=dLLT8fUOnY8Zyt
	zhzOH7yIVJOTRNPI6PxsWd9ppY1lumaBAM5r2SIrEGjGicYeTiRunXx4P5o/QQ45LxA3U/TINF7/Y
	lVi9yETl405p4v9JD3XDQ86wBxkg1h8sgvvGN/HySjpLf5vY+CuDi+fybLxtdBNNqn7d3qxxilSxE
	/k3QwapoxmDyB2wvoLw8cyHvvc/XuODmyxbEiYbBsYuE6m/UzmJkwAIpVxMC2x/DXCRGylNmCNUwm
	WPd3D9zvmjKzbkNdf4JpC9ORI2v9USuf+8ttbxrG5DUdluSbfZ3UrinDHYcDpSV8as5VxeyR24fCl
	3gNr96e1N63Unqfgcqmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rHB-005dWO-3D;
	Wed, 07 Jun 2023 11:24:30 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rH8-005dUk-2V
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 11:24:27 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b18474cbb6so41213805ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jun 2023 04:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686137063; x=1688729063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LGtnZpGFXHvJErq+5YtK1G5nmM14Ut0VvzTCKEVh8OU=;
        b=ZXPfj0MjALIQxgTK4JMLeMGsSYfskXD1OL6gUULavvmiWhruVGK1X8iKTKU6aNcHP9
         3NWAxVHqevzhgKtq+ae3/t5C9/Z2I+XpNDQRCQrXRK/IFlaqRP7V9MEbZrFik+2cFfnl
         Xyn84fjufio8oQyAYrL2hA3FA2Y+7P/ysZUh+RbuxHgaUkrcwil4OgygZnnrOFV+FG3+
         lQ/xYEGfobGRRaIJaKfs0Af4uMIyN7FszS2vRzyyGBSpoK/seZMDQ/BiCjnt555O2QnF
         s9bAoTVhBwbtnGALpC5Ka065glKJpymS7Rvp7kxFCP+ZFnBqqNNiGzpFp5UtHvimg0Fk
         hhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686137063; x=1688729063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGtnZpGFXHvJErq+5YtK1G5nmM14Ut0VvzTCKEVh8OU=;
        b=X7XnMfFvX/dI0SlHFd4ATU4Pv/i7oSzZfJds2d1fwMqZ+1twVuunIhF0dHHeLATNgb
         PCwSAfml/oJvNrKlBz+JD1zJb8Yr7Hbd2xYuJ1bCUkwdwbCHcX8GjVTiO37vYSjYUr0U
         lNgeQauM6i8hNTFnvDpuxdK5/8uVHMs68O9cuAJhxIeDvhqqaPY8q9FRJUF4tB7YxrEU
         2K9eGGp6m0ly2mmx9PDZ/hLmQ4VO27OMEVdBAByVIwGupEzvSpb/f1Im5fQnzlKdSrum
         EGO/MK3yotjIOqwn1xbbyFAuC1qqkNwTfEZvcsKvdUquyzJaRa4NX6svvowEMFgG85n4
         pncQ==
X-Gm-Message-State: AC+VfDzus766VweYa7kwMEqX0x8YwBN7cIGm11ucFtFEHlHWEJTVmW0h
	ViZPJs7dOSfbq9IxoGyaKE1jZstTxkGg6sBQx1Q=
X-Google-Smtp-Source: ACHHUZ6sATbQ1FwH9mwZ+Uz3V2RuFwNAayVWtafoqJ/+rV7t5PghA8X7YA8QPjBsx5ZhRGEhLUrqKg==
X-Received: by 2002:a17:902:f802:b0:1b1:8900:5211 with SMTP id ix2-20020a170902f80200b001b189005211mr2983874plb.28.1686137063635;
        Wed, 07 Jun 2023 04:24:23 -0700 (PDT)
Received: from kerodi.Dlink ([106.51.186.3])
        by smtp.gmail.com with ESMTPSA id o10-20020a1709026b0a00b001b2069072ccsm6228322plk.18.2023.06.07.04.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 04:24:23 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 -next 0/2] RISC-V ACPI: Assorted fixes
Date: Wed,  7 Jun 2023 16:54:15 +0530
Message-Id: <20230607112417.782085-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_042426_815680_D1AD2262 
X-CRM114-Status: GOOD (  10.33  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series fixes couple of issues required to complete the previously
merged basic ACPI support series.

1) Kernel test bot has found a new warning using the sparse tool. Though
I believe this warning exists for other architectures also,
I don't see an issue fixing this for RISC-V.

2) When sscofpmf extension is enabled, the perf driver tries to
find out the root INTC domain to register the over flow interrupt
handler. However, this function is DT based and needs to be enhanced
to work on ACPI based systems.

Changes since v1:
	1) Added "Fixes:" tag
	2) Added RB tag from Conor

Sunil V L (2):
  RISC-V: ACPI : Fix for usage of pointers in different address space
  RISC-V/perf: Use standard interface to get INTC domain

 arch/riscv/kernel/acpi.c     |  4 ++--
 drivers/perf/riscv_pmu_sbi.c | 17 ++---------------
 2 files changed, 4 insertions(+), 17 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
