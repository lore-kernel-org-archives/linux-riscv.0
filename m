Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D27106FD9D
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 08:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7OHjRTj7tBxbPpQjUyDl+TD6Was8nA3Jophzc1Wd254=; b=10UmvB3mOh/2NP
	fKcEUKh3DYro3eRJ7Ds0Gxdu6l9Ad8+JRS5AAIbbzlqHmhYTCp5dAyceGzWzhmiGAqpgyKHa09afD
	X9wHhrfM6Adv3NkdXwSQv4DN3TQLOTkFqEp51RhvLuUNc5iuirJU9hMI9NZPUg5eBz5XTBZ9834zM
	xOl4yqLHsFZun8UK6IjrR0oxhUgKa6fcjFW95qkGXiE/SPhJk54vo/S390tZY35gPOVn+SX0Wbg/l
	91ZTyOj5tq71rWaxvDTb6LOOuwc47zHeIXTRXioHuVYKz96AOqBXRTbSrFBTZ0EgY/eGGAFW+ZNrw
	TlzppwwZY2vzXhc8ZT5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yAA-0000000HIl3-2f3a;
	Fri, 13 Mar 2026 08:46:30 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yA6-0000000HIjt-3h62
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 08:46:28 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-89a0ece9f14so23272756d6.3
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 01:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773391583; x=1773996383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TviLKLZnSD0EBSvZ7PGeEHJcczKtDOcwFZJjbpr/G8=;
        b=B4pN1kd9cLa+RQXzO/r14Wh0N2GbHy/opqezyEO6ByFqK2w+N6r5TtkFc3dYYvcDSf
         MrIF7V2U4/L+9G7N+9d631aVs4HBXUKANobUJpxkJDLp2qt0gb9ZxFZI1/NhZRpjY6lh
         6QfIukxkYk68Aed1+PlSvAtrbPCUElBmC7EVvY3X/RXXJAYP4HM8XRtxnWIjwWPM6E5h
         d7fuehzFw1kXbZOH1SdjvCZNXVdG3tmIMaUqd2/n4xYJBVmYh5RQu55lan83Mvcljavw
         qIqlvBnuXi5xN5FFV49oMPDEL2J789+H7Uvq1DRjEb0V9r++heetTOVNelAA3G4am3Wf
         bBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773391583; x=1773996383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TviLKLZnSD0EBSvZ7PGeEHJcczKtDOcwFZJjbpr/G8=;
        b=qpQHxGz7RXlfaMceaykO/tmUNBP1mzsiD3NhqCuvMdl1YCo/vzNfTk1oSU+gxv7rbw
         QY3/+0uv+2fewUMq8UOVq4oqhBpIqfQBhQRP2tm5ZlHHPlI5F8KiPMiqyWprEDkTMfQu
         pQ9W2SSMxoXXauV1p66W4imI5s+Z7PE8FcjzgY2wDmPQerrRji0auigmX+r38qkytFev
         JvadDLounHrotWQo9mPd9K0eWuXYT5jYjX7ViNJx/CwuG+dZlQsmCsBkMiOCotOa6Dhs
         WeihEzxWZALXU909z6uXZm+y9lqyEk73d0CVMwVRcPPjM5G0Xo5pXRETPnYSBqdRh9/y
         GeQw==
X-Gm-Message-State: AOJu0YwGuG51PAdpsuGwA2Yp1LG4nvLeqIZHAlxYMgiok9ChCIJohu1s
	/odCHbP5rnDdineOe02RbDSei4JsZbVyZs5Pz3fggOMszz6IB35Zo29dPmRmZULF
X-Gm-Gg: ATEYQzy9HyWRYFLtzWk86DkRbGnAYHbkkPLI+fQ9zDbqmCT6kJDU0opHuzTZ/t8paQn
	AdaKSz/sAddz/nWRZTgK2ymFY85rdPV2R3pbWWVqhijcuRUVZQnzVKnaamRjYT4kh2zqO9TNJm+
	9nyyXFc2bQNoc8q+mdpDSz6ipMlxe45YtEIlUSFYadzvJ9VfkceEh6bDqRZH/JpWBO+XBawm7Dw
	lBVkh6JTvBeLKmX9uw8MsEY2ZFUAR875D6M/Kf93rVKrouI7sanZ2jukjVczP+YA7APTn4TNg2t
	qUrO+jSOkOwcrPwnqzpBmx98mj0wIHxyzXROetsusP4ykWPlq2SD01IMB0XiAma8JNIhmfFo1MH
	XKxtGhXm0QuxCb15+rBrfFcM75y4EXDY4eg7Gx7Zl30Z4Mk/SvlJMmvvABDEi0dfEy+WYz7Y7KV
	l6PbdFIpeyrCTbPMa35UYjzqhJrd6uUXZ9NVc=
