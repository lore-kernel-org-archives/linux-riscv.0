Return-Path: <SRS0=yqZG=DL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCBAC4363C
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2020 23:22:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CFEB20674
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2020 23:22:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RoEqf7Xv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="V5hDXA7L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CFEB20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=A68gKv72zyOa0ubynnXKNZYIgN798VkSjJ5Q/Ld+Uhs=; b=RoEqf7Xv7fwQGxDy4H0lPxOd7
	cfx+1IMpIeuuILlotf143L+9455lSauUi1lcYov3RI4yinOFopptBHwWmwqAb8SkYrWrrybat/39o
	nZpo+irqi5b8NNWuTsG3qKKdnPwTC3Jpmkn1j7zMhWuL+aLbXfhiT8AXnavRAcTdZ9k1MvL0KG10q
	3we28MlZjOOZStXIdBJ+JzJgU5zU8aFX0upylM5bcJQoAB+8ZETpnY0FTuQaQ2Q94qQv2SXL3jQFy
	oecLFUQw8J+Ism+TMowuctru1DrSMSRBz4qgd1OXin8tahx4p5HHLh8BeeMyw5YJ8mYuWp7hf3F28
	BwBjcPwgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPDKQ-0006ps-HY; Sun, 04 Oct 2020 23:22:06 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPDKN-0006p7-OT
 for linux-riscv@lists.infradead.org; Sun, 04 Oct 2020 23:22:04 +0000
Received: by mail-pf1-x444.google.com with SMTP id d6so5432295pfn.9
 for <linux-riscv@lists.infradead.org>; Sun, 04 Oct 2020 16:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=4oL2znr6LsSIkLcSKWov235WOf1EfUgHpIbLNjwTdEM=;
 b=V5hDXA7Lu3qbEuROZq2ipYj0K+ZCKZ7rTKiD11nKdv87dxXIi6Gm9+97FS76QlwqlG
 fCnMV6ZW9kBbQgpyq7+NOdKkzne4JlU20Zul3raozoRuMqnNWYw4TjGtLmmKEDh9tdXH
 HtBBoMCsN4CDjRCebYCYy+GXUMjcccr0j/jhVgG8CxQqYPWtJTsE0LF9hPw3sxclWc3F
 mD4qAFIT3nN+vq3dA0ESs9/8/JqfBX+41UyLhezbBKDqmMw0ONqKnCWDdesMWp+sLvMK
 KsM3bdAeV8gxKZtv6Ys9Chrw+biKqJinCSdV25bM89tamRvU5NCZoMSbyWDO9utI7YLt
 GWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=4oL2znr6LsSIkLcSKWov235WOf1EfUgHpIbLNjwTdEM=;
 b=QhSpODjFXUXIbzD4x+6k9CBcWKr/oWXzpxgjs9nnaDbHlcMCy9SkBB9Dzy3BPVIJEF
 vhkT0/BDljgpR6QCjOnqV9eVwLv2jILJd7CfDkBQEjWUAyyw39Mnp6hmJwhx7jxnxT6u
 drFi+b7pI6SEaEqtMkkLm1EKp1aR+nSSL97xVWZ9BKb2vOUP7u4NRuD+xHAQKf3j7NcB
 efL4PBYjsO6Q5hqmWEpMWOgOmOQmR4H0cDHNYTJO4cxAa/b9Titck3n2SBFKlJE9Maqb
 F17G2wisdoOHwbv2aXDWN67LFDhKFCc47ViOrVn9Xf+yNe9oBd/FsFmqRzLjhdbYtevW
 /0Bg==
X-Gm-Message-State: AOAM5333zJgcyNJPPI3tq0KFwaRumoBA9WQlsicYBe2PjHLjpEpNwxoe
 dTWuQ4J0a8s81UFxq9ioTCWQUA==
X-Google-Smtp-Source: ABdhPJw+aJqCbL831y3oSufm7WJkD4N53sPu7ikpVPcvaRYICkDSaFSLS3fkUBj4njIloL4iUsosvA==
X-Received: by 2002:a63:1252:: with SMTP id 18mr12168100pgs.246.1601853721184; 
 Sun, 04 Oct 2020 16:22:01 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a1sm8284798pjh.2.2020.10.04.16.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 16:22:00 -0700 (PDT)
Date: Sun, 04 Oct 2020 16:22:00 -0700 (PDT)
X-Google-Original-Date: Sun, 04 Oct 2020 16:21:58 PDT (-0700)
Subject: Re: [PATCH v3] RISC-V: Remove any memblock representing unusable
 memory area
In-Reply-To: <20201001190557.2860741-1-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-ea11e9ee-62e2-4441-963f-63017f370845@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_192203_797380_DDCE6FE5 
X-CRM114-Status: GOOD (  22.87  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com,
 Atish Patra <Atish.Patra@wdc.com>, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 01 Oct 2020 12:05:57 PDT (-0700), Atish Patra wrote:
> RISC-V limits the physical memory size by -PAGE_OFFSET. Any memory beyond
> that size from DRAM start is unusable. Just remove any memblock pointing
> to those memory region without worrying about computing the maximum size.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
>
> ---
> Changes from v2->v3
> Updated comment as per Mike's suggestion.
> ---
>  arch/riscv/mm/init.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index ca03762a3733..564e0be677b7 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -146,8 +146,6 @@ static phys_addr_t dtb_early_pa __initdata;
>  void __init setup_bootmem(void)
>  {
>  	struct memblock_region *reg;
> -	phys_addr_t mem_size = 0;
> -	phys_addr_t total_mem = 0;
>  	phys_addr_t mem_start, end = 0;
>  	phys_addr_t vmlinux_end = __pa_symbol(&_end);
>  	phys_addr_t vmlinux_start = __pa_symbol(&_start);
> @@ -155,21 +153,18 @@ void __init setup_bootmem(void)
>  	/* Find the memory region containing the kernel */
>  	for_each_memblock(memory, reg) {
>  		end = reg->base + reg->size;
> -		if (!total_mem)
> +		if (!mem_start)
>  			mem_start = reg->base;
>  		if (reg->base <= vmlinux_start && vmlinux_end <= end)
>  			BUG_ON(reg->size == 0);
> -		total_mem = total_mem + reg->size;
>  	}
>
>  	/*
> -	 * Remove memblock from the end of usable area to the
> -	 * end of region
> +	 * The maximal physical memory size is -PAGE_OFFSET.
> +	 * Make sure that any memory beyond mem_start + (-PAGE_OFFSET) is removed
> +	 * as it is unusable by kernel.
>  	 */
> -	mem_size = min(total_mem, (phys_addr_t)-PAGE_OFFSET);
> -	if (mem_start + mem_size < end)
> -		memblock_remove(mem_start + mem_size,
> -				end - mem_start - mem_size);
> +	memblock_enforce_memory_limit(mem_start - PAGE_OFFSET);
>
>  	/* Reserve from the start of the kernel to the end of the kernel */
>  	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
