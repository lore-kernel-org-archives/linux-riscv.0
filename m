Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BC9C54E65
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 23:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uAfbuzo961zLDrbM1RU0ODSsLOgiQRoCCyb7+QhAAlA=; b=h0h628US9qQNo7
	E5CCvmQrIMoLUV9mtU8iDkywnI8oi5BcyG2g0i3AaF4pHn9/goBd33AlZh4jzsPDEh/sCaEwpQ9NY
	3tCZ1QbUR+kDcABb3oJqTNA/Ipz4zFAAGciwF2snJRIMZmlL4DEYePmd3Ml6k1FpnsHmqS/6VuRaL
	DfqMXSVwDQwlk6neqdcdfi+g7jyGGQisX0k8XwTVFA+THVWphCD3+cZ/2rC9EJzz1Uf9kkZ8akcvK
	FU/Z2ZRrdYZlCDx555AGTrb3oKgcDhDe0raf6rnR53Jx9H3FJDoF2TdTeYD/A6Dwz3IsaEkymajhw
	WP7p//z32O2mv1S+hDoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFIs-00000002Rmj-111e;
	Thu, 22 May 2025 23:26:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFIo-00000002RhR-2LcK
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 23:26:20 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso60071695e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 16:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747956376; x=1748561176; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+8XVL2AzLr3r7KuN+VtnlIKRIu/pZqkSiU9SK0eyPQ0=;
        b=k1NUD8zZh/pSQ9dkFObVjqhQOv5jonMcrwYdlQZADygauKX2JqILBMj+OJ7YEd1nbz
         KyrSUV3SMiTzvUxSkChSdLloO6GkxfDwrXiXhL3KgJqPrakI89gN6DEvi8QPoOsGtikb
         eAMsrICXg4BreTkFOFWhVS/JsKYto32DD2TOhupDCT1dUfGD1/yhAF1ZrbufRc48M5jl
         a6i4HHsS1Wday8FyyHbKh6jWHgxFXP06WHe+e2IA7bJFIM+ioODS2Fy+ALsfsZvktyKo
         yd3tbKkL3s6SUfe+h62LNQ4NCmv9f6cr3IJ65X4Fynmr8mDWhD5/3cVbkKsKQUHqIngT
         7EQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747956376; x=1748561176;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8XVL2AzLr3r7KuN+VtnlIKRIu/pZqkSiU9SK0eyPQ0=;
        b=GfdBuIGhRbrXDGsbZ0rv5Oqkl9tNNr9BTFAlWBbO7bWHyyBlXiUr+DWH90cHHSbOkQ
         WHLIsVcsb0CilcNHO8MC7dfTKplCIuADva3hX3wOiOtik7DcpJEWBhPoG81xGm81oB/b
         tDxGUQBuyFpMFtjAwKVXOb6++KFtlyPqwlsVHT22BXbbqmwcG7KSEJ193cbdiZba5BUV
         md0JF71N4StMacmqcaQhS1EELrYmCP5uY3BOgOqlYv7yCjxmDAjbZX12JPWOdSkvM+Mj
         kC9fTs2wFx8W5495oVMnBT5oRB50jdst0sAxHZfDxkyqvOnFyli4aUmc/3UZDfnlI41N
         fhMA==
X-Forwarded-Encrypted: i=1; AJvYcCVaLhwnLugauuXpVYbbqpOs7oM1rP+77XPZiE+CVqqGBcUN8LgxtqnMMlaDTyws7h7E9sNTrOhzi2+43A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzsgl0JrW/i0cfhgk5TPKMjGC5Uc/FLEVVQIpjVaYd0pcX9Stj/
	TmIhtEsJRjX2neQAwlrwM2M0AKisWP3r5j7f/6VbtNjSyZ6fzfQjAt6YaZUgxvED7SEP6Llxidk
	qZ5r4
X-Gm-Gg: ASbGncvIBxq09jPlI0iBTd6FE+nXbAZDZ1NHjf9ri6GSL1AMkTcadoGNmLak7bQBgBh
	Pw+l0kccscZGgbAg0lfakirwlQPv1i1VpHztmPDFGfdxfBIj40GpI26RH9y3l7cLSs37Tby4q/2
	FJFytXd7Oq4YBJlIzJXW76sAdgADzSlf3umamTOaHs2pvkxJdYMhV6BLZ/cFf/TrM48V8hi0d+5
	qmSFw/TPqrpHyxN5488jffEOH/S4yjZZOtbDoaDxUAg53B8upxLSZn6cr5/BI0hRuEVMdxsk0rl
	3w3TsONlxyFfgZ/9eyMMAjvdF6amHDlWtah3cTsca7x2J9a7l7KY/A==
X-Google-Smtp-Source: AGHT+IGEJr3BKVh5rl646evQq6jfB80g3xvgIKAUhdZFT4W8GWtoUdBDEHTxPzLL+VQCxlsQGQXhTw==
X-Received: by 2002:a05:600c:34c4:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-442fd6752e7mr277601475e9.27.1747956376376;
        Thu, 22 May 2025 16:26:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:c7c:75ac:6300:c05a:35d:17ae:e731])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f04334sm117825395e9.10.2025.05.22.16.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 16:26:16 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [PATCH v3 0/7] riscv: pmu: Add support for Control Transfer
 Records Ext.
Date: Fri, 23 May 2025 00:25:06 +0100
Message-Id: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFKyL2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0Mz3SQT3eSSovjSguKSotTE3PgyY10jA5M0kySDJHMTC0MloMaCotS
 0zAqwodGxtbUA8z9ytWQAAAA=
