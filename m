Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EC4C54E68
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 21:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lpPeIrXEb5zvmOFk67gnAwy0F4NXYuXNNtUMlkNmiMU=; b=Jo9T9YGctZiZQq
	hxCrHCURx9Aa8BemXxaUETdkHMEho4c5T8aYhzZ5CyupcdFBFbAeSDCdbLC1GJyC4tl10L7yHDQtm
	3dVdUB8wfBZ6zASezhRxKlOhIf+7BrUu1rIvfyLk3AaBBOXQj/gaz2eD+2ebaQCXtiE5igfozP2Ni
	po2+/nrX8X/4U6z7adQSBSHjs1QR/gxe76X5ElOYAzxL7l1+Wvy6n/oNtUFjNRwOPcdNSD4dwNAPf
	vv/EkVtL0UBjhqn6W/xOLgm46HPa2JYDqVhYPKhQuoh6TgHXC7IJ+/qRFiriCwEKxQL9AHoaVpA5S
	RwRfxJx3wcaN002tVF4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhUW-0000000EMi1-3Ynn;
	Tue, 19 Mar 2024 21:59:29 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhUT-0000000EMeX-2DW8
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 21:59:26 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e6afb754fcso5786603b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 14:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710885557; x=1711490357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rmlb8dkFyYxdz94/c3CDo0QI5YbaWEmRF37tY2/vORM=;
        b=KaN3fwymRGyt8xp6xG1y3QSeXeSRUT/si1mUmDUXwr9egCTzf/x5i9Pl2kioMVKYtV
         tUGG/5XytGhqEkS0/PerxfHl+QUVuePs2/jf+LX6R3wdFyN5yuJS6yUpQmDqgcMkMl+M
         sPtx4VcCST+4cMTTDzN4ZQSVy/xVAjjREGu/DvlZ9TfA42Kz5de8d8m37HpITSsPsH88
         p+4ttZ/vWNW9v1EW8phQaXfWN6QkM4e5hvx+0i/9Dg80/NuV7m6Ye33kfVcXmMMEAfBD
         xytfgAWSoc+VMV9DO6yBDUHe2ax139/UyXQhP/awHrNGXHHB6lNgfy75pgYQN+if64MP
         o9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710885557; x=1711490357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rmlb8dkFyYxdz94/c3CDo0QI5YbaWEmRF37tY2/vORM=;
        b=QafTgdUR+CetTNDQtfHT9dEfNVywV9WhoOiaaMrkls16Z3Wni2VXeUppw+EW+QgTWq
         y/W4po7EFRQ+Fw7vw9osVUkpKwXpPBcMI0H6fKKTKDRskgqtC/9iN5mA+o0bG4LGGyZa
         XP65+WmW5lm1IU9ir4EEBit/6WYwU5mIwu901yhaujqccW/Dr+XQOTc7LbGDRAW+TBSX
         3ELcAdr7lBIweK5msAsmFs/CJIHGE8VsDwGJrzz1aFOUYWWQsCUeztu6y5A/vhLTQs4w
         VfATQtR7UdCtRI0gZ5WHGQGl0VddEf93tpFe43eloCznMR/yOTUsFqRRwbT4MAmmjv4r
         RNTw==
X-Forwarded-Encrypted: i=1; AJvYcCWPk8njxUzfknyAE7qemefJPwDeOnJAHCe6AXAGzqB3BYG2SircPnJGprrY0hdUUOUnIvbTD2ZrHBKkVYpUsiV57V4wNGh+oVdBxm+9zSS3
X-Gm-Message-State: AOJu0YzC3QXINDR9V3192l5D8+eNZYFMH+uy6qhCrY8IGjiOh7L2euZA
	SECw6dF6LJJ2rJ0GKWCDFfVjp6rsfuYaI37HJ2d0OkeQ+m9UqBT5R/TatMn+ru0=
