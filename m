Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60170CAC58D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 12:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5J/ZFZtQw68A09b7Ro8YUAiGQShE6N61Qf+qvUcMkoU=; b=KaFZoSzPKFs74z
	0FZVs/OszFR/+gpmGCLOQjfHtW9CJ5GlRuB9WgHlzUNmXqkcbMJJ05iZQo2+AdLoiLVKplScdBZXK
	A+TcuOB2rexRYwCoyxvW/KqFtkRhe4+Rc13gVIzvmWozTWyLgOo1MlVoL7CqBMCSjzNC+EneBt8pq
	koQ9ZHXcVD1lykUMqCYQwxj1fJTrdzZB2OvLggiEo4m8w675sObKM7Nau3e1Ts1UsTCcjP0qvPDYk
	kD86j2GYettftxxU61oMfH+QMLAKWvQowzhuD+gQdcI76CfXDY8L2u+CB/pISs23AEsCvQtUmcYTn
	0qpP8pJmtUo81oVOn1EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwgfu-000000032jQ-2aOJ;
	Thu, 11 Sep 2025 12:45:18 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwgfr-000000032hX-1kXH
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 12:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757594711; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=A7y9SMNWfcdmMaWZPV3e4O3wkQ5XwZ5q195pdCXDlkM=;
	b=hjWVfWEyD4H2KT6m4Jf4do66nvoM0RZN/crkTKEYnjTmfn1jG6g98dLsm9+oTDOFZmz9+srR4+8SO/6gQlKvKhX4EcmJxa23/WKslWRbPjZ8bvHwMEIkC7mpsoy2ma+uLf1NOnp0nS86s0ibHXtYX+BmF+BVm2/P2Q4ntvoef5U=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WnmLJgJ_1757594704 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 11 Sep 2025 20:45:08 +0800
From: cp0613@linux.alibaba.com
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [RFC PATCH 0/4] riscv: tarce: Implement riscv trace pmu driver and perf support
Date: Thu, 11 Sep 2025 20:44:44 +0800
Message-ID: <20250911124448.1771-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_054516_301393_7A4557D7 
X-CRM114-Status: UNSURE (   8.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Chen Pei <cp0613@linux.alibaba.com>

The RISC-V Trace Specification defines a standardized framework for
capturing and analyzing the execution of RISC-V processors. Its main
uses include: instruction and data tracing, real-time debugging, etc.
Similar to Intel-PT and ARM-CoreSight.

According to the RISC-V Trace Control Interface specification [1].
There are two standard RISC-V trace protocols which will utilize
this RISC-V Trace Control Interface:
- RISC-V N-Trace (Nexus-based Trace) Specification
- Efficient Trace for RISC-V Specification
So, this is a complete guideline for any standard RISC-V trace
implementation.

This series of patches is mainly used to start related work and
communication. It completes the following tasks:
1. dt-bindings completes the basic definition of riscv trace
   component properties, but is still incomplete.
2. Implemented the basic RISC-V Trace PMU driver, including
   support for the aux buffer.
3. Implemented basic support for AUXTRACE integration with perf
   tools.

There's still more work to be done, such as:
1. Complete RISC-V Trace PMU implementation.
2. The perf.data generation and parsing including AUXTRACE events.
3. Taking RISC-V N-Trace as an example, implement the parsing of
   Nexus Trace data format, including support for perf report and
   perf script commands.
We are still sorting out.

Any comments or suggestions are welcome.

[1] https://github.com/riscv-non-isa/tg-nexus-trace.git

Chen Pei (4):
  dt-bindings: riscv: Add trace components description
  riscv: event: Initial riscv trace driver support
  tools: perf: Support perf record with aux buffer for riscv trace
  riscv: trace: Support sink using dma buffer

 .../riscv/trace/riscv,trace,encoder.yaml      |  41 +++
 .../riscv/trace/riscv,trace,funnel.yaml       |  46 ++++
 .../riscv/trace/riscv,trace,sink.yaml         |  37 +++
 arch/riscv/Kbuild                             |   1 +
 arch/riscv/Kconfig                            |   2 +
 arch/riscv/events/Kconfig                     |  11 +
 arch/riscv/events/Makefile                    |   3 +
 arch/riscv/events/riscv_trace.c               | 253 ++++++++++++++++++
 arch/riscv/events/riscv_trace.h               | 133 +++++++++
 arch/riscv/events/riscv_trace_encoder.c       | 109 ++++++++
 arch/riscv/events/riscv_trace_funnel.c        | 160 +++++++++++
 arch/riscv/events/riscv_trace_sink.c          | 100 +++++++
 tools/perf/arch/riscv/util/Build              |   3 +
 tools/perf/arch/riscv/util/auxtrace.c         |  33 +++
 tools/perf/arch/riscv/util/pmu.c              |  18 ++
 tools/perf/arch/riscv/util/riscv-trace.c      | 183 +++++++++++++
 tools/perf/arch/riscv/util/tsc.c              |  15 ++
 tools/perf/util/Build                         |   1 +
 tools/perf/util/auxtrace.c                    |   4 +
 tools/perf/util/auxtrace.h                    |   1 +
 tools/perf/util/riscv-trace.c                 | 162 +++++++++++
 tools/perf/util/riscv-trace.h                 |  18 ++
 22 files changed, 1334 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/trace/riscv,trace,encoder.yaml
 create mode 100644 Documentation/devicetree/bindings/riscv/trace/riscv,trace,funnel.yaml
 create mode 100644 Documentation/devicetree/bindings/riscv/trace/riscv,trace,sink.yaml
 create mode 100644 arch/riscv/events/Kconfig
 create mode 100644 arch/riscv/events/Makefile
 create mode 100644 arch/riscv/events/riscv_trace.c
 create mode 100644 arch/riscv/events/riscv_trace.h
 create mode 100644 arch/riscv/events/riscv_trace_encoder.c
 create mode 100644 arch/riscv/events/riscv_trace_funnel.c
 create mode 100644 arch/riscv/events/riscv_trace_sink.c
 create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
 create mode 100644 tools/perf/arch/riscv/util/pmu.c
 create mode 100644 tools/perf/arch/riscv/util/riscv-trace.c
 create mode 100644 tools/perf/arch/riscv/util/tsc.c
 create mode 100644 tools/perf/util/riscv-trace.c
 create mode 100644 tools/perf/util/riscv-trace.h

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
