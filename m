Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F630D58B21
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 06:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wWBHX1D5ZrmW4dYRP7gKhuzHaapl1qGQWUGwz/XJg6s=; b=X6NX8dCU2fji0g
	5EHnS6P1CyEOrz4G7lDBNPexUWTBBZTJAbJvLBrepegJbe0uatnCmikCkVCkVbOoDtFT5hca2SGL7
	cfwli2K0ok0EmcTnbk3rx6LnT3XetnqhE88vq7hFgjQmEPUQQEp69KnEl+TSTOPIk4jn+5pUPbUPx
	Pp2kIAkg5HmvXgc6GOUjwfx+BtBx8+PJ8JCoOTcg8fEsAyw1YxSM3WkpAowQwPLbiEasjBSC3oT5c
	rjuBgQQDKNnECyK9MzgJTvy+A1eZaw0Bf+EfDtLQUl2xUJAHAGa9sH6KOm/NYpIP0RCZr4q+B6fn3
	Lv+g8Yqs643iCBmvOaLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w215M-00000003Nrr-0A6s;
	Mon, 16 Mar 2026 06:05:52 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w215F-00000003Npu-0w1r
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 06:05:47 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-824c9da9928so2687992b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 15 Mar 2026 23:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773641142; x=1774245942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XqADmgEQy7gNByruAkWImtwTKNM7Exnw9tKz+3+dv0M=;
        b=CFdnePKrN0hs+oxDfw7eV1GvPAesONeJTdI1N4GrlJiymerSTFn+sQD32l3B6CAKbN
         888XEnL4x2pH/daA2umNy5/04Usnx2dyd4Qfv0b+pShXea79dPxrlhaqZ79XAnpbNFgt
         lKfpHFn4ZyjvWm45mTZ3TepxRMasaUBUVPKVS3Hf75Iv/ZhgH9MmxEiJeaPZczdPCUrr
         8tB7OsPusil+6kRdPoC6Qgkvl8hftwYVNmja7C7CDTc1v1kq7UQcTDjkU57+tbwPMYl7
         0xRBp5kPuYPYKcwUJcyUn6hIAwxXY/VmwPQpYHS3u2pnNnq/l71bnNLqyzA122qsRWND
         QY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773641142; x=1774245942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqADmgEQy7gNByruAkWImtwTKNM7Exnw9tKz+3+dv0M=;
        b=U+WlkialEFNby+n8S9qEF78r/hFPIcLuai7/OD8gwaM9dHkJe3yvbZunTuWarHv+Oe
         B2SOf6bSqvE/TuVeTIYBzkEPpVbu/uAt0c5+bS8amhAHx/h2GS3qe6WivevwLPUXrXAf
         JTe8Z8yrNY3J5dshsPZeStJM67sruhcK2/jR1glqQ83BGO+zepYipBkzmFVMArfPivHD
         61UZdO56ktnjARfWCh2lATd5+Tq3ARJF0qiPVZvTBvLxw/Aj5cmTIJbrTi7mfTzNE7CT
         gzwMXGUjvAVx1haKZDDKy8BgBLZecBzAa+alG7NDhRKQUb9T9KTLZ7PfwvG/HdByWTv9
         pAzQ==
X-Gm-Message-State: AOJu0YyTho4Rpqybs0C74dKSrnyLEIV9TN0ZWl7eIuhtSx+VKheGJcqU
	NsrW7/oWjDqyqfiVwyT6S1vP1NaH6iOHp8FDYwiAcWWZ1MSPZ/VL7FSFDyJNFQ==
