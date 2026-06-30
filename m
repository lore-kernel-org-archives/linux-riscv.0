Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6EFC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 09:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KZ9l1MCDQwOf57LF9hfU46uMDAVpPS/XLDNaDmtRx1A=; b=Ioyx4LxzbOfWuf
	CXvYkvE7sk0uthr/pqU5NhiWjS7Hs8kjsjp0TmcNOVf0QeuuDzK9muFH+DW/YPjgdodLpscXnveei
	0uL7SiU6GwlbEPaznuFM1xTPLh0cc2rED+JqnMTcyYuuroCIrRiLwKPPOZhUk4kv0LfqmSnXRewGT
	y5nKb6PiXArmdX1rJXxoqaMZJOubojIHmFl6WGhNKs8Bhg1WyZ1lh1UXTG1Z2dzt6ZP1trwUSh52N
	AUDXYT3y9Fw4uRq78/+WBXLIlftjQPdbAmS+Ni9WGFrg8JOkUWXHME7V9vQ9qQElsD9navK7jmHw6
	KowhcsG75gQrZvnwK1EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3J-0000000GVCd-3Nhi;
	Tue, 30 Jun 2026 09:46:49 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3I-0000000GVBq-0fMV
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 09:46:49 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c8c30492a0so36261845ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 02:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812807; x=1783417607; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y471ptHCO/F1YjHTOq/QY0bSdLfzgUbegLFtHTg4rN4=;
        b=EaD5hWEt7SOtyFP6w9s8Ek+e6vh8Vr+mopNaUvoXu2jdcMASGgOL0HwPsEFLwxRkte
         GL+MiTHx6+JwMpdHh3dftIAJMhSbL522NwfzqeHcL/SDcS9LPzhNLc4OBJ4RoFO0YnfC
         qIs1QkomCqQhmid9CA720pBf+4Y3zdlyazzMEzjwHDdhkwMFQGtuI9iPWIZsiWiLl1WS
         jtFziGK8J11KL7xBjhwFvfIst73czi0CEBxrHLr2Vo/RKKcayO+Y0s3zIeWQz9adLBuk
         aHnB+xw8BsgVxkbFuhZrJvbgdZTRv/HzZP/ZyiBrR98W84j/gr6CxU/zetUIgbkmYrI8
         jGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812807; x=1783417607;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y471ptHCO/F1YjHTOq/QY0bSdLfzgUbegLFtHTg4rN4=;
        b=arAYxImht49TRlYrjBRNodE0g18OKQi1FcGzTEDOFlTHdrJKpms8el0st2ffq/yRFr
         m92GMME7FFzUT81O7SHd7cUvKkb+jrady71e8NuCpcMfEPDwF9+6J49MfRMEJTbCgr/r
         VlAowLQGuei05D0faJHfIYwFsJN5UsN8JYk6obuk4lt6C1ov5AJwCIfoiCEhmkEzGEYd
         LoJjzFxTM3ZB/llYkWURzXZysQ1dLs2j3CL87NCxwEy1na4qzI+cGqd+pZ9vqrF/zThk
         hKsp9KyE+R/XGoQDvNjOTsvK50CKV+lS8BReFuO/m4i2Xpl+refPPEJ3HPPPIxMkvOel
         5JZw==
X-Gm-Message-State: AOJu0YzVmT0YmfBV4TnTAVm8l2tYWO7nBeVXbyOJXPr/M9oVL36+LN06
	tHMhicw/pTa28pCoeZOeT9UQnkPLGjm90P+rmTBfvblql0eQz4Cf86teKa3UAaaEJEU=
X-Gm-Gg: AfdE7clR9VXS1est8i2vBxS5TMbTf5o7ee4e5VaCj0FeCDH5jn48wYQnmyi6YDOo4/K
	0seVT4oeG4q/qqNvmc6hhgDoAkWeWvR2Z2wdLDcAbFRrp5puteW2T5CBFtj0qurMpNjm2vbwOL7
	5aXObKkOAFY1Lyr+36u5aIVeY+b1UNQL5LhGLUGzGv9v9Yg/rrOHn+uacr055hdDavHCDnDerui
	oXfvUrwEpOCiiT30KkKmiQMD3DWtUFQwOPL9Eucgsdf0i9Vc28q9vVnVyM097tUcwV8SrBu0n8P
	xHjwP+1D+IteDLv9OL+wR/UxEwEFkq98TLfigksitbDf6zuYxvbWcpTeQMrPkubASFobwm1HnBF
	huQ+oLYraU/kMu154O2t4ft4UAZTTGftNvacQgtWedwGwbgFA/bC7pwjabD8s6p1dFn80CcvMXm
	I5HGv6jH+CWQpbENl1Ucah08s6OqUzNAM=
X-Received: by 2002:a17:902:e5ca:b0:2c9:e6d7:fbb4 with SMTP id d9443c01a7336-2ca2ea1a4fcmr20740095ad.31.1782812806775;
        Tue, 30 Jun 2026 02:46:46 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:46:46 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Subject: [PATCH RFC 00/12] rvtrace: Add SiFive pre-ratified trace device
 support
