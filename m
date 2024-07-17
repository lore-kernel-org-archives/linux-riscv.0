Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48783C3DA60
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 18:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ImcLmo4W2fPqGxvgglK0UQsr7k05ikCuix3xLVQozqo=; b=1zl/YUGnsISScg
	R3ZovLshGvIognLhA/wSGg0foFKduuqMif5PETNYt7nRQlJmsjTaBcbWF8/UBsY4xo1CxePOGX6Uk
	ais1kprHFU3LKUgd/RMLJEAOGzMXxgFYSrsJV8oHuvUWeDCDhEbP80tNpWRafD3eqDT3uVtefLe5w
	PYAvr7t+Z9/0Ug+FM7whAMZLJBIBWzTjqkMuRWQV3nBIdzYOVgkbfAN8NF4JFoQHnzTgk6qPGfrkD
	H3Wv4mG5iiBi7AiivLIlHUa8V5dUTHJOGqyL9lD+8j+AWmWu2Hw94e/Ah25DDkCDBGo79ddSalCoY
	YEQlqr/3Ptd9cQ6v2uEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU945-0000000EYvR-250u;
	Wed, 17 Jul 2024 18:07:45 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU93v-0000000EYrF-3gHE
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 18:07:37 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-70b31272a04so762278b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 11:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721239653; x=1721844453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d+q85MMx8ReifEh26OnOcH4ON5TNG8DhWzEzhvIX3E4=;
        b=rUSl0VBmAs5/GWbxoHiIUxJpnVFFnWm6Lxnnj40ULZChmR9haFcgsay/444Sl6hMJM
         3jp89j4K8BlETbcB6sKnFCHzSWVV8WHdxbw+KhuoPbJamJ4luVibjlHHe2lsDgWGmpQB
         Cc4/4b38sS+Mc/LK8cjolHnzudM1j0zHo29LziH9EErOMWa8thqP453GpbJ0Sz3rDJ5A
         BtLVXHIz4JVdPnKNg9aY8XKp/k23tt5WY667DBT9b9DhXn6FKMn4GPCC29d8TwCow2hL
         aupgtFJAICZq65302kIrXwm0/IF6PmH5QFK+2w5Ar/x0+bQurpoAczKpmuYiWS1d0Ngw
         B9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721239653; x=1721844453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+q85MMx8ReifEh26OnOcH4ON5TNG8DhWzEzhvIX3E4=;
        b=qPzM+5+rpG7SPirP2joFbx1pDb4GiejddVHWmTUoQOk14zRjT4IkJugf5t5EOyHOMM
         4D2W1POhkfmdl/2a9sAQ0Zq6GTAaLFBg+CHiTuhqEwXMm+y2/e9t4cOPnwfqMmp+882G
         ilaQ4rz+/7gSj+KqIoj2FnbbOb26MJ1iSXI+0znaJLrez/pYdYRzSvgxqn7Cm8XPVN9c
         3L/vJghocrWIIyKvqoq80QimIoJNv/+2C3M2QFi5SWTjkzR/+Xp6U3I/wpZ5sSRojw9S
         m+0i9y1WaGe4VI2Fh0mji/LAXg5Uy/76fd3/ZAVg0gkyiuzJTrn6Dznsq4w+RS++DyL2
         cNMQ==
X-Gm-Message-State: AOJu0YxbxbCh5/ewx7nIjHUUh4ifzOQtbSS/7daZ65fNKEuZNPrHynKD
	8MbR7Gwo3KxJgWJU+gQc5DXjJETf3g9b2/92CNpGmMf1WC/oDM8c64nnhJi+qOeH1zUq5obqVwJ
	R
X-Google-Smtp-Source: AGHT+IEM7NbPBiq56WjI7wp5uxcZnnktec6blz44hAygeP3ZH/gozFqg+Zse6oBeox6vYNKlbyAg5Q==
X-Received: by 2002:a05:6a21:329f:b0:1c3:b20d:ac33 with SMTP id adf61e73a8af0-1c4077ba37emr758100637.3.1721239653262;
        Wed, 17 Jul 2024 11:07:33 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eb9c969sm8432332b3a.35.2024.07.17.11.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 11:07:32 -0700 (PDT)
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
Subject: [PATCH v5 0/7] RISC-V: Detect and report speed of unaligned vector accesses
Date: Wed, 17 Jul 2024 14:07:20 -0400
Message-ID: <20240717180727.4180475-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_110735_938593_F8FBEDE3 
X-CRM114-Status: GOOD (  11.48  )
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

Jesse Taube (7):
  RISC-V: Add Zicclsm to cpufeature and hwprobe
  dt-bindings: riscv: Add Zicclsm ISA extension description.
  RISC-V: Check scalar unaligned access on all CPUs
  RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
  RISC-V: Detect unaligned vector accesses supported
  RISC-V: Report vector unaligned access speed hwprobe
  RISC-V: hwprobe: Document unaligned vector perf key

 Documentation/arch/riscv/hwprobe.rst          |  21 +++
 .../devicetree/bindings/riscv/extensions.yaml |   7 +
 arch/riscv/Kconfig                            |  57 ++++++-
 arch/riscv/include/asm/cpufeature.h           |   7 +-
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
 arch/riscv/kernel/traps_misaligned.c          | 134 ++++++++++++++--
 arch/riscv/kernel/unaligned_access_speed.c    | 148 +++++++++++++++++-
 arch/riscv/kernel/vec-copy-unaligned.S        |  58 +++++++
 arch/riscv/kernel/vector.c                    |   2 +-
 18 files changed, 473 insertions(+), 38 deletions(-)
 create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
