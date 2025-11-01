Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCDACCFA04
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 15:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lfbh691V0eSW+cWvNigI9M6nnc72tgN7hE5NbDyeIV8=; b=rsbguSt1NVFSfa
	24a/pQlGl6gZbUo24QXl5fZdbNQCsG7DyjLOwNtH5zIFB463Tfu5PpF62dJtwppIt0wWoAFV1p14E
	XyCFey26fcqD8o07JFW/k5vRkTARzLClapkDmOwNAWgcWI7toKviGCcm7zWAqjChVWmIlNzRXjPLm
	QWtMPsdc6dlpIET1pZPfmTXYU5Dek380AC/sPuH3RTEqTiHIytuMFilElU8OPpj0QB4ELJKMBXzqB
	4d68v/eQZtAeecQM7N6NKCIvHi+aBqt7oJdCxs3talhQBiuVzLgR3NnjTRVrcG11ValYi+uzw+wZl
	KOjgC0z7GxcglvstLa6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDkw-00000007snb-1RGv;
	Sat, 01 Nov 2025 15:43:06 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDkt-00000007snE-3J9C
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 15:43:05 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-294fb21b068so35590105ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 01 Nov 2025 08:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762011782; x=1762616582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qzSxlietdv08Nz41XlGqZnExJjtZBryEPCo4y1RIDZc=;
        b=M/IjIAljfXgdJ7j+jGcvCqC6usurEFN1i438oKMripIA3gxpMskSeUFpxodAcVM0wN
         gPg9ZOm88y4WBocDcuq4wEgYG7fFF4NYptr+Jfa5mYxVw2OVYrrlK3XLrPjRZPc+mY0p
         ha0NE1CZcbgtvsJ3hVHNJQAUn5yqcWbuGu/qT3/upZ8Nl8IxNiYEKQ7tQjzhcSLUnVVj
         XQ0OkqpTqBt8QAarfPoA3loUek2+BHVmBGXCK+GXBjEpeOE6IZqmcVi3/5s5PiTW2TXU
         gbfxJvDtUmx3inlEKHhmDn6T4aSdIHmt/FFxaGKrskXpRwP0hWWs3vHYtrclJC5DF7i5
         XkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762011782; x=1762616582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzSxlietdv08Nz41XlGqZnExJjtZBryEPCo4y1RIDZc=;
        b=AgoG51sha+4XWPOLJw1g7CHCWclU43kukPOWz6XhoW5pJPAX7UT66eWslA3hQu+4GX
         noWGoFWYXrGlLH1aFhgGfZZTA/8hKq6wOXu993xbrk6YpesnrHykyZVRHsaZe7P8kQJg
         uTVnR82w9685HZDp/q982wkS3YOX3wc/8u3cEyPk32VYaxRGuNbMq1BNMYmPyFYA7eOJ
         vWo9o6bZYDCxeduNtN1gRhF3x92riZJbZ9zq/DIIQcNXmBhM98mUZ2WbMwDdETmPBImB
         3QoaPqDlPRNggmnK9Cl6r88s6BTMDL+gKbuXO4Mg+ALfll7MLX/h5BXXdFmFW8Vi19Em
         Sxwg==
X-Forwarded-Encrypted: i=1; AJvYcCUKxG0YQUdTRci1ipKWxDkVKe/8OQEEfhFB8mwuxsgvfbPUnhvHRW8hpLxBtij0PE/5i272a0IN3tjiTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxG9rcuucnziRxujC9kcmmObBdzSgPmOU4xlc+7GZ5QUxmd3MFl
	8Ir6qwoY7M9juD9qZlnXMcWbiitmfiTTV845gt7R7tQmb3C2S1ax8ekq31oZbrltCU0=
X-Gm-Gg: ASbGncspHq1jbZ9EqQy/gCRoCqRNICS3mS9Yh9wnhGE8DN5xJV8egIz58SPVeLGs1p9
	Wtcmcml/GEWQZ60anGyMMZkyVRqkELLWOTBgWZPV1QS9qTLIiTS3Y1ymUJBJxMWT4KYo3F96sBZ
	7wTwlVBQvnl+F8XO296jpQzJl1bPfT7QCKRsVw2HpXakR0rG13OTXTVq1iGiMeHaB2eYP8q1kii
	Fs4SJgG4BD2kZlcSZutDuWG5zJuMAXoE3Vc3pgHxRy9KvevHyNUnwlrx4pe0gUpUkAYzkjrSRUo
	1PGFM2MJ3r9TLG2caEahhUBTwADYBaenrIA+KnlTraqsDF98gQxBGCkt2fPk0q+jiltts+PzCcj
	MY7f7hNYKSIL7MsFt3g+8+tf63XTGMunRKSe91DqMGpcQ0m1umVds2O/kg9WxiQl5yQKZs/TEYm
	/yDYF/PYSO9o2a4c72qNZo5jtFSNvWpFw=
X-Google-Smtp-Source: AGHT+IG9sjo4xwPEkzo6ctV338QETzcZ1vLZmEK24hr2B/GgahZDtRfJJ0dMRkfnA3yh0prDVDGKIw==
X-Received: by 2002:a17:902:e749:b0:295:7f1d:b034 with SMTP id d9443c01a7336-2957f1db313mr4827205ad.4.1762011782049;
        Sat, 01 Nov 2025 08:43:02 -0700 (PDT)