X-Change-ID: 20250416-b4-ctr_upstream_v3-204f4b0b7481
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Beeman Strong <beeman@rivosinc.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, Rajnesh Kanwal <rkanwal@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747956375; l=5043;
 i=rkanwal@rivosinc.com; s=20250522; h=from:subject:message-id;
 bh=Xt+9J5CINKC67/Xf9FTS32L9c6buwlWjqj4FpG7qyTQ=;
 b=voXbtY/BvjLgr1Qk+pdKoA/M9txQ+Uo8IZDt/nVzmOvCl9hu8Lrpi2vmzjOnKtVTdNeWIIAkS
 zuOwbL5C0z1CmtoSdzyA2XjmkKpBnAPcjkCDaiTFuIC9KKpMB7oMk1P
X-Developer-Key: i=rkanwal@rivosinc.com; a=ed25519;
 pk=aw8nvncslGKHEmTBTJqvkP/4tj6pijL8fwRRym/GuS8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_162618_608357_32399999 
X-CRM114-Status: GOOD (  19.63  )
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

This series enables Control Transfer Records extension support on riscv
architecture. This extension is similar to Arch LBR in x86 and BRBE in ARM.
The Extension has been ratified and latest release can be found here [0]

CTR extension depends on both the implementation of S-mode and Sscsrind
extension v1.0.0 [1]. CTR access ctrsource, ctrtartget and ctrdata CSRs
using sscsrind extension.

The series is based on Smcdeleg/Ssccfg counter delegation extension [2]
patches [3]. CTR itself doesn't depend on counter delegation support. This
rebase is basically to include the Smcsrind patches.

The last patch is in the perf tool to allow processing 256 entries. Without
this perf seems to consider that sample as corrupted and discards it.

Here is the link to a quick guide [4] to setup and run a basic perf demo on
Linux to use CTR Ext.

Qemu patches are merged upstream:
https://lore.kernel.org/qemu-devel/20250205-b4-ctr_upstream_v6-v6-0-439d8e06c8ef@rivosinc.com/

Opensbi patch is merged upstream:
https://lore.kernel.org/opensbi/20250307124451.122828-1-rkanwal@rivosinc.com/

Linux kernel patches can be found here:
https://github.com/rajnesh-kanwal/linux/tree/b4/ctr_upstream_v3

[0]: https://github.com/riscv/riscv-control-transfer-records/releases/tag/v1.0
[1]: https://github.com/riscvarchive/riscv-indirect-csr-access/releases/tag/v1.0.0
[2]: https://github.com/riscvarchive/riscv-smcdeleg-ssccfg/releases/tag/v1.0.0
[3]: https://lore.kernel.org/lkml/20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com/
[4]: https://github.com/rajnesh-kanwal/linux/wiki/Running-CTR-basic-demo-on-QEMU-RISC%E2%80%90V-Virt-machine

To: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@redhat.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Jiri Olsa <jolsa@kernel.org>
To: Ian Rogers <irogers@google.com>
To: Adrian Hunter <adrian.hunter@intel.com>
To: Liang, Kan <kan.liang@linux.intel.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Atish Kumar Patra <atishp@rivosinc.com>
To: Anup Patel <anup@brainfault.org>
To: Will Deacon <will@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Beeman Strong <beeman@rivosinc.com>
Cc: linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
Changelog:
v3:
- Added missing To/Cc, especially devicetree@vger.kernel.org
- Changed the commit description to better describe the need of
  perf tool change that increases max sample size processing
  capacity of remove_loops function.
- Minor fixes found while doing a virtualization PoC.
- Added the missing commit and repository information to dt-bindings,
  indicating where the extension was ratified.

v2
- Added context save/restore support for tasks using CTR feature.
- https://lore.kernel.org/lkml/20250116230955.867152-1-rkanwal@rivosinc.com/ 

v1:
- https://lore.kernel.org/lkml/20240529185337.182722-1-rkanwal@rivosinc.com/
---

---
Rajnesh Kanwal (7):
      perf: Increase the maximum number of branches remove_loops() can process.
      riscv: pmu: Add Control transfer records CSR definations.
      riscv: Add Control Transfer Records extension parsing
      riscv: pmu: Add infrastructure for Control Transfer Record
      riscv: pmu: Add driver for Control Transfer Records Ext.
      riscv: pmu: Integrate CTR Ext support in riscv_pmu_dev driver
      dt-bindings: riscv: add Sxctr ISA extension description

 .../devicetree/bindings/riscv/extensions.yaml      |  28 +
 MAINTAINERS                                        |   1 +
 arch/riscv/include/asm/csr.h                       |  83 +++
 arch/riscv/include/asm/hwcap.h                     |   4 +
 arch/riscv/kernel/cpufeature.c                     |   2 +
 drivers/perf/Kconfig                               |  11 +
 drivers/perf/Makefile                              |   1 +
 drivers/perf/riscv_ctr.c                           | 612 +++++++++++++++++++++
 drivers/perf/riscv_pmu_common.c                    |  25 +-
 drivers/perf/riscv_pmu_dev.c                       |  82 +++
 drivers/perf/riscv_pmu_legacy.c                    |   2 +
 include/linux/perf/riscv_pmu.h                     |  55 ++
 tools/perf/util/machine.c                          |  21 +-
 13 files changed, 918 insertions(+), 9 deletions(-)
---
base-commit: e0200e37637e573cd68f522ecd550be87e304c6c
change-id: 20250416-b4-ctr_upstream_v3-204f4b0b7481

Best regards,
-- 
Rajnesh Kanwal


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
