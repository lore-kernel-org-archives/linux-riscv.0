Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8429DC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 13:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1kKVsQ0Stc7ID22tcXj6R5v9AIzzyUmpZxt7rV+IVsw=; b=4PvuiLEbXKqEDe
	0PNRO9Lb+V2BBcVyw0A0mn1MEE4kfIlHAgHkeIqJd1gwQzYSO+IQUJxGrKX2sf63HIWapPhUS8a25
	na9nYr4QY4JcoV96QnKmYITWaVDIyY4cL0cXLAKKUvdEtgRNJkRNcUA+0f4jx90fSHjXCTLfmRQ6p
	g6q9LjgV0/bdRCa5yXhz+Mt3Zbeo8HtxBnAxGgDGjx3wh2mDIwKnP/2WwbsIeUTYSkuQK3NjqNH4s
	Hql00ioRmhj/TehEUYuduYHBGwpNXjCOFpLABJD26dcog3yKu23rs+49pB28rShyjl+DvRDQ7ou9V
	D4RH4SaJ2qXbFpKWqHLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogR49-002jTN-BL; Thu, 06 Oct 2022 13:37:33 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogR47-002jS1-5l
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 13:37:32 +0000
Received: by mail-ej1-x630.google.com with SMTP id b2so4651563eja.6
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 06:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=1KBtCQA+POVQgcSO7IcdkKbJOYcYsiANOuZ7mA7FU3A=;
        b=LsdhIKdvpjq+E2RQuOWZxicWS6QGeHaNtfNH1k/a6CWDS9JJyNkIMmqwaybdEfF1nn
         onH6NfXu/Z1KePjmeteD0pzhTtNBZQfoTMDzLsHNsd9aT+MNLcR5Vu8lHKySLVmgi8Yi
         rvAPCS+izjGHM/0D9VUU4/0fHvdB/npA4/RqzUgwKt0jO9xaCM01OPR94dudpkE/yhIM
         u5/kRXswkHYZ4MNHHqc5SqP1xEsRls/SHH2yZ6/SW7RKg5A5YO1mHTXGsnyVdohXopO0
         1n8E7Wdjc0hjXChB0PDXf93t/7S8MgtQxcICj+QfnAPoFP87/757+uvS4EMpKu/IIGVy
         DCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=1KBtCQA+POVQgcSO7IcdkKbJOYcYsiANOuZ7mA7FU3A=;
        b=iD6+8yLWP95nBEfXLxEeHLhHnX+g5hLEQwbCRbvrFxmAN7etkpxvPAmFWWn0FagTc/
         n/2PUGaovh+y1rAz2hur1z8BarkgbCwR6pO2AEjFV5vySXOswEVe2wF4ni1qBSjyOwKX
         fuo1RVkVBwKMkgRhg+D9lXCcA2jcqKRpRhZznI+G8HdG0/hM2PYYnDCj/KrwNEhHKEfR
         3Fr4I3pNjFAK/JbnaY3lOai/ni0B9Kmq5vjKgd8UFL/LunL+TEryVT/u/mblV9RMc885
         xTY1PEOS3foBbVDCvZTH69VoBDejfzmvDQSxGXU5vlxdDqJD9jKGiukHLd/Y8KFztiTu
         QDsg==
X-Gm-Message-State: ACrzQf1T7XfmtA19fnzm53YDni9rpIHkq+UKXNp81c4tXBjiODlMadyc
	Yl07effSq47DrNXeaLcqR6xRWg==
X-Google-Smtp-Source: AMsMyM7bnqMp+6Vd29aCm00f0CbgnkbIiZIM7a9RaRs+fmZ/teSS89vbvnwFen2XQsfYICJluA5tLA==
X-Received: by 2002:a17:906:8453:b0:78d:4893:fede with SMTP id e19-20020a170906845300b0078d4893fedemr1346086ejy.637.1665063449792;
        Thu, 06 Oct 2022 06:37:29 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id z10-20020a50eb4a000000b0044e01e2533asm5901815edp.43.2022.10.06.06.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 06:37:29 -0700 (PDT)
Date: Thu, 6 Oct 2022 15:37:28 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] riscv: cpu_relax: switch to
 riscv_has_extension_likely()
Message-ID: <20221006133728.4ge3pmcm7mvksia7@kamzik>
References: <20221006070818.3616-1-jszhang@kernel.org>
 <20221006070818.3616-8-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221006070818.3616-8-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_063731_231882_040D3CEB 
X-CRM114-Status: GOOD (  15.67  )
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

On Thu, Oct 06, 2022 at 03:08:17PM +0800, Jisheng Zhang wrote:
> Switch cpu_relax() from statich branch to the new helper
> riscv_has_extension_likely()
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/vdso/processor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include/asm/vdso/processor.h
> index 1e4f8b4aef79..fb30480f36a0 100644
> --- a/arch/riscv/include/asm/vdso/processor.h
> +++ b/arch/riscv/include/asm/vdso/processor.h
> @@ -10,7 +10,7 @@
>  
>  static inline void cpu_relax(void)
>  {
> -	if (!static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_ZIHINTPAUSE])) {
> +	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZIHINTPAUSE)) {
>  #ifdef __riscv_muldiv
>  		int dummy;
>  		/* In lieu of a halt instruction, induce a long-latency stall. */
> -- 
> 2.37.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
