Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61D0C71133
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 15:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6YRcEEMXC/ltlI8ojTpi9PgePtuMIuoJKv/ZnPsmyQ=; b=xm2JOLz1jeT02o
	Q7yCYo9FzxtF6Uv5vW8ETIeCsYVlXXWifDZvMz4Q0CIxF2D+lKunevOlpzcslmQZSoq5ogYe6lRG9
	I6ngu1azgJ0LsVRh6eBdRC/HC4GZJmRM3EYw34VUs/6KVVrDY3xrhhAfaGXJuJvwEXrVphx1Y7QBx
	ROTEEZY2fCLIYPBQYSVB4bpp+fLVpUVcJchOPGVN0cCIj9cKDi9yXT78wPfQkgRXurOOcRJV7oqnG
	BUKSQnmO2bCjK01z17NR5vBEXflxOlkx5rWdkqsEpE3K4ZhrtqI/+/8FvkbbT7DpiW1zXXRXrpvLi
	Gv0UF463OiV6T93yxbng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNnB-0000000AUwi-2Gz2;
	Wed, 11 Jun 2025 15:55:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJdg-00000009kHC-1aAD
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 11:29:05 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a52874d593so6265701f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 04:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749641342; x=1750246142; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a5eBwBbTQUmE/jg9qxOQzcw7gsljfjr3T8EkpVA+lR8=;
        b=YZz9CTkYcCZ3oFINg9muqBHSCpW3sETClBxSTgu2zCYfHOahTDP1mpA/0z03Fw7LJQ
         4RJ/eLPW5WyLjvnDAeV29xfcSpVmoXK3pYvKZ2TcthDUZ0NQLvMXfQWYZVyjG7vBNIoQ
         6enV5jP/RNYG15xcNv4psogeP0XU/LbhhIXuNjPFdLy5foLgQUCX3qksKnaGAOs8UYZP
         vZPBazSP4AYrfQU4QQ7+vmMK4PkkiUKC0GBhNXtPkr/85Ihv4+P9F5n2avWQiqTUkP2q
         MXvlf+TrdhMdnJlCFGldC+BliceOfbPsBQau5Uc602hzACp4reaxBeDcdL5cdULv5/yv
         Pyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749641342; x=1750246142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5eBwBbTQUmE/jg9qxOQzcw7gsljfjr3T8EkpVA+lR8=;
        b=uWg4b0cc9/fgSgKLlMqpH1NTyDoXFBdm6743igfbizxjpc+KPiaxOJy4pm6DHt+gnS
         g9YAX+5JXFQS+BHcFt2njS09nSjJxzNGKOQ9vHxbCsRTRpJ+9iAWOlKproXU3DTpKtal
         u9ZcDwzUe4LY2Tnn1F+MiVCWWsUWG9I0iQokPr9Yw3npkWmKSik07AW6mEgev6xN9Yrh
         F4VMvTgNq2DTyP5Ynt8i87+OTz8LokdEq832xKa/PjwxtxE9LSfhg/GbgI+CSdmQmGli
         ACPDXDBF9fXTz8FSq4Gr+2ARuRRFObV5ebiSajFXWc2heTDMcVpBc8BzmsGQOc91Pfhl
         tdew==
X-Forwarded-Encrypted: i=1; AJvYcCWSVo8i1GxDGT+4FLDNvq6J/xPskxOP/b7tgkA6H/MNfx7tXI/aRYlO0jwfP9877qpSLuqjUI6sj3huPg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrpin4f523H7TdJ4Pd8SAO1TDevT2NHwWKb3AhssFqFJKoIeRi
	dygy+zIg5fAF8z+6enQ2WH3v5OW6iW9RWxgYpAm/1XadUnmytGJ5UEeExOAP4kRaAe4=
X-Gm-Gg: ASbGnct4bfKOAZustNuCqiCLVX+kSBFbloXmclaTracrq2hOD2L7h3yKUZGgEDzOqeX
	PL41zZFgCLX2kHZT8IlopIYgXgLGA5Ewp7M5trt5SPGfPcsZB9OKfBpu4heQRdqYFauDZqyRsMR
	cOWxdonSWoJKSyTFCjDHDIqk4+7i7UrNaYF7sYRy3wN9mvNVkwUBPa8g2VfOkuJkYvpor97DDyz
	AeFElQVQncM3kp2JQi7YeYuQsqafpqZB9lbpBEbN62sM8pKXKbV0GV4YGfcIqXZPTsoxGYUc07L
	N1Lq8rAoOO19SCmMQy0984eXg/Zs50ZnUKFM+jj/UtvKBA/NSg==
X-Google-Smtp-Source: AGHT+IGR2AIUE7a4nEZNX6K/UcpKOCr7ODBk7la16aB9kHn6bvTqIQ8QJX5Tm6kGkYsyX0BXvJw49w==
X-Received: by 2002:a5d:64e2:0:b0:3a0:b940:d479 with SMTP id ffacd0b85a97d-3a558af780fmr2434572f8f.53.1749641342318;
        Wed, 11 Jun 2025 04:29:02 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323c08fasm14761939f8f.44.2025.06.11.04.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:29:01 -0700 (PDT)
Date: Wed, 11 Jun 2025 13:29:01 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: KVM: Avoid re-acquiring memslot in
 kvm_riscv_gstage_map()
Message-ID: <20250611-352bef23df9a4ec55fe5cb68@orel>
References: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_042904_419877_BA9968C7 
X-CRM114-Status: GOOD (  19.34  )
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

On Wed, Jun 11, 2025 at 05:51:40PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> The caller has already passed in the memslot, and there are
> two instances `{kvm_faultin_pfn/mark_page_dirty}` of retrieving
> the memslot again in `kvm_riscv_gstage_map`, we can replace them
> with `{__kvm_faultin_pfn/mark_page_dirty_in_slot}`.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/kvm/mmu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 1087ea74567b..f9059dac3ba3 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -648,7 +648,8 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		return -EFAULT;
>  	}
>  
> -	hfn = kvm_faultin_pfn(vcpu, gfn, is_write, &writable, &page);
> +	hfn = __kvm_faultin_pfn(memslot, gfn, is_write ? FOLL_WRITE : 0,
> +				&writable, &page);

I think introducing another function with the following diff would be
better than duplicating the is_write to foll translation.

Thanks,
drew

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 291d49b9bf05..6c80ad5c7e89 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1288,12 +1288,20 @@ kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
                            unsigned int foll, bool *writable,
                            struct page **refcounted_page);

+static inline kvm_pfn_t kvm_faultin_pfn_in_slot(const struct kvm_memory_slot *slot,
+                                               gfn_t gfn,
+                                               unsigned int foll, bool *writable,
+                                               struct page **refcounted_page)
+{
+       return __kvm_faultin_pfn(slot, gfn, write ? FOLL_WRITE : 0, writable, refcounted_page);
+}
+
 static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
                                        bool write, bool *writable,
                                        struct page **refcounted_page)
 {
-       return __kvm_faultin_pfn(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn,
-                                write ? FOLL_WRITE : 0, writable, refcounted_page);
+       return kvm_faultin_pfn_in_slot(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn,
+                                      write, writable, refcounted_page);
 }

>  	if (hfn == KVM_PFN_ERR_HWPOISON) {
>  		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
>  				vma_pageshift, current);
> @@ -670,7 +671,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		goto out_unlock;
>  
>  	if (writable) {
> -		mark_page_dirty(kvm, gfn);
> +		mark_page_dirty_in_slot(kvm, memslot, gfn);
>  		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
>  				      vma_pagesize, false, true);
>  	} else {
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
