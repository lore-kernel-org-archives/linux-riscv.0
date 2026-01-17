Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DC7C9830E
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 02:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RF51OTx4/YaS6VUmpAo5ZY7LPhEGweEWRzKeNKoek4U=; b=UcH3UoBHtjKT9Z
	KHO8o+e83eC+FsKe0vY5tCRz+CgzE3xtJFsmtog1Z2XsnEE54RSkJMJ/Q8IAz7j4iHd5w4okAKTZT
	7nlysW+uZWJgKXJV7iWaOdzSU0a+XlPwrnrzza8DoZvzayQINiBLOsCRwW7+3YT/7ThrAePOzMGOZ
	KguzZGcmf89zfwFanLcOfPQ6lI0xY3CU9vhDmj+BeGe+ovneKspShcAq0jbhVjRPttGBiOer9R/1G
	DkK67UzGGC81ZVlAT1vKRfT+c52C6BuP03aL9micGLSR4oejYu2nf5OFKKBHQk0kWEii/JChIW18P
	h9yhnAQzf9fE0W0qSbIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgw3L-0000000F8Ii-11zW;
	Sat, 17 Jan 2026 02:28:39 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgw3I-0000000F8IN-228L
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 02:28:37 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-8c6a50c17fdso175375985a.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 18:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768616914; x=1769221714; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dta8pivS2rued3Q3ChMqGgKi/kS9yYaS8vWr9CkDH7o=;
        b=g6yG/4fKca0aAgFSIle7t3jlOstFkGeiZ8iJ0V/GxLNXgQGKRGPHifeOReoQwywJ0D
         lVnTA7zSJADUwgjgFuN5Ih74yF4hoLJtQA6EMz6MCQLQyD2MCBPGxiQ9zVPb4GWxFLRF
         w6anUpcqQtOSsQEw2DStop5DjeyALA7l/WFyt6qKYxQMvd3URqebS/bxd3ZI9Uow6Ry1
         wzqQviK2o+EGkmUsdW9yQjSc8zC3b+QRlKK3orxpxqNUfDI3SYevbstzQGSANy5gM8bv
         yagSSDNeEVT6XU/mgIIoTp0tGLsJvdEJnUTpJnEACknXQ50y/Z6nsMnvOAu5WXuG3txg
         oppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768616914; x=1769221714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dta8pivS2rued3Q3ChMqGgKi/kS9yYaS8vWr9CkDH7o=;
        b=N9VB3ASiyDaH1xmoVhv9w+uazLpzOMlBkDt6gtSNoL78xYYUdFgNmsJ+ZHb/0VZi/9
         Yc3vNUcD7trxPPdT1vGv4D0Wgsm6O9Jk3hocKiZHrJb7aa0HqlMbWYYG01mZjnm4L3QL
         hRhQr2hmY6423vaHEwcOBgLVqq+WVHt8eXY+oO/gGxJsHvdjyZG1UDFFprJbDHHTCznl
         dBziWKPxl8Yw5egHPE3LvD7Ly7vkZODGhda9tRg5yRCzkP3JglyG8N0y/mZ48cgqkDHp
         8bxYuoDH+mkaTicZ4mh0yX8tCKCKL4NIMl3B6uEchBq38OmCd2pTMs1QDmBFNU/A6AtD
         ZanQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtxq0kVDafH/XNFSXtqYXqP+iI4JGcic8fin4F2Gj1vzwUIL97tySXJHKznSoaFqKHMmvLZAN4L0zjpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YymhOGSy563d56/e3/OX4bH5F0PDAnbzMIFDRnEsKrjkHNgn2q4
	kT5EZV1lhJZuJ76fqr9VmHDRNQ7ce8e8qxFBVheqT73V88RP3WS5PWG1bTVKN7Wn/Hs=
X-Gm-Gg: AY/fxX7XVnICaEq45QRK0L/weW4zzkesgoT4ophJLTg2W6GmfxIB2gH9ndgZUbxmKTa
	LwC0IduC9l/ASnaBrDiGM3hk256rhAQ/Tr7vkoEhhOhPtanzDIikoVQAu4Y03r1CLIHkrSj8coX
	JRXF3JVtnsF1K3ho3IuTTbhwsvb3L1htkWwrOP0A5KTuQm5Q6+ooM9wuUzRW3p/wO+QXcF3QA9X
	vNeck8jEd2kkXRb2iA3b4Hys5o7AxNgKQlcGqG/FRNxJv+qR4ese3njUOMfNi/8/7VerMSF0xr2
	bAq1N8b4P2tyjPhJeyddR8+Ll8NHaxqchHkSVntLDyZE5NOP0qUzf5Wju/e4SrvjtnIeBnkfKAG
	mvtQen283fvX0jnNG3evioyJdp+tptHhO5FsSjUUkCQoVwLXbXJGzCIGKCHtlVU584M1WVzWyrz
	v4qicq6316OQ==
X-Received: by 2002:a05:7022:4588:b0:123:3bba:fc4c with SMTP id a92af1059eb24-1244b381373mr3575104c88.38.1768609928525;
        Fri, 16 Jan 2026 16:32:08 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad740c5sm5332461c88.8.2026.01.16.16.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:32:08 -0800 (PST)
Date: Sat, 17 Jan 2026 08:32:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Frank Li <Frank.li@nxp.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Longbin Li <looong.bin@gmail.com>, Ze Huang <huangze@whut.edu.cn>, 
	"Anton D . Stavinskii" <stavinsky@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: cv180x: Allow the DMA
 multiplexer to set channel number for DMA controller
Message-ID: <aWrYSw94WjqPrUkK@inochi.infowork>
References: <20251214224601.598358-1-inochiama@gmail.com>
 <20251214224601.598358-4-inochiama@gmail.com>
 <aWpcfqHDFaq8Lsv5@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWpcfqHDFaq8Lsv5@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_182836_568929_F7DD7CCC 
X-CRM114-Status: GOOD (  17.92  )
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

On Fri, Jan 16, 2026 at 10:42:54AM -0500, Frank Li wrote:
> On Mon, Dec 15, 2025 at 06:46:00AM +0800, Inochi Amaoto wrote:
> > Change the DMA controller compatible to the sophgo,cv1800b-axi-dma,
> > which supports setting DMA channel number in DMA phandle args.
> 
> 
> Does it need update DMA comsumer?
> 
> Frank


Not needed, this is handle by the dmamux driver, it is allocate and
configure the DMA channel dynamicly.

Regards,
Inochi

> >
> > Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
> > Reported-by: Anton D. Stavinskii <stavinsky@gmail.com>
> > Closes: https://github.com/sophgo/linux/issues/9
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > index 1b2b1969a648..e1b515b46466 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > @@ -417,7 +417,7 @@ sdhci1: mmc@4320000 {
> >  		};
> >
> >  		dmac: dma-controller@4330000 {
> > -			compatible = "snps,axi-dma-1.01a";
> > +			compatible = "sophgo,cv1800b-axi-dma";
> >  			reg = <0x04330000 0x1000>;
> >  			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
> >  			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
> > --
> > 2.52.0
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
