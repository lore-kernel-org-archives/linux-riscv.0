Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1461AEE498E
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 19:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5B28Iz209gNdC+n1ZH1QgIg+nITU8BuV9jp6DRQNYAw=; b=gPFjdGqbvIthVD
	vQkhnYkFzlAHHLZkJfr7kYmSRa/6aRfgN5VlqOmEkATIrPmxy7HUyhnFBRzWjuCCsegsX9O7OkNEK
	0f+0hzPO7DCoqBcCyQLrLGRxpf9upglKlFjz7pzk4KHMDhjVnL9ZJTxLoSmQs/CZhyB1/K9d8iMFF
	C2yLq7OWz1L4FvBeVSe2Pc2v7hC0uSR6vwH4TgHg07wX5d0OuRc8H4NzgNfIji4L7Bb5GgYum36gm
	q9dMTdyrU4lk61fXK+cEO2F+kVMmb8vekfiLJU3SAykXPEqfPOBGQCue3X1aMApe+T0Kw08QXsPio
	5zNlQjCDoMNAANlY6E1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX5M2-009wV3-22;
	Fri, 18 Aug 2023 19:41:54 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX5Lz-009wSC-1o
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 19:41:53 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bc8a2f71eeso10080425ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Aug 2023 12:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1692387709; x=1692992509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rO/GUjqy2MCWkNcI9MNL4IXjkgGHQcESzZrRDHtdeBw=;
        b=HUOkjNnS0G3UQF0NDHPyYjqP02QdPU9zoAWS4AH5JJoGjL0DKKk3iAViyAZfC5ZCJ6
         SxBo984z15jkyaC+/oo7e38wht/CkFKF32cNAg/ktTK/OHghzqeZ2a3holHzb+UefpqC
         hRwhMs+sRjX004iMu/N9E3kvfDhErk0C9UH6hec9/ivN13LhQyZOxCZ2hPeSrMwVQ93D
         1vYgSld99LAY3VoEWPms7Xkww94o3MyydYPNKGGGWMQqbKLUqrYNmDASAriNZC27VEit
         MUUYU5p7YVRm74h+Y9jiLR/azSBHXs7+m8GomS8KHfSgE2dtbUzgyAEK98dBZooBIDbs
         azSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692387709; x=1692992509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rO/GUjqy2MCWkNcI9MNL4IXjkgGHQcESzZrRDHtdeBw=;
        b=i7Jv8wG+2SOM+nBrlxwtR8OxoiTfhPXY1r0p5Q1rU4kXE9t3GarM9sq10g6pYMeaNw
         6A6D9AjIHK30P5bhWGULKgbn8MuILa42kRCJH9mSM+QxdVujcP4bTDhloXUax5B3a3/k
         IS9xSa2KHC7HxUQQgLPQec27sYTGtXHodOnXpimvCR3MWy35pm57Xpt2cFzvLVspFZjl
         dpRSh6HZcEp5RirJbzEMcwdRAemfDfBN4evqyfxZHfhMxLXPlTY4T8hzQGnKLfygshfY
         p3jWY0V8vu0D/cwlmaxa7ETNs3cgiZ/uYHAVvRgS6WRxE5CgGSOwVxPn8nksq3Vh5PPs
         nCsg==
X-Gm-Message-State: AOJu0YzA1jeByzbIZJP29GzzK+8Fn5MnNAZ/auXsmAznLhTQGWMvLY4j
	OQzvjfW/vK+Y4Wd0KItEQOUKPQ==
X-Google-Smtp-Source: AGHT+IHAbzVBKSdZm7wTqR2x1vEdbjkUfcwg1DIi0NWKJ5cIeVFirBgIn1Yq/YXj66ZWyVJtECsk7w==
X-Received: by 2002:a17:903:2445:b0:1bc:6861:d746 with SMTP id l5-20020a170903244500b001bc6861d746mr185975pls.58.1692387709302;
        Fri, 18 Aug 2023 12:41:49 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id j10-20020a170902da8a00b001a5fccab02dsm2126614plx.177.2023.08.18.12.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 12:41:48 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 0/2] RISC-V: Probe for misaligned access speed
Date: Fri, 18 Aug 2023 12:41:34 -0700
Message-Id: <20230818194136.4084400-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_124151_673612_BA02B921 
X-CRM114-Status: GOOD (  16.24  )
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Evan Green <evan@rivosinc.com>, Greentime Hu <greentime.hu@sifive.com>, Simon Hosie <shosie@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Xianting Tian <xianting.tian@linux.alibaba.com>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


The current setting for the hwprobe bit indicating misaligned access
speed is controlled by a vendor-specific feature probe function. This is
essentially a per-SoC table we have to maintain on behalf of each vendor
going forward. Let's convert that instead to something we detect at
runtime.

We have two assembly routines at the heart of our probe: one that
does a bunch of word-sized accesses (without aligning its input buffer),
and the other that does byte accesses. If we can move a larger number of
bytes using misaligned word accesses than we can with the same amount of
time doing byte accesses, then we can declare misaligned accesses as
"fast".

The tradeoff of reducing this maintenance burden is boot time. We spend
4-6 jiffies per core doing this measurement (0-2 on jiffie edge
alignment, and 4 on measurement). The timing loop was based on
raid6_choose_gen(), which uses (16+1)*N jiffies (where N is the number
of algorithms). By taking only the fastest iteration out of all
attempts for use in the comparison, variance between runs is very low.
On my THead C906, it looks like this:

[    0.047563] cpu0: Ratio of byte access time to unaligned word access is 4.34, unaligned accesses are fast

Several others have chimed in with results on slow machines with the
older algorithm, which took all runs into account, including noise like
interrupts. Even with this variation, results indicate that in all cases
(fast, slow, and emulated) the measured numbers are nowhere near each
other (always multiple factors away).


Changes in v4:
 - Avoid the bare 64-bit divide which fails to link on 32-bit systems,
   use div_u64() (Palmer, buildrobot)

Changes in v3:
 - Fix documentation indentation (Conor)
 - Rename __copy_..._unaligned() to __riscv_copy_..._unaligned() (Conor)
 - Renamed c0,c1 to start_cycles, end_cycles (Conor)
 - Renamed j0,j1 to start_jiffies, now
 - Renamed check_unaligned_access0() to
   check_unaligned_access_boot_cpu() (Conor)

Changes in v2:
 - Explain more in the commit message (Conor)
 - Use a new algorithm that looks for the fastest run (David)
 - Clarify documentatin further (David and Conor)
 - Unify around a single word, "unaligned" (Conor)
 - Align asm operands, and other misc whitespace changes (Conor)

Evan Green (2):
  RISC-V: Probe for unaligned access speed
  RISC-V: alternative: Remove feature_probe_func

 Documentation/riscv/hwprobe.rst      |  11 ++-
 arch/riscv/errata/thead/errata.c     |   8 ---
 arch/riscv/include/asm/alternative.h |   5 --
 arch/riscv/include/asm/cpufeature.h  |   2 +
 arch/riscv/kernel/Makefile           |   1 +
 arch/riscv/kernel/alternative.c      |  19 -----
 arch/riscv/kernel/copy-unaligned.S   |  71 ++++++++++++++++++
 arch/riscv/kernel/copy-unaligned.h   |  13 ++++
 arch/riscv/kernel/cpufeature.c       | 104 +++++++++++++++++++++++++++
 arch/riscv/kernel/smpboot.c          |   3 +-
 10 files changed, 198 insertions(+), 39 deletions(-)
 create mode 100644 arch/riscv/kernel/copy-unaligned.S
 create mode 100644 arch/riscv/kernel/copy-unaligned.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
