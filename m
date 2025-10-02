Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFF9CAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 06:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B1ZnJ7i6L6jYj1XJN1xazdt4dO0yJxaxi4GB9BH4bbI=; b=ltMpftAklgRcnm
	D382SVEXMWeak4xVXIpG1Wcn4Czv68pPNBtP68U1Xt3XgzUfhiCktD9CfFMZKgkb7LIRfQ/l4jv3q
	bCE2hQ3YmgA+Z2gMzU31jna5c8iF8xeGZ3/w3zuiNjnWlsp0lCTtdzQSwrdaPiCkdfREhH9+OshrT
	7b58LyBl9c8PcJiODGLIXiNb26U4g3EaxOP2w2hRK2hgJhp8FsBrOS0+fqFtU1phPYxrK2TWn3x6m
	QZBew/deQFQexKGuoz0pa9usHl9n0yht6DgHh/AgQzF7sRh6UR8Elqg2RYPLLBf358mDeUH+O5Dkv
	W1ss+xDfpewOyqsAIItw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CUM-00000009h22-3mfr;
	Thu, 02 Oct 2025 06:08:26 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CUJ-00000009h1P-3XkH
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 06:08:25 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso714307b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 23:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759385303; x=1759990103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2sr1Hj8RYXUqowJ/luorrsraS2wOxt6c5HA/zSdYBaw=;
        b=iZObB9TDKIgetQ1pHGAkeL2uOipuwaIRylsBdSMmAfd8+rYWQo6otksT8MNUDHQVJK
         b24OQCf9buI9vub9yb+ykyOcViX3Pi1pPtWwMaivBYT5vtRL02SLtspXC5RNaVvlN9g4
         kVsb9Do0/pT+D5JPDuNepZF9st+cY7hjZfLantOAjHqePSYaLXnCEIa8W8kxcLqLKO5n
         oNZYkwUflAKcQSIFpZQ5LNE4ONQWI+pG8CKVquR6jcFoNdhpGfSRo+5Xwxg0fFxQFuKP
         kA/cKIRuE0rmLTvTpo6En9kMlmQiZdt0iGkjyMMyi3NrAlqhukw3VVlu88XLSSB+Oh+8
         Gj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759385303; x=1759990103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sr1Hj8RYXUqowJ/luorrsraS2wOxt6c5HA/zSdYBaw=;
        b=C0+vC0/jDPRRJbVEi005lQtJ0Zbv2fWGA7NAy1pLkYuKMLvicPpwBdpdEKCDen4a6Y
         KaxpIRhzQrFTEQcq5p/DWDZQgmAtdUyspsnYd9sereYi8vyQLou0HmAlvC//hkBdSsfy
         JVH5OnBzmvglILAsUh5gTW+TQ4LPewhX8IiFgvQz3qrhQIfMinW3Wq2/4YvKf5f6Sn0y
         ZRTbD4zjBtuolqCDI5gb+7sCAwvp+CbVAP6+bBvQskJpzOfVr5cIp4CgZsLtUyQOFGR4
         SO2EgncnscSIJhBlTWbYhl4RavJxN4+XpWDvxD2tgXtteWLk9/Yuo4qd+WPw3CQBlgLD
         745Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGMjItn/H5Eo33j1IgWxjwyjZYbvMFetIIbhuj95p4gmIj0jt3wWLE3vdLwhXMF71q9SeziK41PJ5lOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YypzEvAguFb3zwbgBA9NuPr+yIt3Iw/adx6hLKP3xBtartAsPJh
	U1XKG8HNy0uEOkrKdWSIc+uJPDtps7pD4DpcRLYYow9V4l7LGALwn3YrR1Jf+4K5Dm0=
X-Gm-Gg: ASbGnctO9z1GJcQJOuLkRm8zvOOKSEEyFUtXErfNm+c71A3eP10liLIdeyF2bngk6Qg
	MlGwtbPSLj/98AFF3F8czUrjb+DC3t4KdqpYK7hRwTrHBR0SjBMw3wt0xhIx20zs2pAH0028x0Q
	TNRrMApX2U7aGvSvwelUj3PqV2th+kzLfQOEH9g6aosvSOWPtjgJNGMULBXNZPvBz8WvqiRr8F8
	Apyz0Uja+OAscyAJUCHE9p3HAlxXv+Mezq0ED/BpjwwQrBNcg0H5zVWde32hIvvvXmM/AgMJgLN
	uvjXYTl6mdsxASEDc592UGxUW9FGTgbo9+1du6pka6toJ3zpahJrtw1Oza5LeieieGEfR1yAfIE
	7Gk6XNeWvPoPgM+yX8z7eagpQm0gnmI5eIG8svGUGKaw3naK6wmOiO7mzytWUZfAy+QyPP0xe6t
	AYfQE=
X-Google-Smtp-Source: AGHT+IE/P3CYgcBDFzRCkFb9v11QtqWlSsUw+KrLc7ikzxnSyndvWks/J4/8QFBSVDLBkg6UpMZ8bg==
X-Received: by 2002:a05:6a20:9f99:b0:262:9451:c648 with SMTP id adf61e73a8af0-321e3edc7a6mr8232285637.37.1759385302495;
        Wed, 01 Oct 2025 23:08:22 -0700 (PDT)
Received: from localhost.localdomain ([122.171.19.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f594afsm1205029a12.37.2025.10.01.23.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 23:08:21 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH 00/11] Linux RISC-V trace framework and drivers
Date: Thu,  2 Oct 2025 11:37:21 +0530
Message-ID: <20251002060732.100213-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_230823_904339_EC1412C8 
X-CRM114-Status: GOOD (  15.88  )
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

These patches can also be found in the riscv_trace_support_v1 branch at:
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

Anup Patel (5):
  dt-bindings: Add RISC-V trace component bindings
  rvtrace: Initial implementation of driver framework
  rvtrace: Add functions to create/destroy a trace component path
  rvtrace: Add function to copy into perf AUX buffer
  MAINTAINERS: Add entry for RISC-V trace framework and drivers

Mayuresh Chitale (6):
  rvtrace: Add functions to start/stop tracing on a component path
  rvtrace: Add trace encoder driver
  rvtrace: Add trace ramsink driver
  rvtrace: Add perf driver for tracing using perf tool
  perf tools: Add RISC-V trace PMU record capabilities
  perf tools: Initial support for RISC-V trace decoder

 .../bindings/riscv/riscv,trace-component.yaml | 110 +++
 MAINTAINERS                                   |  11 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/rvtrace/Kconfig             |  32 +
 drivers/hwtracing/rvtrace/Makefile            |   6 +
 drivers/hwtracing/rvtrace/rvtrace-core.c      | 781 ++++++++++++++++++
 drivers/hwtracing/rvtrace/rvtrace-encoder.c   | 107 +++
 drivers/hwtracing/rvtrace/rvtrace-perf.c      | 343 ++++++++
 drivers/hwtracing/rvtrace/rvtrace-platform.c  | 174 ++++
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c   | 198 +++++
 include/linux/rvtrace.h                       | 341 ++++++++
 tools/perf/arch/riscv/util/Build              |   1 +
 tools/perf/arch/riscv/util/auxtrace.c         | 218 +++++
 tools/perf/util/Build                         |   1 +
 tools/perf/util/auxtrace.c                    |   4 +
 tools/perf/util/auxtrace.h                    |   1 +
 tools/perf/util/rvtrace-decoder.c             |  91 ++
 tools/perf/util/rvtrace.h                     |  20 +
 19 files changed, 2442 insertions(+)
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
