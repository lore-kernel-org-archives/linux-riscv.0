Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99340107BCE6
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 22:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oi3pMe5wzbTuVnHkD/FJGOgDFpI4f5zLbIjGG5yWPik=; b=rfm0kSGuuzhX22
	ontNynLuOdLY0mW79Cy9tJPKjEZHOXfmHgCL7DXTCzEp6GvpzUgm8umKmNtaFVVZJ9ylWVqEacQKW
	iFcdKq42KyEix3GyUXoQoFmRxq3zsRQfPywPf8UudtAtwcdH0UG1eq9VqRC/cYUB14AKGbmIxRXmc
	H7sPFmrK0F2BdhwdQm7z0Ec5Y7vf9iDBRxB1ynR71a39Ef8t6KAKRjZVYqG15yfNdfkvfLkr87Vss
	khoTRrfD6LB1huYtpVnKsl2gBAo4x4kBDDvLeYg+m01Kev7hp/6yC/spDLQ00zIMK0xIsu3LKvD1U
	6cBuDUN6x3W0BPL9R7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Ajw-00000001G6v-0iat;
	Fri, 13 Mar 2026 22:12:16 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Ajs-00000001G6W-40NV
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 22:12:14 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2ba895adfeaso2843402eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 15:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773439932; x=1774044732; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fdJ8YTk3Y5PWsipane+dpCcPmUZ5IoU6AqaNYKwWMkg=;
        b=KRQa+B8Bx6f0m6hqo4qO5M3SAY5ylvAZrQMqXrmtu/tpf41H59pOJqruNG7NQIugdv
         rhrdiWXpsdYlcdr3IU6EUwGD8/jq3n7/vLZGlP4hhroF4DdiKQ1qdecmTnOE9bXU6DdT
         FGAZfzqZdnm34DWUI8MUsPaIDr2iSJyyQ56UFWir/DjKiw86dtdr6SRg6sBy1TX1VZkE
         wHqYkUsbIDAs7LcBR2rhoT5a2TfaJo7HILNeJzjTh/ed/I6FE5pKJXAFevqwf1YINavA
         i7OXqkxENnN9f1IJ+jApVl9M7Yrm2vnqRdkfvszheeajBT98PXVAv2WPFVgrF/f+bIzD
         +D7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773439932; x=1774044732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdJ8YTk3Y5PWsipane+dpCcPmUZ5IoU6AqaNYKwWMkg=;
        b=Al8Opn0QWAoQFkZatmvsVx/AR9EAlxzr1Ggpjk3bPRzoqd4ZMbonT10jQVvNoxhtu5
         Rq7lNWJYqcoYBRA2JHt8B1pJmwo/ZTAMttMcvfHi2a1xA3JQZXQhdwgTPTbUOSTVVO8h
         CFbJfFHlourSqgEVM+r5dtcFVYYnq/ScIsdk+0422YsdBARdB6QFz/cNIWRAwZ4cIix3
         JqGL1DW3V3WiB7o+6goXZmt6MgS7Hv7tgRnGkcSVhL1rrNoiiUo3pT6M9i5ZerSLdOtT
         POw2sappooDs/EoUYRSofbyO4YvoTF2hfhDJoOi0QzaihN96IuT0cGR31QSa+WvmSXj7
         fpug==
X-Gm-Message-State: AOJu0YxgKjNXVSB3Cgy3jUpNTYe8+umELR+Y2KXXkbKnrRFdoS9WNSnK
	z6saN/uyJKbADTxHjKyTBJBzQLkDgkmMt7hjhUy+mPSA7oJtfa+14OgQ
X-Gm-Gg: ATEYQzw18nGSbRXG39rvCzHHntMe4lr7twoREWXyEwT2vm+1t7/2V4gDd6enJy5jBPy
	rRXsEojki7cH3c7h+7QPIoGfPrf90yaRS4SiwcgtMm5j+xAxdnyys9mgWPrlvE2vF4w2BLppsdI
	4RXIZKf2awUcvQfVPqv/XoE/pmIXaYovkqwLpIszi6hTYWwqTgrNhTBVNNa5Tc0c02NY+1WtLfi
	CLWNo21serctKykP70FrCKYFHHnceIeXcHoeyvgkAfD8QnZTMvZoWBWZhAjnnAorM/CQdPGeXPc
	NIfwrrS7OgDykJy1CAQ0W/qX6ovAlKQ0KVgiwdVcYEQ1s4Rk211wZo1uHTJbsWwnSh3fVWa+cva
	cXsHVcijWuvDXs0/luxCmQB1O0fK5tZI1tR9aw4YfH/qAZga6UK50KZfb2s/4ZKlcz9kH1wXg3E
	N8s0k0b16GzqDNK/x2gPFt0TZqkWR2aU9WDnrOpzzojA9Xi+ZGbk1Kx0GhjQ==
X-Received: by 2002:a05:7300:e887:b0:2bd:cfce:4c4b with SMTP id 5a478bee46e88-2bea5434677mr2436598eec.2.1773439931999;
        Fri, 13 Mar 2026 15:12:11 -0700 (PDT)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526d61sm5063802eec.17.2026.03.13.15.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 15:12:10 -0700 (PDT)
