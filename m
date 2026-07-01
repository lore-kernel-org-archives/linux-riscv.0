Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D47C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 13:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rijo7tZYbYwmHM2UWKrdb5RzG/VFGKt9enTgmaBM4pA=; b=GI8NxeMsDWK1MN
	zYoj10DerYZGHfzIAs5A17kOPSrIaueSCtW6lQx7Ji29MslW48DfvYdc3aGGg82qev+m867p+hm7M
	wJrV+bAfhTbNOlwdKG1yCpvfKUr3xp1WO117onRhRvu0L2Ow/S3efbRni8Al+1bPhQD9KhhC/Hy/G
	hYAbYloz+OT7Rf2ACG4NNkpWbgtS8BEG5ecAP0L+wbJDIUzVjXvcL6L7om1SL5H4he9C5byJBe9rc
	mBhETklFgCB869fDGCylVDARvqcB+xBT9gGDFjBfcFKgwekivmg5tZq6tbqplcjcz0k84Ifi181Ky
	DyCph9sspIyGwyPVZd0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuwh-00000002As1-0oBP;
	Wed, 01 Jul 2026 13:25:43 +0000
Received: from mail-oi2-x03.google.com ([2607:f8b0:4864:32::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuwe-00000002ArN-24iT
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 13:25:41 +0000
Received: by mail-oi2-x03.google.com with SMTP id 5614622812f47-4893ebdbfbbso128790b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 06:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782912339; x=1783517139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7dk9Opzu24JNP4K9nU0Mr28PXO88jXoMMk5rdIT57/w=;
        b=ZFbsc4EXTmo3p4C43XRW/ds6vX7X0TEE/j+TZR2VvBvjO2h1oBAxWQySVfHu+ZDuFD
         TsAnuLCYz+uBwVik2WhPhioYWTbGfrdz9Y2JKOLMJTWSnjzzDx3H6HFx4172ZeE0/Bv8
         ZFeuHEnCU5u63zA6QYoI1tSoN38mIOMUrlHzvMCJu3kC7Gkz/OmBpNGxLdvnnvjh8oKs
         uO9SZiLD8c1Kb4/v8Hcjc4aveQ+EtfOIC+V2AB7mxKhpo5vzODEmEgmLp8Bv3ko/PMF9
         +IV5yXHhf1qpH9T93evAtfWzvMATmTq5kfHOQl1hUgdJzpmCDNr/YbWuqMNMaj8zD9+K
         iT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912339; x=1783517139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dk9Opzu24JNP4K9nU0Mr28PXO88jXoMMk5rdIT57/w=;
        b=XAIUFoczHMOzb7FDermz1ZlaRFUl8EyfqVMFGu+nooF5POUjgeJkU0YRYsCYMbkV+A
         30OSCBvxmc7MAeqX4Kt6kOhzIysP1Jgo8Y9PTBYY8IuDYB28gAlZeRShOddLgmcE5GsR
         RlKxlrMLmdSCf9AY2FnhvzSHWzwVIwSOA7vT75gaz6YJY3y/m9ta0F2ocSQf9zaXvVA0
         8vX7CgeeXoLDexV/abSFw82ppgmK9tKJiCJjy6+/0MCRBlf/C0uXXtrKoWrtg5XaxBd9
         PYQsTMIAp3v2fVsX9vR5M4J6bybAAYYvi9TKU9weQDRrDe8hp4MsmtQedi7dYIoJxb0T
         dg5g==
X-Forwarded-Encrypted: i=1; AFNElJ8iyWlS7zevjEdS+EjcVVCHIIg10CfhN7MmiIMZVuf0AB84gRXl9LRS3pAxnKt+c5RCzBK6zoAnmRXMyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgpexDuurgat/8l1VG+7HhcGDsJvsnQaJ7FcZkaMdWkqK82utH
	xmRqDMXy4M46SuPS8b136VLyFAN4iKkSrx2u33fXHFp8jlfjVMKm8Xb8
X-Gm-Gg: AfdE7ckvMFgn7S4i9C2AlTMFGGvVHLlgRN8KK0rgQQwQK3mg+gUHUC8RjNJbvSGUZtb
	Ufq+pNNh/YbbEZJhShTWuXDg7tvAvWGOdBw4GSToGJ1utMXT7TTG0T1XbXhbWDBrU7d1KfHP8gi
	D4KwHIfV1yZ+evy7vnZKPqH8uuAZxRtZRFuOVjVBenOkNFV9qPg1IHHJex/usAyHbsFgYdXcr3U
	dkyhr8ioFfMQiWMEh8TKNgFQ9CUptm0rZL52F+uaulDKvKEMQiZVuQXdm5CDl8ZbHbrzbCYOLLP
	lsKNV2wG94yLqnTazGCJqYTIoh4niB5ViYtbHvtvDJqFVLv8nLfz5Rwxo4noexjzVj3B59cF/cP
	b0wrUzEjQuQe0MyJTZNjpLxDXQt1QNQzbZlP3+9SyyaAtiKZ5Pzt/CqLeIuMDvT40B2vJULAbxg
	ucOnaWZGm/4tseIb+6RoXpKYZBE2sMZanogV1thXHpuE6UtBMdeK8Jzac=
X-Received: by 2002:a05:6830:348a:b0:7e9:e5df:5ee2 with SMTP id 46e09a7af769-7eb3cedcb83mr899113a34.6.1782912339110;
        Wed, 01 Jul 2026 06:25:39 -0700 (PDT)
Received: from ubuntu24.. (dsl092-249-254.sfo4.dsl.speakeasy.net. [66.92.249.254])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec34f898sm4938144a34.27.2026.07.01.06.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:25:38 -0700 (PDT)
From: Xing Loong <xing.xl.loong@gmail.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xing Loong <xing.xl.loong@gmail.com>
Subject: [PATCH 0/3] tee: add MbedTEE driver
Date: Wed,  1 Jul 2026 21:25:11 +0800
Message-ID: <20260701132514.186953-1-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_062540_564728_2C3E5199 
X-CRM114-Status: GOOD (  11.72  )
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
  [2/3] dt-bindings: firmware: add mbedtee,rpc binding
  [3/3] tee: add MbedTEE driver

Xing Loong (3):
  dt-bindings: vendor-prefixes: add mbedtee
  dt-bindings: firmware: add mbedtee,rpc binding
  tee: add MbedTEE driver

 .../bindings/firmware/mbedtee,rpc.yaml        | 221 +++++++
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
 drivers/tee/mbedtee/rpc_callee.c              | 609 ++++++++++++++++++
 drivers/tee/mbedtee/rpc_callee_arm.c          |  91 +++
 drivers/tee/mbedtee/rpc_callee_riscv.c        | 203 ++++++
 drivers/tee/mbedtee/rpc_caller.c              | 539 ++++++++++++++++
 drivers/tee/mbedtee/rpc_caller_arm.c          |  66 ++
 drivers/tee/mbedtee/rpc_caller_riscv.c        | 192 ++++++
 drivers/tee/mbedtee/shm_pool.c                | 105 +++
 drivers/tee/mbedtee/shm_pool.h                |  15 +
 drivers/tee/mbedtee/supp.c                    | 310 +++++++++
 include/uapi/linux/tee.h                      |   1 +
 22 files changed, 3277 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml
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
