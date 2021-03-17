Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D600FC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 04:53:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71BD764F9F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 04:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71BD764F9F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=wMRAVzQ1otP1gexzHv4QLpoS2htVz7ZKbuzTnwGcGjY=; b=UaxESmjLcX73vsJHgNFo0892e
	hkquPfRFp1SJmBY3NHkIad+Uw2z2WXTX7iGFzq7u74v1NcNWsv+8Q7e4gJH2Mn/fIYWfK9zHdKuuy
	gwlKwKJDOnthbmVwK59ks1krIBYFDU5IOoPoVsTtyCz2wkWCVVNSqq7AiFIjfHQshjpTz+1zHA/83
	uW/zMzm46FysiFDME9kXLZV/yPhg8LGeTRaT913Df7wgCDVxy5vpwJLrkJ3BHax44lBirOM0ftMaW
	qGImDpd9YRvMMFrNffN4ua95aLmvCVDL8b9D3LDaZHnGVljJL+OmMlwvvs1Nf4nBm/+e/L8NXggfx
	quvsL9iDA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMOBF-002TFe-6J; Wed, 17 Mar 2021 04:53:13 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMOB9-002TF1-Tv
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 04:53:09 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so4681650pjb.1
 for <linux-riscv@lists.infradead.org>; Tue, 16 Mar 2021 21:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=bOxl3V+1KY/8zaD5pUmKYcp5UFMxN79rD/BTslHwRVI=;
 b=U0h7/IfExyTKR9yu6gUha/hKKszbmmte1DU+1SP6d3S/3CIPBb2IssZ6weDVC3axu5
 Amra2Dib6T7784UdJZrrFYNzoIezcnZVzOIjnL4PkQ8qr3fQEhDs9dIix4TrKLDc8Gcz
 riNmCzpa5lnqYNWqvrJ0Rkc4TVlN2xY1YtIhFR/AxrKCbWMnCeT2tgrQ+20tIjgI9YyB
 tV4L8w7PX0HH04D1co8yOP07qrKSgO0mBUN3ZZNpSbR2Twk67rlgg82UkfBVtmgaKWWA
 kxRXPENGKo/ASSBasO8bVN70EHeUCh1QJiy4UICGyCQt/xueATheoGbliYcKLbbszO/b
 ss8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=bOxl3V+1KY/8zaD5pUmKYcp5UFMxN79rD/BTslHwRVI=;
 b=j4402n/saZ2rTX18NmYRGuzjb6rsIgsKAtoj0Uahg5xGT1mMYLuKYdnFGx2JZ72QHZ
 lfPXYWY1G2KBotlJSWeNbZZLHgZZ1zUY4B+WlhUliE6NL637FX46xOStb2WoGG0GQ/bp
 c6qtG41npGr2SXCT+UVF5OxvvkZwh+EhMbE2mk2gxaHFd520U+xsJHXsufPsf9XvvnFX
 9m9/WSrs1zcPE6iItZXkHlfZ3O8DxSm0PehCY3Ns4icb6KqSqs25Hzfw/8Fc8Pow+XbH
 76qVF1psckrpdxwTrpx4Ot7SBU827+ph2McSnr6rQ5mChVwMOhhkDSfgL15EV1VNobZA
 Iwrw==
X-Gm-Message-State: AOAM5337w1vxxLuHyrBIER5Kht+I6JBMBXiuOAGH4n1yJybO5uK6womX
 atrmZ51O+MV7uxVMUH7txw7YhA==
X-Google-Smtp-Source: ABdhPJxYg8S6BCSDk4G2YF7NIsO7aZiy5c1IxedOg7sM8FHnbI38szc1bKtdAAn91bGNpRHTeGzHvg==
X-Received: by 2002:a17:90b:2284:: with SMTP id
 kx4mr2454622pjb.96.1615956786456; 
 Tue, 16 Mar 2021 21:53:06 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 132sm18050138pfu.158.2021.03.16.21.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 21:53:05 -0700 (PDT)
Date: Tue, 16 Mar 2021 21:53:05 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Mar 2021 21:52:48 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Fix out-of-bounds accesses in init_resources()
In-Reply-To: <20210312154634.3541844-1-geert@linux-m68k.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, geert@linux-m68k.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: geert@linux-m68k.org
Message-ID: <mhng-3252ea0a-bbbb-4024-ae06-cf2212aaa466@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_045308_085251_3E41DAF4 
X-CRM114-Status: GOOD (  23.71  )
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

On Fri, 12 Mar 2021 07:46:34 PST (-0800), geert@linux-m68k.org wrote:
> init_resources() allocates an array of resources, based on the current
> total number of memory regions and reserved memory regions.  However,
> allocating this array using memblock_alloc() might increase the number
> of reserved memory regions.  If that happens, populating the array later
> based on the new number of regions will cause out-of-bounds writes
> beyond the end of the allocated array.
>
> Fix this by allocating one more entry, which may or may not be used.
>
> Fixes: 797f0375dd2ef5cd ("RISC-V: Do not allocate memblock while iterating reserved memblocks")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Tested on vexriscv, which works now using L1_CACHE_SHIFT = 6, too.
>
> This issue may show up during early boot as:
>
>     Unable to handle kernel paging request at virtual address c8000008
>     Oops [#1]
>     CPU: 0 PID: 0 Comm: swapper Not tainted 5.11.0-orangecrab-00023-g7c4fc8e3e982-dirty #137
>     epc: c04d6660 ra : c04d6560 sp : c05ddf70
>      gp : c0678bc0 tp : c05e5b40 t0 : c8000000
>      t1 : 00030000 t2 : ffffffff s0 : c05ddfc0
>      s1 : c8000000 a0 : 00000000 a1 : c7ffffe0
>      a2 : 00000005 a3 : 00000001 a4 : 0000000c
>      a5 : 00000000 a6 : c04fe000 a7 : 0000000c
>      s2 : c04fe098 s3 : 000000a0 s4 : c7ffff60
>      s5 : c04fe0dc s6 : 80000200 s7 : c059f1d4
>      s8 : 81000200 s9 : c059f1f0 s10: 80000200
>      s11: c059f1d4 t3 : 405dbb60 t4 : c05e6f08
>      t5 : 81000200 t6 : 40501000
>     status: 00000100 badaddr: c8000008 cause: 0000000f
>     random: get_random_bytes called from print_oops_end_marker+0x38/0x7c with crng_init=0
>     ---[ end trace 0000000000000000 ]---
>
> or much later as:
>
>     Unable to handle kernel paging request at virtual address 69726573
> ---
>  arch/riscv/kernel/setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index e85bacff1b5075ee..f8f15332caa20263 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -147,7 +147,8 @@ static void __init init_resources(void)
>  	bss_res.end = __pa_symbol(__bss_stop) - 1;
>  	bss_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
>
> -	mem_res_sz = (memblock.memory.cnt + memblock.reserved.cnt) * sizeof(*mem_res);
> +	/* + 1 as memblock_alloc() might increase memblock.reserved.cnt */
> +	mem_res_sz = (memblock.memory.cnt + memblock.reserved.cnt + 1) * sizeof(*mem_res);
>  	mem_res = memblock_alloc(mem_res_sz, SMP_CACHE_BYTES);
>  	if (!mem_res)
>  		panic("%s: Failed to allocate %zu bytes\n", __func__, mem_res_sz);

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
