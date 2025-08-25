Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82319CA0EFA
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 08:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BaRwZ0KHpNpM++meC064r4QTcfIhEDPh1xonnQqhpPg=; b=WZT4WFDK7iEPTN
	77bxjv85/ysYvInVYYTDQNHAQJSR1MKV3pIcXJVu0FNNGCumrxeYogqwY36NH1EVUi8PYu4YzyvcQ
	UHAXgKksIvKAdepDDwtMYoTc7pT7mOFOjgsbeLj7xQioMEUmUsN4qHYGecps+tkQx7DX2dtWC1pw0
	fJ/FbOo9Nm+OdRHxJpW+Ctf7ROA3gFxdQFDrlv31rCC4ntqP2EbrZW7bPpQ/2cRwwbSDIursmk4Rb
	biTuG0ieOxBykUXvP3JupEFc4LrWrCVncCzj+vi3vdYOmbS840elMR77xHb4d1R6/Zq+tB2nTMGwr
	D0jg4Mf60lWYbMIEbscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSUQ-00000007I3Z-1GPn;
	Mon, 25 Aug 2025 08:23:42 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRjM-00000007BVd-1C55
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 07:35:05 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b47175d02dcso3408144a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 00:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756107303; x=1756712103; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lvp5MBsT7YhMVkgGMIsz2MCxt+BzXm3dU8zTzzspkLs=;
        b=fln/C9UxVxMP0t9XFAECNyqWApIt9aMcu7kudaeSHpp4QUdXFeUGRwjx6PaqUuRjAK
         YZagZC5kok+Kr1kh0w95W8C/xMhTCaOVG9ImGYEZpM3XJOHRnCJKO/GEolThQaoT3hgf
         YSIadsvKykp9j+VuqQUMzH3HXn3sZZf8slfOkZdWqB9RKZz44hIcMGXCrsn+YAU+C0lv
         9LMdbF1sv57XWX2K8/njuJUrkQJFXeJod8hXsRQnPKud8VNGtkBkp+FOP/EDGpMqW3OS
         SFErHd8eaty6F67tFSQ/hfNx1MVm+MaNYrhvXduX8FzCluwjfAwHV69cv7l6kqshLO5z
         xbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756107303; x=1756712103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lvp5MBsT7YhMVkgGMIsz2MCxt+BzXm3dU8zTzzspkLs=;
        b=BbNwn4q6mCY5OYgk6GPjGsK6jtPqjmxCgbfySW5SAPotqqvzFM7Kt7QN8EkOCuuyMD
         NTgU2JPKK2lAbnrWAqZ7YbvLmNpO6uDz1195FX9x/eIoXNi18sjzWtI6lF0EvKF/IZmv
         KwFZxqeWrs+nxjY1oeLSF/C9lQomJIMvNLSiBo+IEo79JbZuG0FdhwNSxxU/PcmAnd7e
         rkvBpmHzczqtMC0Vo4EKrh0XpGE7uFu71Ddv/3nNaJcAdHGDklJ/61HH3xGbKCVPbhZr
         aM5rz0ptVs7y8qp3gT0qiWYtPvJ7cO9aHbp+l3hNa22dfCQUIaVzbyXFAEH/+NxggaPL
         /ivA==
X-Forwarded-Encrypted: i=1; AJvYcCWqf3ZKXuyqWEAMMk40PiWaas7IUvN9yMY8fXlI28rRunDSp0+KAaJIF50E01kw1WnA0QL6PVxKhd6OMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJCYTBxWhc3Ic1r30sOm6F4ut5CpJdsgQzs8BSswdEC4KwwfQQ
	vfo+FRRkmI7I783dfGl+x+QgMBzPW0E3RTpbIlURs5jQgAz20V2KGzqH
