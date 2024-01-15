Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43069C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 10:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gz8m+0OsPZCpAaoVQ6BHL98Xw4s454LIvakCNSyf07Q=; b=l9MNlyyM15L6zq
	BOuArCJt+wkIfXtejN9pcW+WweYR6So8GOmYltAK8c6NpsyPtlNh4N1x7vFtTs/itWTXVsKuK9rUM
	Nd9YNVfp3ksWGIJecH1DnYlAOXpeehPDqz0lEGd2eqzKus7y9IoLPl751LdzCxZnRNi/vBg8pFDL8
	cCVCN4A6h+KwFB5nc+6sE467PMvoJfIvevQJhIWAP71UFY5xvicwe3vTvrYNT8F6yPO+oPMPW5kIU
	0ZYYYRUnXszapd7iUS25J8kfVV8zmba/hZgr52qdmNWi3riBL8Gk0RHj5emytKr0ZRcYQ2ToD/fV7
	IiLmZoaNKDYLk+HQ54TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJvz-008XTp-0y;
	Mon, 15 Jan 2024 10:11:11 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJvw-008XTQ-0U
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 10:11:10 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5961a2726aaso4651230eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 02:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705313466; x=1705918266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+D1l7MDJ7PqRKV1gRx82cPii/0bkhIwCmY25QP/RxaE=;
        b=kqzu2UzoU7yt1d4zKjvXujfBzYKffQDuXhqRjnwpxW4L5ARk/IOMXaakxp/B3Uas46
         hBYc+44uJBIJc0UsndG0tBy8cF8jw+YcFliPA3bNSIHrACXqQ9IlCclxoSAWF12KR/u5
         i5jwYOqKEz1px59w0llAb3s4pZP5Jqy0dGNVpFV7Cfs09CRriA9oj6ZxfMxKIXN8hCmB
         prrCgGzAEK3nsXdb0xUF27RLN1ExHg5oen5LJz8FcPTLCYlaZH/zdFAt+GObuc3hXEWS
         qd5FhfHDHjBtMmyxpOEV1QA1Q2K6H3Lr8gWE8zP53K3wJb0Tx9K/0cg54jNoMfCcac1z
         M3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705313466; x=1705918266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+D1l7MDJ7PqRKV1gRx82cPii/0bkhIwCmY25QP/RxaE=;
        b=Ax+4AIiSrWPA7T+LJUeZVRnlxOzW5IFqYIk/qAiJantQsRIwsMpiWojsTOJXrb+6Z0
         PDgWeQhXrkU9IxPTLn7ri0pUBsaPCL7j12QEht91jHvhMGrLheGISvgeo2gNyUIhzPwR
         DwlAqztUjuBmzWObAJn9vMZ1x48NNp/6n3IoSqBnF7K9+x5gPymXNVKbFlVTTW8KM9fu
         FaF49hiAZPp5DVa5n3S5XPB+Zsmx1/Fnc49yGfvMKe4Tfg8pUy+kce1wEFkb7k5WZSf4
         gE0PFu3lJZyS9aXZUWLDMvibpcjqY84cXcGN7DnQDcR3By88oVbgGeafV7m0BdWIdC1Z
         iR1Q==
X-Gm-Message-State: AOJu0Yymi6Z10uPNDojEfkBqtK8x1lenHOqzQRvL1lqR3XKvo3MsY/vB
	KFdU03rzKYaHiDb/QHrwhevOOZTS5x+8hQ==
X-Google-Smtp-Source: AGHT+IF47ROODJD0FnkWocuvC9yXVXK34tP9aIvQB8RqdRDE264JjbYTVF4hhoy3J/3GEi8o7KQVOg==
X-Received: by 2002:a05:6359:6b81:b0:170:64cd:8aac with SMTP id ta1-20020a0563596b8100b0017064cd8aacmr3471927rwb.62.1705313465983;
        Mon, 15 Jan 2024 02:11:05 -0800 (PST)
Received: from localhost.localdomain ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id u5-20020aa78385000000b006d9b8572e77sm7348256pfm.120.2024.01.15.02.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 02:11:05 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 -next 0/3] RISC-V: ACPI: Add LPI support
Date: Mon, 15 Jan 2024 15:40:53 +0530
Message-Id: <20240115101056.429471-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_021108_202564_A6A6FA98 
X-CRM114-Status: UNSURE (   9.39  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds support for Low Power Idle (LPI) on ACPI based
platforms. 

LPI is described in the ACPI spec [1]. RISC-V FFH spec required to
enable this is available at [2].

[1] - https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#lpi-low-power-idle-states 
[2] - https://github.com/riscv-non-isa/riscv-acpi-ffh/releases/download/v/riscv-ffh.pdf

Changes since v1:
	1) Reordered the commits such that the patch which enables
	   ACPI_PROCESSOR is the last one in the series.
	2) Used GENMASK and other changes to address Drew's comments.
	3) Moved common functions required by both DT and ACPI based cpuidle
	   drivers from the DT driver to common arch/riscv/suspend.c.
	4) ACPI cpuidle driver is added under drivers/acpi/riscv
	5) Rebased to latest for-next branch of linux-riscv.

Sunil V L (3):
  cpuidle: RISC-V: Move few functions to arch/riscv
  ACPI: RISC-V: Add LPI driver
  ACPI: Enable ACPI_PROCESSOR for RISC-V

 arch/riscv/include/asm/suspend.h    |  3 ++
 arch/riscv/kernel/suspend.c         | 47 +++++++++++++++++
 drivers/acpi/Kconfig                |  2 +-
 drivers/acpi/riscv/Makefile         |  3 +-
 drivers/acpi/riscv/cpuidle.c        | 81 +++++++++++++++++++++++++++++
 drivers/cpuidle/cpuidle-riscv-sbi.c | 41 +--------------
 6 files changed, 135 insertions(+), 42 deletions(-)
 create mode 100644 drivers/acpi/riscv/cpuidle.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