Message-ID: <338f0f79-1eed-4c5c-9966-04a2eaeb3d98@gmail.com>
Date: Fri, 13 Mar 2026 15:17:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] riscv: support EIC770X/JH7110 noncoherent devices
 with XPbmtUC
To: Conor Dooley <conor@kernel.org>, Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
 david@redhat.com, palmer@dabbelt.com, pjw@kernel.org, gaohan@iscas.ac.cn,
 me@ziyao.cc, lizhi2@eswincomputing.com, hal.feng@starfivetech.com,
 marcel@ziswiler.com, kernel@esmil.dk, devicetree@vger.kernel.org
References: <20260313084407.29669-1-ganboing@gmail.com>
 <20260313-uninsured-desecrate-06d51e8c100d@spud>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260313-uninsured-desecrate-06d51e8c100d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_151213_525652_FFF9E0F6 
X-CRM114-Status: GOOD (  20.27  )
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

Hi

On 3/13/26 05:30, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 01:44:01AM -0700, Bo Gan wrote:
>> Starfive JH7110 and ESWIN EIC770X both have non cache-coherent
>> peripherals. On JH7110[1], GPU/VOUT/VPU/ISP are routed to the sys port,
>> making them not cache-coherent. On EIC770X, all peripherals are routed
>> to the sys port, and none is cache-coherent. To make drivers work on
>> such platforms, the standard solution is to use Svpbmt and map the DMA
>> buffer as uncacheable. However, neither SoC supports Svpbmt. Instead,
>> they map the system memory twice, as cached and uncached. The uncached
>> alias implicitly applies the uncacheable PMA. To support such platform,
>> a special form of Svpbmt, namely "XPbmtUC" is introduced in this patch.
>> It's a synthetical PTE format where a single bit (UC) is controlling
>> the cacheability and the bit position can be configured at runtime. It
>> is intended to model the physical memory aliasing with minimal effort.
>>
>> On JH7110, it aligns perfectly with the HW, as the aliased UC region
>> happens to be offsetted by 2^34. Thus, configuring the XPbmtUC with
>> bit=32 (PPN is shifted by 2) is all that needs to be done.
>>
>> On EIC770X, the aliased UC region is put to a awkward offset, and given
>> there can be 2 NUMA node (dual-die) with 2 separate memory regions and
>> their UC alias counterpart, we instead ask the firmware to provide a
>> thin-layer hypervisor to re-arrange the memory map. The XPbmtUC will be
>> enabled with bit=38, thus map all UC pages to 2^40 (the upper-half of
>> 2^41), and the underlaying hypervisor will re-map the 2^40+ addresses
>> to the appropriate UC alias regions. (See description in PATCH 1/6)
>>
>> We chose bit 38 (PPN bit 40) to make the 2-stage translation efficient.
>> Hypervisor can utilize Sv39x4 G-stage scheme, and map all pages as 1GB
>> huge page, consuming only the first-level page table (16KB total), and
>> several TLB entries. In practice, it's the firmware/bootloader that
>> configures XPbmtUC through device-tree, based on firmware capabilities,
>> and skip the enablement on stock firmware. This is tested on Hifive
>> Premier P550 with the modified OpenSBI[2]. It runs the host Linux in VS
>> mode, and provide the aforementioned remapping. The performance penalty
>> (if not running KVM in Linux) is minimal, as the CPU is never switched
>> to HS mode. A very slight, unavoidable, slow down is with the external
>> interrupt delivery. Due to the lack of AIA in EIC770X, all device irq
>> now needs to trap to M mode first, before forwarding to VS mode. The
>> overhead of running KVM in such setup is yet unknown, and may well be
>> noticeable, as all HS-qualified instructions will trap to M mode, and
>> there's also the extra cost of flushing G/VS-stage TLBs. I'm analyzing
>> it in parallel.
>>
>> I'm aware there's an ongoing series that Samuel sent for physical
>> memory aliases. I haven't been following too closely, but if you're
>> worried about it touching to many areas, I hope my series can shed some
>> light on the problem. My change is very minimal and local, also fairly
>> easy to remove if we later decide deprecating it down the road.
>>
>> [1] https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Cache%20Coherence%20V1.0.pdf
>> [2] https://github.com/ganboing/opensbi/tree/eic77x-vspt-physalias-wip
> 
> For those following along at home, Samuel's series is:
> https://lore.kernel.org/all/20251113014656.2605447-20-samuel.holland@sifive.com/
> 
> I've been meaning to try it, but never conjured up the time to dig into
> it...

Thanks, Conor. I don't mean to step ahead of Samuel, just want to find a
middle ground that's easier to maintain from kernel perspective. I know
riscv HW is evolving rapidly, and we just don't want to add way too many
workarounds for each SoC. Hence I decided to move the re-mapping logic to
firmware/hypervisor to keep the kernel clean. If you'd like, use my v6.19
tree for testing on Hifive P550 if you have one:
https://github.com/ganboing/linux-eic77/tree/ganboing-xpbmt-uc-v1-eic77-clk-v15
I'm also sanity checking on my JH7110.

Bo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
