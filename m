Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1636EC77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 19:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/KuGsGBNnNOwEERGwBc6oXyf7voj5Abetts7E4NZz0=; b=AM3iYCUBpbShns
	L1Nw/RL72vsG7OCD0bK+qWAGHsvAnmFTiCp8Kn6nTOdQnEdiBCX8+7Bh+rbaEUlOVP5fkQVHBItPL
	Pwyw8wYOfjZrQehAvXqjSr2USYwf8fJnwZ6FaVWxIgygrWN9PPgDKHQ/QM6TKe0Nme1g+HAbPupsq
	TZnrTNmhsi/T5NGbtZLniLp/Jv9z4wd/DJ6VWW6QLGcMSKV769fV1Zq+1mbnDKzHwRtCMqJde1kwD
	syfmtMeQ4e6rtDEyMx+lC5sOA/aAJV/bPSs7iLxJSyXkaRLWLB5d0QzoiDcRyMu+GgsGSnOV1NbsC
	IKOU89NsJ6qt4+ePoIFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppaB8-008tJV-0A;
	Thu, 20 Apr 2023 19:42:50 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppaB5-008tIR-05;
	Thu, 20 Apr 2023 19:42:48 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f189819513so8684575e9.1;
        Thu, 20 Apr 2023 12:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682019764; x=1684611764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pfv2B7nnglGPY5lKeYYJGgG41JxY4YTi9gYldIZZ2FA=;
        b=MYgjyypqswmQG6YtHr/gj3invlgUzYkrg/aPTuFdvQHZPL/YO5i4PF32XnyH1ZTGQz
         b734vWMYMbVsbbO/M9Wal3nSfPgVsr/VlA1Dm+srAgGFmF6Lp0bnhVphG5TcywnqlxEN
         otaG9qzSCRigVoIglNcR4SbSXcfghPUb5gc1+7NJi53TmMDnoeaSS5N3K/ZZKyvKhMOv
         my1Eafov4Ugs+psmIfSzuTUTr7xCxd+xW3qLejMV+2Hr7Qjwm/CzXTt6GkSmEByoLwgT
         dJD5ky+Ow1cBOXG8ZlV7MdBSFET0Faa917sHxhy0dYFJroREl5QPGJjugg/sG4kskK5K
         ewTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682019764; x=1684611764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pfv2B7nnglGPY5lKeYYJGgG41JxY4YTi9gYldIZZ2FA=;
        b=bn0L88uZ1EePrgx/mipl+rTftJ/fpg9zVrPHjL0xP3LIYjahzvGfwHb4R+KMQylxjt
         eX6+sj+Pg9XQNsAnxZC7V6bzBRj4oXUjbx6UP/lclB0tjGd859ZNBPNGGDQeZntf4B+Q
         +AQ3MR5v2vbQ5MqghRgNPHFlDBh/qXzrg392GbA79IbFJOBPAnhucr+QGG5pejggjBTy
         VmPkSBtYlBrUneZks3wkROBRZUMuqGm9Sk5h9IyqbTRGy+B0eWWc4wTP5aITGrZiq5J2
         6YTmPsmBapMZ7le056JJZIPPbYo8W93eJFkguS2fGHKp2lUyKriGjPJE8xbKZJSuSHKy
         oCaw==
X-Gm-Message-State: AAQBX9fitKz5xy7IQSmH5pzMW8p7gCrmkLZq4JUoiGuoAWpO6KuRAcve
	qQxydfqk32Vo+8TY1FyXl0s=
X-Google-Smtp-Source: AKy350avq0CExGtf4fiebF3FQzRiPIJEHCbJzrk50zC+WfWDQsglBM9pgQzdlXh/LaLmbuvNYNl/2A==
X-Received: by 2002:a7b:ca43:0:b0:3eb:3945:d405 with SMTP id m3-20020a7bca43000000b003eb3945d405mr34247wml.38.1682019764130;
        Thu, 20 Apr 2023 12:42:44 -0700 (PDT)
Received: from localhost (host86-156-84-164.range86-156.btcentralplus.com. [86.156.84.164])
        by smtp.gmail.com with ESMTPSA id j32-20020a05600c1c2000b003f173987ec2sm6257438wms.22.2023.04.20.12.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 12:42:43 -0700 (PDT)
Date: Thu, 20 Apr 2023 20:42:42 +0100
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>, linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>, abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: Re: [RFC 01/48] mm/vmalloc: Introduce arch hooks to notify
 ioremap/unmap changes
Message-ID: <b58eadb7-c80c-42fe-b803-09f2f466c0bd@lucifer.local>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
 <20230419221716.3603068-2-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230419221716.3603068-2-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_124247_063869_9B6CB4AA 
X-CRM114-Status: GOOD (  29.14  )
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

I'm a vmalloc reviewer too now -next/mm-unstable get_maintainer.pl should say
so, but forgivable because perhaps you ran against another tree but FYI for
future I'd appreciate a cc- :)

On Wed, Apr 19, 2023 at 03:16:29PM -0700, Atish Patra wrote:
> From: Rajnesh Kanwal <rkanwal@rivosinc.com>
>
> In virtualization, the guest may need notify the host about the ioremap
> regions. This is a common usecase in confidential computing where the
> host only provides MMIO emulation for the regions specified by the guest.
>
> Add a pair if arch specific callbacks to track the ioremapped regions.

Nit: typo if -> of.

>
> This patch is based on pkvm patches. A generic arch config can be added
> similar to pkvm if this is going to be the final solution. The device
> authorization/filtering approach is very different from this and we
> may prefer that one as it provides more flexibility in terms of which
> devices are allowed for the confidential guests.

So it's an RFC that assumes existing patches are already applied or do you mean
something else here? What do I need to do to get to a vmalloc.c with your patch
applied?

I guess this is pretty nitty since your changes are small here but be good to
know!

>
> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  mm/vmalloc.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index bef6cf2..023630e 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -304,6 +304,14 @@ static int vmap_range_noflush(unsigned long addr, unsigned long end,
>  	return err;
>  }
>
> +__weak void ioremap_phys_range_hook(phys_addr_t phys_addr, size_t size, pgprot_t prot)
> +{
> +}
> +
> +__weak void iounmap_phys_range_hook(phys_addr_t phys_addr, size_t size)
> +{
> +}
> +

I'm not sure if this is for efficiency by using a weak reference, however, and
perhaps a nit, but I'd prefer an arch_*() that's defined in a header somewhere,
as it does hide the call paths quite effectively.

>  int ioremap_page_range(unsigned long addr, unsigned long end,
>  		phys_addr_t phys_addr, pgprot_t prot)
>  {
> @@ -315,6 +323,10 @@ int ioremap_page_range(unsigned long addr, unsigned long end,
>  	if (!err)
>  		kmsan_ioremap_page_range(addr, end, phys_addr, prot,
>  					 ioremap_max_page_shift);
> +
> +	if (!err)
> +		ioremap_phys_range_hook(phys_addr, end - addr, prot);
> +
>  	return err;
>  }
>
> @@ -2772,6 +2784,10 @@ void vunmap(const void *addr)
>  				addr);
>  		return;
>  	}
> +
> +	if (vm->flags & VM_IOREMAP)
> +		iounmap_phys_range_hook(vm->phys_addr, get_vm_area_size(vm));
> +

There are places other than ioremap_page_range() that can set VM_IOREMAP,
e.g. vmap_pfn(), so this may trigger with addresses other than those specified
in the original hook. Is this intended?

>  	kfree(vm);
>  }
>  EXPORT_SYMBOL(vunmap);
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
