Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C57C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 16:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yjdoK46aFzYxoIIwkqsfumI/dGJ27kqvsIqUQSZ3yFE=; b=Ggb7Ac4Q2iYpe2
	MGzZuon4LxE+z1sn/OLDJPFZoV7AzF+Igcs63Mes9vdofOympqSFCsGLrZsazK+LEv3dgZquX1ge1
	iWExFJbzjKRafsJxTTwOTcv0maIAJ61EiiGMR9n8bgdcKqzUGEG92sPvO0tuWjBgTmVK+fBzpr3oK
	tMEWsc2K/kVlFQo5J4QcaJp2lhSJF4LnqdQ+76SihPiddzjkXruoLhnvMSMB0m9F4BdB4XW/+mrsN
	dv8e8+8bvNhDGf3cF5ZMBPBVxrOjS0/QEfD9BklRqr0rZnxMvc43OuTv9yVoj20UeNNT6BRClv19c
	MLClj7Gg+rLrcqojrx9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXNwg-00000004QnL-341x;
	Fri, 26 Jul 2024 16:37:30 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXNwc-00000004Qml-1Z0t
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 16:37:29 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-70d28023accso997512b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 09:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722011845; x=1722616645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8abyY+23OqRfjC+HH12SH89B97LQIWTr/A0vDo3wc9A=;
        b=gT9FrCWeOscl8XGMfaNmEvh4fExTyUz+N7YY5wZlfzY4P4YZyOK6SKEMmSCbF7HckP
         r3P50vaEWlV6rDKGZVwh5b0Q0GwWfadYbsAqMIxAIGvXM7iKXXnpKsZgsNZYCIEjvYHf
         lHeo6UaZkb1Bx53Uda9e/Kdh4ns/DKT7lzKDmc42YzsJERaiKv49xpZr5g7TaSnu78Na
         /RSVctfNN87Ahju//vNmiOEoaNaxq3t0mz1TJZAt+alWDOybeTNI/WvAmSeXWtnELZto
         sIoipdi41SEGPYjqStkaERtbFZ+UuBF685E/yg6cfufJEq4Dn0ogMkZ5Zo5nh9g73Kip
         fpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722011845; x=1722616645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8abyY+23OqRfjC+HH12SH89B97LQIWTr/A0vDo3wc9A=;
        b=ckeOGEOBxe/Lfo49PlH4Uk+lmFVNtf06sdZKvqIjMcV4lwEfflIin1V3fpZfWXD4FD
         lo+ZrR81gQhn/y668D94ainD7+TBonY0A2ObHTF/E+vO83tCEgy+0I6j0YLInoSfO30K
         V7gicY2LiCGxL/KUDDYxe1egts8yi0W7yDuUunJzFHud3sWTtMPF08s6d/OphKGO3lnR
         FQpl3iYOIInghBbTzVeYp2onCpp4FUuJY7qQvtIbsXbnb2ItfUAGHQRDpmjWwsURvxjN
         WO9qV5zRcl8RGkWHINcCDkQZez+EqtJo1y08JO6eyutTtIYHDE12qDe8iK2hBfIrWElk
         4QYg==
X-Gm-Message-State: AOJu0Yyy9vRTN1u+rBmtJbNL20k7AJtTLC/CedykFHegQ233mP3Bu6Rm
	aiExfWubyW31Ri5n75xs5hHxL0xbf85smxsnC0dfEgx1fa/OqSjoKrHNnK0C+pvs8dNTV6Zv2Ov
	Z
X-Google-Smtp-Source: AGHT+IEKupxYr1+7Tw7NNkxw4zI+vDeEkSlnSvkM1SOcwHrSkTUm/tBEZCxIeVzhDmNZ2U0QJGFr0Q==
X-Received: by 2002:a17:90a:ac2:b0:2c9:5c67:dd9e with SMTP id 98e67ed59e1d1-2cf7e1ff4e8mr39752a91.19.1722011844844;
        Fri, 26 Jul 2024 09:37:24 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28c55a2dsm3676619a91.7.2024.07.26.09.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 09:37:24 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v7 0/8] RISC-V: Detect and report speed of unaligned vector accesses
Date: Fri, 26 Jul 2024 12:37:11 -0400
Message-ID: <20240726163719.1667923-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_093727_381163_14CDBD4F 
X-CRM114-Status: GOOD (  12.10  )
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

Adds support for detecting and reporting the speed of unaligned vector
accesses on RISC-V CPUs. Adds vec_misaligned_speed key to the hwprobe
adds Zicclsm to cpufeature and fixes the check for scalar unaligned
emulated all CPUs. The vec_misaligned_speed key keeps the same format
as the scalar unaligned access speed key.

This set does not emulate unaligned vector accesses on CPUs that do not
support them. Only reports if userspace can run them and speed of
unaligned vector accesses if supported.

The Zicclsm is patches are no longer related to this set.

Changes in v6:
 Added ("RISC-V: Scalar unaligned access emulated on hotplug CPUs")

Jesse Taube (8):
  RISC-V: Add Zicclsm to cpufeature and hwprobe
  dt-bindings: riscv: Add Zicclsm ISA extension description.
  RISC-V: Check scalar unaligned access on all CPUs
  RISC-V: Scalar unaligned access emulated on hotplug CPUs
  RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
  RISC-V: Detect unaligned vector accesses supported
  RISC-V: Report vector unaligned access speed hwprobe
  RISC-V: hwprobe: Document unaligned vector perf key

 Documentation/arch/riscv/hwprobe.rst          |  21 +++
 .../devicetree/bindings/riscv/extensions.yaml |   7 +
 arch/riscv/Kconfig                            |  57 ++++++-
 arch/riscv/include/asm/cpufeature.h           |  10 +-
 arch/riscv/include/asm/entry-common.h         |  11 --
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/hwprobe.h              |   2 +-
 arch/riscv/include/asm/vector.h               |   2 +
 arch/riscv/include/uapi/asm/hwprobe.h         |   6 +
 arch/riscv/kernel/Makefile                    |   3 +-
 arch/riscv/kernel/copy-unaligned.h            |   5 +
 arch/riscv/kernel/cpufeature.c                |   1 +
 arch/riscv/kernel/fpu.S                       |   4 +-
 arch/riscv/kernel/sys_hwprobe.c               |  42 +++++
 arch/riscv/kernel/traps_misaligned.c          | 131 +++++++++++++--
 arch/riscv/kernel/unaligned_access_speed.c    | 156 +++++++++++++++++-
 arch/riscv/kernel/vec-copy-unaligned.S        |  58 +++++++
 arch/riscv/kernel/vector.c                    |   2 +-
 18 files changed, 481 insertions(+), 38 deletions(-)
 create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
