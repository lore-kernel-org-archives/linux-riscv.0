Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF33C4828D
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Feb 2024 00:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkqeRYE19SOGQbsfaf7RTXm3MZ+X/qIjE0IO2T1R9DU=; b=ZFDPimvi8Dn7ar
	pQ7IXwpLqGD5iG+FQmmbGVYqbDCtKPyIyH7ehLUBQyLJ0XObJ2lWNh3L9SnqlTTvhzZJr6oxqan+T
	fz4CLJmG08v7htt6alO0PF0lyNqRmNTC7WH3e5t3ndJjqmnzme3b7UfoUitQMFkFk4ZOMrO86QYja
	sHWa3YVK07akzW7nvTxnziShP3tIeoe2F7bvN+vpGWfdm2tv55VuSo1HxNJpaZZHUSNUxELxBZdUu
	FmXAMHqv3MrYDlMs5cspl1UTp80xqj/5vzqu+MEdeqDEbxW5RqGVHquYH2GppwsMpsKl4InpBQi6w
	k/cMXYzvM9o8+RqtWo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX9Iu-00000005dSd-1bn6;
	Tue, 06 Feb 2024 00:27:12 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX9Ir-00000005dQu-2NoF
	for linux-riscv@lists.infradead.org;
	Tue, 06 Feb 2024 00:27:10 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5d81b08d6f2so4717222a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Feb 2024 16:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707179217; x=1707784017; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fiVjpSDFqDkt9XNvIzkLrXyeTIMkWHM8SqfmdeXNea0=;
        b=pn1DoUHUQuxibUMRxnyrxsKGOjr6RAzGKTIXCGAIewDHxlXnxOtdGGwk/Np50HZDOl
         LbVn10chlxUPL0GqwOMbr7LsWXcgs0p8PVvQ/jBL1KfrKA60PJmeQubzX9Q1HyejLnfJ
         3ugaVEORV2xgaPpDUEizAO30nTXS+juXF/7EnBNgaIYwhW8+hsFR1LtLhRNlXcHzFFiO
         IPcyMXf5N5gVdMApW4vyvgbYiNCyjb+joY73t55ozAhwIMHfgOauAjJP0Ls1U38MGYJL
         WLDNo+aF7856xnlvXJg3wbROr9VMO2hNNNbrSm1KMvIGEuO3LlhOK8WXGwr9rUDQBj+/
         t9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707179217; x=1707784017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiVjpSDFqDkt9XNvIzkLrXyeTIMkWHM8SqfmdeXNea0=;
        b=ek2GSY4lMFEeaEb3ca1nNaUTom5Axumm8wzq2zBTypqtPY51uwOxKALadhYdzWGPZC
         SOHf157gC/DIFLEdlLOgfP6JaRa0J2+tChfsDzf/MsB0OfSe7aqgJ054LJDeqcsmLnNA
         BNkChyk7Pwp0fSAdKZGmtlM2iB3ZggARzy5Bhy1LnB0CxVoCOQbbpPHDVQGgo7BIp4n4
         PYduAdabXjwNR8of7PPx6T6H8GFerl1k4WIbXB2+w45cTm2Yl2fk0DufZnUS1/TXMIlP
         pz0qBx+qNbnCXLymSUTATj2zoRY8I/4Fxaxqs73JUfefFZmXI6uTqehtmKxONTZ25Y26
         nq8Q==
X-Gm-Message-State: AOJu0Yz4iDLfofrgTMXOvBJB/PfzrEycR4pdfTa9szuVVkt6chVgyeeP
	d8+h86pbe9ZpieaTUHk2LFRTgVZqimuO5zeQ/LfM5AWP5zz30LYRM6pOEmbuoKs=
X-Google-Smtp-Source: AGHT+IGYCi0+X1+vaJBNc0l8Gs1SpiPv6m18ULzOlpD7Sl4SzHbj0qBqx6SGNAXHukFrXAy7Mux6kw==
X-Received: by 2002:a05:6a21:788e:b0:19e:367a:2ca9 with SMTP id bf14-20020a056a21788e00b0019e367a2ca9mr143337pzc.8.1707179217597;
        Mon, 05 Feb 2024 16:26:57 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXuxl7fvNMncJzVpzTszUz0jVy3RKrVSRFq9HMCATFeYqQ2K4Xs8LZ/kTazqhiy1ELGqU/PG1WZ8jG+JNbM0l2kGIOnOZBEiwfxm4NgppMD5ZTW0fvTyMOlVS5hhFI4CyWG+rrdacWNcMMTf0c9tTrq3cOSWH15M2jCROPLOO/n/A85UD4n5jVgfa9iSFhuoDUguU2inNzIHXdQmoXOF7W+sx1AYGdfYRaMd8xv
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id y32-20020a056a00182000b006d98ae070c3sm485463pfa.135.2024.02.05.16.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 16:26:57 -0800 (PST)
Date: Mon, 5 Feb 2024 16:26:55 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: Fix arch_tlbbatch_flush() by clearing the
 batch cpumask
Message-ID: <ZcF8z18dwnGsw0Ix@ghost>
References: <20240130115508.105386-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240130115508.105386-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_162709_620538_3C0BDDE1 
X-CRM114-Status: GOOD (  15.25  )
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

On Tue, Jan 30, 2024 at 12:55:08PM +0100, Alexandre Ghiti wrote:
> We must clear the cpumask once we have flushed the batch, otherwise cpus
> get accumulated and we end sending IPIs to more cpus than needed.
> 
> Fixes: 54d7431af73e ("riscv: Add support for BATCHED_UNMAP_TLB_FLUSH")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/mm/tlbflush.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 99c3e037f127..c8efc3f87a0f 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -240,4 +240,5 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>  {
>  	__flush_tlb_range(NULL, &batch->cpumask,
>  			  0, FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
> +	cpumask_clear(&batch->cpumask);
>  }
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