Received: from localhost.localdomain ([122.171.20.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295269bd2fesm59990105ad.105.2025.11.01.08.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 08:43:01 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH v2 00/12] Linux RISC-V trace framework and drivers
Date: Sat,  1 Nov 2025 21:12:33 +0530
Message-ID: <20251101154245.162492-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_084303_838263_9426B0A4 
X-CRM114-Status: GOOD (  17.54  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Anup Patel <apatel@ventanamicro.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Liang Kan <kan.liang@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds initial support for RISC-V trace framework and drivers.
The RISC-V trace v1.0 specification is already ratified and can be found at:
https://github.com/riscv-non-isa/e-trace-encap/releases/tag/v1.0.0-ratified
https://github.com/riscv-non-isa/tg-nexus-trace/releases/tag/1.0_Ratified

The RISC-V trace framework and drivers are designed to be agnostic to the
underlying trace protocol hence both RISC-V E-trace and RISC-V N-trace should
work fine. The discovery of trace protocl parameters are left to user-space
trace decoder.

In ther future, there will be subsequent series adding:
1) Sysfs support
2) ACPI support
3) More trace drivers (such as funnel, ATB, etc)
4) Support for upcoming self-hosted trace specification
5) ... and more ...

These patches can also be found in the riscv_trace_support_v2 branch at:
https://github.com/avpatel/linux.git

To test the patches, we need QEMU virt machine with RISC-V trace support
which can be found in rv-etrace branch at:
https://gitlab.com/danielhb/qemu.git

To capture rvtrace data using perf on QEMU virt machine do the following:
1) Launch QEMU virt machine
   $ qemu-system-riscv64 -nographic -M virt -smp 2 -bios fw_dynamic.bin \
     -kernel Image -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
     -drive file=/path/to/rootfs.img,id=disk1,if=none,format=raw \
     -device virtio-blk-device,drive=disk1
2) Run perf record to capture rvtrace data
   $ perf record --all-cpus -e rvtrace/event=0x1/ <command>
3) The step2 would create a perf.data file which has the rvtrace data.
   Now run perf report -D and look for PERF_RECORD_AUXTRACE event
   section(s) which point(s) to the actual rvtrace data offset.

Changes since v1:
 - Rebased on Linux-6.18-rc3
 - Addressed Rob's comments in dt-bindings added by PATCH1
 - Get reference of conn->dest_fwnode and add missing break in
   rvtrace_of_parse_outconns() of rvtrace-platform drivers added
   by PATCH2
 - Added new inline function rvtrace_comp_is_empty() in PATCH2
   and used it in rvtrace_encoder_stop() added by PATCH5
 - Fixed trRamWPLow usage in PATCH7
 - Determine RAM sink buffer size based on component implementation
   ID and reduce default RAM sink buffer size to 1MB
 - Add new PATCH8 to enable DMA_RESTRICTED_POOL in RISC-V defconfig
   so that implementations with RAM sink address restrictions can
   be handled.

Anup Patel (6):
  dt-bindings: Add RISC-V trace component bindings
  rvtrace: Initial implementation of driver framework
  rvtrace: Add functions to create/destroy a trace component path
  rvtrace: Add function to copy into perf AUX buffer
  riscv: Enable DMA_RESTRICTED_POOL in defconfig
  MAINTAINERS: Add entry for RISC-V trace framework and drivers

Mayuresh Chitale (6):
  rvtrace: Add functions to start/stop tracing on a component path
  rvtrace: Add trace encoder driver
  rvtrace: Add trace ramsink driver
  rvtrace: Add perf driver for tracing using perf tool
  perf tools: Add RISC-V trace PMU record capabilities
  perf tools: Initial support for RISC-V trace decoder

 .../bindings/riscv/riscv,trace-component.yaml | 112 +++
 MAINTAINERS                                   |  11 +
 arch/riscv/configs/defconfig                  |   1 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/rvtrace/Kconfig             |  33 +
 drivers/hwtracing/rvtrace/Makefile            |   6 +
 drivers/hwtracing/rvtrace/rvtrace-core.c      | 798 ++++++++++++++++++
 drivers/hwtracing/rvtrace/rvtrace-encoder.c   | 107 +++
 drivers/hwtracing/rvtrace/rvtrace-perf.c      | 343 ++++++++
 drivers/hwtracing/rvtrace/rvtrace-platform.c  | 192 +++++
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c   | 262 ++++++
 include/linux/rvtrace.h                       | 349 ++++++++
 tools/perf/arch/riscv/util/Build              |   1 +
 tools/perf/arch/riscv/util/auxtrace.c         | 218 +++++
 tools/perf/util/Build                         |   1 +
 tools/perf/util/auxtrace.c                    |   4 +
 tools/perf/util/auxtrace.h                    |   1 +
 tools/perf/util/rvtrace-decoder.c             |  91 ++
 tools/perf/util/rvtrace.h                     |  20 +
 20 files changed, 2553 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
 create mode 100644 drivers/hwtracing/rvtrace/Kconfig
 create mode 100644 drivers/hwtracing/rvtrace/Makefile
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-core.c
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-encoder.c
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-perf.c
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-platform.c
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-ramsink.c
 create mode 100644 include/linux/rvtrace.h
 create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
 create mode 100644 tools/perf/util/rvtrace-decoder.c
 create mode 100644 tools/perf/util/rvtrace.h

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
