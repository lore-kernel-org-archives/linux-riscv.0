Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C81EC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Mar 2022 23:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=G7ZhW28q7nkO/AFm9SRXOJkCkaJ8oxdh7J6oHRTiNUw=; b=nUcZryXYwoqkHeZcgUWOZIhXZ9
	Fvtpnot4IEb8odN4R7GphHguYHyrPnPT8UnhkDvKWfEfybq+Chci59ldCiETA7gFYUNj8INGVwdGk
	DxV38RGEH8gOcK3kTgIt4C3zguJnd+QAllxpxNLstcB7NhZo9X2domHdmfEZbH36hoN1oV53EkUjs
	9fZxLYzl2Xc1P/iGj01MNL3JZftQcYJg8ecEteI/38aDrFtA/9RGeqJqrqnJlYh5HkbtvS5nbkEpz
	mGLpPM2vgJAHW+9Ty18vMUn/ahafpcDf7F/ES/GiC88K9FdzHuUFzI6kJ+53mb+mrkNbuR3FWMctB
	le54g7tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSSYg-00EMBB-Q8; Thu, 10 Mar 2022 23:51:02 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSSYc-00EM9y-OG
 for linux-riscv@lists.infradead.org; Thu, 10 Mar 2022 23:51:00 +0000
Received: by mail-pf1-x42a.google.com with SMTP id p8so6456223pfh.8
 for <linux-riscv@lists.infradead.org>; Thu, 10 Mar 2022 15:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=INgj8rTXvSAzUwJnpuawPcVUdKw6g6SAvhUFGBPa20w=;
 b=fbWHVX62vUa8exJGyTct1ga0AZuEMcW93/RSwfhyfYd0KV0/zdmtLALmkjeYXPDWBs
 kVyY27sewIxi+DJ45gNPp8FKm7OtDu3KUc4Zu3hgB/jx93UbW4Cm6klaLOF/3BlcVsXj
 jLIs9bXJviSUvp4Aml/5x3hoGyv1EEgB/YH+i8JofknAH1oJkjoqPccSSeHuVQmUjl+b
 WiILqgKpC4/Y3CPPcUpXAISKldi2IQ/WB350w3s4+n3jSuzL34+1DZ1PrYGYFHSIAXB4
 TkkyKLi5OV11krzpmH4qHSIMxhFyAoD1GKADP6w6hemtbWDK4o/69nNypA2n7RB2+H0g
 U2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=INgj8rTXvSAzUwJnpuawPcVUdKw6g6SAvhUFGBPa20w=;
 b=4iRuu7NSFa6NN7XQkj0MJvjZ9fX4Mg37ZmYRHrilaIzaHAx+tLqgZvMhjJxKXZEDwM
 SmLwzmfznusC9Hf5+sdCnNsy2fHxkwzoRaWWMtu91UlvCjH3bzJxPF0x+gcYrXDrhDeB
 HNsPVFrQ5SRA2apCc33MHdIyByz5Bkfh6Vwb/G5ctwjW+yQcD8dszmWJf9UbU4aRbh6t
 9c3ncHlDjwaRjywSTZeZU5LnF/VpZ97/fM/VhtmAKJqiGv2UW4m/aABAPzL1BMQB0XF8
 S6YeXOFlgzejDQufM8Tc0jocp7u0Lre9w1pnNKSUH0r3L++1MJdivx52MDOGRfhGDlca
 GnZg==
X-Gm-Message-State: AOAM531FTQ0y0UxvLLjVWdOiaxKwvWtZ297Q9CODsGB9ZzJ8Bn2CSHWT
 LLu+BeEu2Ud46PuMLOJAOQgqoQ==
X-Google-Smtp-Source: ABdhPJwXJfHEQvMlhBajppaP3JQkQ/qujHp3qSdGTjciaGZUR7sqgIGDkyhI60/Ju+m1lkZSnfOJQw==
X-Received: by 2002:a63:1c58:0:b0:380:bfd8:9e10 with SMTP id
 c24-20020a631c58000000b00380bfd89e10mr6183633pgm.422.1646956255724; 
 Thu, 10 Mar 2022 15:50:55 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 rm8-20020a17090b3ec800b001bcd57956desm7006323pjb.51.2022.03.10.15.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 15:50:55 -0800 (PST)
Date: Thu, 10 Mar 2022 15:50:55 -0800 (PST)
X-Google-Original-Date: Thu, 10 Mar 2022 15:49:44 PST (-0800)
Subject: Re: [PATCH v5 0/6] Provide a fraemework for RISC-V ISA extensions 
In-Reply-To: <20220222204811.2281949-1-atishp@rivosinc.com>
CC: linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>,
 aou@eecs.berkeley.edu, atishp@atishpatra.org, anup@brainfault.org,
 damien.lemoal@wdc.com, devicetree@vger.kernel.org, jszhang@kernel.org,
 krzysztof.kozlowski@canonical.com, 
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 robh+dt@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <atishp@rivosinc.com>
Message-ID: <mhng-4593ea1e-503d-47df-8e55-d2ef06f01518@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_155058_890242_15D3F90D 
X-CRM114-Status: GOOD (  29.05  )
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

