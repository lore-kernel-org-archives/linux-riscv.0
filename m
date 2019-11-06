Return-Path: <SRS0=JmrV=Y6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F53AC5DF63
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2019 17:56:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23542217F4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2019 17:56:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LH5/LYeC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="PGZwZeqh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23542217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=BoXXznI/PmNbB1YolcL0DgCJBIWhtYhpdD1CIZE+Sq8=; b=LH5/LYeCPF8+Nm
	3lw6u6yyJu65ZFl132kCsHrw+mlz+Qi8fxG+XQej7HQNipqIa9rIeaQ/S4iuyuWeAE8NUm0rnnnKd
	cMJvHiQTrITebH9yG9CkuLtk2UIMYwvpMQZIRQerNTUszelZ/B0vO36PDFeIA/ws/FKnw88VfB0b5
	U6/yB3VYUXGAEtGMAfx7TIG/jQ4d1mayQ6EqRr5xhlKT9G2IvxCwfZ1xyN0ljqC2GVLxiXmycESJA
	sKEb/yQl3ROcpXjdpI+pMpLGJqFfN3WzVt72RVp8alI4O7h0iuDRvxFMr5xK1zWzjbAwNxP1t5E0g
	m3SPrcNVuwQR1vHJIYNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSPY2-0006KO-Af; Wed, 06 Nov 2019 17:56:50 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSPXr-00063y-VG
 for linux-riscv@lists.infradead.org; Wed, 06 Nov 2019 17:56:41 +0000
Received: by mail-pg1-x544.google.com with SMTP id 15so17648270pgt.7
 for <linux-riscv@lists.infradead.org>; Wed, 06 Nov 2019 09:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id;
 bh=xZW1gMrCUoJqpGWBEYHWFfV09K+K/0uVmzI4MIoxGS8=;
 b=PGZwZeqhjPGqmbBUrw44Auucb8k6dPtlYxXbuNpTAeEMGmKlsnFWXhrKzSARRD1P5Z
 ofkafacEFrUvuMMQ8srHmApZNGXOM2FXgWNtdGS1rg8UPKc85d79tzD5/t3BF7GMjDtX
 WoCFpoFoR/nlY6sa8P7ME55iO2h9Yfcb7ZSd7Zw+om2XJAjYyCK0yIJtNHDyXsnWFiZL
 JcRZR97cwQ2ZvZRsXx81CQhAqwyUUPUY90oJrysCQQ7l1b0iCyPludGEBBLbIE1elh0S
 JIqszC7OB8xZ2n5/8rEoDBU7MzMibg41EDmgXW2rJwIAtaViAg8zHwFVYITgL2sVpvu1
 UzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id;
 bh=xZW1gMrCUoJqpGWBEYHWFfV09K+K/0uVmzI4MIoxGS8=;
 b=nwZ1fsik8FDA83e6mr+cCOuQcL9EFJsZwaGsXMgKqIVGzDqIznGoI281LPbNoLzwjB
 ERX4fix9UU7Y8FAC+oCwjoSIG64KZQxU8yZKreQkHEErE8GvMrLaB9IzAwKhihdkeCBP
 2JBjG+0fZP9OdTUOb4SvWnaPpr3Uu77SDOyN6xscmVKldKY0xiCMsfq4Kcz63bGjUI2a
 BnTtUj4InYMgRyVAonoxvUrVjv/ehWBsqfpMYr0VAg962pZOn9wjE9jsXEhxqmqk45jc
 tkjmW4hfzjPeoaxLTotWudPSrE3MtTZ8dEYzuZq+0FZzSWo1lXXzUnhJA8phjY0d7OyA
 WfWA==
X-Gm-Message-State: APjAAAX5MfJZ0374eViEvszBZvzAwWeZAzpoNqTypXiib9KCv1dnnh8O
 KfZwVfVOJHg9OToGWAaWcrI60Q==
