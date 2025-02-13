Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4ACAC021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 22:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nduxQIrjRiV+GCRKkMmMS9p2z/BYi2FNupr+5/nZd9k=; b=XPy4fhxTC7BmVp
	tLTy0zPWlWWlIm8K51n5wqWVwNYiWSxpZEEIBfcvExBKS+omwh1TUQCI3vkqFyHeFcY6ANDep0Jml
	V8jSJgyt/l1XDba9W12AlX96e5i9MKbn1ywrJ0ADQh7GQJnTU9fMttLVowA4hKFRG8yfRSk5hiUzt
	CGGo/eTJmoOcoxd7eUwCvVXhntGv60MlK5f3COlm4B4AHSOKT+X9ojVc2rQ52ke5NiyD7WDkAPnCa
	37+oS+DrSTpS5kWDZATGlwyZFSr+2Ce8M61KdWWIiQh2ioPScZloA31/PqucJDpifapLLVArlhiA7
	gzgsfUayAug+LnrAmkGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tihJE-0000000ClSx-1SdS;
	Thu, 13 Feb 2025 22:03:48 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tihJB-0000000ClQI-1mOx
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 22:03:46 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2fbf77b2b64so2522625a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 14:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1739484224; x=1740089024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vofSNuCMlReC+WuFTXGYAG+iOC4hNVftxe7EdwNqb5U=;
        b=HogU7Q8t/6syYoRRDaa+Ak7saQQee45yc6rPxPMONvp5Eor0k9iWdCPcxZ4NUDMzsK
         9CV+CYgpUSYsBzjLN8zQHe4Xy1+6tnUrNaWfQpMiBhEyIVXbJKYr7b5eNGo8vHGCDtkg
         w0nMxXgbWDaset2vIWxJM4x3RpWCHom+cInnH4fwNWnt3oy+/VjdhAW/0U1mEry1ilzf
         +cVVtEVCbvKfTAZ3FJ2bJy76uvVUSKdIDHRX8tpw9S3grr9r3bPjEVQLrchEZqsXWT77
         n2M2yxRO5qQb8vZsXCGRcdVNq2dCho+VqWK6deaoKD0US78TPS/Rsy6NwOhRf/+Xik0v
         BLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739484224; x=1740089024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vofSNuCMlReC+WuFTXGYAG+iOC4hNVftxe7EdwNqb5U=;
        b=VSKNT6u3UBW4cxifoeLiyGRdJ0vxEGbDBzFlyqv293qjC7qmMfI2sWLUrfLrz6UDnO
         OBhK82xUxOGpXklUZdPMmRot+DK+bK95UIg84ll4Xmo4X1Dnx9odq25y8uUawybo6cXz
         C9zP0w2K+XOogJIdJnIoCL0UjLaD1XaF4rhcSjx0ep64y2wdhjO1yKnySmSCs3S7fOjh
         yX8N9OcdwDF1b8hFZwbuztNowwBtnAK4iaUD1+kgdraCpsTI8CG8N/shA1SZ3JvfevoF
         pFp0eT5IwWId0FY3DuiVc9VP/JDZTi2RjOzb09Ia8kwb0K2gx2IXb6cfU7LMYoPj4zfY
         le5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUv7p5VwRlH7zD+pUV294c6mUF+VNtLl2ecvZVaeaMZWtHJVQ+urIZsB8ITTLOZWWZTaISkLBkYH8DrmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJKB394iw3JEOR62uCvtbNkZ31SZJt5zuasSCMaB/oh6vKiyA/
	SzMDqxNtSo31NA2jrQOiZCG3B+2846dqZSKXYUg+/HcHPuHNqW/BlCCwpy80EkQ=
X-Gm-Gg: ASbGnctN/NzaFMWOy8CbfpM3q8YUffFQg4iTZA98Dq7uF8jaSDKtuTO+dZK2XrSjFF4
	KP/gqGFy6eCLcGo1XKgwngWSim0X7fgbQFyqUAc5XsM4ujLnxzgQ5OvyAokri0KoBDv1Kz4YoA7
	aoIX4A61vBN4ENMkSGRZXxZ9I7FHNmF6B9km0lffbJ+u9n7LpEFv5q2B2QckwQSJfllWAoR5eC2
	2tt5iCD3OQIfGcfqtt3YZQTtebu7cdc+zx/bP1JDaPsD7pnNeIpwWUrv9fC+Qi836U4BMwwELm/
	um9PqzTK6tEg2VtQ1aFBR//KznM6YcK/bP/Dsw==
