Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D456E7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 08:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x4t8N23RNpW6qBW/P0PlObd4XWpsR38VJt7sofXX8S8=; b=HI5Jq0KWQP72a9
	+k5ST5kYvFO6cobkeYmw4IUYCgpMtDfFv88SW7fa2pB3qSH4CWs7gZ18VPaPh1UFGrjlbnAY/6KtI
	oknnf7xBsQbOpoEDv2g7im5Uh9EXfFObkhGljh/qW5qt06SBkGX6XGQn/Izoo/GYu4Wvqb9xJ5Huo
	iNb/BXBpZdAQGjI566Ap3rjuAQCwv5BnrqL+CkKzeO2fS5gO6TNHm7S4cq5H1K51TKOzglOr/Z/2/
	5A5iLcpaQK6+P/zNZSfhHQKzoJ4+pfFou67AhPIBW4BIWIZuO01KRDB8JFdE0Hd6TVI0jegD5uiQn
	Up5kIBh3AJA6NF5pg+sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6mM-00000009RF8-3q43;
	Mon, 16 Dec 2024 08:48:38 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6mJ-00000009RET-3VyG
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 08:48:37 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21628b3fe7dso28852305ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2024 00:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734338914; x=1734943714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZPlunLBlln7QYb6AUUO3djXlFosdjLIQj/QlK3o4jU=;
        b=lgLvKdfqEaBSZkxJFbrQmQnVOcUL8f0ROTuyaWZtOifEIhPJmytf69TOPqKBq8Flab
         BgkhsC8O2C4FVwD6RU5dZ01CHHBrZsTravDVEW1oeueTgXpGlXZOe8WmGQSzealY9bjZ
         WxgUtIA3weT63jVrpUd7TUf8MmAFy2DYr8PZ2Ceg5flvO88M2zLHqli6B+nvoU0lg5E0
         Zj77iDZQNx83JDvrIwK86vazDIbwo5HN1nt559ulTwNtS+q/fq//bTjGoruQuy6drUa2
         qOxWe5oT1ISKFuUrLigEwctiIMRL85rr0kCVdRJA9w1r5NScPKImjxi27rENEBQE0qui
         kJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734338914; x=1734943714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZPlunLBlln7QYb6AUUO3djXlFosdjLIQj/QlK3o4jU=;
        b=JVFWShY1IvoGHVuwhBC9sTy080qckmxSa8ApTmg+awjqmFVXnsvk8mtLdMCQiX8cVD
         ozwUwNcZrBL8YUHnB2nc3IWicpQOPFTg8r0qZRCRH5LbPKgu0fF91BpFn3+Vg4t4zIoa
         cVb0sxCyRgvWMy54VQJ/2Og1gnEHanL3Ekz4nLSA20oWjHsKjH6UE7ojw0MxggI/ms7e
         JbuwmpDSC4Fk6x7dSaKknTteAIVYe2y6j4CSNvPX/5rePa6viedK5QuvUtcCEDnyU8Wm
         BE/JPkxMlgLxq8r5Gi/JNj5aJ/VXIqAgdytT7+hDs1Spcl+YYLoJgRtA0hc4bN6uyMAI
         Qqdw==
X-Forwarded-Encrypted: i=1; AJvYcCVbAkQ7kT65Hi1TcybV8z2AqTYaSfuYyg8UWM1dy1sf/iTeoHgQpBLm7PknbeWerufptmDUqh0Z7dLn1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXXmshBcu/1p5/5HeWR+JLtassvX2kNR1c6jwis70iqcxnr616
	O1Fx0Irps5ojA6DY4uK2CvERQOR51qLjbqebf+5/ituUVjfGAGB/NYFcxIoj59g=
X-Gm-Gg: ASbGncts6cRtMiLEHr2FORBJmuQMkjaay82icvCA3Z+3mgq5fSzRYgXoJ7BPhfOLZbC
	qChPzQQxRHd76XEha8paisjztuiRlJ5TO4mMCy+E2jIU8YLj7kV4vVmIq6pe0CNJpe0fp5UOJv0
	MkDYcWC6jVOZRs645EcI0Ju7wS5Ddu8D2JcEL/ZqZvUT1QjQAE+I9SkvezNsDqITbwGc5v8pEMe
	1jXZ/jNsGH/2dP86YCfzfPuO2m3GySKEG5nHlZ6/Qq4Jb3WCqJZfQO/ZAXN+zeD7lFrQ2/+QbrJ
	DZlK6mHt8vobzSg=
X-Google-Smtp-Source: AGHT+IFoNCn1xjwdvfD5tU8wcob3LmcqUZZYdSpRKH7XSPi+k1Q2z7DhQmm+kma0y1vvzp+aMNnp1w==
X-Received: by 2002:a17:902:e84f:b0:212:514:b30a with SMTP id d9443c01a7336-218929808c8mr181238975ad.12.1734338914542;
        Mon, 16 Dec 2024 00:48:34 -0800 (PST)
Received: from localhost.localdomain ([223.185.130.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e501d0sm37711495ad.116.2024.12.16.00.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:48:33 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [RFC PATCH 0/8] Linux SBI MPXY and RPMI drivers
Date: Mon, 16 Dec 2024 14:18:09 +0530
Message-ID: <20241216084817.373131-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_004835_881177_FD862706 
X-CRM114-Status: GOOD (  14.27  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The SBI v3.0 MPXY extension [1] and RPMI v1.0 [2] specifications are
in stable state and under ARC review at the RISC-V International so
as part of the RVI process we would like to receive an early feedback
on the device tree bindings and mailbox drivers hence this series.

Currently, most of the RPMI and MPXY drivers are in OpenSBI whereas
for Linux only has SBI MPXY mailbox controller driver and RPMI clock
driver. This series will be expanded in the future to include some
more RPMI drivers and ACPI support.

These patches can be found in the riscv_sbi_mpxy_mailbox_v1 branch at:
https://github.com/avpatel/linux.git

To test these patches, boot Linux on "virt,rpmi=on" machine with
latest OpenSBI and QEMU from the dev-upstream QEMU branch at:
https://github.com/ventanamicro/qemu.git

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
[2] https://github.com/riscv-non-isa/riscv-rpmi/releases

Anup Patel (7):
  riscv: Add new error codes defined by SBI v3.0
  dt-bindings: mailbox: Add bindings for RPMI shared memory transport
  dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
  RISC-V: Add defines for the SBI message proxy extension
  mailbox: Add common header for RPMI messages sent via mailbox
  mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox driver
  dt-bindings: clock: Add bindings for RISC-V RPMI clock service group

Rahul Pathak (1):
  clk: Add clock driver for the RISC-V RPMI clock service group

 .../bindings/clock/riscv,rpmi-clock.yaml      |  78 ++
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 135 +++
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml |  54 +
 arch/riscv/include/asm/sbi.h                  |  69 ++
 drivers/clk/Kconfig                           |   8 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-rpmi.c                        | 588 +++++++++++
 drivers/mailbox/Kconfig                       |  11 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/riscv-sbi-mpxy-mbox.c         | 979 ++++++++++++++++++
 include/linux/mailbox/riscv-rpmi-message.h    | 218 ++++
 11 files changed, 2143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
 create mode 100644 drivers/clk/clk-rpmi.c
 create mode 100644 drivers/mailbox/riscv-sbi-mpxy-mbox.c
 create mode 100644 include/linux/mailbox/riscv-rpmi-message.h

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
