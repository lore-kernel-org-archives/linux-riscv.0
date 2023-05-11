Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E64DC7EE24
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 07:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGss1nFCrml5Mz5ZiSERVcD+6yfPwOE7nK6SVpoICPI=; b=hbmuSlr9nIvsYI
	mIVAkHVNDY/miWqa4Dg2L8Gm2pCjC8AqwFCsGBlMNwmVJhSb1TEFOj+rM97K6CsvNfnOiKTbbOEPK
	ANpk0o+CXqVqQ45XAOrFO+D5yXVikFiTk9E4T5+JwmCUaVZS+HLFLKAGf5d8l1Gsj/R9dqXzTsNV4
	xycP0m/bWTNiDzrC8wgCl3WOPwX+UKCPpcKaW+iT1ua7ofXkNpS6QSx3WmuRXa8/Yk9Dv9TW/3G8q
	Pk15P8/ylPqLXX3L2PVuoob8GBtyobQQo+W3DCI9ArBlUv1BMtvsWxXmwEsndux8zdO036RXRxehz
	gUpnweV1KJja0bD+yYlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px0xY-008Az9-1n;
	Thu, 11 May 2023 07:43:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px0xV-008Axe-2Q
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 07:43:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f435658d23so22045985e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 00:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683791007; x=1686383007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FBy3EahqDgphDTB3uA+fykF7pytc9B8smwJ6NU7vDwM=;
        b=eIFYwFSSuqxK+vIm0dZNSB3vYWqC2bicIX47XguJQcbEpYIOpBIuwGGz5TC1clRGKw
         Uv8hHegP08UctXWFl9cr8r5q+f0lTUaLufV4JdZHztCDzoulNw0xXyrxg24AZbzAIfxt
         HbXvQOKCG9VvZnfRkvwpoDxa7KBqSXMy525dNl8cvnMlqxnsYf65yoGqv85WoxTTAWx/
         aX1Y6z68ML4GH7QSnLaRD5t5NypJQ3XBG7n5jBlO4PcuUokgTs3ZTpeRwHWKln98C5B8
         bARq+DWdernt0rz9pgbNdLPrQCZYisYJRkIATfd1IdV8UVOWkbKg05clnffLInEL23st
         +RpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683791007; x=1686383007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBy3EahqDgphDTB3uA+fykF7pytc9B8smwJ6NU7vDwM=;
        b=QAF6PhtnUlAlGVJVuwuCMJZyVLbEO9fkOT60ovi7497jOAXyb2Xb7WlKN3gkSaP5wr
         wr/ACcGhIe5gx5buECBZr+jYAnl0Np2P4wZkWKvzYEJOies+6wbwyjkDv08jnerSlw2u
         A5I+phMf6I90oPzE07mvxh5HBAwEF7vhjyo3mOvMLKJqn+Fo2a16PtcHcKXvkjtkhA9H
         qUIkh7TeNW3o9L3XM5f2gCvUkukJyavjrx3Vq41NHqpgIKIqVKj5uY7VrMlihLujO1/O
         y+mWu0d6TL5aMo/dZv1ADZEmKwrYFhVD+sF5zRbvfEY3w6YomS2vKLBlPu4SQrRssRM8
         a0VQ==
X-Gm-Message-State: AC+VfDyaBmhGNnSBaenK0qY/622E5XBG5XiRAdvJw4bT+aOjs2n3Lf1L
	ZtpgT4f/XYjmg/PnzDOHJgg4zw==
X-Google-Smtp-Source: ACHHUZ4kIz5XP3kUYA/hnVIW8pxjPDUWybVBvXw/YAkccZzNhDAHSIhtd4q7z1aQawGspLSzUk2Asg==
X-Received: by 2002:a1c:750a:0:b0:3f4:16bc:bd19 with SMTP id o10-20020a1c750a000000b003f416bcbd19mr12140830wmc.23.1683791007240;
        Thu, 11 May 2023 00:43:27 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c220a00b003f171234a08sm24781981wml.20.2023.05.11.00.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 00:43:26 -0700 (PDT)
