Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE59C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 15:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Udr4bXS4/u/zu6xSBmRalNfiO9Er0sRAWTyrfWJTGfo=; b=s7kFaHAYGF8qFf
	5FHYakP5sxHhB+vUFmiuW3karuFz8/KgSYQDBh9lM+IxENuossQj2WGx2ijmPJdotTyLOHOd6+9//
	S68/RjEKhedhTwFNuwkGxc5LalgrWxcovA/0uP/moWH0iuMPo8YkyUyK/rhi4e/eUb0di3QfMDbbP
	e8ARSQHR7S3NLTV2U7fbsqSmFWF9v9Tj3pLjoMGo+uElq6EtGiGH7ioVQeku6fJ4kmMcjOMco6jAG
	OrQCkIuTt0NO5WJOuYYJlF5YUeWxtq72F2LIdh0ufWzhbqStpYQTGpLGrzQoxxoymbKHneOszOBir
	50TY4BOJfrLXlO9fl55A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJ54-00000004lbn-1ucR;
	Thu, 02 Jul 2026 15:11:58 +0000
Received: from mail-oa2-x00.google.com ([2607:f8b0:4864:30::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJ51-00000004lar-2wm3
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 15:11:57 +0000
Received: by mail-oa2-x00.google.com with SMTP id 586e51a60fabf-44cc0b31e50so68322fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 08:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783005114; x=1783609914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUoKcMNp1i0OsjwBDMTVKkf2BV13qPTJjkx+a7eS6X8=;
        b=fQSCwALvi686k7zI05JYhOjtmSz44kbnYkspzIeybXld0p7ZX6CZb015Qm6oJ3ZCP9
         XcCx8VfFrxJvv1Im96kgRZSzsC51lufptU/LZxugluWDDsJbsYYC20xtuFJ5Xpoa9VF9
         HOs8TYhElVr97uf0fYj5ZP0pzkAwczLrVvjh/T0v//LwOmBWPgNkBozy9CoOgLwNgk/8
         MZ2XEGwzQQ6YkU2j4TNGKLowE0JBii3VxZEvahtqohL1opPINCr+4Lkx57EY7XyHIvf0
         AqaJq4GSMi5yMvrh5Ny78xAOT2RpFapC5xuf00TPea9cR1bpMwKRigP2Z5BWy46ca2zr
         z2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005114; x=1783609914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gUoKcMNp1i0OsjwBDMTVKkf2BV13qPTJjkx+a7eS6X8=;
        b=ltTr7OTrlyR+rHXFBNLEcWeiNii0W5hlawiGnwGa7Qj4Gdqogx9qefHzl2eKxU2x9w
         LPVGkT5r9RSrYopdV5DAJxSptclKt91RzaYh0U5cInO8J1xZtKG0ZHzxNTH+G9sQKe2g
         xLq38hmSISelm0XRyjdQWFahAqohwR29U1TRqI/pjL2IadGFLz6nbObpK8XelKaxY0s7
         2qXosBDhR2s9gGgA5u+3vPG1mDgoTBDsQeiEGdKmsQsQBD+bk0/HXp0VYtAxWDKMiBtP
         fA4hJJu1z3ojTcwp9DjEPuGrauDVGZpwCfPlX5NP8qf10L5nm2wXOnZA67j57B/PZZK9
         9uQw==
X-Forwarded-Encrypted: i=1; AHgh+RqQ9TldrMLjqjAE9hGPhH1D55iBWx2cEuMOBABBhTV1mfofoakzhysSvK6zwx1wHqX8kJHsizC4NCryOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQrV0Wn0ZAply4vWO90J7H6RSaLOT4CJ3vGifJB5ZgH1KANPPl
	ICeZOk3DjIGOCiKO8AQQhYxL3On7LdO43qGyzX4dkYx//HZi+camR+f0
X-Gm-Gg: AfdE7ckfVxxuuzvFZyO3lPFR5scpzVykjxPl69/10ZDg66yR/N+3REVIk+t2Y7tlMQb
	/M9TTnsiy89M2u1U2vdbhTBatkabx6hvSFVGNumNR1lKj15bron/sUnoDZjkF/gWCcAy8XNt0QV
	jd6oNXoa0ypTxL+y0VtMHipILE8bdxwmUwPi1V011ZmXOx/irBV5TmoJKUibpxqyqSDJvYRSWQh
	TKmWvZ1TECeBg1jOxUmYT3RM4Z/KaSlqakawXWRfmalipjm6j5FyBaMSRJpHkAM8W+0IGAzeGeE
	gz87GDA37cyjPmFzyYrNtjbnnWLQegc+iIXDoYyzCOpEJ46furT7qvWTpjWcg5i1e7i3vSxwHuS
	CCbqvhxPftNLlZiRdiyZ5GALu5mDV13AmBD25L1WuVSiEv8hhwQFSmxRWrTupg1Gxw+LgNx724e
	3TGG/yxrYoUw5urLv9MB2iN9Nd/CyUbHjIG7bevyQAfnr3wTrgqVQamOI=
X-Received: by 2002:a05:6871:d3:b0:447:3be4:44d with SMTP id 586e51a60fabf-44cabc00880mr4009842fac.33.1783005113834;
        Thu, 02 Jul 2026 08:11:53 -0700 (PDT)
Received: from ubuntu24.. (dsl092-249-254.sfo4.dsl.speakeasy.net. [66.92.249.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cbec9a113sm3094561fac.9.2026.07.02.08.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:11:53 -0700 (PDT)
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
Subject: [PATCH v2 0/3] tee: add MbedTEE driver
Date: Thu,  2 Jul 2026 23:11:12 +0800
Message-ID: <20260702151115.544016-1-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701132514.186953-1-xing.xl.loong@gmail.com>
References: <20260701132514.186953-1-xing.xl.loong@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_081155_792546_F2C58314 
X-CRM114-Status: GOOD (  13.64  )
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
Changes in v2:
- 0002: Fix DT binding review comments from Krzysztof Kozlowski:
  - Drop $nodename, "YAML devicetree binding" wording, property descriptions
  - Rename compatible string to mbedtee,tee
  - Rename memory regions: rpc-t2r-ring -> t2r-ring, rpc-t2r-shm -> t2r-shm,
    rpc-r2t-ring -> r2t-ring
  - Add memory-region / memory-region-names to required
  - Simplify allOf constraints (drop redundant else-branch items)
  - Rewrite description to describe hardware/firmware, not the binding or driver
  - Drop all irrelevant platform nodes (gic, cpus, reserved-memory
    containers, reg addresses, riscv wrapper); the ARM example now
    uses bare interrupts (matching arm,sbsa-gwdt.yaml precedent)
    with only phandle-required stubs (imsic, t2r-ring, r2t-ring)
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

 .../bindings/firmware/mbedtee,tee.yaml        | 132 ++++
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
 22 files changed, 3190 insertions(+), 1 deletion(-)
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