X-Google-Smtp-Source: AGHT+IFq09XmFNSIoRgARl6YR9z7iEUW5Yif2KVMNG/hMOVVaxwVphqnsk3Rt+lVEueTdkA4OIwSpQ==
X-Received: by 2002:a05:6a00:a22:b0:6e7:4abe:85a0 with SMTP id p34-20020a056a000a2200b006e74abe85a0mr457780pfh.14.1710885556934;
        Tue, 19 Mar 2024 14:59:16 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id z25-20020aa785d9000000b006e6c61b264bsm10273892pfn.32.2024.03.19.14.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 14:59:16 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	tech-j-ext@lists.risc-v.org,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [RFC PATCH 0/9] riscv: Userspace pointer masking and tagged address ABI
Date: Tue, 19 Mar 2024 14:58:26 -0700
Message-ID: <20240319215915.832127-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_145925_575183_6BA55020 
X-CRM114-Status: GOOD (  16.54  )
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

RISC-V defines three extensions for pointer masking[1]:
 - Smmpm: configured in M-mode, affects M-mode
 - Smnpm: configured in M-mode, affects the next lower mode (S or U-mode)
 - Ssnpm: configured in S-mode, affects the next lower mode (U-mode)

This series adds support for configuring Smnpm or Ssnpm (depending on
which mode the kernel is running in) to allow pointer masking in
userspace by extending the existing PR_SET_TAGGED_ADDR_CTRL API from
arm64. Unlike arm64 TBI, userspace pointer masking is not enabled by
default on RISC-V. Additionally, the tag width (referred to as PMLEN) is
variable, so userspace needs to ask the kernel for a specific tag width
(which is interpreted as a minimum number of tag bits).

This series also adds support for a tagged address ABI similar to arm64.
Since accesses from the kernel to user memory use the kernel's pointer
masking configuration, not the user's, the kernel must untag user
pointers in software before dereferencing them.

This series can be tested in QEMU by applying a patch set[2].

KASAN support is not included here because there is not yet any standard
way for the kernel to ask firmware to enable pointer masking in S-mode.

[1]: https://github.com/riscv/riscv-j-extension/raw/a1e68469c60/zjpm-spec.pdf
[2]: https://patchwork.kernel.org/project/qemu-devel/list/?series=822467&archive=both


Samuel Holland (9):
  dt-bindings: riscv: Add pointer masking ISA extensions
  riscv: Add ISA extension parsing for pointer masking
  riscv: Add CSR definitions for pointer masking
  riscv: Define is_compat_thread()
  riscv: Split per-CPU and per-thread envcfg bits
  riscv: Add support for userspace pointer masking
  riscv: Add support for the tagged address ABI
  riscv: Allow ptrace control of the tagged address ABI
  selftests: riscv: Add a pointer masking test

 .../devicetree/bindings/riscv/extensions.yaml |  18 +
 arch/riscv/Kconfig                            |   8 +
 arch/riscv/include/asm/compat.h               |  16 +
 arch/riscv/include/asm/cpufeature.h           |   2 +
 arch/riscv/include/asm/csr.h                  |  16 +
 arch/riscv/include/asm/hwcap.h                |   5 +
 arch/riscv/include/asm/processor.h            |  10 +
 arch/riscv/include/asm/switch_to.h            |  12 +
 arch/riscv/include/asm/uaccess.h              |  40 ++-
 arch/riscv/kernel/cpufeature.c                |   7 +-
 arch/riscv/kernel/process.c                   | 154 +++++++++
 arch/riscv/kernel/ptrace.c                    |  42 +++
 include/uapi/linux/elf.h                      |   1 +
 include/uapi/linux/prctl.h                    |   3 +
 tools/testing/selftests/riscv/Makefile        |   2 +-
 tools/testing/selftests/riscv/tags/Makefile   |  10 +
 .../selftests/riscv/tags/pointer_masking.c    | 307 ++++++++++++++++++
 17 files changed, 646 insertions(+), 7 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/tags/Makefile
 create mode 100644 tools/testing/selftests/riscv/tags/pointer_masking.c

-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
