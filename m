Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D08C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 07:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p1Df6mW7ghfOnxyTgnajlnEyVIfzKE6lwj244WPF+rM=; b=lFK7L6Wn9L4HXh
	HiMbssrQQfarYkPy/YWqTTptA07qs5bpgWndvEzBxA5LNxHSTDip7tAAPFI6PMZMoTbLjZXqhNRHO
	Kx5+7EOeCk/pP4fNnsY6TePIZKQoq/CsaxO4N7I+KvNE0Vze6o/wUVh9mSJ3V46EIFEtxRFaOdgyZ
	Mtlty5C4qLq+HbZMC0ji+4v5LQA0ME1Gwac6d0cW7pXpgaTpJS8W2hM4HIU6iGI+ZLMx3IrlcOF6S
	CFSyh9fgF6WBRax9ZQU8w+6nOo2j93WkfPkfQcXpxnN3T+iVK+dUbUuzS4fhYSiTFHLgoimRzQITD
	W/sh+1PRHXg+K8Pvzasw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4d4i-009Kcb-BN; Mon, 12 Dec 2022 07:18:08 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4d4f-009Ka7-LF
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 07:18:07 +0000
Received: by mail-ej1-x636.google.com with SMTP id fc4so25537620ejc.12
        for <linux-riscv@lists.infradead.org>; Sun, 11 Dec 2022 23:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4YY2z1Mp24RHUP83hMOwgHkkLHgDHarI0Vd7fO5iQ8U=;
        b=cSJOvlcMeDS21t0Qa1Z/x0VD+7h+OZelDpXMFwsb1l5ZWVNBieRpEoKRYCMtlIJlHb
         OP9ih5xuUjdGgbse9iiJy62BTDT+9QldxKnJTmfXpbTzlptq7ECdLArVF+JjKJmvtNae
         jl47qMYUit5ExEoYkQo9ydQEq7Yqd3BtLGLsw1xM1jxNmswo4OFr1ngo38rQ/WBL4cht
         HDKOVSnmOdD8RPlZI5C719/oKvWtr1jZ14JlkdRw7i5nmHmEjR+fvgczKA9YHjvfrm9V
         aTfWtdnFPMW714ckSWM37ydYGVpzcb+7GqVL9HQXGFj31fYwA2+0L62lUa/TlnbM3Qt1
         fVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YY2z1Mp24RHUP83hMOwgHkkLHgDHarI0Vd7fO5iQ8U=;
        b=JB0GYea3wfc+sKMjepcTVXWbRGtFFVPGPlQhSHtZjSM9jgoFilghd5cLcGcKFjum9G
         yXs4JBmo4Dbnv0V2bi1IinbczA8ookxJaWDhZnytqdALXmbSNLjQLTgfL87PWtUT/T41
         Sj7o/ET1bh7l1aapV0W43Aw8LGuKDhLXrcPJLtEyptKLYQ+NvgUL4SCNZ2VirOisxkMx
         GCMHB7KXQ/1cfD9S2Nk9t5tYHKPo4hkaSG53ILe4I/YJnfngbJZ2Q+vl02/mS9k4lHDq
         mFyTmWvkQS9MLCFPtoZJ9TkEmMLPzl7MKhF6D6hsy3QGhoRtHGaOjdB+i8F8tY/hK+iG
         C2Bw==
X-Gm-Message-State: ANoB5pmV1H1fVCWW+IgWhqqTY1ib7LJPHjmR0EHXcwi7cjbDv1Fnb4el
	P7r+dKojpZxqf02j+FFAh1TX1g==
X-Google-Smtp-Source: AA0mqf7ew2EWmDqombi+c+MlwYVJzKEMwk3YN387wbEjXgPvVD96PJOMe7HhLcR8+GB1ww15JZJHQw==
X-Received: by 2002:a17:906:f9cc:b0:7c0:ad62:a25f with SMTP id lj12-20020a170906f9cc00b007c0ad62a25fmr10036719ejb.51.1670829483773;
        Sun, 11 Dec 2022 23:18:03 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id i17-20020a1709064ed100b007c0dcade045sm2933200ejv.43.2022.12.11.23.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:18:03 -0800 (PST)
Date: Mon, 12 Dec 2022 08:18:02 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn, conor@kernel.org
Subject: Re: [PATCH v10 1/3] riscv: mm: modify pte format for Svnapot
Message-ID: <20221212071802.o7cobfdvsp26xoq7@kamzik>
References: <20221212065526.805233-1-panqinglin2020@iscas.ac.cn>
 <20221212065526.805233-2-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221212065526.805233-2-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_231805_722718_A0A3DC23 
X-CRM114-Status: GOOD (  20.35  )
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

On Mon, Dec 12, 2022 at 02:55:24PM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> Add one alternative to enable/disable svnapot support, enable this static
> key when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
> option is set. It will influence the behavior of has_svnapot. All code
> dependent on svnapot should make sure that has_svnapot return true firstly.
> 
> Modify PTE definition for Svnapot, and creates some functions in pgtable.h
> to mark a PTE as napot and check if it is a Svnapot PTE. Until now, only
> 64KB napot size is supported in spec, so some macros has only 64KB version.
> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 67ef08d33d3a..4b5bb719bc6f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -397,6 +397,24 @@ config RISCV_ISA_C
>  
>  	  If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_SVNAPOT
> +	bool "SVNAPOT extension support"
> +	depends on 64BIT && MMU
> +	select RISCV_ALTERNATIVE

Hmm, shouldn't we also be selecting HUGETLBFS?

> +	default y
> +	help
> +	  Allow kernel to detect SVNAPOT ISA-extension dynamically in boot time
                                ^ the                              ^ s/in/at/

> +	  and enable its usage.
> +
> +	  SVNAPOT extension helps to mark contiguous PTEs as a range
> +	  of contiguous virtual-to-physical translations, with a naturally
> +	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
> +	  size. Without CPU's hardware extension, turnning on this feature
> +	  may cause some little momory leak now.
> +
> +	  If you are sure your CPU has not SVNAPOT extension, say N.
> +	  If you don't know what to do here, say Y.
> +

	The SVNAPOT extension is used to mark contiguous PTEs as a range
	of contiguous virtual-to-physical translations for a naturally
	aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
	size. This option unconditionally allocates some memory for each
	NAPOT page size supported by the kernel. When optimizing for low
	memory consumption and for platforms without the SVNAPOT extension,
	it may be better to say N here.

	If you don't know what to do here, say Y.


Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