X-Received: by 2002:a05:6214:c41:b0:899:d6d2:4b96 with SMTP id 6a1803df08f44-89a81f730acmr40516186d6.34.1773391582639;
        Fri, 13 Mar 2026 01:46:22 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65beb131sm50142206d6.13.2026.03.13.01.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 01:46:21 -0700 (PDT)
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
Subject: [RFC PATCH 0/6] riscv: support EIC770X/JH7110 noncoherent devices with XPbmtUC
Date: Fri, 13 Mar 2026 01:44:01 -0700
Message-Id: <20260313084407.29669-1-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_014626_952957_13D40B21 
X-CRM114-Status: GOOD (  15.30  )
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

Starfive JH7110 and ESWIN EIC770X both have non cache-coherent
peripherals. On JH7110[1], GPU/VOUT/VPU/ISP are routed to the sys port,
making them not cache-coherent. On EIC770X, all peripherals are routed
to the sys port, and none is cache-coherent. To make drivers work on
such platforms, the standard solution is to use Svpbmt and map the DMA
buffer as uncacheable. However, neither SoC supports Svpbmt. Instead,
they map the system memory twice, as cached and uncached. The uncached
alias implicitly applies the uncacheable PMA. To support such platform,
a special form of Svpbmt, namely "XPbmtUC" is introduced in this patch.
It's a synthetical PTE format where a single bit (UC) is controlling
the cacheability and the bit position can be configured at runtime. It
is intended to model the physical memory aliasing with minimal effort.

On JH7110, it aligns perfectly with the HW, as the aliased UC region
happens to be offsetted by 2^34. Thus, configuring the XPbmtUC with
bit=32 (PPN is shifted by 2) is all that needs to be done.

On EIC770X, the aliased UC region is put to a awkward offset, and given
there can be 2 NUMA node (dual-die) with 2 separate memory regions and
their UC alias counterpart, we instead ask the firmware to provide a
thin-layer hypervisor to re-arrange the memory map. The XPbmtUC will be
enabled with bit=38, thus map all UC pages to 2^40 (the upper-half of
2^41), and the underlaying hypervisor will re-map the 2^40+ addresses
to the appropriate UC alias regions. (See description in PATCH 1/6)

We chose bit 38 (PPN bit 40) to make the 2-stage translation efficient.
Hypervisor can utilize Sv39x4 G-stage scheme, and map all pages as 1GB
huge page, consuming only the first-level page table (16KB total), and
several TLB entries. In practice, it's the firmware/bootloader that
configures XPbmtUC through device-tree, based on firmware capabilities,
and skip the enablement on stock firmware. This is tested on Hifive
Premier P550 with the modified OpenSBI[2]. It runs the host Linux in VS
mode, and provide the aforementioned remapping. The performance penalty
(if not running KVM in Linux) is minimal, as the CPU is never switched
to HS mode. A very slight, unavoidable, slow down is with the external
interrupt delivery. Due to the lack of AIA in EIC770X, all device irq
now needs to trap to M mode first, before forwarding to VS mode. The
overhead of running KVM in such setup is yet unknown, and may well be
noticeable, as all HS-qualified instructions will trap to M mode, and
there's also the extra cost of flushing G/VS-stage TLBs. I'm analyzing
it in parallel.

I'm aware there's an ongoing series that Samuel sent for physical
memory aliases. I haven't been following too closely, but if you're
worried about it touching to many areas, I hope my series can shed some
light on the problem. My change is very minimal and local, also fairly
easy to remove if we later decide deprecating it down the road.

[1] https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Cache%20Coherence%20V1.0.pdf
[2] https://github.com/ganboing/opensbi/tree/eic77x-vspt-physalias-wip

Bo Gan (6):
  riscv: Add a custom, simplified version of Svpbmt "XPbmtUC"
  riscv: alternatives: support auipc+load pair
  riscv: apply page table attribute bits for XPbmtUC
  riscv: select RISCV_ISA_XPBMTUC in STARFIVE and ESWIN SoC
  riscv: dts: starfive: jh7110: activate XPbmtUC
  [TESTING-ONLY] riscv: dts: eswin: eic7700: activate XPbmtUC

 arch/riscv/Kconfig                       | 12 ++++++++++++
 arch/riscv/Kconfig.socs                  |  2 ++
 arch/riscv/boot/dts/eswin/eic7700.dtsi   |  1 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi |  1 +
 arch/riscv/include/asm/errata_list.h     | 17 +++++++++++++++--
 arch/riscv/include/asm/hwcap.h           |  1 +
 arch/riscv/include/asm/insn.h            |  8 ++++++++
 arch/riscv/include/asm/pgtable-64.h      | 17 ++++++++++++++++-
 arch/riscv/kernel/alternative.c          | 11 ++++++-----
 arch/riscv/kernel/cpufeature.c           |  8 ++++++++
 arch/riscv/mm/pgtable.c                  |  7 +++++++
 11 files changed, 77 insertions(+), 8 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