Date: Thu, 11 May 2023 09:43:26 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhangfei <zhang_fei_0403@163.com>
Cc: aou@eecs.berkeley.edu, conor.dooley@microchip.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, zhangfei@nj.iscas.ac.cn
Subject: Re: [PATCH v2 2/2] RISC-V: lib: Optimize memset performance
Message-ID: <20230511-0b91da227b91eee76f98c6b0@orel>
References: <20230511012604.3222-1-zhang_fei_0403@163.com>
 <20230511013453.3275-1-zhang_fei_0403@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230511013453.3275-1-zhang_fei_0403@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_004329_794006_C102D759 
X-CRM114-Status: GOOD (  19.77  )
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

On Thu, May 11, 2023 at 09:34:53AM +0800, zhangfei wrote:
> From: zhangfei <zhangfei@nj.iscas.ac.cn>
> 
> Optimized performance when the data size is less than 16 bytes.
> Compared to byte by byte storage, significant performance improvement has been achieved.
> It allows storage instructions to be executed in parallel and reduces the number of jumps.

Please wrap commit message lines at 74 chars.

> Additional checks can avoid redundant stores.
> 
> Signed-off-by: Fei Zhang <zhangfei@nj.iscas.ac.cn>
> ---
>  arch/riscv/lib/memset.S | 40 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 37 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> index e613c5c27998..452764bc9900 100644
> --- a/arch/riscv/lib/memset.S
> +++ b/arch/riscv/lib/memset.S
> @@ -106,9 +106,43 @@ WEAK(memset)
>  	beqz	a2, 6f
>  	add	a3, t0, a2
>  5:
> -	sb	a1, 0(t0)
> -	addi	t0, t0, 1
> -	bltu	t0, a3, 5b
> +       /* fill head and tail with minimal branching */
> +       sb      a1,  0(t0)
> +       sb      a1, -1(a3)
> +       li 	a4, 2
> +       bgeu 	a4, a2, 6f
> +
> +       sb 	a1,  1(t0)
> +       sb 	a1,  2(t0)
> +       sb 	a1, -2(a3)
> +       sb 	a1, -3(a3)
> +       li 	a4, 6
> +       bgeu 	a4, a2, 6f
> +
> +       /* 
> +        * Adding additional detection to avoid 
> +        * redundant stores can lead 
> +        * to better performance
> +        */
> +       sb 	a1,  3(t0)
> +       sb 	a1, -4(a3)
> +       li 	a4, 8
> +       bgeu 	a4, a2, 6f
> +
> +       sb 	a1,  4(t0)
> +       sb 	a1, -5(a3)
> +       li 	a4, 10
> +       bgeu 	a4, a2, 6f

These extra checks feel ad hoc to me. Naturally you'll get better results
for 8 byte memsets when there's a branch to the ret after 8 bytes. But
what about 9? I'd think you'd want benchmarks from 1 to 15 bytes to show
how it performs better or worse than byte by byte for each of those sizes.
Also, while 8 bytes might be worth special casing, I'm not sure why 10
would be. What makes 10 worth optimizing more than 11?

Finally, microbenchmarking is quite hardware-specific and energy
consumption should probably also be considered. What energy cost is
there from making redundant stores? Is it worth it?

Thanks for cleaning up the patch series, but I'm still not 100%
convinced we want it.

> +
> +       sb 	a1,  5(t0)
> +       sb 	a1,  6(t0)
> +       sb 	a1, -6(a3)
> +       sb 	a1, -7(a3)
> +       li 	a4, 14
> +       bgeu 	a4, a2, 6f
> +       
> +       /* store the last byte */
> +       sb 	a1,  7(t0)
>  6:
>  	ret
>  END(__memset)
> -- 
> 2.33.0
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