X-Google-Smtp-Source: AGHT+IHZZb2Jta84jO1YUZkaqS3bvyvNnQldZh8oh2u99VvWuVBNfNp7QsimOh8/7XV9ie22K9NXig==
X-Received: by 2002:a05:6a00:3d46:b0:72f:f872:30a7 with SMTP id d2e1a72fcca58-7322c37d9b1mr13653146b3a.6.1739484224011;
        Thu, 13 Feb 2025 14:03:44 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e438sm1847491b3a.94.2025.02.13.14.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:03:43 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Ian Rogers <irogers@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Jiri Olsa <jolsa@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RESEND PATCH 0/7] perf vendor events riscv: Update SiFive CPU PMU events
Date: Wed, 12 Feb 2025 17:21:33 -0800
Message-ID: <20250213220341.3215660-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_140345_476914_0217A068 
X-CRM114-Status: GOOD (  14.70  )
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

This series updates the PMU event JSON files to add support for newer
SiFive CPUs, including those used in the HiFive Premier P550 board.
Since most changes are incremental, symbolic links are used when a set
of events is unchanged from the previous CPU series.

I originally sent this series about a year ago[1], but received no
feedback. The P550 board is now available (and I have tested this series
on it), so it would be good to get perf support for it upstream.

[1]: https://lore.kernel.org/linux-perf-users/20240509021531.680920-1-samuel.holland@sifive.com/


Eric Lin (5):
  perf vendor events riscv: Update SiFive Bullet events
  perf vendor events riscv: Add SiFive Bullet version 0x07 events
  perf vendor events riscv: Add SiFive Bullet version 0x0d events
  perf vendor events riscv: Add SiFive P550 events
  perf vendor events riscv: Add SiFive P650 events

Samuel Holland (2):
  perf vendor events riscv: Rename U74 to Bullet
  perf vendor events riscv: Remove leading zeroes

 tools/perf/pmu-events/arch/riscv/mapfile.csv  |  6 +-
 .../cycle-and-instruction-count.json          | 12 +++
 .../arch/riscv/sifive/bullet-07/firmware.json |  1 +
 .../riscv/sifive/bullet-07/instruction.json   |  1 +
 .../arch/riscv/sifive/bullet-07/memory.json   |  1 +
 .../riscv/sifive/bullet-07/microarch.json     | 62 +++++++++++++
 .../riscv/sifive/bullet-07/watchpoint.json    | 42 +++++++++
 .../cycle-and-instruction-count.json          |  1 +
 .../arch/riscv/sifive/bullet-0d/firmware.json |  1 +
 .../riscv/sifive/bullet-0d/instruction.json   |  1 +
 .../arch/riscv/sifive/bullet-0d/memory.json   |  1 +
 .../riscv/sifive/bullet-0d/microarch.json     | 72 +++++++++++++++
 .../riscv/sifive/bullet-0d/watchpoint.json    |  1 +
 .../sifive/{u74 => bullet}/firmware.json      |  0
 .../arch/riscv/sifive/bullet/instruction.json | 92 +++++++++++++++++++
 .../arch/riscv/sifive/bullet/memory.json      | 32 +++++++
 .../arch/riscv/sifive/bullet/microarch.json   | 57 ++++++++++++
 .../arch/riscv/sifive/p550/firmware.json      |  1 +
 .../arch/riscv/sifive/p550/instruction.json   |  1 +
 .../arch/riscv/sifive/p550/memory.json        | 47 ++++++++++
 .../arch/riscv/sifive/p550/microarch.json     |  1 +
 .../p650/cycle-and-instruction-count.json     |  1 +
 .../arch/riscv/sifive/p650/firmware.json      |  1 +
 .../arch/riscv/sifive/p650/instruction.json   |  1 +
 .../arch/riscv/sifive/p650/memory.json        | 57 ++++++++++++
 .../arch/riscv/sifive/p650/microarch.json     | 62 +++++++++++++
 .../arch/riscv/sifive/p650/watchpoint.json    |  1 +
 .../arch/riscv/sifive/u74/instructions.json   | 92 -------------------
 .../arch/riscv/sifive/u74/memory.json         | 32 -------
 .../arch/riscv/sifive/u74/microarch.json      | 57 ------------
 30 files changed, 555 insertions(+), 182 deletions(-)
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/cycle-and-instruction-count.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/firmware.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/instruction.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/memory.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/microarch.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/watchpoint.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/cycle-and-instruction-count.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/firmware.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/instruction.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/memory.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/microarch.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/watchpoint.json
 rename tools/perf/pmu-events/arch/riscv/sifive/{u74 => bullet}/firmware.json (100%)
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet/instruction.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet/memory.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet/microarch.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p550/firmware.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p550/instruction.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/p550/memory.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p550/microarch.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p650/cycle-and-instruction-count.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p650/firmware.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p650/instruction.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/p650/memory.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/p650/microarch.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p650/watchpoint.json
 delete mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/instructions.json
 delete mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/memory.json
 delete mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/microarch.json

-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
