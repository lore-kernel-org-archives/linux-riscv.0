Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9007C4828D
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Feb 2024 23:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jjFJKdHZpYccZcFbgzp8Qi3Mkjxwa/ZpvbJAWNXe8MQ=; b=UUWOK770MJshTq
	8YpBwJ8NMI7D49XRlAsaP03XNEZ5TTL1gmvy9LxxOs4Ss8ql7yuXN/JK3ktJ/kzaqPOEBzU67K/nR
	NhIQ/ReKp371z22cjlXdPbBOjzgUJtVHxLPBzCG6nMdva6mDqwci9MDl+hRfHnG3NcUDvXJpYODRh
	Xv13f8b6EePcEiAugPvfzYVW2G21BjflbmEr+V+WBwBQcGtuFezaXindSbXismUx3TRnxcgm3/kZ1
	iq6aVUcS96YQt5AGAYgDv9TXiCYzEsdyihiYsIy039JZkR5bWruzes1GIMIJWvB56Tzj+Tw+MVwS6
	bsWVdI3EBSmFPSZBkUcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX8mo-00000005b2L-3cXe;
	Mon, 05 Feb 2024 23:54:02 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX8ml-00000005b1k-0W45
	for linux-riscv@lists.infradead.org;
	Mon, 05 Feb 2024 23:54:00 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so3979576a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Feb 2024 15:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707177237; x=1707782037; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hmrdDifKn+uVsNlfDzCvuZfjS7ayNWNTt2suseO1un4=;
        b=NYUr4PLMTP2tc5Vve2XPMfZy8AMux2V4xNjJI4f09CvhMDslXPYEhwIDmSXtf+Dowc
         lJAfu8PhplnqsSjPPQI1AImqI166IGbzWuvG8ajQKDOCUcA5B6csDrRJsvMioFhUdNy7
         Np+fbqhy/BGwXh1sanhmgElx8Ysleg2n4ppOv1N9jJmPqdWXcBYZEclALYStFIzqxVoP
         LMFGwRtbLLAX5DlOj0Hk99OUGVhrOMU1C1EjSxWfk/7kgaPFod17B1UVe7TXKdfZCSJH
         RjCf8YUNsx3Q1EtIl6AFhvv4AIJXjLKk3+54RunK4XqA8l0+1RNgcO6J2sqH4l5nFhQO
         qC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707177237; x=1707782037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmrdDifKn+uVsNlfDzCvuZfjS7ayNWNTt2suseO1un4=;
        b=c7L+B1u+QCB3qAOhRiqW9EHnaCdqx/trzRPT5BlQzjuvZTcGD0xmpm6s7aSxRu8N3G
         9pt0u6MbScGuJyAME5BV/X9VP0x7PerU35+vF1WJNLtxqKyLqa/c9OyUwDtqWo3Ane1v
         ORozh2M8HUAaZiidGatPCjAdVYBw8vyTi1PCV90ewJ194ifBhIuxghyqzZ7TC+P2r4P3
         E9oQWsq9UoVnZ7AsAzxeSSFlPqxTRpziD3J27hbCmn4u8FfLpwUNNfM9rgoRtMV2qqqY
         YjZU62WA3Hf6PcBDoaGLyud9ex0+mBNlsyTNrim2BQiMIrENC5JIOGS/t9Wj5Ri2+yyr
         5WPQ==
X-Gm-Message-State: AOJu0YzsBvQub7k1BjSNE/KM/NYGGOTcrAxymr0z+Gfckmrw7BXiYgDZ
	cpgIjGJHsQuTz+PRJ3y+9yqar5u9Xhhi2B/TtSiLTXMT0mbR1JA/r0x9N5yC5sc=
X-Google-Smtp-Source: AGHT+IHeI/+Sp824UroO/mDYidk3cFb94YOApkQqYdkLtM9PHmtd5rblgX/GhroclrmfDZVRJjAJvQ==
X-Received: by 2002:a05:6a21:2785:b0:19e:89ae:9b52 with SMTP id rn5-20020a056a21278500b0019e89ae9b52mr51387pzb.7.1707177237249;
        Mon, 05 Feb 2024 15:53:57 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVwcZhTk4c0u0np/uhoHXLwPQ/Wcj2MaeQOM9FqkgxTj2vuWoI/YVq71BO5+lhQYk5e3bISfbaGFDwsMYle96R7byvptgPpHlcZishruHbiB2ER4cRLKUlSlSasxMzD1Asz14TVXCdqBFQGhWo0gN5hQcCmHn1noPYecH0xtKK6GttXmIn4v/8Z3JF41HtMi0WjDjq5Gj2Nv/KL4aEAO6D3s3OGA7wAtbIdL04MZdkkF2CmOjQQvL8jlAJQUqHONWA/1DPJdI0imC15vjTHcmrkvgr7TEDqVli0Mlg9oQnxUwoZXAO1VedoHrNEPmI64j11xtnv2+MgUEhwUUjFpcaFUjralvHAUvXcA5fPQc2628t1uCSBbOcw3jy7ESMZhGUDpplvpP7R7VHdhx+GVMTxtl7eE5RKZQfmkoU4KkGTOYG2+pYJWJumzly5fwvjX22/7ZOWnO5JAcWy1+RlzpyruTNclkK+EwLEI6X/GyAOPAFqnt7d5A==
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id e12-20020a62aa0c000000b006ddc7de91e9sm444758pff.197.2024.02.05.15.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 15:53:57 -0800 (PST)
Date: Mon, 5 Feb 2024 15:53:54 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: Flush the tlb when a page directory is
 freed
Message-ID: <ZcF1Er55ClKgJtHJ@ghost>
References: <20240128120405.25876-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240128120405.25876-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_155359_184583_43AF5930 
X-CRM114-Status: GOOD (  17.90  )
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

On Sun, Jan 28, 2024 at 01:04:05PM +0100, Alexandre Ghiti wrote:
> The riscv privileged specification mandates to flush the TLB whenever a
> page directory is modified, so add that to tlb_flush().
> 
> Fixes: c5e9b2c2ae82 ("riscv: Improve tlb_flush()")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/tlb.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
> index 1eb5682b2af6..50b63b5c15bd 100644
> --- a/arch/riscv/include/asm/tlb.h
> +++ b/arch/riscv/include/asm/tlb.h
> @@ -16,7 +16,7 @@ static void tlb_flush(struct mmu_gather *tlb);
>  static inline void tlb_flush(struct mmu_gather *tlb)
>  {
>  #ifdef CONFIG_MMU
> -	if (tlb->fullmm || tlb->need_flush_all)
> +	if (tlb->fullmm || tlb->need_flush_all || tlb->freed_tables)
>  		flush_tlb_mm(tlb->mm);
>  	else
>  		flush_tlb_mm_range(tlb->mm, tlb->start, tlb->end,
> -- 
> 2.39.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