X-Gm-Gg: ASbGncumXBmbF2rQVLSVJZz5xrkC8QcNmQFoIJzeldCUHV6W7MHQLNYao3Miq9VmLRb
	FS1zV6nddtDmL6m4eqJpJz91Ub5Tw/ppM0nwaG2YYdKA1xFtafv1+/Drym766ALNRXzG8vbG5XW
	eTiM52Pv/OyqkZU0FC6L91LDiY1yKDEXliljKt/sYMvV/vZ/tZ1AmwwHKwdyDdImx3cSrxmPZVW
	1PjVs7q5BIzL4IWcPOB3FtB3aRAdwjhW0sQja8AtO5OpdryrKIIG/P1uFogLhyFRv2O5K0oCL2d
	tije6aTYITpGUhruIoxzdV5WQrm8VMWEOfYkXcdTKjQfsm+ueRyfWLF0aQYHIaLvU6OAiB7zjwk
	S9SY8VdTcDF4gl5e+VI77Pg==
X-Google-Smtp-Source: AGHT+IEsuMQF9X71mGIcNScDFx9goLQ7xmHtthjhYeAIT6/QFur1P7fK5isGOF+ZbDuvxs+fIRAQtw==
X-Received: by 2002:a17:903:238e:b0:240:50ef:2f00 with SMTP id d9443c01a7336-2462eea80fbmr175765105ad.26.1756107303209;
        Mon, 25 Aug 2025 00:35:03 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-24668880368sm59546745ad.109.2025.08.25.00.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 00:35:02 -0700 (PDT)
Date: Mon, 25 Aug 2025 15:33:57 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com, 
	aou@eecs.berkeley.edu, unicorn_wang@outlook.com, conor+dt@kernel.org, 
	inochiama@gmail.com, krzk+dt@kernel.org, looong.bin@gmail.com, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh@kernel.org, tglx@linutronix.de, sycamoremoon376@gmail.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev
Subject: Re: [PATCH 1/4] irqchip/sg2042-msi: Improve the logic of obtaining
 msi-ranges parameters
Message-ID: <n7na4pl6xfhwdk3xq3ulwrxm5d32kdub44otuk7avwjgb32sjz@erqbkyzhohqv>
References: <cover.1756103516.git.unicorn_wang@outlook.com>
 <adb383f0f4a3cb588448a5a708fb7a907d5e9403.1756103516.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <adb383f0f4a3cb588448a5a708fb7a907d5e9403.1756103516.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_003504_331134_1B71E5B3 
X-CRM114-Status: GOOD (  19.05  )
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

On Mon, Aug 25, 2025 at 02:55:03PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Get the arguments of msi-ranges by specifying nargs directly instead of
> using nargs_prop. This only takes one step, unlike the previous two
> steps to get the values of all the arguments.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  drivers/irqchip/irq-sg2042-msi.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
> index 3b13dbbfdb51..5249afd93b4a 100644
> --- a/drivers/irqchip/irq-sg2042-msi.c
> +++ b/drivers/irqchip/irq-sg2042-msi.c
> @@ -276,17 +276,9 @@ static int sg2042_msi_probe(struct platform_device *pdev)
>  	data->doorbell_addr = res->start;
>  

>  	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "msi-ranges",
> -						 "#interrupt-cells", 0, 0, &args);
> +						 NULL, 3, 0, &args);

Why using a fixed range here? I see no improvement. I think using #interrupt-cells
is just OK.

Regards,
Inochi

>  	if (ret) {
> -		dev_err(dev, "Unable to parse MSI vec base\n");
> -		return ret;
> -	}
> -	fwnode_handle_put(args.fwnode);
> -
> -	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "msi-ranges", NULL,
> -						 args.nargs + 1, 0, &args);
> -	if (ret) {
> -		dev_err(dev, "Unable to parse MSI vec number\n");
> +		dev_err(dev, "Unable to parse MSI Ranges\n");
>  		return ret;
>  	}
>  
> @@ -298,7 +290,7 @@ static int sg2042_msi_probe(struct platform_device *pdev)
>  	}
>  
>  	data->irq_first = (u32)args.args[0];
> -	data->num_irqs = (u32)args.args[args.nargs - 1];
> +	data->num_irqs = (u32)args.args[2];
>  
>  	mutex_init(&data->msi_map_lock);
>  
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
