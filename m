Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D130C5DF85
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 08:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6ijDMhRUc5YERltBZhFa+F7U1UDg3KLAn6PDEHhaiBo=; b=YIBUr+QrKs2xyx
	2lceVey3A/LG4H9HbZyqmykMWcKAUQ13ezwaT09umlazRzOh78Gflo9yan8hzAf47WxTec3gR3vP3
	OxYf+iJA7wayf5NA2QwjCM+ek2ujqyXwrbwfUrk7aUXz9F1G++l6u2lBNEFTglDsD1pquEsbkLiRm
	6SLTjWdOg9mcJUkFk/oSD5m13BCN/gvvgR52Rj9dbyJIPo9GAlqG5Tt36cNLh8rgNfXfFQYhVGyxC
	L1Ft94SX7WAS0xxX+dQaJt+VMJ8U9XkL2PLIOSROrMGgU80lGAOjmm3NUTKD3wJ2g4WYTA+YEFHc8
	Kb8jyyfQ5VpHsqTktEfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbmc-00000009Jt8-0dNX;
	Wed, 19 Aug 2026 08:36:26 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbmZ-00000009JsZ-3s6H
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 08:36:25 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-ca92f36c4acso183449a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Aug 2026 01:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787128582; x=1787733382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OOhYCONyOlLqZ7Th3lMilNB9DV3vW0wUhGS0m5kXWkU=;
        b=f0Z5a7vu7KquA7W+kReBa2KVxQH1gpNEiQ3zuEbOMbOUKS/N5Io5V42hjSbq+TOTtW
         5xIY4lpU3usV8709lcoyY0ceBPBPfYSzEwQg1jIdxGGk813YJrLsE26ckfkoC967Lx90
         4D6uy+NCCsTHc0jLluGL5WE6zv8AdVFDLY1w638XY7S10Y7l9sPNeowVUXfz1NXLWuo0
         hEj6kYXjD2pS8R3fj92d2DWUYhTrlyqfqnHA/I1fWAcIVBZQfBSritoEe0AOuvLk1z9K
         2LCyaHPuyXo9xhe42LEk+ZRTwd+rZS0vW7NTVbj5U2Y+DDXTdTNqSbYcjkmTdl8vjveJ
         dt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787128582; x=1787733382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOhYCONyOlLqZ7Th3lMilNB9DV3vW0wUhGS0m5kXWkU=;
        b=QaykAmmTYfJ4UpG7hD9SJA+v48nNssDcx+nQ9GiM9WRVge5/bM3uvB0BdGF/Hak0ld
         6RqFxuSIH8G3nh/JT5nlQmoloH6KtPvxIOdZqIsaX2r0fRT2Ro83TLL98SOfMA1y9RfW
         kXtSkuSNdJjp+Hyn1hAIZgzR2RJ/ZrowDsoHbMAtUoREiTFHASHEGM9DKE5OvEMIii8W
         QCUnzHBto67gVym+iDz+JxbfOSPxPL2TNAQeMZSdeNmDA+msPhoqRyYfJly3MAw8eixi
         eLAHGT7V1GBCU3neSi/kKW5brow4qXEbhYJuL6YOlp23omH5LC6XtT//tL+Prnrs4L1A
         WDWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpt7CcLfW2+O7z9kOoti44OErMgU9Lfgb+l3Q0z+l7JGjjyuMvnEsXUcYMSpTuo+os8i7dAG9gKqQ8WRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxFXhizsMplFE44RRNJ6b5CwEPHuYi3KjljdPuIvCeeY5wOhQG
	mPpDU4XieQNI+TirVvpXJL5j0hShblX0vKQCNQgSYDvBfVW6yx/042O3
