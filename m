Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5F5C47422
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoXP2v2lwwowvYTzLdfocYGvQnVBT1t6yuRvvcodZAc=; b=EW+zDDQl8NCMaV
	6+c5/daEzqZAOcdhSvIoV1qNQjeyxmD19DAbSmG2tB1v8Bg//QmBaa6sFr0+NwqdfzrXQKdiGWoJE
	xzB05jQ/M9Rl9drXdJxtc78C9tZvwg3XUwcEL4JJnNCjoV38v64ygPUF2gR95reWOpGBbAXnZlxGx
	IL37tnfX/kS63EAe2pJ+uNd3rKMMgiqTAqx7VhaSSvfpzI2fKC9wnrB7VBBFPaBWRpZG9ZuEv+BwQ
	th+OqNXoKQspyTSqqm1xCqAkEzPE796++N9POjU9sQaHc/ZHk2HsadS+NnthmF9YS6vWa/RegIebs
	74dM2rVtUVBPX+Sj0ltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUNVr-0000000Bua2-2TLv;
	Mon, 29 Jan 2024 09:01:07 +0000
Received: from mail-pf1-f178.google.com ([209.85.210.178])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUNVp-0000000BuZR-3FSn
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 09:01:06 +0000
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6d9b37f4804so2412964b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 01:01:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706518863; x=1707123663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhYaJDE5CFB8YW0bqykwvmnJq3NUnNOhl7XZdq+k3Iw=;
        b=GDAy0RNyshRLkfe7sZng0i3Q3iFBwJgsv+kitFd79515Lmg0aOcYozFvMztHfgbxXX
         i2PZWYwgLxpv62LgLSGN/Mm4xpj9YkNvPj5IqL8R8tPH7HSCfEjLuk+InL2AWoZhEtVL
         dwgIIOx770SeafTQTF/fZRSQz9CN4n4x0OqbPzbr4aiZ0nDVEy1ASwiVtogsl8sW4EDJ
         14MBadiCw3EckSDvez0ztasIzpqF6HA7DKhBBZlcdqC2l/xB9d/NuyHGiybZ7pcOkx8O
         ZZcVVKTfpMuozAcaXEY3j4nRK9U6ILeunngsL0RbtUZt5CYS0zIwEkKcNDTZRsS7zDxp
         fgkA==
X-Gm-Message-State: AOJu0YzuT0UAwyU0KWcStsVMank6Ba0k2wQcDtRd/D1nXVaUoHHZocjk
	AiLsXa53Uqu/b6bDU/bqnZEDLYNscIyY8f9/B+ktAAOo7016HsA6
X-Google-Smtp-Source: AGHT+IFfZsGglwKUIEhC2sDvoOnVcokEfT9wX9xbq8ZJ+OYDVfKyQQYX2szarFvqGGSfpI0AQekNZA==
X-Received: by 2002:a05:6a20:7886:b0:19c:748a:303a with SMTP id d6-20020a056a20788600b0019c748a303amr4030758pzg.17.1706518863496;
        Mon, 29 Jan 2024 01:01:03 -0800 (PST)
Received: from snowbird ([136.25.84.107])
        by smtp.gmail.com with ESMTPSA id k28-20020aa7999c000000b006dbac48633bsm5359811pfh.189.2024.01.29.01.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 01:01:02 -0800 (PST)
Date: Mon, 29 Jan 2024 01:01:00 -0800
From: Dennis Zhou <dennis@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix wrong size passed to
 local_flush_tlb_range_asid()
Message-ID: <ZbdpTPMOw4lsPxBi@snowbird>
References: <20240123132730.2297719-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240123132730.2297719-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_010105_857171_67CAA3C7 
X-CRM114-Status: GOOD (  19.98  )
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

Hi Alexandre,

On Tue, Jan 23, 2024 at 02:27:30PM +0100, Alexandre Ghiti wrote:
> local_flush_tlb_range_asid() takes the size as argument, not the end of
> the range to flush, so fix this by computing the size from the end and
> the start of the range.
> 
> Fixes: 7a92fc8b4d20 ("mm: Introduce flush_cache_vmap_early()")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/mm/tlbflush.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 8d12b26f5ac3..9619965f6501 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -68,7 +68,7 @@ static inline void local_flush_tlb_range_asid(unsigned long start,
>  
>  void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
>  {
> -	local_flush_tlb_range_asid(start, end, PAGE_SIZE, FLUSH_TLB_NO_ASID);
> +	local_flush_tlb_range_asid(start, end - start, PAGE_SIZE, FLUSH_TLB_NO_ASID);
>  }
>  
>  static void __ipi_flush_tlb_all(void *info)
> -- 
> 2.39.2
> 

Sorry for the delay, I just pulled this into percpu#for-6.8-fixes. I'll
send it to Linus this week.

Thanks,
Dennis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
