Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44059FC72C5
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 23:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FgBDYb/Sy6/NKOLyrShjmakRYOiowjdj0fP3jo+50N4=; b=T/Mb9OmbaZFyCZ
	wsHhHn67xJgWFLwHyIdoagOmyBv8iCsyvybFK7/xYfI8UCsIW2ozBCw1f9d7s48kdepl9UGDe5uSO
	PjXR7E/8xfRawR093dQ8+X7Yk+tpZaQIkKLLZP5Vb0QlWFfaGIT0pyrp8KJ5DvslYhWVzboqM0jzn
	YsJtNkxxF9ipo+DHhaId8EB0HV0aTVMm+7cb142DZ9tot/CK39VbTRPPyzmYM9VINQ2FEHhb7KVbC
	o7odXM6jNPtuL+YXLbMvNCnInr15y55cOM+JosRZP9JvCps/eWNKR2CXO+fIHYfSXa8WXW1kRQSTp
	rhjmpKQl8oUO1LVOfPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4oJ2-000000007A3-3P4g;
	Mon, 23 Mar 2026 23:03:32 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4oIz-0000000079e-36le
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 23:03:31 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso3120550eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 16:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774307008; x=1774911808; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BZztsE1r2FiTb70Dm21KViQxBIeEVdaH74oQDXwWhlo=;
        b=QfdCYOGMPGvqTTv5owUXj1wE120KIKw6K0g/QlvbbLngMKVQEXCJiBkDZDVZG1UUnK
         C/rgrlfOggShy2y55uyh0cY+d+uFfKTnnWA5qITUFmm3OijbmnLyv+iUuuA+8DDnb+F8
         bu2A9tVCQ+2jizJAjOpHBNKXiF8hbHiWLWW3SqMLgFM29CUDNhSykmcEJtT42Ur8S7cs
         UKBkmIDjzOvNMpYnPI+LHb7uL7sXQYreTgEbZiiInMuM+pwGGBor+uvCF9bgTTzy0bx5
         RoLjbSknUMWLC3QGA8Fqugav6cVLfUp8MclfPTnjBrkk6DWmey4PBkGOHvp4BzeHUCxx
         h7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774307008; x=1774911808;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BZztsE1r2FiTb70Dm21KViQxBIeEVdaH74oQDXwWhlo=;
        b=ik7d8z/lerOCnSPm7Zzu66dJxZgLRH7Kf+ZxtVX4Cd6o3ijky3HHctRSWdtmFZ5iKU
         tmgGVxCMGpzhHYpvBrWFIn8OW6V06RHP8tJ/qOBCzbpG4jzQLpcTgMb+rgUIbYSyd0YG
         oR6mqhFAuU82/arp9ZJbp7DlM+XFNlxFgExLb1kozBExneLDwYKJ6hE98x2L5vlYz1UN
         93mNKfFQx2t+kB4N91wFAS8xJhlz26Kl8QVJGoA8YWPY3UKNoj8rsOcBcgUK1QDurHD5
         ZCjvNpb2z/X9ue8FrsMgiQC2QtCWeLlxXTquzhVQxJETd+csKZpy5J7FOG0IXPiORosQ
         h1Ug==
X-Gm-Message-State: AOJu0YwmW8FNEoVOmbumsMXWPemPlsBA1yqYWKm4q6Km34ai3nGPmN6O
	OKcGq77gYrXarFSPXA5R+tBkjcc5+DuBnDqr8WLOTKzTeYeFv5jaML0M9u5Bq38M
X-Gm-Gg: ATEYQzwiRLH5Xi2TEJleFpd4GDyW2I4G1Upei8ItHr1v8UKODlenH+a/arbfhnJz0Bp
	1KlQShNnSELuFo8kwEAxboTr/QSQvCH1PjFKLGCn7ZZHtZU75DEUy579DKxB/VwmD++FVJe+CQw
	RjNGcl/zNyJ/TSeUaSk9O+/nZhvqiNB5j15lf+EgmtdFa00XXXUAHV7IzDVTAi6/wJtf6vKZdw9
	5x7Til3e3coCu27Hd9nXnY4SXuLQ1WhPMhdoERJAebwhwkZYufQfMun8Qi/2YSj9ySXYLrsQLXs
	EtBDM5em7LscZx1GBletH4ES5ARpSyjMiCDUASCnNUUCDDBwRwbIC1qtXGWJb10M/G+46DpIkiX
	e2IsO42eLpDMu5IN4d15N8PYMTNPiV/foC160lyDTc/rnM0aJ59OXuXzIJ+bYCu+ru4sGnDsQt6
	8HqIBqgAVgXqkE+6rhensuO5Ea4ojvldBQs2WMoh5u2JfseFU=