X-Gm-Gg: AR+sD13S+T32DaUTx7sXAcHz8FUUjIgC4kHySAAkTk066NWM0JzZknuGn6PH4DixeFN
	mUGoeJY6vNAPfj2Ric9k+sQKrJtZb116fLPvWloioWi6EmD4g5sxCSidJmPPO2r4ln0OFbN/OUg
	s+R8lC/QsLZ3EeFF8X3NJGdOBGNG2VirUNlEPXEFhTgS8cjpAeSjaFN0rupcr42EZseYI2yaowj
	r6jI7+CGFl2Hp1TDDQNHjIjuwz6sUnEnwQ/W5nu7xTElZwU5bJSV8GOq8mQPKg9bfeCJIY5GNPo
	NiM3igEL0HJdd6gz3/0lYSZ2mWnTS/aXMlYD6WEiiSE+cZ18NoFb0AgZN+fGm4dqp5+ANXllTno
	1PRIG1RMaWO9MsSIM3TZC4zHlt4L3P8Os2MTkkzE08cZjNhg70X5jS1mrPkqNXXnD2tq4asthQl
	pvEVkUGo69oIGrm+4hrrtIjnl/I/Sy+6tTh43/3OunzPYr1+1HhZpZdRNt5Dgf0Yw=
X-Received: by 2002:a05:6a20:a126:b0:3bf:9b61:f7ae with SMTP id adf61e73a8af0-3cd011a0cfbmr5624816637.14.1787128581986;
        Wed, 19 Aug 2026 01:36:21 -0700 (PDT)
Received: from ubuntu24.. ([85.149.220.152])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc155464a0asm332268a12.14.2026.08.19.01.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 01:36:19 -0700 (PDT)
From: Xing Loong <xing.xl.loong@gmail.com>
To: Jens Wiklander <jenswi@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xing Loong <xing.xl.loong@gmail.com>
Subject: [PATCH v4 0/3] tee: add MbedTEE driver
Date: Wed, 19 Aug 2026 16:35:56 +0800
Message-ID: <20260819083559.1303348-1-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_013623_976126_2A54C8A1 
X-CRM114-Status: GOOD (  15.98  )
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