X-Gm-Gg: ATEYQzz3MW0ZfbVM9TxiVB/A24WROkxQ7ccxVYUV1dMGv5bsM4DYDzeYTH38rBewZx5
	Vg/wl0yIT9RWX23x5pf2t+2JkXmS88zP7Fdi5g/ktBacJ9Vc/Wr0yau95mrjBInWd1OAZ0+M+kc
	RHcjJEfyWYM2uYdsbIXgowuo+rBn5bq6t91oyVSKppZaxidupbQf7ZlMTQwx2XkpgZmhtgcegQf
	hiT7kM+4rfA/P7T8TPcM83T+RhDRsWl2fp1pK3R28iyyR2t3TgEPAJRXiPUwtN9MNE4Zv4bMYJx
	rciNr/wY9vYOw8LMGO+zm7ef7XFwyp6+F0MaV75U+uka74ZT8EUlGd0Y1NF7fEfa0NJghWLx37V
	sDEM18TRF5k+SvDeGZ326RGkuCWwx3E9MpMSmdiqAHr4ECtMKcypFJPS5wpoGjJEHoqeq0iYyZ1
	Y/DcDxcpij1yKlG3VZT1OnHW73DoIrfSeeQzM=
X-Received: by 2002:a05:6a00:3e22:b0:829:a127:518 with SMTP id d2e1a72fcca58-82a198d152dmr8827062b3a.40.1773641142279;
        Sun, 15 Mar 2026 23:05:42 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07393098sm12525226b3a.62.2026.03.15.23.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 23:05:41 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: linux-riscv@lists.infradead.org,
	samuel.holland@sifive.com,
	david@redhat.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	gaohan@iscas.ac.cn,
	me@ziyao.cc
Cc: lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com,
	marcel@ziswiler.com,
	conor@kernel.org,
	kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: [RFC PATCH v2 0/3] riscv: support EIC770X/JH7110 noncoherent devices with XPbmtUC
Date: Sun, 15 Mar 2026 23:03:25 -0700
Message-Id: <20260316060328.1173634-1-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_230545_270037_D86D3F4E 
X-CRM114-Status: GOOD (  16.47  )
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

SoCs with pre-Svpbmt Sifive cores, e.g., Starfive JH7110 and ESWIN
EIC770X both have non cache-coherent peripherals. On JH7110[1], video
subsystem (GPU/VOUT/VPU/ISP) is routed to the sys port, making them not
cache-coherent. On EIC770X, all peripherals are routed to the sys port,
and none is cache-coherent. Instead of Svpbmt, these SoCs map system
memory twice -- the conventional cached region (through front port),
and the uncached alias (through sys port) at different base addresses.
The uncached alias implicitly applies the uncacheable PMA. Drivers
working with noncoherent devices can utilize the uncache alias to map
DMA buffers, without doing explicit cache flushes.

This feature is not an ISA standard, and the cache/uncache base can be
configured by the SoC vendor. To expose it properly, introduce a Sifive
"errata", namely "XPbmtUC", to model the setup as a customized version
of Svpbmt. It choses a single, artificial bit in PTE at runtime for
cache/uncache control, effectively offsetting the PPN by power-of-2.
On JH7110, it aligns perfectly with the HW: it maps the cached region
at 0x40000000, and the uncached alias at 0x4_40000000. Chosing bit 32
(PPN bit 34) as the UC bit matches HW exactly.

Starfive JH7110 (Sifive U74 core) memory map:

          [0x0,   0x40000000) Low MMIO
   [0x40000000, 0x2_40000000) Cached Mem
 [0x4_40000000, 0x6_40000000) Uncached Mem (UC+)
 [0x9_00000000, 0x9_d0000000) High MMIO

On EIC770X, the aliased UC region is put to a offset not power-of-2.
There can also be 2 NUMA node (dual-die) with 2 separate memory regions
and their UC alias counterparts are offsetted differently. We detect if
the firmware has the capability to re-arrange the memory map, using
G-stage pagetable, making the the offsets power-of-2 again.

            [0x0,     0x20000000) Core Internal
     [0x20000000,     0x40000000) Core Internal (Die 1)
     [0x40000000,     0x60000000) Low MMIO
     [0x60000000,     0x80000000) Low MMIO (Die 1)
     [0x80000000,  0x10_80000000) Cached Mem
  [0x20_00000000,  0x30_00000000) Cached Mem (Die 1)
  [0x80_00000000,  0xa0_00000000) High MMIO
  [0xa0_00000000,  0xc0_00000000) High MMIO (Die 1)
  [0xc0_00000000,  0xd0_00000000) Uncached Mem <----------.
  [0xe0_00000000,  0xf0_00000000) Uncached Mem (Die 1) <--+--.
