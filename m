Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA72C531DC
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 15:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GoP9sTuy3wpgIXcQKdvrZg+1aneyoJKMyAcRwBU9QPs=; b=yaQxzyn24Ltn/2
	bnw9GQgrZGkObH1b0DmYZYFhTTB0Y8P52FSprEiLrAP9BrgJzVSf9oUM7ZYgus12a5SCvNL5tzisU
	zSANG3v3Vg2JY0IQ1D5RZbXkxDtUymxbPM1eJ6p38g+3dXu67Y6OenjosdJyYzB2k0MD0JH61mD1s
	coZXe5/zq1ABxd6a01CW17E5Obb+d9WwZjT5NWrhZNN/PWbXzNSWmpIMjDt5c0AhOKCFkcZibnLHM
	8fEpXuXZ1VvpPJqk32So3tx6b+YVQ7/uwumhJKyMpKO8/lx44dLfA0WsZHiJTQ4TnxRdX8sdLa4dd
	Lc3HPDLbQ8Co9OqRIfTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQlk-00000005okp-1xqL;
	Tue, 20 Aug 2024 15:27:36 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQil-00000005nFQ-0OqA
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 15:24:33 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7a103ac7be3so3721937a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 20 Aug 2024 08:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724167470; x=1724772270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9HfCveIGD6wgO07CWK+R0yFcUzfSO61CbRgrTad0T8=;
        b=UGYCPD/V5ZOJqWLNSp0szWzs2nBdsOEg6SRm3O20yCnNkByC5KXsqMKPBJCY7AnByF
         8b6XV0FrygSx6+ojpal4lvDU6YwQx3cksVTIZjI+siVmNyAd6n+0VCv0a6eBpbZSwMcs
         yeB0WCwMv3rLaKg7+iyOkLEDtwjh9zKhmEvlV6iEexjm1fJFSC7iOxikfwA5FAI21E0V
         rJojQgNM04MtxRxy7FvH5y+R1SToCshmFwRi9k90ZbANHcphQvKba+6h2KeWOv22uoSr
         BiH8qUjXh8usfE44zNGg0UAcsOyWCwNBCNQWuXKMl035/HJPIotTxgKCADMhreeVF+pJ
         BOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724167470; x=1724772270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9HfCveIGD6wgO07CWK+R0yFcUzfSO61CbRgrTad0T8=;
        b=pWkOtn+S+ZDGa9ctv9B+zZDUu0uYszd2tfXBc/+8qyGew8AFua0+xiaepNbIs8nRA2
         Z+BwSPu0ykwiaoj4OZbS5noaaGtn8fLaRwQYEamo0m4INsNRHPuBB5xGWtlYqcKwtbyI
         AYOmkekDpMASMilnBnvUkAJZ6Hmygad8yNku4lMEaBbnfnNVM+CmhMBasS4BBbviYtCz
         drPSD5InLXU6sqnLEXuyECchGbgLfns7QFy/Ur58+hCI0zuyIrlJOop+AX+rjOQ9IsNQ
         +KHbvk8FmvibHXCqXtGXS1+q+qQsTbXpDNbg95DBAH2YuUF+psnJNC0iQ7HBvo5+lF5A
         HC3A==
X-Gm-Message-State: AOJu0Yww8YQRbXPiLtZpQUvDGazZV4/1HxaPGPVEjFQuK1GbGQokp+wv
	OIc8SzaJn7HEJ0Uj/wsr4PxsXoBxHCCjuK3+dxa4L6OsUhRyobSjUHpXiRtVypzq8uKA/XmaZSA
	k
X-Google-Smtp-Source: AGHT+IEFp8nNWtAhX07M+oXg7b8ZrLAlbIoqjPUVrUowEtxL+yOzQda+T9qdfMXpVJlBtO5ij749KQ==
X-Received: by 2002:a17:90a:d803:b0:2d3:bd32:fc7d with SMTP id 98e67ed59e1d1-2d3e0409749mr14730820a91.39.1724167469966;
        Tue, 20 Aug 2024 08:24:29 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d40bea7cb3sm7258157a91.25.2024.08.20.08.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 08:24:29 -0700 (PDT)
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
Subject: [PATCH v9 0/6] RISC-V: Detect and report speed of unaligned vector accesses
Date: Tue, 20 Aug 2024 11:24:18 -0400
Message-ID: <20240820152424.1973078-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_082431_450872_35564756 
X-CRM114-Status: GOOD (  11.59  )
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

Changes in V8:
 Dropped Zicclsm
 s/RISCV_HWPROBE_VECTOR_MISALIGNED/RISCV_HWPROBE_MISALIGNED_VECTOR/g
  to match RISCV_HWPROBE_MISALIGNED_SCALAR_*
 Rebased onto palmer/fixes (32d5f7add080a936e28ab4142bfeea6b06999789)

Changes in V9:
 Missed a RISCV_HWPROBE_VECTOR_MISALIGNED...

Jesse Taube (6):
  RISC-V: Check scalar unaligned access on all CPUs
  RISC-V: Scalar unaligned access emulated on hotplug CPUs
  RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
  RISC-V: Detect unaligned vector accesses supported
  RISC-V: Report vector unaligned access speed hwprobe
  RISC-V: hwprobe: Document unaligned vector perf key

 Documentation/arch/riscv/hwprobe.rst       |  16 +++
 arch/riscv/Kconfig                         |  57 +++++++-
 arch/riscv/include/asm/cpufeature.h        |  10 +-
 arch/riscv/include/asm/entry-common.h      |  11 --
 arch/riscv/include/asm/hwprobe.h           |   2 +-
 arch/riscv/include/asm/vector.h            |   2 +
 arch/riscv/include/uapi/asm/hwprobe.h      |   5 +
 arch/riscv/kernel/Makefile                 |   3 +-
 arch/riscv/kernel/copy-unaligned.h         |   5 +
 arch/riscv/kernel/fpu.S                    |   4 +-
 arch/riscv/kernel/sys_hwprobe.c            |  41 ++++++
 arch/riscv/kernel/traps_misaligned.c       | 131 +++++++++++++++--
 arch/riscv/kernel/unaligned_access_speed.c | 156 +++++++++++++++++++--
 arch/riscv/kernel/vec-copy-unaligned.S     |  58 ++++++++
 arch/riscv/kernel/vector.c                 |   2 +-
 15 files changed, 465 insertions(+), 38 deletions(-)
 create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S

base-commit: 32d5f7add080a936e28ab4142bfeea6b06999789

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
