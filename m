Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C409BC3DA45
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 21:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t0LqS8SoAfSlBdTUm8Iy9yfiLLYDu34S4kS0zVdWzi4=; b=U2b/oKFU64qM20
	oXbbSf9o7bJHiP9W5MXOn+V/OWk/Y1RKWmUZktKG13arLb/RMBaLcACqRxPmmuAs+edftNPYX9IXh
	6MmV/a+tUv5LuzIhEdxTFK9ezMeRj/t3yqbETPHBqVJg/uCao1ZEUra2QiznL85KqF+8nt7PVM+Nw
	/1hruNsLW7xNvVOt/y4zgbmj3O5AEdMZqQHV+5b6kLv6ezSCGHkUMQNfC0xcPbkC6yKB8DCzp8BnD
	e2TJ+i86lvGeogiPU/1ZGXU72X7fUXdpgwatkIpK76os34RqHBC2ppwgLo3vEjdGMSQU+zS0UoToP
	QXoZuct7DR/U1EWFeCCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS1ok-0000000FZSz-1z80;
	Thu, 11 Jul 2024 21:59:10 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS1og-0000000FZSL-3Rzm
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 21:59:08 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-70b12572bd8so1232269b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jul 2024 14:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720735146; x=1721339946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/kw+IcYp8bgUiJbh37Eb+rjf6jAd1bzt2laJrXIeEks=;
        b=QZtcaj1FXqUrK8I2gvzecu+Lh/T0hXMYLt8OgnEmoEkpjUkZzytIcQsvH8HnErLiJX
         RWDZDcyC+Bs/tzkJpUvwtjqMU8h/ueYtsEVKwev1iLWo0pbgekEPKMu/ZnapLdIQ6cTw
         xXXRqpPCA7ovlzDyBlLSOV9yfmziB6J753EkYnuiVKidWlE5AUbwly1swigFeQh8/lA1
         C+J2uLFYUUV+GW9qMJPmWCReo7+Idyn2GadklIcv3Rh1lGGKdcnN138Q7vqvvN0NzrTv
         KBxsWqQbHc0aqqTbUiDC2/WTrwHxyTThMtnLMYhGL28/weQKpVvTGoBoO2Tbroy19i1H
         ms7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720735146; x=1721339946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/kw+IcYp8bgUiJbh37Eb+rjf6jAd1bzt2laJrXIeEks=;
        b=wTIa27fcU87nhtwhHGK18f58hB1YODmlVmOsrux+Gz7VkwRd8zMQbK9JZkyf8aW23c
         AgIRtL5ifCm8g+Ef9FPJdbTfx/j12Cfo/x5GWh1AL7B4air/yiOx664ZsFglo2v9cVeJ
         cpBtzcohPiaFxeY5rE/iqgfC+BReuCrqOjWhpmzvn2kIZQmuX/alo4zycfZFGXTuHHoB
         4kbgNa2HiGxggrvixaxbsRENct0vSH8Q0UcdpjGSYg8DaprRYljV2iHXKzhhailTw88v
         X4Y7QGnlTleh6uB0ByZ93CfH2uZ3hjZLCXsKhBhw9qtoHgiLk6Ck5LeizLFAm6zXeViq
         yeXg==
X-Gm-Message-State: AOJu0YytewD8hc9OKjQ5M7GtSjnAYyzgagxqs8wO7UNLy320a96FUUKv
	AaNJ87Ffm3ismnLAD4wdfz/WFKkm9SvtKhVyLwmV0NeAonTKOGXTDOcP9ZbZj4+0uP3WNF92YgD
	R
X-Google-Smtp-Source: AGHT+IFQBa/vIEx5Z0khrKTKGJiYkqA2a1gi0Teh5Yh2zckpKKSH2Er9zsMFqmnL0nQM5VYY6+YdWQ==
X-Received: by 2002:a05:6a00:846:b0:706:58a8:f686 with SMTP id d2e1a72fcca58-70b43678a11mr12384423b3a.32.1720735145519;
        Thu, 11 Jul 2024 14:59:05 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b43898b10sm6169431b3a.7.2024.07.11.14.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 14:59:05 -0700 (PDT)
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
Subject: [PATCH v4 0/7] RISC-V: Detect and report speed of unaligned vector accesses
Date: Thu, 11 Jul 2024 17:58:39 -0400
Message-ID: <20240711215846.834365-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_145907_191169_3AF15EAF 
X-CRM114-Status: GOOD (  12.89  )
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

If Zicclsm is present, the kernel will set both scalar and vector unaligned access speed to FAST.

This patch requires the following patche to be applied first:
RISC-V: fix vector insn load/store width mask
https://lore.kernel.org/all/20240606182800.415831-1-jesse@rivosinc.com/

V1 -> V2:
 - New patch: dt-bindings: riscv: Add Zicclsm ISA extension description.
 - New patch: RISC-V: Check scalar unaligned access on all CPUs
 - New patch: RISC-V: hwprobe: Document unaligned vector perf
V2 -> V3:
 - New patch: RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
 - Split patch: RISC-V: Check scalar unaligned access on all CPUs
 - New patch: RISC-V: Check Zicclsm to set unaligned access speed
V3 -> V4:
 - Drop patch: RISC-V: Check Zicclsm to set unaligned access speed

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
 arch/riscv/include/asm/vector.h               |   1 +
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
 18 files changed, 472 insertions(+), 38 deletions(-)
 create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
