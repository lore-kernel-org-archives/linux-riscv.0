Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8ABC001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 10:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7YWqj5fAMPZKSkzkXyOOMHsnW1TJzYkaDZHEq95m38=; b=wpNI59UvQHYMzP
	PT5TDsMvs5oH7MKq1hfbJnXVnrZk8VCeSR3uBzkj8qAgSym+gXWewIHQG/Wcja+nJ5Yr+nEinzlKn
	/5v/ZhbkwSbkh7LjVsFKKNt08AhjiSFjKHhbNKXlkijN/nIUzx+CHHJnItCDPsxqh70d2Biq8gJ4r
	54BqewCWiZXZnNG3nIKZW6qd8AJJPf8nWCOPpFPQcFdLigWR+804vJSWMnSGS3aUMFlHVweDD6xnz
	tOdjNFoZGNP/4OLiPk7HrWJEXokT83XJapLqo+k5LKQLKBTXlnvduOUAEpCQL5TWHtHaNdqkV8Hay
	yRWCUxzo72YGaJPpua4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsPi-003Zsq-04;
	Mon, 24 Jul 2023 10:03:38 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsPf-003Zrx-1d
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 10:03:36 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b89d47ffb6so19727405ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 03:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690193015; x=1690797815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=irnZK5VJVU/AvPnIudC2XTq+WREheiEIBR7LygQl+ws=;
        b=dHARKePIGkFra3NY1uluycCD9ycJKXO5I17JdpjU5HpCKHmSb5aPqN3JViWfR4Ysev
         TA/qFgnCJOTnTrrqa5icdHpNCmd2yrv+hX3tDDBvDyHTAd3xiT2UDg7oFIxb8gcA6lNS
         9snaI+UKGUZKLci864M/JSAcgWa/6EBBJ14VsGdMEipXA02PFBiRU0yA5vCrseAzeBMC
         wOqggx1Qg8Mvb2g+SHuDhtTbUrj3QFGzTDAwt93iWxwdNZ8xabNv9DeBz4RgwhVowrk3
         tOhHrSkKbs8qCMj6iDKykP6VK2d6sS6mjcVxgBw8xMuitnGv72ePVAIohj/6nv5ZXrxy
         goWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690193015; x=1690797815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irnZK5VJVU/AvPnIudC2XTq+WREheiEIBR7LygQl+ws=;
        b=Mwrcf7eY3nzUHQRhtihE3CxKRnV6r33nPhvwgh+oX4AdvhXIAnMLIhYEkV6Y1vXx2k
         4ujZCU48b87ufsbmxnEeQER8jWdkG0nyg63blLuEEkwCgn92STXl3Tpn0ikM+oRh15g2
         nor+DJFKQqJ6UyKVRaVg+DPGZKCkzRklBMzJMnXvK74CPz5jlTStB/b2gPT3G6t9SQfy
         cIFaw8EmcIsgNQ+rXLf0KQDGQa3zABsnKma8hu4yxnCIs1KBHFOLh1B2yxpnsznwF4V0
         v2IQ0Ml0UN0JHDgcMv6rBVqZUInEYnyaMPEPlnF2+8BwafQ8Y7QxNQkOIQT6YPAQPOQX
         o0ug==
X-Gm-Message-State: ABy/qLY0cV/V5dFnwdTQmuVIAF3tVdSaQsEq0LBroKCIRJe6eIypmu52
	bNmttQz0P3XvWqkT9N8Rvvs4Gw==
X-Google-Smtp-Source: APBJJlF1CQZ1cg59E54KGa9kDfKHQvta4M96RAu16e3sgfccxvBtqHeyaMZOqEeMWqY+XIDA7oJ05w==
X-Received: by 2002:a17:902:b188:b0:1b8:94e9:e7b0 with SMTP id s8-20020a170902b18800b001b894e9e7b0mr5741090plr.9.1690193014711;
        Mon, 24 Jul 2023 03:03:34 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.25])
        by smtp.gmail.com with ESMTPSA id l20-20020a170903005400b001b8a85489a3sm8442147pla.262.2023.07.24.03.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 03:03:34 -0700 (PDT)
Date: Mon, 24 Jul 2023 15:33:27 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 -fixes] RISC-V: ACPI: Fix acpi_os_ioremap to return
 iomem address
Message-ID: <ZL5Mb65sejudi4Ri@sunil-laptop>
References: <20230723191758.1262960-1-sunilvl@ventanamicro.com>
 <20230724-phonics-earthling-d104ef807286@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230724-phonics-earthling-d104ef807286@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_030335_538629_93661AF4 
X-CRM114-Status: GOOD (  20.79  )
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

On Mon, Jul 24, 2023 at 09:07:46AM +0100, Conor Dooley wrote:
> On Mon, Jul 24, 2023 at 12:47:58AM +0530, Sunil V L wrote:
> > acpi_os_ioremap() currently is a wrapper to memremap() on
> > RISC-V. But the callers of acpi_os_ioremap() expect it to
> > return __iomem address and hence sparse tool reports a new
> > warning. Fix this issue by type casting to  __iomem type.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202307230357.egcTAefj-lkp@intel.com/
> > Fixes: a91a9ffbd3a5 ("RISC-V: Add support to build the ACPI core")
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> > Changes since v1:
> > 	1) Removed enhancements from the fix patch.
> > 
> >  arch/riscv/include/asm/acpi.h | 2 +-
> >  arch/riscv/kernel/acpi.c      | 4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> > index f71ce21ff684..d5604d2073bc 100644
> > --- a/arch/riscv/include/asm/acpi.h
> > +++ b/arch/riscv/include/asm/acpi.h
> > @@ -19,7 +19,7 @@ typedef u64 phys_cpuid_t;
> >  #define PHYS_CPUID_INVALID INVALID_HARTID
> >  
> >  /* ACPI table mapping after acpi_permanent_mmap is set */
> > -void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
> > +void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
> >  #define acpi_os_ioremap acpi_os_ioremap
> >  
> >  #define acpi_strict 1	/* No out-of-spec workarounds on RISC-V */
> > diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> > index 5ee03ebab80e..e6fdb9edcdd9 100644
> > --- a/arch/riscv/kernel/acpi.c
> > +++ b/arch/riscv/kernel/acpi.c
> > @@ -215,9 +215,9 @@ void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
> >  	early_iounmap(map, size);
> >  }
> >  
> > -void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
> > +void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
> >  {
> > -	return memremap(phys, size, MEMREMAP_WB);
> > +	return (__force void __iomem *) memremap(phys, size, MEMREMAP_WB);
> 
> Why's the __force needed? Does sparse complain about the cast too?
Nope, I think it is required only if the cast is other way. Let me remove
this in v3.

Thanks,
Sunil



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
