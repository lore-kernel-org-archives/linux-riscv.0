Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CF1C54E68
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 00:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=P+pc6pkoajstmqlE9yw5bNrt+W7DlYM+Q3LKH0bb+0s=; b=K/Mcnrvs33bYxZaobUjTiXI7rT
	ypdbC16hU5Hk6Nt/o3qoRVhhTt+MABO0OstefVoT4ySFk3hlnp8Hico5yhEiFoTlkx2bQeVGM1A2z
	gQ15IDi1toCQ1wStVAPnLZoZbolB+7UQQfjhVWZ4CCX6lsq+ysje1h3PuPtUOX6TnPxFeoq6v39+w
	4MgXOdJ/6BC0kdIjg9MxoYi9NST105w+yliPoH7hbpydvRI+riaJEV69LlnlJcek3MtcyJMi16s+r
	cTgvslv+m3Q7AhJfIWL2+VpvZLC8RRn7BKBf1R8OjMLZg4K7Ts3s6U8nTMEIf8+6B/X+NPMmWmvDP
	uDuJhp3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmk7r-0000000Ensn-2g49;
	Wed, 20 Mar 2024 00:48:15 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmk7o-0000000EnrM-0H0a
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 00:48:13 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1dde26f7e1dso45136065ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 17:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1710895689; x=1711500489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A1BsYh4Oeo/EXB+SJKi8cVJUla+OGiDIMCVUpv9M9MY=;
        b=HZbkBLMuqwweQYj/wSe8kkaOe0pH+NBi8RwqZYf8EPOsuRils2+10L5GkIiEdnJKVa
         dUSjuSOPJNtfcLrmoRTuLqhaYFKAvA4SPDNyv2C7P6C9vNAVRc8XpjQhU2p0aHFty26G
         Xs0vz5I65++7lWWlIC+zdcqzh148qjudOMdivbsUf8MWDANRQsck+P3Xg1aaBvjHMsfF
         O8d57RmvS4zfJ0IrO2kaWERCC3PPaXZJV7+YOonCbSExT3MEMVlxrswbQU8+65PD8W/O
         GP3WWHVk4q1ERHm+GhZyXCEMVEOJcaMpMweOP56vvpyF7bsL1RuiWlupOa9zGGgFsZYn
         mDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710895689; x=1711500489;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1BsYh4Oeo/EXB+SJKi8cVJUla+OGiDIMCVUpv9M9MY=;
        b=v99BigcBmPZMH9SWGVy1/iUR8CpWG1Pl/4ldoXYEqmCjCaP9maf/Et7KN78fM0D2VS
         mhqxPEq3S7oGbW97khckE0y+iNpixUscqT3yPhY92dpTvybIxiotQ2YJ8If+CdElBMir
         yZ2PBVrijD5FY5KzeyPOxV+pFESItVV34Pn3AHi39y19S7cRzxinmFNrzxBUenM0FWHc
         sOexf1iSFakrZQLX+H+xn3IBD8KJyuXNqM6YTNqYybV9PI9HbnAYuByLLjf77hPYE9zv
         LdP7uNeOYFctcd4IKF4xx99FoJN7lk123akiGBfQwbZEkcCM42W4MT8xbvx8AyqTFPO5
         Kiug==
X-Gm-Message-State: AOJu0YxVofpAH5sFEp++2HzLmI48slWRd2kN8AWHAL+kx+1TYMOux6Bu
	IP8jeMa3NEn6h4+lYlxGpplMaGhCcWZbKCBE6r2Raieh6mlimiX1JBa79fD2ukBXbBYPqzU0dn2
	o
X-Google-Smtp-Source: AGHT+IH7vs7fj6C8C1fDW6ALbMxHKGDjjyKi+kbxP1SdfGtU9JwsqQfjYZ6lM1/3DMCXj7XvwbTB8A==
X-Received: by 2002:a17:903:41ca:b0:1e0:6a:1c01 with SMTP id u10-20020a17090341ca00b001e0006a1c01mr10511673ple.52.1710895688740;
        Tue, 19 Mar 2024 17:48:08 -0700 (PDT)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902a3cc00b001dd6290283fsm12354071plb.248.2024.03.19.17.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 17:48:08 -0700 (PDT)
Date: Tue, 19 Mar 2024 17:48:08 -0700 (PDT)
X-Google-Original-Date: Tue, 19 Mar 2024 17:48:06 PDT (-0700)
Subject: Re: [PATCH] RISC-V: only flush icache when it has VM_EXEC set
In-Reply-To: <tencent_6D851035F6F2FD0B5A69FB391AE39AC6300A@qq.com>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
  Conor Dooley <conor.dooley@microchip.com>, jszhang@kernel.org, Andrew Waterman <andrew@sifive.com>, cyy@cyyself.name
From: Palmer Dabbelt <palmer@dabbelt.com>
To: cyy@cyyself.name
Message-ID: <mhng-3e79924e-d965-4156-836d-19cc8fb8cafe@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_174812_211801_E5C2A3A7 
X-CRM114-Status: GOOD (  21.03  )
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

On Tue, 09 Jan 2024 10:48:59 PST (-0800), cyy@cyyself.name wrote:
> As I-Cache flush on current RISC-V needs to send IPIs to every CPU cores
> in the system is very costly, limiting flush_icache_mm to be called only
> when vma->vm_flags has VM_EXEC can help minimize the frequency of these
> operations. It improves performance and reduces disturbances when
> copy_from_user_page is needed such as profiling with perf.
>
> For I-D coherence concerns, it will not fail if such a page adds VM_EXEC
> flags in the future since we have checked it in the __set_pte_at function.
>
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  arch/riscv/include/asm/cacheflush.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index 3cb53c4df27c..915f532dc336 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -33,8 +33,11 @@ static inline void flush_dcache_page(struct page *page)
>   * so instead we just flush the whole thing.
>   */
>  #define flush_icache_range(start, end) flush_icache_all()
> -#define flush_icache_user_page(vma, pg, addr, len) \
> -	flush_icache_mm(vma->vm_mm, 0)
> +#define flush_icache_user_page(vma, pg, addr, len)	\
> +do {							\
> +	if (vma->vm_flags & VM_EXEC)			\
> +		flush_icache_mm(vma->vm_mm, 0);		\
> +} while (0)
>
>  #ifdef CONFIG_64BIT
>  #define flush_cache_vmap(start, end)	flush_tlb_kernel_range(start, end)

I'm not super worried about the benchmarks, I think we can just 
open-loop assume this is faster by avoiding the flushes.  I do think we 
need a hook into at least tlb_update_vma_flags(), though, to insert the 
fence.i when upgrading a mapping to include VM_EXEC.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