X-Received: by 2002:a05:7300:7fa2:b0:2c0:bd37:a75a with SMTP id 5a478bee46e88-2c1095a4d38mr7277143eec.1.1774307007715;
        Mon, 23 Mar 2026 16:03:27 -0700 (PDT)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17b8f2sm18642252eec.9.2026.03.23.16.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 16:03:27 -0700 (PDT)
Message-ID: <ee2b42b0-1489-478d-8c88-ced6b77824b3@gmail.com>
Date: Mon, 23 Mar 2026 16:08:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/3] riscv: support EIC770X/JH7110 noncoherent
 devices with XPbmtUC
From: Bo Gan <ganboing@gmail.com>
To: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
 david@redhat.com, palmer@dabbelt.com, pjw@kernel.org, gaohan@iscas.ac.cn,
 me@ziyao.cc
Cc: lizhi2@eswincomputing.com, hal.feng@starfivetech.com,
 marcel@ziswiler.com, conor@kernel.org, kernel@esmil.dk,
 devicetree@vger.kernel.org
References: <20260316060328.1173634-1-ganboing@gmail.com>
Content-Language: en-US
In-Reply-To: <20260316060328.1173634-1-ganboing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_160329_792981_5AE60FEF 
X-CRM114-Status: GOOD (  30.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi All,

Any suggestions/comments on this?

On 3/15/26 23:03, Bo Gan wrote:
> SoCs with pre-Svpbmt Sifive cores, e.g., Starfive JH7110 and ESWIN
> EIC770X both have non cache-coherent peripherals. On JH7110[1], video
> subsystem (GPU/VOUT/VPU/ISP) is routed to the sys port, making them not
> cache-coherent. On EIC770X, all peripherals are routed to the sys port,
> and none is cache-coherent. Instead of Svpbmt, these SoCs map system
> memory twice -- the conventional cached region (through front port),
> and the uncached alias (through sys port) at different base addresses.
> The uncached alias implicitly applies the uncacheable PMA. Drivers
> working with noncoherent devices can utilize the uncache alias to map
> DMA buffers, without doing explicit cache flushes.
> 
> This feature is not an ISA standard, and the cache/uncache base can be
> configured by the SoC vendor. To expose it properly, introduce a Sifive
> "errata", namely "XPbmtUC", to model the setup as a customized version
> of Svpbmt. It choses a single, artificial bit in PTE at runtime for
> cache/uncache control, effectively offsetting the PPN by power-of-2.
> On JH7110, it aligns perfectly with the HW: it maps the cached region
> at 0x40000000, and the uncached alias at 0x4_40000000. Chosing bit 32
> (PPN bit 34) as the UC bit matches HW exactly.
> 
> Starfive JH7110 (Sifive U74 core) memory map:
> 
>            [0x0,   0x40000000) Low MMIO
>     [0x40000000, 0x2_40000000) Cached Mem
>   [0x4_40000000, 0x6_40000000) Uncached Mem (UC+)
>   [0x9_00000000, 0x9_d0000000) High MMIO
> 
> On EIC770X, the aliased UC region is put to a offset not power-of-2.
> There can also be 2 NUMA node (dual-die) with 2 separate memory regions
> and their UC alias counterparts are offsetted differently. We detect if
> the firmware has the capability to re-arrange the memory map, using
> G-stage pagetable, making the the offsets power-of-2 again.
> 
>              [0x0,     0x20000000) Core Internal
>       [0x20000000,     0x40000000) Core Internal (Die 1)
>       [0x40000000,     0x60000000) Low MMIO
>       [0x60000000,     0x80000000) Low MMIO (Die 1)
>       [0x80000000,  0x10_80000000) Cached Mem
>    [0x20_00000000,  0x30_00000000) Cached Mem (Die 1)
>    [0x80_00000000,  0xa0_00000000) High MMIO
>    [0xa0_00000000,  0xc0_00000000) High MMIO (Die 1)
>    [0xc0_00000000,  0xd0_00000000) Uncached Mem <----------.
>    [0xe0_00000000,  0xf0_00000000) Uncached Mem (Die 1) <--+--.
> with firmware/hypervisor re-mapping:                      |  |
> ------------------------------------                      |  |
>   [0x100_80000000, 0x110_80000000) Mem UC+ ----------------'  |
>   [0x120_00000000, 0x130_00000000) Mem UC+ (Die 1) -----------'
> 
> The "XPbmtUC" alternative PTE format is the cleanest solution I can
> think of to solve the non-coherent device enablement w/o Svpbmt from
> kernel side. Drivers can do explicit cache flushes to workaround the
> problem, but a. it pushes the burden of cache flushes to driver code,
> and we don't want to complicate them if it's already written with the
> cache coherent assumption in mind. b. complex drivers like GPU could
> allow user-space to mmap DMA pages, but userspace can't flush caches
> due to the lack of Zicbom on these SoCs. I'm aware there's an ongoing
> series[2] that Samuel sent for physical memory aliases, which is
> essentially a superset of my patch. I don't mean to step ahead of him,
> but try to find a middle ground if the community still worries about
> his change touching too many areas. My change is very minimal and
> local. It's fairly easy to remove, too.
> 
> ----------------------------------------
> Notes about PoC firmware implementation on EIC7700X[3]:
> 
> The OpenSBI is augmented to provide a very thin layer hypervisor, where
> it runs the entire host OS in VS-mode, and provide the aforementioned
> remapping. I remap UC+ memory to 2^40+ to make the 2-stage translation
> efficient, where I can utilize Sv39x4 G-stage scheme to map the entire
> physical address space at bottom-half, and the uncache counterparts to
> system memory at top-half. I also make use of the largest page in Sv39
> -- 1GB page, to map everything, keeping the G-stage page-table minimal,
> only 16KB in size, while also minimizing TLB misses. A very slight,
> unavoidable, slow down is with the external interrupt delivery. Due to
> the lack of AIA in EIC770X, all device irq now needs to trap to M mode
> first, before forwarding to VS mode. The overhead of running KVM in
> such setup is yet unknown, and may well be noticeable. All HS-qualified
> instructions will trap to M mode, which is costly. The NACL extension,
> if implemented, will alleviate it, but there's also the extra cost of
> flushing G/VS-stage TLBs. I'm analyzing it in parallel.
> 
> Use [4] if you have a Hifive Premier P550 to try it out.
> 
> [1] https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Cache%20Coherence%20V1.0.pdf
> [2] https://lore.kernel.org/all/20251113014656.2605447-20-samuel.holland@sifive.com/
> [3] https://github.com/ganboing/opensbi/tree/eic77x-vspt-physalias-wip
> [4] https://github.com/ganboing/linux-eic77/tree/ganboing-xpbmt-uc-v2-eic77-clk-v15
> 
> ---
> v2:
>   - Move the core logic to Sifive errata to address Conor's comments
> 
> v1: https://lore.kernel.org/linux-riscv/338f0f79-1eed-4c5c-9966-04a2eaeb3d98@gmail.com
> 
> Bo Gan (3):
>    riscv: alternatives: support auipc+load pair
>    riscv: errata: sifive: support auipc/load pair in patched alternatives
>    riscv: errata: sifive: Add an "errata" to simulate Svpbmt on cores
>      without
> 
>   arch/riscv/Kconfig.errata                    | 13 ++++
>   arch/riscv/errata/sifive/errata.c            | 80 +++++++++++++++++++-
>   arch/riscv/include/asm/errata_list.h         | 19 ++++-
>   arch/riscv/include/asm/errata_list_vendors.h |  3 +-
>   arch/riscv/include/asm/insn.h                |  8 ++
>   arch/riscv/include/asm/pgtable-64.h          |  9 ++-
>   arch/riscv/kernel/alternative.c              | 11 +--
>   7 files changed, 132 insertions(+), 11 deletions(-)
> 

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
