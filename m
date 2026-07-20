Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452B4C44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 07:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WP9lTk3FM1omW7UEq3bCoHzWLTyHuDH7q0fsKcfWrD8=; b=Qa7naPYWZ+kaye
	1vz0CLm+aUzmwjIK88gZ4eNHYqHJqZqyQHmqnnInFAS6cIb1zVA6CY6cHZUmwzVJYNqrNM64EI72z
	jXdJM9lQaLgU1pq1qiR/IpviW2R2Nit45MXowcZyUkbvphxMR2W0PY9TjhcXHR5n3Z/PhYQXMWQma
	iDNwXRijIe1GRv55/OJDeexkAsfUWFGaVBHqayvUGRIJKMBSoTSIITOV9VS+cMfPlmRW6q9DrjE1Y
	SuStBVFk3gcONFihQT5xqYisWurQpd5F+hd69j7kq3yRx0AjxUH3LFCRfO9XPBXhR9dNRpZ5jYAen
	yMx2+QzS3Y/oSdvT8SJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliYH-000000066aX-3YWj;
	Mon, 20 Jul 2026 07:36:37 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliYF-000000066a0-14VX
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 07:36:36 +0000
Received: by mail-pj2-x04.google.com with SMTP id 98e67ed59e1d1-383390e7584so854248a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 00:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532994; x=1785137794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bSGBn4Ublx73sYl2HPbFN0xtoAs6LbPrdTcJddm5B3g=;
        b=TewfEqNNF2rnkyZjjvu4KlshdLMe4wln74v1tTzd+ot2JJcZaUJE5sYPg6Zj/Ii+EO
         oZq3BX/wRxSkByP1/FN25EFxuNy1PLrMO/uz1Wncw7uQYmoiEub5jwZKttAGEvDAIAyJ
         KFXvI8LNHu3TSxQ3QJ1nrcvVY9e/aanjlkLVe47o5y/P7L77ox0uZb7WT693aBNSWgDj
         rf7jKkH87HoT3zpRnRy5bQpuBKyjiN2eDrInRfc4v8W/LxTddNeTquMATObNMm5Bw1NB
         S99uD+z0kA1XpCj9gH0H2l5k2yzmMQvwtoLv2YrU5IZWo4Lu5SOA9peV3HsQI/6DQo+z
         nSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532994; x=1785137794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSGBn4Ublx73sYl2HPbFN0xtoAs6LbPrdTcJddm5B3g=;
        b=Y6HsPDGfXLoWgXqmRzX328rR5z3VlERRyYmyq9Qx1DLk5q8sMd89Y38WTaoApmR4mE
         OPHDJdLCyssT0O1279g6uZE2/FAVfZzTKmCnzpcjiJGJFb6d5MDkYdYoF3pjAsIDAJq9
         YWndorw6Rjrbd55eO9YpXiMH6fWE4LiesuJbC7c9u9FcHtRxYdW3CSJhFh/qmauilokn
         eruV4l4x2IAiAl7QYqKmgD84c5CPvZHk+KGe2STHXAKSPTXDRfuzlu0wl4f14vpKMLZa
         5Ek0gWF0Ghad1H9JIK9u7hhjx/LOgcxhNUAoWLzNLWr86+0hNjJbE///aefHPRogSVYN
         b/qg==
X-Forwarded-Encrypted: i=1; AHgh+RqR6BgLy6LP5kNMmDyW57IPHJjYELti/DkWnHS1l+3sjU1rC1nQXZuf66vEqgL6SELGF7UmRz9OWtqMHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZDI8Dqht8XzQiqCKS9t1mIt/FZLvEj1UcUTcigdDyit1uNFHY
	e/MEbkvdrbHnkgghZXJTOsAG87D+mZi36I6yPu+2Bfdl4XsuY3kLxvPRQW7Am+d8xU0FaKAL
X-Gm-Gg: AfdE7cla5KlUYhQdJ0zy47rts7J77/cWzoriv1d/lBtH+/bzhqVpYtGkbBEyY80nkck
	Llc4xgHKi18F9k8oLxRzKryZodsQalDKuS5V6OnX6mU9cyKTx2bw6Tx97EmCy63oJ54EWGQb5Lv
	HylYCG6Obh9zUyYbsIQjD20atmpJnSQbNRP4zfWLwzL+pm3JBFASe3ykswBSwxnbTp1C9zN/8rs
	sEYos1oBCQL9Kw7UigLxDiQiJYY8sSFe1RL7F89wOi2mhBwyAaQvg59zQHLbZfY21rXPCFcv21u
	1T9BR5qLld7Wpzjx0y+VYXyx1T4Qcu2L2YNU1YT90x96kkfNQdVN89uZCezPtMAI2Wz2geFSPAZ
	ZbBcnT74Oj7e+kx/vx0PhGTHmXaYgygjlc4NUKOKAtLbtItVRoo5ewcQM7P20RhSWKt3Hb7NNi8
	/wwqI=
X-Received: by 2002:a05:6a00:2289:b0:848:2ef5:50d8 with SMTP id d2e1a72fcca58-84c28c2daa4mr13302524b3a.32.1784532993870;
        Mon, 20 Jul 2026 00:36:33 -0700 (PDT)
Received: from ubuntu24.. ([216.23.123.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcaa0bsm5210536b3a.20.2026.07.20.00.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:36:33 -0700 (PDT)
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
Subject: [PATCH v3 0/3] tee: add MbedTEE driver
Date: Mon, 20 Jul 2026 15:35:54 +0800
Message-ID: <20260720073558.799755-1-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_003635_300766_6F4B4BBC 
X-CRM114-Status: GOOD (  13.48  )
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

 .../bindings/firmware/mbedtee,tee.yaml        | 109 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 Documentation/tee/index.rst                   |   1 +
 Documentation/tee/mbedtee.rst                 | 155 +++++
 MAINTAINERS                                   |   9 +
 drivers/tee/Kconfig                           |   3 +-
 drivers/tee/Makefile                          |   1 +
 drivers/tee/mbedtee/Kconfig                   |  20 +
 drivers/tee/mbedtee/Makefile                  |  11 +
 drivers/tee/mbedtee/core.c                    | 236 +++++++
 drivers/tee/mbedtee/mbedtee_drv.h             | 269 ++++++++
 drivers/tee/mbedtee/mbedtee_msg.h             | 219 +++++++
 drivers/tee/mbedtee/rpc_callee.c              | 618 ++++++++++++++++++
 drivers/tee/mbedtee/rpc_callee_arm.c          |  91 +++
 drivers/tee/mbedtee/rpc_callee_riscv.c        | 203 ++++++
 drivers/tee/mbedtee/rpc_caller.c              | 532 +++++++++++++++
 drivers/tee/mbedtee/rpc_caller_arm.c          |  66 ++
 drivers/tee/mbedtee/rpc_caller_riscv.c        | 192 ++++++
 drivers/tee/mbedtee/shm_pool.c                | 105 +++
 drivers/tee/mbedtee/shm_pool.h                |  15 +
 drivers/tee/mbedtee/supp.c                    | 310 +++++++++
 include/uapi/linux/tee.h                      |   1 +
 22 files changed, 3167 insertions(+), 1 deletion(-)
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
