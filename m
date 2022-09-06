Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EFEECAAD5
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 15:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoH098Ex3Zvf7mM6KfiyninWppT5a2A1EPHQ3YeLdzs=; b=MV1qKAS6CYyVGf
	kAvLwy3v28fNtvBek2vb+GyozuXDzLQUDKmsm/+VsDF0E/mBUWC33Z2iB3uP1+pqbM4vN+2tQ+YYL
	aEQy+zx4R43lebHLyvV+3h5w4H9tpRhgukQ4dEYZGSBzTBz3wjAiDnRlkg26AANgQ6y7eyasoZPQU
	HwvToGIZOrV5f8jf0TNYcWXoVN3lJem7gUZkaGEr+Fv5ZB3tgxmHdFKusGTGU+6kUgleeIRSFBo54
	Hu0Gw7lPhWhVKv4odNLDgmUzur5TkwNFvOaHPYl8/hkcltWBY8clCOzO/5BDDCrM2rSbzZyqeIICA
	H8BBtN75JrOwdTq67XkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVacN-00EsC5-J9; Tue, 06 Sep 2022 15:36:03 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVZla-00EOnj-FN
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 14:41:31 +0000
Received: by mail-ej1-x633.google.com with SMTP id nc14so23784879ejc.4
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 07:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=obQJf2HknhO5LzamvcoZsXBNmP3jnXXMiHwGcU1ms9o=;
        b=A5Qc+A50njRhw1b0a1ZGGwu5fDE1YrtFg3Ico2zug/0A42aYG+KK8KbolxcVUBi9Bb
         ZhCzClL+eQS5DYrAC5FPM5lebzThdjB/tYzCGO/RBUYfQ4K7RTCjmpYHCaNhPSswnqil
         ntuyKzTa/ejN3Q6GN11yHAIxy1dYX5rsFFiMptv2jQRX/tDbP/Dqp5/eaFT9PBcXBNDC
         3jJaj5mlij2DLvjBXYIx5UZoZmNGGKOzPUstbAjgggv30h4YMJRlnmPQIRvSzPNXApVL
         XoClgGvta8m/TpOCQjXI9QnyaxOezSeZ088kDGPvRTzquGOd44bQe34u/+NhTAKIws5U
         PCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=obQJf2HknhO5LzamvcoZsXBNmP3jnXXMiHwGcU1ms9o=;
        b=nBJlDRMs2w3vHHGcjmmxUObT7k1A8InoF4zPCGYhgF+0OAH1cg0goFpqJvsXD6tCR2
         eWuzZkgiFnrym4Q23I+wizOA9Iqx43NVARZfULq13bKk2HhIjr3DxDicsOP0+Sjsd+G4
         Ex8YkO1IKPDDyrFdmpqO29A8xaS/5U4h/bUl+7XM+idBBykJZ+mb98EQ5v8qdCQ5xTja
         WfiXlX3K+KKJ2iuBn/5CrKJ3GsJf1m1W/HJy7lJbVidFunqYqj/RTNy4+RuQChuKO2uc
         wzFAEJNV90VG6VbZUb95mPlw4QCx5Kn5T6EKUjBtFqBE58qdMatSm0Y3My4FD+mITivr
         InDQ==
X-Gm-Message-State: ACgBeo0exRqGDze5nnxDY+r9sA3tiVbTySiELGS7Am+xuqyxwcZuDor3
	wE/gnfxhrEKi4XbMGAf6s7nJqA==
X-Google-Smtp-Source: AA6agR4M8LGhVDadjv3GI5r/7o8QPMQuVlDlgU4uWaZusJxp2iRDYJDDjLlZ+KbYRkK12sJNOWh6vQ==
X-Received: by 2002:a17:907:9721:b0:741:5c68:a0a4 with SMTP id jg33-20020a170907972100b007415c68a0a4mr31455536ejc.81.1662475287925;
        Tue, 06 Sep 2022 07:41:27 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id b13-20020a17090630cd00b007308812ce89sm6600708ejb.168.2022.09.06.07.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 07:41:27 -0700 (PDT)
Date: Tue, 6 Sep 2022 16:41:26 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jinyu Tang <tjytimi@163.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, anup@brainfault.org,
	alexandre.ghiti@canonical.com, guoren@kernel.org,
	akpm@linux-foundation.org, heiko@sntech.de, tongtiangen@huawei.com,
	sunnanyong@huawei.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, falcon@tinylab.org
Subject: Re: [PATCH v1] riscv : support update_mmu_tlb() for riscv
Message-ID: <20220906144126.3enx6y2mhevrc4ur@kamzik>
References: <20220906121921.8355-1-tjytimi@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906121921.8355-1-tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_074130_603020_B2CED3C9 
X-CRM114-Status: GOOD (  16.53  )
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

On Tue, Sep 06, 2022 at 08:19:21PM +0800, Jinyu Tang wrote:
> Add macro definition to support updata_mmu_tlb() for riscv,
> this function is from commit:7df676974359 ("mm/memory.c:Update 
> local TLB if PTE entry exists").
> 
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 7ec936910a96..84a791d54f95 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -418,6 +418,9 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
>  	local_flush_tlb_page(address);
>  }
>  
> +#define	__HAVE_ARCH_UPDATE_MMU_TLB
           ^ just a single space here, please, as all the other
	     'define __HAVE's in this file

> +#define update_mmu_tlb	update_mmu_cache
> +
>  static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
>  		unsigned long address, pmd_t *pmdp)
>  {
> -- 
> 2.30.2

This seems like the right thing to do, so

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

I'm curious if this patch is the result of debugging something? Or what
led you to post it?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