On Tue, 22 Feb 2022 12:48:05 PST (-0800), Atish Patra wrote:
> This series implements a generic framework to parse multi-letter ISA
> extensions. This series is based on Tsukasa's v3 isa extension improvement
> series[1]. I have fixed few bugs and improved comments from that series
> (PATCH1-3). I have not used PATCH 4 from that series as we are not using
> ISA extension versioning as of now. We can add that later if required.
>
> PATCH 4 allows the probing of multi-letter extensions via a macro.
> It continues to use the common isa extensions between all the harts.
> Thus hetergenous hart systems will only see the common ISA extensions.
>
> PATCH 6 improves the /proc/cpuinfo interface for the available ISA extensions
> via /proc/cpuinfo.
>
> Here is the example output of /proc/cpuinfo:
> (with debug patches in Qemu and Linux kernel)
>
> # cat /proc/cpuinfo
> processor	: 0
> hart		: 0
> isa		: rv64imafdch
> isa-ext		: svpbmt svnapot svinval

I know it might seem a bit pedantic, but I really don't want to 
introduce a new format for encoding ISA extensions -- doubly so if this 
is the only way we're giving this info to userspace, as then we're just 
asking folks to turn this into a defacto ABI.  Every time we try to do 
something that's sort of like an ISA string but not exactly what's in 
the spec we end up getting burned, and while I don't see a specific way 
that could happen here that's what's happened so many times before I 
just don't want to risk it.

I've gone ahead and removed some of this information (isa-ext, and all 
the single-letter extensions we can't properly turn on yet) from 
/proc/cpuinfo, modifying the last patch to do so.  It's at 
palmer/riscv-isa, LMK if that's OK.

I'm not opposed to doing something here, I just really don't want to 
rush into it as we've already got enough complexity around the various 
flavors of ISA strings.  I don't see a big pressing need to provide this 
information to userspace, but having the rest of this sorted out is 
great (and there's some dependencies on this) so I'd prefer to just 
stick to what we know is good.

> mmu		: sv48
>
> processor	: 1
> hart		: 1
> isa		: rv64imafdch
> isa-ext		: svpbmt svnapot svinval
> mmu		: sv48
>
> processor	: 2
> hart		: 2
> isa		: rv64imafdch
> isa-ext		: svpbmt svnapot svinval
> mmu		: sv48
>
> processor	: 3
> hart		: 3
> isa		: rv64imafdch
> isa-ext		: svpbmt svnapot svinval
> mmu		: sv48
>
> Anybody adding support for any new multi-letter extensions should add an
> entry to the riscv_isa_ext_id and the isa extension array.
> E.g. The patch[2] adds the support for various ISA extensions.
>
> [1] https://lore.kernel.org/all/0f568515-a05e-8204-aae3-035975af3ee8@irq.a4lg.com/T/
> [2] https://github.com/atishp04/linux/commit/e9e240c9a854dceb434ceb53bdbe82a657bee5f2
>
> Changes from v4->v5:
> 1. Improved the /proc/cpuinfo to include only valid & enabled extensions
> 2. Improved the multi-letter parsing by skipping the 'su' modes generated in
>    Qemu as suggested by Tsukasa.
>
> Changes from v3->v4:
> 1. Changed temporary variable for current hart isa to a bitmap
> 2. Added reviewed-by tags.
> 3. Improved comments
>
> Changes from v2->v3:
> 1. Updated comments to mark clearly a fix required for Qemu only.
> 2. Fixed a bug where the 1st multi-letter extension can be present without _
> 3. Added Tested by tags.
>
> Changes from v1->v2:
> 1. Instead of adding a separate DT property use the riscv,isa property.
> 2. Based on Tsukasa's v3 isa extension improvement series.
>
> Atish Patra (3):
> RISC-V: Implement multi-letter ISA extension probing framework
> RISC-V: Do no continue isa string parsing without correct XLEN
> RISC-V: Improve /proc/cpuinfo output for ISA extensions
>
> Tsukasa OI (3):
> RISC-V: Correctly print supported extensions
> RISC-V: Minimal parser for "riscv, isa" strings
> RISC-V: Extract multi-letter extension names from "riscv, isa"
>
> arch/riscv/include/asm/hwcap.h |  25 +++++++
> arch/riscv/kernel/cpu.c        |  51 ++++++++++++-
> arch/riscv/kernel/cpufeature.c | 130 +++++++++++++++++++++++++++------
> 3 files changed, 183 insertions(+), 23 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
