Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD243C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 17:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8xijGcm+PeCGBLy5sX9M7l2MeqscKL1qgS1s9cjnGs=; b=qWZdkf6jbU1PTY
	/bCOIUKx0YJJhIO8e79Bi1aJyZVnE34dC7SIgBDe9X2EJ8ZVQcjq5MfuN2iFYUNpoJV3Wu1XXQD/L
	F5ILUJ04y1om48w7FcVDj/UFdrlAsHiYFXhhXKBxfKqnlkdwmgEUzuNAZH3A7XLJeFFkt28Mjvwwr
	l+U2VKO/0rPpGiNDeWPGrbMqikTvRo/GBmdqHg/6mOD4Ssem1FwZfaillAt7PAqxPViOLyFO9MHXE
	Q92q0S/yB2vAPGV9T1kmoMYyAyIIU3dCm9n0TWxoyLAwDOQpUXpDQkOE+QY8AD1/RYXNVez3Y3Nm0
	Pr16xkjbjK+p4BmFeLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX4gH-00EQ2q-Uw; Wed, 23 Mar 2022 17:21:58 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX4gE-00EQ1P-Pr
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 17:21:56 +0000
Received: by mail-wr1-x42a.google.com with SMTP id w4so3083735wrg.12
 for <linux-riscv@lists.infradead.org>; Wed, 23 Mar 2022 10:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6sXiDJvv69n8sHq+JRwL0P1DmaR1Tz5cYXPQWGXC/Qo=;
 b=1g7KaD85BOYVRTcTLkv82FEI1SnFXurp/HCBpDNBoifcWmL2FLh94HOkNvc+yM5TYk
 HzIxMTbi1Lo41Av8/q50o2zOggWUXcv1owiCnBBRVeUtxuTgaBHylbAhoay1NGLhY+mF
 J+U+kqC2lkNKQ0KKTpzB328D/LBABX+dLfuyeR69bix7E3f+eMtS60wTRBDNtWcqFhwY
 vUoEgoleh0sfr33THUkiwo2gGYYznwdMAxcIkDvLjYvvV5XJas1vIt/FRfy9k8v1HBCE
 uepBzEQr/9nuiC4jt6H4JjqzfkDyVN6ame6htBFrJ9+VrxZADd0lYQD8AoT0MiQgHTLj
 jN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6sXiDJvv69n8sHq+JRwL0P1DmaR1Tz5cYXPQWGXC/Qo=;
 b=dsRb2rkuIWXUhnHUCXaJc51zcohkXrWNqDvYetW1NqtHaCNY3ujfMRQhW+GIrhzezD
 BLU4UlrhTlelutHMyU3obzIUKaktsELxoWQumX8ZSe/rpjTuXiAoW4Lowyx79F+9Aq10
 ZOc8KCOrAE+qxNLg2C6qrHt01/V3F/DpjrpkGiEbGiR1d/wddAsBCCIQjP7GmRxNCWyd
 vJMccjfgVjt1n7ZOnST/V19uWSs1d+Zo2Mi9EKv7y4jxWUhwmgdxEqTGnDtXIomVshgF
 e9CDMDmTx+g3Pmkt/is386hRi/KcWSmQSZIY4EwtPV/IcWAzEMMa9oxQ3Sp0SznTYn3u
 U+MA==
X-Gm-Message-State: AOAM5330sU0sGVoJC93eOjX9nvhOihlp6ivtOJu0exQPFadHd7s9xdPk
 Y5YYSjs6lnitFNXkgKPXxIE4oA==
X-Google-Smtp-Source: ABdhPJxBjkif7aQVExZrGrjt/c8OcfPCG2t36WRW88q14eWB1N0M36x34ibCL3UHx+Bv6adSvS7GPQ==
X-Received: by 2002:a05:6000:15c2:b0:205:922e:3aa2 with SMTP id
 y2-20020a05600015c200b00205922e3aa2mr436873wry.411.1648056112963; 
 Wed, 23 Mar 2022 10:21:52 -0700 (PDT)
Received: from [192.168.2.222] ([109.76.4.19])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a5d6acb000000b002058148822bsm487374wrw.63.2022.03.23.10.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 10:21:52 -0700 (PDT)
Message-ID: <329d26b2-14d1-d8c7-ccbd-ddbb0c011370@conchuod.ie>
Date: Wed, 23 Mar 2022 17:21:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] RISC-V-fixes: relocate DTB if it's outside memory region
Content-Language: en-US
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com
References: <20220322132839.3653682-1-mick@ics.forth.gr>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220322132839.3653682-1-mick@ics.forth.gr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_102154_944928_1E319AAF 
X-CRM114-Status: GOOD (  25.19  )
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

On 22/03/2022 13:28, Nick Kossifidis wrote:
> In case the DTB provided by the bootloader/BootROM is before the kernel
> image or outside /memory, we won't be able to access it through the
> linear mapping, and get a segfault on setup_arch(). Currently OpenSBI
> relocates DTB but that's not always the case (e.g. if FW_JUMP_FDT_ADDR
> is not specified), and it's also not the most portable approach since
> the default FW_JUMP_FDT_ADDR of the generic platform relocates the DTB
> at a specific offset that may not be available. To avoid this situation
> copy DTB so that it's visible through the linear mapping.

Ran into the same issue & have been carrying a hack for it, this looks 
*a lot* cleaner. I'll dig out the offending configuration tomorrow and 
try to give you a tested-by.
Thanks,
Conor.

> 
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> ---
>   arch/riscv/mm/init.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 0d588032d..697a9aed4 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -206,8 +206,25 @@ static void __init setup_bootmem(void)
>   	 * early_init_fdt_reserve_self() since __pa() does
>   	 * not work for DTB pointers that are fixmap addresses
>   	 */
> -	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
> -		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> +	if (!IS_ENABLED(CONFIG_BUILTIN_DTB)) {
> +		/*
> +		 * In case the DTB is not located in a memory region we won't
> +		 * be able to locate it later on via the linear mapping and
> +		 * get a segfault when accessing it via __va(dtb_early_pa).
> +		 * To avoid this situation copy DTB to a memory region.
> +		 * Note that memblock_phys_alloc will also reserve DTB region.
> +		 */
> +		if (!memblock_is_memory(dtb_early_pa)) {
> +			size_t fdt_size = fdt_totalsize(dtb_early_va);
> +			phys_addr_t new_dtb_early_pa = memblock_phys_alloc(fdt_size, PAGE_SIZE);
> +			void *new_dtb_early_va = early_memremap(new_dtb_early_pa, fdt_size);
> +
> +			memcpy(new_dtb_early_va, dtb_early_va, fdt_size);
> +			early_memunmap(new_dtb_early_va, fdt_size);
> +			_dtb_early_pa = new_dtb_early_pa;
> +		} else
> +			memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> +	}
>   
>   	early_init_fdt_scan_reserved_mem();
>   	dma_contiguous_reserve(dma32_phys_limit);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
