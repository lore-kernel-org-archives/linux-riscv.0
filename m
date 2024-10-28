Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03334D5B845
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 23:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpc6PABBjaPlwTxuBfo/EE4SsLFQGqS9Eh5F52oM5mk=; b=O+Hz9Yog7D4z4/
	Etrb+htVzDzfv/VlTSgWlpV08UFQghB2td881Y3/+8Lz22lh+MI0ZiXaQ8Qvph18b1I22zJVaXny1
	7tRqJSvNTC7/1IcoAsNVJCPeQSY+BDsuobA2WF4GWS8atyy5Nzhr6YV/gZIA8CDNKWPwe7oVFWGbk
	aZB3WGOskVOOUFKB3Cle5xVnWFyad5njKipeL4Kv20s10fj6YKZiQ4evklPaJ0RzfBP6haUSx1QT0
	xW4vSrzAyCdHMbMV9nflfOl97qYvRDc4V2G2va49LsBUDUF9B3Wnl3Kol2Fv+GIsQSdHjjt46dpDy
	px3zcFcJFSNdPP8xEVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ZWE-0000000Cg6T-3pzp;
	Mon, 28 Oct 2024 23:51:30 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ZWB-0000000Cg5X-38DX
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 23:51:29 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20c7edf2872so43283195ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 16:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730159487; x=1730764287; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hBExjAcJs6Aul3nNaLRq3dN0oA7L1rfNiioxXb3aSZw=;
        b=e/uXzaU+/AoVrXVOp1Y+Mj8s0ZVW0nZrBxlytyJCWyiuO5NHJDnndfKdiMzL/b5+8s
         LKG3nl2CASj6bSHoVJV9Ptu7+1brRTe2nqMVyo6NdIAzH/fV2V+EqOtNEXNTJPi1Xshp
         O8zd82HyIq7B5K+o1V+0nTQRzomiBFyFz0LT0H5OFcoAhot0p0ngNMCGV6Ox2jeeIZcc
         FoA5ZmZPRZ+/fC3kNXXjfBMEPPIwZxgSMZ+OXOt+Kmpf95+A54bLH9DCi/+TVcwbYhOy
         PtM3SmglGb9WMo/QNRiEKvyQz6HwYb9vbh58q677IhOvSfZBIP6JDlbAGp4+QuxYEoD4
         /dAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730159487; x=1730764287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBExjAcJs6Aul3nNaLRq3dN0oA7L1rfNiioxXb3aSZw=;
        b=Qa/uv7EqyU99OZTJhSxjLdqtxipouaGoRr7iSW3YSjzYIcD7YdFtACl85mDwZ3eWW1
         4+S/d1BUR59k4xS9/njpUJOEyTKNV9ybU2OzjfGNv1WpuT2YbQRd6Zzo4NRCwD5/j4NU
         VlS3tY0Yy0I019HSJW3+S+pa1OdQxYPHa/B/5VJKbcq9R9veO9c5bhlxzDNhIzoFZXy2
         Tcw2YXMEx/Ghvo8LwTuV84/sUEjHrN53Ai5LG0dEnqTLUu0z+HeyCEzh4Kcxu9jktzcC
         GDeYOQ5YjRla13CTK0Pbtcrw2hvjEjqBzv46yj75dHWDGqovNNtFP9nIZPqAyb6AX3fI
         6i7w==
X-Forwarded-Encrypted: i=1; AJvYcCW/xyV1Lq3eKo+q3QRD1mX1GNWHInOvIsOQGEholCmnoeJszIP+kUTqxk2WFC3rBSvaJS0D12CBjZWP+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlXYu0TqtHPYqaDuLJ92esHrPaHJVTMlEIroVZ0874SndpX7mo
	/ZejaC/rPcBx+41GDNHOw83HSao1AGr0eAoNIEkQRHa3lcXyPzrFe+sCvQ==
X-Google-Smtp-Source: AGHT+IEAlu5S8i7peqRrFUMZF8zh2gi3qfjhQkwwkSfMMnI1yIFUJ1hhJtZf/SeEqCbo08WGvwjGRw==
X-Received: by 2002:a17:90a:3044:b0:2e2:c1d0:68dc with SMTP id 98e67ed59e1d1-2e9220baf2fmr390549a91.9.1730159486593;
        Mon, 28 Oct 2024 16:51:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3771814sm7955697a91.52.2024.10.28.16.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 16:51:26 -0700 (PDT)
Date: Tue, 29 Oct 2024 07:50:45 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: fix pinctrl base-address
Message-ID: <dvu67iiddw2hdtfl5ezjxi76idt7pcj6kaapraj6kv4hujh65j@zqhaaiuridrd>
References: <20241028-fix-address-v1-1-dcbe21e59ccf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241028-fix-address-v1-1-dcbe21e59ccf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_165127_807972_3C141A89 
X-CRM114-Status: GOOD (  16.06  )
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

On Mon, Oct 28, 2024 at 11:43:24AM +0100, Thomas Bonnefille wrote:
> Fix the base-address of the pinctrl controller to match its register
> address.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  arch/riscv/boot/dts/sophgo/sg2002.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
> index 242fde84443f0d6a2c8476666dfa3d72727071b1..6616f578d190f7aa2a82b233fa9c55267b41ee0e 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
> @@ -16,7 +16,7 @@ memory@80000000 {
>  	};
>  
>  	soc {
> -		pinctrl: pinctrl@3008000 {
> +		pinctrl: pinctrl@3001000 {
>  			compatible = "sophgo,sg2002-pinctrl";
>  			reg = <0x03001000 0x1000>,
>  			      <0x05027000 0x1000>;
> 
> ---
> base-commit: 45a544a62ef7cac9ecc69585a90da72ca68af898
> change-id: 20241028-fix-address-e7f0c40eac2c
> 
> Best regards,
> -- 
> Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> 

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
