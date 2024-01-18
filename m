Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E76C4707B
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 06:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SZCP8WttY0ixyRl3T3+H098GhCKXMNbo50lH9a2ycUc=; b=vJgDxVh9nlReqr
	hQAeY7W5Q4AAuf5MhrR7J/RddhIABxiU4bZQImxQh+N6CRQ9YNj9m08/tRiIQGMGRruxwRxgjzmnb
	v279lAWXZYo+0N6Xu1T1B+y2sMoAz4Wi1BYWRzxRa+zaKLkt+YKbF8JAZFxYDVH6+9fyi2j1c3XmG
	gbO0h2zP4gFl/wrLUE9tLugCckCIpQabVQFmy8o/qrRV+Hu4FS4n7A1v2nTN6vA4+73Xo9acPC8iK
	5jNm6AEm2WR6/hZ7PwkAudXyvKmlu8SETSFZoC6zJcwpmwcC7oBSmRLn/fYa/es9ndqxVJxdivDAg
	RT79AAXUKLjwVGuuVv8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQLuL-001nEo-24;
	Thu, 18 Jan 2024 06:29:45 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQLuI-001nET-2X
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 06:29:44 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-7ba9f1cfe94so8572539f.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jan 2024 22:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705559380; x=1706164180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nKRSRDgZCX0qZ4H/CNTVQl9+01tMfjOuLKW5Fu3dbqs=;
        b=c+4aBufE35v26u2g+NN+M7ATkGwI5qLxY0JHggvl07PsMcydPVX8sgUUpMf69zZe9e
         ApM1bAazm2h5Gaa2Z4gXkv3HfdElCyTwTxppjZYF4D+Pg8JSdt/LgL/PhCjs+qQNbe31
         ftEk1UXlJV0Z/DMxIm1BVxOW5zYr9jDmpGbBQj1H3+j3MeVdRtRFmMvb+T114yGE4iO5
         5HN5UTYEsMybXhvKBs/y8xRCwQTVhQpfVkAnHwC9Ieszw8KMh2PZAyFf0RJUBYN31n2P
         0lfVuM70Ai5TFVOXkvwdRWrrB6hH75WC3GnuAUy9Mfljq7EdddcnTWpZn2KrDyJL/uRu
         xS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705559380; x=1706164180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKRSRDgZCX0qZ4H/CNTVQl9+01tMfjOuLKW5Fu3dbqs=;
        b=hrKyZTd0SEuXXXoQtzNcNUsPyU+vqb6+akiv81mQvnulcvxrIndf90NyQ+zDYRLoUc
         OpA49G1VeMWCh/eQcAdCMxUVV9JG+Lpne1HU6DQYXRdD96hFQ7Zv9tnNCn4Qp6xfbE1s
         CV+Q4ekg5XIV8bHgZSQaFxs4TTjZ8jnFm2kR4wThZr2K/DHfXKkGFK+yM42la9Te3Skn
         2DHG1XAl2a3HFpDFYLU/2ZIdwRnChjNpBMfI5DqMI/QXszQo6DYx8WisbIDI1Z0PrGnK
         ZO+pthvpn8xY5ANu2IaltAGJlTOdIdVk3BkahYc79wzdOK8yDiK5Q/Qky1klF3lTH/8m
         +vwA==
X-Gm-Message-State: AOJu0YzDicDpa9K1xbYHAgy7DDCJPYikzXDJArzrJtlp/iK/woOYk9bj
	K+aJvqAWnJNihul0kiptak33VQlIDDv15jzOXnP3yFtoX28ghXmuzF9VibKHkUI=
X-Google-Smtp-Source: AGHT+IG1KliUgFB2bTNUn2Iwg2xlnQseSG6/fqem8LxM9mRgfpKIp7Pca72j/MOfj5keAZE9edU4lQ==
X-Received: by 2002:a92:c844:0:b0:35f:e0a7:888a with SMTP id b4-20020a92c844000000b0035fe0a7888amr360581ilq.21.1705559380680;
        Wed, 17 Jan 2024 22:29:40 -0800 (PST)
Received: from sunil-laptop.dc1.ventanamicro.com ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id bn28-20020a056e02339c00b0035fec699584sm4663269ilb.13.2024.01.17.22.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 22:29:40 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v3 -next 0/3] RISC-V: ACPI: Add LPI support
Date: Thu, 18 Jan 2024 11:59:27 +0530
Message-Id: <20240118062930.245937-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_222942_852482_0DF291CD 
X-CRM114-Status: UNSURE (   9.08  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
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

Changes since v2:
	1) Added "riscv_" prefix for functions made non static (Feedback from Drew)
	2) Added RB tags from Drew.
	
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
 arch/riscv/kernel/suspend.c         | 49 +++++++++++++++++
 drivers/acpi/Kconfig                |  2 +-
 drivers/acpi/riscv/Makefile         |  3 +-
 drivers/acpi/riscv/cpuidle.c        | 81 +++++++++++++++++++++++++++++
 drivers/cpuidle/cpuidle-riscv-sbi.c | 49 ++---------------
 6 files changed, 141 insertions(+), 46 deletions(-)
 create mode 100644 drivers/acpi/riscv/cpuidle.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