with firmware/hypervisor re-mapping:                      |  |
------------------------------------                      |  |
 [0x100_80000000, 0x110_80000000) Mem UC+ ----------------'  |
 [0x120_00000000, 0x130_00000000) Mem UC+ (Die 1) -----------'

The "XPbmtUC" alternative PTE format is the cleanest solution I can
think of to solve the non-coherent device enablement w/o Svpbmt from
kernel side. Drivers can do explicit cache flushes to workaround the
problem, but a. it pushes the burden of cache flushes to driver code,
and we don't want to complicate them if it's already written with the
cache coherent assumption in mind. b. complex drivers like GPU could
allow user-space to mmap DMA pages, but userspace can't flush caches
due to the lack of Zicbom on these SoCs. I'm aware there's an ongoing
series[2] that Samuel sent for physical memory aliases, which is
essentially a superset of my patch. I don't mean to step ahead of him,
but try to find a middle ground if the community still worries about
his change touching too many areas. My change is very minimal and
local. It's fairly easy to remove, too.

----------------------------------------
Notes about PoC firmware implementation on EIC7700X[3]:

The OpenSBI is augmented to provide a very thin layer hypervisor, where
it runs the entire host OS in VS-mode, and provide the aforementioned
remapping. I remap UC+ memory to 2^40+ to make the 2-stage translation
efficient, where I can utilize Sv39x4 G-stage scheme to map the entire
physical address space at bottom-half, and the uncache counterparts to
system memory at top-half. I also make use of the largest page in Sv39
-- 1GB page, to map everything, keeping the G-stage page-table minimal,
only 16KB in size, while also minimizing TLB misses. A very slight,
unavoidable, slow down is with the external interrupt delivery. Due to
the lack of AIA in EIC770X, all device irq now needs to trap to M mode
first, before forwarding to VS mode. The overhead of running KVM in
such setup is yet unknown, and may well be noticeable. All HS-qualified
instructions will trap to M mode, which is costly. The NACL extension,
if implemented, will alleviate it, but there's also the extra cost of
flushing G/VS-stage TLBs. I'm analyzing it in parallel.

Use [4] if you have a Hifive Premier P550 to try it out.

[1] https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Cache%20Coherence%20V1.0.pdf
[2] https://lore.kernel.org/all/20251113014656.2605447-20-samuel.holland@sifive.com/
[3] https://github.com/ganboing/opensbi/tree/eic77x-vspt-physalias-wip
[4] https://github.com/ganboing/linux-eic77/tree/ganboing-xpbmt-uc-v2-eic77-clk-v15

---
v2:
 - Move the core logic to Sifive errata to address Conor's comments

v1: https://lore.kernel.org/linux-riscv/338f0f79-1eed-4c5c-9966-04a2eaeb3d98@gmail.com

Bo Gan (3):
  riscv: alternatives: support auipc+load pair
  riscv: errata: sifive: support auipc/load pair in patched alternatives
  riscv: errata: sifive: Add an "errata" to simulate Svpbmt on cores
    without

 arch/riscv/Kconfig.errata                    | 13 ++++
 arch/riscv/errata/sifive/errata.c            | 80 +++++++++++++++++++-
 arch/riscv/include/asm/errata_list.h         | 19 ++++-
 arch/riscv/include/asm/errata_list_vendors.h |  3 +-
 arch/riscv/include/asm/insn.h                |  8 ++
 arch/riscv/include/asm/pgtable-64.h          |  9 ++-
 arch/riscv/kernel/alternative.c              | 11 +--
 7 files changed, 132 insertions(+), 11 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