Date: Tue, 30 Jun 2026 17:46:23 +0800
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG+QQ2oC/yWNQQrCMBBFr1JmbSA2aUG3ggfoViS0yURHJA2ZN
 Aqldzfq8n34763AmAgZjs0KCQsxzaHCfteAvY/hhoJcZWhl28teSeGwiHqxT5GIbTE5jRYNLzH
 OKZuiRMCXYfJUUFRC3SntD5PuvIMqjQk9vX/BCwznE1z/Iy/TA23+pmDbPoNqHEiXAAAA
X-Change-ID: 20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-e4534f9b45fd
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>, 
 Eric Lin <dslin1010@gmail.com>, Eric Lin <eric.lin@sifive.com>, 
 Nick Hu <nick.hu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=3860;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=CaFoSNXuBKxAvWcQK+MKKdLsqaO7OxAaJlieCaXIKxw=;
 b=+JaqWrH9g1HtWjQX66RV/3stjNQ/yueSV3AGgI/hetGiELFrnEk5F673KRs9QzUo4Amo5EBBO
 IxVFZ3hSKhTAKPBqULzO7INK6HhjEyRxqP64ZNZOShnZamiSsf/VK4R
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_024648_224065_D5DDF0BB 
X-CRM114-Status: GOOD (  12.85  )
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

This series adds support for SiFive's pre-ratified trace devices on
top of the Linux RISC-V trace framework patch set [1].

The pre-ratified trace hardware is not fully compliant with the
RISC-V trace specification. The key differences are as follows:

1) The pre-ratified trace component major version is 0, and the
   implementation register bitfields are different. PATCH 2
   introduces a get_impl() callback to translate the pre-ratified
   hardware implementation register information into the standard
   RISC-V trace implementation register format.

2) A pre-ratified trace component might support different trace
   sinks, and its trace sink availability information is embedded
   within the implementation register. PATCH 3 introduces a
   get_data() callback to retrieve the component's supported trace
   sinks.

3) For routing trace data from a source to an output trace component,
   the pre-ratified hardware needs to configure the current
   component's control MMIO register, which differs from the standard
   RISC-V trace. PATCH 4 passes 'struct rvtrace_path_node' to the
   start callback to provide full path topology information,
   supporting data flow control for both ratified and pre-ratified
   trace components.

4) Unlike the standard RISC-V trace RAM sink, which is an independent
   device, the pre-ratified RAM sinks are embedded within the trace
   encoder or funnel MMIO registers and utilize a different register
   layout. PATCH 8 introduces 'struct rvtrace_ramsink_regs' to
   abstract register offsets, allowing pre-ratified trace sinks to
   leverage the existing rvtrace_ramsink_setup() functions.

This patch series has been tested on the HiFive Premier P550 board,
and the resulting trace logs match expectations.

Note: The PATCH 12 reset RAM sink write pointer on every context switch
      to avoid wrap quickly.

[1] https://lore.kernel.org/linux-riscv/20260429125135.1983498-1-anup.patel@oss.qualcomm.com/

Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
Eric Lin (12):
      dt-bindings: riscv: Add SiFive pre-ratified trace components
      rvtrace: Add pre-ratified implementation callback
      rvtrace: Add pre-ratified private data callback
      rvtrace: Pass struct rvtrace_path_node to start callback
      rvtrace: encoder: Add pre-ratified support
      rvtrace: Add pre-ratified trace sink config
      rvtrace: Add pre-ratified trace funnel driver
      rvtrace: Introduce struct rvtrace_ramsink_regs to abstract register offsets
      rvtrace: Add pre-ratified ramsink setup
      rvtrace: Add copyto_auxbuf callback for pre-ratified encoder and funnel
      rvtrace: encoder: Add probe success message
      rvtrace: Reset RAM sink write pointer on every context switch

 .../bindings/riscv/riscv,trace-component.yaml      |  73 ++++++++-
 drivers/hwtracing/rvtrace/Kconfig                  |  16 ++
 drivers/hwtracing/rvtrace/Makefile                 |   2 +
 drivers/hwtracing/rvtrace/rvtrace-core.c           |  42 +++---
 drivers/hwtracing/rvtrace/rvtrace-encoder.c        |  54 +++++--
 drivers/hwtracing/rvtrace/rvtrace-funnel.c         | 127 ++++++++++++++++
 drivers/hwtracing/rvtrace/rvtrace-platform.c       |  32 +++-
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c        | 166 +++++++++++++++------
 drivers/hwtracing/rvtrace/rvtrace-ramsink.h        |  13 ++
 drivers/hwtracing/rvtrace/rvtrace-v0.c             | 130 ++++++++++++++++
 drivers/hwtracing/rvtrace/rvtrace-v0.h             |  65 ++++++++
 include/linux/rvtrace.h                            |  26 +++-
 12 files changed, 658 insertions(+), 88 deletions(-)
---
base-commit: 79783024b7bd12897e21fecfaf6ac7dad02a8f0e
change-id: 20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-e4534f9b45fd

Best regards,
--  
Eric Lin <eric.lin@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
