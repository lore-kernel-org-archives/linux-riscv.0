Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617D0C3DA63
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 18:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B+b+7Xz/jrdllMlVVs18Nw+9Ojmi6RrP2ukW92zFj4U=; b=XYwWrRyPT5P3b+
	9EazsrEe7mxuOwMDVhdhPDAktmElHtyiawi231NLcmD8k+63dale5cPoVPB8A7LW8n5QqZOWNUYyB
	1KPos6cxwyKM4ZAjEEQ94uGwjKHHvO46VSUVd9R1CUl0InQzqzwNC4fTX67rJfFk/MxIJ1p4u34PR
	M91dMrk5UwyNNquat6DeG8JKRpUFKN7cPUgYaHCX5v+U8e91ulj218tnkjoWg1srDf7ucWZiVDrNL
	I5W+aNbNnTP26+NBF/1VEhbkTYFg9id8QKGryYYqGatgcyMNWJm0LabcoW9Hr+ZtYSHfv4rpASGu0
	h6kVAIGCFfbyFkC5vmVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWgqZ-0000000GDR6-2L8Y;
	Wed, 24 Jul 2024 18:36:19 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWgqW-0000000GDQI-06Bo
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jul 2024 18:36:17 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2cb5789297eso88022a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 11:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721846174; x=1722450974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sm/wAJveVBv0q7tk/dMFAOUxjubw/u5BATqZaSVqdOk=;
        b=iLvvF+aN63+6HFm/YJyd1NAhbNdANUN1xaTH26ZOL3va867iVgoN2VYmDfN6AcECdg
         TxTde0UzG6FQzbuqZUlQNcbGzizjYGjY+T0c57xF97SyRlBHhgxa1TjCyQNMQgtHmn9z
         aWCBI6DMIbG4r0hH3CHpBsL92ci2DSUjWJTpTb4HMOrNARZRcZyo4GCGYvIPY8Zt1WL0
         oqQoDLBumPdHZv1QzUONUZ7A4uvMi6jG9zkJcPkbx9rVzutvH/YklU+9CauTRD5QeP1n
         3/qZuYVqYbURXFE2ZqvWYwSV8WFzJhkg8eBrGydtw/8rMqNOmx9xuBa/r5YRSxd45QL5
         fKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721846174; x=1722450974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sm/wAJveVBv0q7tk/dMFAOUxjubw/u5BATqZaSVqdOk=;
        b=f0FsciojQb0NGFp9HDFffqFazFxM2dZ1FrT1cNjdhWygQ/aStqhNXTW78kdwNTkTxe
         MCYv/VJgOwcqVYR76MmvGVE/8WP1bR7d6ZN39eyFWQR9OtMNHHc/xyp/i6zhrvaH4EKa
         Z7OxRPFGekguDlmBpN6zLx3J7xbbCl+BMSQn5V9r92yqOdSZWLXWLKb5CGlAoqRXidQg
         gyuD1TDzp7NGmITW0Ntr7fyuFfa19eKB7k1b5ZW5rQ7B/m4wC7ooWZiBKnvULMI8rvrT
         BKlhwQRvVaioBCx/VZNt7bCBZGdW0KCXGtPKODvvmBZl+mSuk1Xoj7rC0qKGmXjuWKEk
         8pEg==
X-Gm-Message-State: AOJu0YyzRTE8u5TJpSTMTtMNtj0OYgF/aE1mzXX/4xXhtHoKhTDs5cJo
	54P0lUn1WzuwudXG7p/0UmqNOmnbhCpNr8zO4xL2rEfm2drpO50vlszEEJyF1cIKjBb9Rn1bWnI
	K
X-Google-Smtp-Source: AGHT+IH3zF5NChQtBzQf3AtZCLeYvOcpbH4+G0JFh9sfOmScH/VpntNYEqKMklwYdqLHBNmrtYSRgA==
X-Received: by 2002:a17:90b:281:b0:2cb:4c25:f941 with SMTP id 98e67ed59e1d1-2cf23865f3amr447525a91.17.1721846173689;
        Wed, 24 Jul 2024 11:36:13 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73a189esm1997830a91.2.2024.07.24.11.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 11:36:12 -0700 (PDT)
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
Subject: [PATCH v6 0/8] RISC-V: Detect and report speed of unaligned vector accesses
Date: Wed, 24 Jul 2024 14:35:57 -0400
Message-ID: <20240724183605.4038597-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_113616_263637_7AB9E46A 
X-CRM114-Status: GOOD (  12.16  )
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
 arch/riscv/kernel/traps_misaligned.c          | 134 +++++++++++++--
 arch/riscv/kernel/unaligned_access_speed.c    | 156 +++++++++++++++++-
 arch/riscv/kernel/vec-copy-unaligned.S        |  58 +++++++
 arch/riscv/kernel/vector.c                    |   2 +-
 18 files changed, 484 insertions(+), 38 deletions(-)
 create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