This series adds a Linux TEE driver for MbedTEE, a Trusted
Execution Environment for embedded systems
(https://github.com/mbedtee).

Two RPC transports are provided for systems where platform
firmware or board configuration has already established the
REE/TEE separation before Linux boots:

  - ARM/ARM64: SMC calls and GIC SPI notifications (TrustZone)
  - RISC-V: shared-memory ring buffers and IMSIC MSI notifications

The driver implements the TEE subsystem interface (tee_driver_ops)
and provides GlobalPlatform TEE Client API support, dynamic shared
memory registration, and tee-supplicant support for REE filesystem
and RPMB operations.

The series is structured as follows:
  [1/3] dt-bindings: vendor-prefixes: add mbedtee
  [2/3] dt-bindings: firmware: add mbedtee,tee binding
  [3/3] tee: add MbedTEE driver

---
Changes in v4:
- 0002: Move reserved-memory region descriptions into
  memory-region-names property (Rob)
- 0002: Define memory-region-names item order at top level; keep
  per-branch name count constraints (maxItems: 2 / minItems: 3) (Rob)
- 0003: Harden ring and RPC handling against malformed input:
  - Validate both ring indices; bound async ring skip and resync
    the reader on corrupt framing
  - Enforce RPC handler modes (COMPLETE_REE async-only, supplicant
    commands sync-only)
  - Reference-count rpc_call objects; fix use-after-free on
    interrupted calls; abort and free leftover calls at teardown
  - Add XA_FLAGS_LOCK_IRQ to the rpc_calls xarray
  - Fix supp_recv/supp_abort_all race; malformed supp_send unblocks
    the worker instead of hanging it
  - Reject TEE-changed parameter attributes
  - Report the wire error on failed supplicant requests; fail
    oversized requests instead of requeueing them forever
  - Wait for R2T ring space with a bounded backoff; bound
    COMPLETE_TEE retries and stop them at teardown
  - Match the supplicant context when dispatching supp_send
  - Access complete_work_pending under ring_lock
  - Serialize RPC submission against shutdown and reject new
    calls once teardown starts
  - Quiesce all RPC activity before tee_device_unregister() so
    parked waiters cannot deadlock teardown
  - Bound non-interruptible RISC-V waits so a hung TEE cannot
    block ioctls forever
  - Track closing state on sessions; reject concurrent
    close/invoke/cancel races
  - Quarantine TEE-owned call objects at release instead of
    risking a cross-world use-after-free
- Link to v3: https://lore.kernel.org/r/20260720073558.799755-1-xing.xl.loong@gmail.com/

Changes in v3:
- 0002: Drop all phandle stub nodes from examples.
- 0002: Remove redundant required: - interrupts from then branch.
- 0002: Simplify title and description.
- Link to v2: https://lore.kernel.org/r/20260702151115.544016-1-xing.xl.loong@gmail.com/
- Link to v1: https://lore.kernel.org/r/20260701132514.186953-1-xing.xl.loong@gmail.com/

Changes in v2:
- 0002: Fix DT binding review comments from Krzysztof Kozlowski:
  - Drop $nodename, "YAML devicetree binding" wording, property descriptions
  - Rename compatible string to mbedtee,tee
  - Rename memory regions: rpc-t2r-ring -> t2r-ring, rpc-t2r-shm -> t2r-shm,
    rpc-r2t-ring -> r2t-ring
  - Add memory-region / memory-region-names to required
  - Simplify allOf constraints (drop redundant else-branch items)
  - Rewrite description to describe hardware/firmware, not the binding or driver
  - Drop all irrelevant platform nodes (gic, cpus, reserved-memory)
  - Add maxItems: 1 constraint to interrupts property (Sashiko AI review)
- 0003:
  - Fix supp_release incorrectly aborting unclaimed requests on close
  - Fix potential tee_shm double-free on supp_recv error path
  - Fix async RPC ring skip leaving orphaned payload bytes
  - Fix COMPLETE_TEE retry to also handle transient -ENOMEM on RISC-V
  - Fix session leak on close_session allocation failure:
    release kernel resources before sending RPC

---
Xing Loong (3):
  dt-bindings: vendor-prefixes: add mbedtee
  dt-bindings: firmware: add mbedtee,tee binding
  tee: add MbedTEE driver

 .../bindings/firmware/mbedtee,tee.yaml        | 102 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 Documentation/tee/index.rst                   |   1 +
 Documentation/tee/mbedtee.rst                 | 155 ++++
 MAINTAINERS                                   |   9 +
 drivers/tee/Kconfig                           |   3 +-
 drivers/tee/Makefile                          |   1 +
 drivers/tee/mbedtee/Kconfig                   |  20 +
 drivers/tee/mbedtee/Makefile                  |  11 +
 drivers/tee/mbedtee/core.c                    | 260 +++++++
 drivers/tee/mbedtee/mbedtee_drv.h             | 289 ++++++++
 drivers/tee/mbedtee/mbedtee_msg.h             | 219 ++++++
 drivers/tee/mbedtee/rpc_callee.c              | 697 ++++++++++++++++++
 drivers/tee/mbedtee/rpc_callee_arm.c          |  91 +++
 drivers/tee/mbedtee/rpc_callee_riscv.c        | 203 +++++
 drivers/tee/mbedtee/rpc_caller.c              | 697 ++++++++++++++++++
 drivers/tee/mbedtee/rpc_caller_arm.c          |  70 ++
 drivers/tee/mbedtee/rpc_caller_riscv.c        | 238 ++++++
 drivers/tee/mbedtee/shm_pool.c                | 105 +++
 drivers/tee/mbedtee/shm_pool.h                |  15 +
 drivers/tee/mbedtee/supp.c                    | 311 ++++++++
 include/uapi/linux/tee.h                      |   1 +
 22 files changed, 3499 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
 create mode 100644 Documentation/tee/mbedtee.rst
 create mode 100644 drivers/tee/mbedtee/Kconfig
 create mode 100644 drivers/tee/mbedtee/Makefile
 create mode 100644 drivers/tee/mbedtee/core.c
 create mode 100644 drivers/tee/mbedtee/mbedtee_drv.h
 create mode 100644 drivers/tee/mbedtee/mbedtee_msg.h
 create mode 100644 drivers/tee/mbedtee/rpc_callee.c
 create mode 100644 drivers/tee/mbedtee/rpc_callee_arm.c
 create mode 100644 drivers/tee/mbedtee/rpc_callee_riscv.c
 create mode 100644 drivers/tee/mbedtee/rpc_caller.c
 create mode 100644 drivers/tee/mbedtee/rpc_caller_arm.c
 create mode 100644 drivers/tee/mbedtee/rpc_caller_riscv.c
 create mode 100644 drivers/tee/mbedtee/shm_pool.c
 create mode 100644 drivers/tee/mbedtee/shm_pool.h
 create mode 100644 drivers/tee/mbedtee/supp.c

base-commit: 03e2778d1f11de9260543f969e9e888a1c2bf830
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
