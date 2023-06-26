Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840B5EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 15:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGIhpyC5jy4tEUVMRx63+1t0Y24gC14PXSs2cpuzmog=; b=17VYShDVPRJ3RH
	2QDfub8xuJblMD2vcirQ6X1GtBsUeecp8uPcxUEKiqCxntjE5RStL/NEcOYuF3VBxMZ/U8jBUTQgF
	VNRr1Mr4w566rJ0cjsC0wsPYSSuUrX6PSIoMnd0tUmUoZsUjwytjV19J0sFNqVb04NTJ4IqwUngii
	WgB+LpeJ7CcvTj9uNtD4jsZY2U7CTQl//tS8kFMvEIFiDkHIj9PWCLYOHKkBOT3y96P9/hgQpf7md
	znSXEvouV/eFufGWkXNuuW1xi4mSZ/q9N/8EwHEFVf7W5tft2nbShWeNv/IYDciz212DLPJHazGMR
	mOyB0GOBH76jhigKB+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDnzp-00ATAs-0i;
	Mon, 26 Jun 2023 15:19:17 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDnzm-00ATAN-1d
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 15:19:15 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b6a0d91e80so17458491fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 08:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687792750; x=1690384750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Czk7x5n6Mrmu3uCgM3g0XObvviS7O6LtljfnSRp8Lu4=;
        b=jtGX7siBQsyT+P/YzALMFWZBXNwz5KO8DiHH5xFg5dR7umyNG/JCelf8OHbIvwd00H
         L5aYgm3pIsNnnksn6odR+lIoNlgt+sIY1PYazdO5A0j2lzeuyAspG64RLq9XgC/W6Io3
         Q02ZhpuJPhZs8+voHoBl7lRYZK+fLMLd2z8QVg90dZkOaWXoBCeCOlGJillHy04rmWOU
         VYLIQHkAuqo9ZTyXbkMpOB0JvezN9Up+nXHeOa21mmvl7LJV2BLbobdAzM4OpunDkBjW
         7+kRGIyUAotwRjhGuwEjypdFfOl9JpAtQ58RxwTYW75+4M4ffp8qdUjjmbWhxKcvTq00
         23CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687792750; x=1690384750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Czk7x5n6Mrmu3uCgM3g0XObvviS7O6LtljfnSRp8Lu4=;
        b=FksBzSyIAyZNGw2rn3gE6GUqoMjINKFKf590T+XPvPhq5uv1+uUc/8OuKcvRW2fWR+
         yC2sP+H7fliMNBrIrvmUedMeHHgN2VZ/i+idShK9IsjpFBCeR02YvdPbSDYjoVTEHLCT
         ivds1bAv4DuIHzchvI+3nGMvx5hR4rcj9+hIfzcWdMtxpx2Sw0C7RTsvXN8EeUuAQ0Ot
         cS5KPPcV1MQOLIpEzTq8rGbP51jaMXwJvkokCCYSsgtygi8CIyZDJM9Ts5ddYD3aJxi8
         NFsnd/8SGu5O5yKqmW4Ex8cmdApopwxN8CeNbNUYTDAcl7HavrKnJfIgfWsdFc8hjM27
         7nfg==
X-Gm-Message-State: AC+VfDyrLrLQUzQ9GAhzdmQFuF7DBlf8Bcte3r2YyckhaUTVcKLwyuAy
	PY+uw2D5CbR+hsJD07/QE1BHzg==
X-Google-Smtp-Source: ACHHUZ42zN9JaEPH6AXQSnwMo5S3K8EOoc3Rp6A8ANRQ0lo1K6rI0KDmb+Dk7IdBqVvVuuK/RweOWg==
X-Received: by 2002:a2e:7306:0:b0:2b6:9930:871 with SMTP id o6-20020a2e7306000000b002b699300871mr2554964ljc.13.1687792750438;
        Mon, 26 Jun 2023 08:19:10 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p21-20020a170906499500b0097404f4a124sm3399047eju.2.2023.06.26.08.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 08:19:09 -0700 (PDT)
Date: Mon, 26 Jun 2023 17:19:08 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v1 2/9] RISC-V: drop a needless check in print_isa_ext()
Message-ID: <20230626-67e571e6d9f02c28a09dab33@orel>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-skydiver-frown-659b982a43ad@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626-skydiver-frown-659b982a43ad@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_081914_563045_BEF7DF7D 
X-CRM114-Status: GOOD (  17.51  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 26, 2023 at 12:19:40PM +0100, Conor Dooley wrote:
> isa_ext_arr cannot be empty, as some of the extensions within it are
> always built into the kernel.

This is only true since commit 07edc32779e3 ("RISC-V: always report
presence of extensions formerly part of the base ISA"), right? If
so, it might be nice to call that commit out in this commit message.

> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/cpu.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 742bb42e7e86..01f7e5c62997 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -233,10 +233,6 @@ static void print_isa_ext(struct seq_file *f)
>  
>  	arr_sz = ARRAY_SIZE(isa_ext_arr) - 1;
>  
> -	/* No extension support available */
> -	if (arr_sz <= 0)
> -		return;
> -
>  	for (i = 0; i <= arr_sz; i++) {
>  		edata = &isa_ext_arr[i];
>  		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
> -- 
> 2.40.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
