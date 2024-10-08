Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FC6CED266
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 05:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Af6/9UsVozTqs+G8ozGzZFjCe1sxFvkoJVizM3h371g=; b=FPL4TOuXdEcT9X
	mlRUeNKgjwNy7IzkZVdrVrHij5Z+17vg5YoDABRcm5xN3F+jRHh4pE6C0l5cUeRAtbS3+//lZ7XsS
	yLF6RBeLO/rGakYcEbzoN9x7oXgE2hL0nx81qLBJIa5L3aPKjwFNtuEIsPDqygsSEI7QHhQntXROS
	uj7FdBUScvWYtuQCIf2wbxL/ehvJm6NMtNmxvBhNbbnPEujezF3sbL3EB0QimVOyCmDfKf2CrZe8N
	3hqoNLfb1VKFu+Vy37oFwN8Pg6tkmxhQfNF+x/cj0MbXxVUTRc/PyHIjca7+dA6nnDMoD1eJNJOu5
	Z0g3JeufDTui62QWYnpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy2cc-00000004Xd8-47eq;
	Tue, 08 Oct 2024 05:18:58 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy2ca-00000004Xcm-1rdV
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 05:18:57 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20b49ee353cso48794245ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 22:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728364735; x=1728969535; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YQO0zvw9KnkYprXk/usa3JnN+eWxXRiy1TqyGCHK6FM=;
        b=RRRwbDQC9xCA1shsAAYLO2ZozAogQ70h9cfpI+ecICO32zV8OEJQRgDJntk7eHhSEr
         P8S+Ln1TK0rKm8MdUYIzICKI8yM3Y02OKwgySp+/dcPCuCPAtLYK6UpgSMe9LYJwipCh
         iwCA9Rq07n0lIdbtg0oUlMqBzqyeYlZJe+2ch8yFP1Z2h5sen0Qqp2t5JAkskRkhvTSO
         beL4TqQC8+lSZrzrXgPhEvUQ/EK45zKTDmihQqz4a1nkwgPwk3f3CWfXbZX0qOQpfY9f
         q5gbPYzP+a/J4iai5PXPDuWUGnYl7cFw3kyNIKf5ZjWmpOi+Z7KyXIj8bRGJdZhntqP8
         UdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728364735; x=1728969535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQO0zvw9KnkYprXk/usa3JnN+eWxXRiy1TqyGCHK6FM=;
        b=KxXH1dcPAqJZIhOcxCQxvRzOjFBX2+fukvGnjDmaIQnbOlXnJPdgC7fcCQrdIpPme+
         ChL5Ke/oiYxg2LLOBt85xR7xTAmHrsiXAy28xqceZsMIYWISybmfpZEC0BOaKu4j/wB7
         KekLpKgyAxwF5uP3MHBneCHLN9S2SWcaTcBK9t7uRLnowoltXU0GqXh1C/ZJpd4Q4dKS
         ZftqEEzoO4tC2dzN+vGFzWJ3tk6YX4BPfZmdvOQZd6Skvr0jI5oVs+8JN4DdE8V1OmfJ
         8Ok1PETAYc0Tf6yRWyJothyRphd9kLn889nUx2qJtexfBj/X9mBp6laEp9Ddk4fmRIq4
         ZZHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGniWbrPgkBH6F1eQa21OAB/zc26AmV9S7yUznDWMPxavKsYELG8uwjU+B9p8mVU+Gyp8LBnAHa26nPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvhbuwOGKtAq8VThYcm0laFKfPAJlv9C4flZnCIldv2NpQ80ko
	DMFXWyNCN12Eo9D0acsP7srO2Sd36h+JUoLXwaOL+LBDo/wHm72v
X-Google-Smtp-Source: AGHT+IEJ7tiXzNbXz43iRKpy9kKwG7dH8WSlBskbZXuh6zvWYGqu/6a4ih5eqS1AOLgEJJOllhxQQQ==
X-Received: by 2002:a17:903:32c4:b0:20b:9098:4693 with SMTP id d9443c01a7336-20bfde659c8mr200667015ad.5.1728364735090;
        Mon, 07 Oct 2024 22:18:55 -0700 (PDT)
Received: from inochi.infowork ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138b13a0sm48211415ad.50.2024.10.07.22.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 22:18:54 -0700 (PDT)
Date: Tue, 8 Oct 2024 13:18:46 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu, 
	unicorn_wang@outlook.com, conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com, 
	krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, 
	chunzhi.lin@sophgo.com
Cc: Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 1/1] riscv: sophgo: dts: add power key for pioneer box
Message-ID: <aixuis25v56xwnc6zd2ost5yhho5soznpa2pf6fya6orvwwke4@6n3nhzrd7kio>
References: <cover.1728350655.git.unicorn_wang@outlook.com>
 <12e65a99f1b52c52b7372e900a203063b30c74b5.1728350655.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12e65a99f1b52c52b7372e900a203063b30c74b5.1728350655.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_221856_508975_90918439 
X-CRM114-Status: GOOD (  16.10  )
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

On Tue, Oct 08, 2024 at 09:43:52AM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> There is a power button on the front panel of the pioneer box.
> Short pressing the button will trigger the onboard MCU to
> notify SG2042 through GPIO22 to enter the power-off process.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../boot/dts/sophgo/sg2042-milkv-pioneer.dts      | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> index a3f9d6f22566..be596d01ff8d 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> @@ -5,6 +5,9 @@
>  
>  #include "sg2042.dtsi"
>  
> +#include <dt-bindings/gpio/gpio.h>

Just move this include into sg204.dtsi. It seems you forgot to
add include when sumbitting GPIO dt patch.

> +#include <dt-bindings/input/input.h>
> +
>  / {
>  	model = "Milk-V Pioneer";
>  	compatible = "milkv,pioneer", "sophgo,sg2042";
> @@ -12,6 +15,18 @@ / {
>  	chosen {
>  		stdout-path = "serial0";
>  	};
> +
> +	gpio-power {
> +		compatible = "gpio-keys";
> +
> +		key-power {
> +			label = "Power Key";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&port0a 22 GPIO_ACTIVE_HIGH>;
> +			linux,input-type = <EV_KEY>;
> +			debounce-interval = <100>;
> +		};
> +	};
>  };
>  
>  &cgi_main {
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