X-Google-Smtp-Source: APXvYqyZI0/opOONYHdOR3l6SH/z69P+ajsTKg8L6ObdzcVPlsahU45e+bD0ChxR/pgAJsTDNgZ9EA==
X-Received: by 2002:a17:90a:340c:: with SMTP id
 o12mr5529604pjb.18.1573062994968; 
 Wed, 06 Nov 2019 09:56:34 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z11sm32745913pfg.117.2019.11.06.09.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 09:56:34 -0800 (PST)
Date: Wed, 06 Nov 2019 09:56:34 -0800 (PST)
X-Google-Original-Date: Wed, 06 Nov 2019 09:56:23 PST (-0800)
Subject: Re: [PATCH 10/21] asm-generic: ioremap_uc should behave the same with
 and without MMU
In-Reply-To: <20191029064834.23438-11-hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-3f709a8a-a8c3-4612-b4de-847d13b4af0a@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_095640_010389_0F720D68 
X-CRM114-Status: GOOD (  18.13  )
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com,
 linux-mtd@lists.infradead.org, gxt@pku.edu.cn,
 linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 28 Oct 2019 23:48:23 PDT (-0700), Christoph Hellwig wrote:
> Whatever reason there is for the existence of ioremap_uc, and the fact
> that it returns NULL by default on architectures with an MMU applies
> equally to nommu architectures, so don't provide different defaults.
>
> In practice the difference is meaningless as the only portable driver
> that uses ioremap_uc is atyfb which probably doesn't show up on nommu
> devices.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/asm-generic/io.h | 36 ++++++++++++++++--------------------
>  1 file changed, 16 insertions(+), 20 deletions(-)
>
> diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
> index d02806513670..a98ed6325727 100644
> --- a/include/asm-generic/io.h
> +++ b/include/asm-generic/io.h
> @@ -935,18 +935,7 @@ static inline void *phys_to_virt(unsigned long address)
>   * defined your own ioremap_*() variant you must then declare your own
>   * ioremap_*() variant as defined to itself to avoid the default NULL return.
>   */
> -
> -#ifdef CONFIG_MMU
> -
> -#ifndef ioremap_uc
> -#define ioremap_uc ioremap_uc
> -static inline void __iomem *ioremap_uc(phys_addr_t offset, size_t size)
> -{
> -	return NULL;
> -}
> -#endif
> -
> -#else /* !CONFIG_MMU */
> +#ifndef CONFIG_MMU
>
>  /*
>   * Change "struct page" to physical address.
> @@ -980,14 +969,6 @@ static inline void __iomem *ioremap_nocache(phys_addr_t offset, size_t size)
>  }
>  #endif
>
> -#ifndef ioremap_uc
> -#define ioremap_uc ioremap_uc
> -static inline void __iomem *ioremap_uc(phys_addr_t offset, size_t size)
> -{
> -	return ioremap_nocache(offset, size);
> -}
> -#endif
> -
>  #ifndef ioremap_wc
>  #define ioremap_wc ioremap_wc
>  static inline void __iomem *ioremap_wc(phys_addr_t offset, size_t size)
> @@ -1004,6 +985,21 @@ static inline void __iomem *ioremap_wt(phys_addr_t offset, size_t size)
>  }
>  #endif
>
> +/*
> + * ioremap_uc is special in that we do require an explicit architecture
> + * implementation.  In general you do now want to use this function in a

Presumably that's supposed to be "do not want to use"?

> + * driver and use plain ioremap, which is uncached by default.  Similarly
> + * architectures should not implement it unless they have a very good
> + * reason.
> + */
> +#ifndef ioremap_uc
> +#define ioremap_uc ioremap_uc
> +static inline void __iomem *ioremap_uc(phys_addr_t offset, size_t size)
> +{
> +	return NULL;
> +}
> +#endif
> +
>  #ifdef CONFIG_HAS_IOPORT_MAP
>  #ifndef CONFIG_GENERIC_IOMAP
>  #ifndef ioport_map

With the fix:

Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
