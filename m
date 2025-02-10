Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CC4C02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 04:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8oKNhcKObIIbhfJ2WTeDnG9oleleJBjo8OMJ11qf08w=; b=znPjiMu71ZrBjD
	gBN78VuDsxG5k0Y0sPFRAAoiK47YCcO5EuGC+x05GdPiZRKNTU/PB3CAQCgV649pP8S/fp5cvyyxp
	CSZr4ByIPQJ0tLjHSinSceoucoe3ZVkLwWRRSndnYep8y7Lmb6bww2YPPPaVWLh1L+m6SNEZR/n5J
	3snm5gUNXHXpfLksgK0uhuthz4gLKaF19s3N3Pw6jPoV6zxY38Jol2aJ4+2VR0XWS0O38uJbqsMQW
	AauB5EYZdiRgEgXbrXrpoSJeaAFbmi2pJdszj7UjfmO1KWrjDE4y8FLrvdR4Umx/xBXhYtw1hdq2s
	KUGXT3SY1rpXquQ58SiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thLpw-0000000GDDm-1Jc1;
	Mon, 10 Feb 2025 04:56:00 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thLpu-0000000GDD5-1Es9
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 04:55:59 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6e4487fce51so11797486d6.0
        for <linux-riscv@lists.infradead.org>; Sun, 09 Feb 2025 20:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739163357; x=1739768157; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kDqppX0WdOexQIXVE4p9PqEM+RUAIpyKK3l1fEy0G68=;
        b=hhrCMjs9XL0q41LanCmvYVujGsfkMtrLJEMVlf6eYtItKaXSaKiCfhgZ0dDcX//HD1
         EydduOUwB3i/7HDfuWRBm9sYho+SDbZ5pBqR9SNb4cPcTKs3hgnXhxS3agn8vkojh3yq
         IFkgS3wJhIjl+8Ftsh/s04sImmJ5VVwVgZlH1UATvDT2ZxYCme6occiMY3V6/a6QOXOz
         ZScEG8MNmTaBX/xLzD4pdxgUq5eyhokJHxCPKMXcl3QHyHJoZ1nGEC2FtFe6u99XXi8Q
         n0zNBJifW3lLni5iE8miMxUVW4vn3/h9zTLgl7t4sXKc+9WRxPJ8TpnnCSM6Xhfdgc4t
         /i/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739163357; x=1739768157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDqppX0WdOexQIXVE4p9PqEM+RUAIpyKK3l1fEy0G68=;
        b=dF9NSrn7rn+oGp+tDFLIGUX5woG8P9Fsq29OeCkLvM1WqU3XdivZP+zS1cbY0cZHaI
         Hjc2VlE0uSl4f8Il5VcskhKmDcJLVduvD0m1q9KUfNFAnnvq2ev3UhDUP3Z9AW4XEhop
         hZFG43AClcAxjU09BFZGSV5UHFcVnlEOtzhuPUKiOe8jDxkWy8mFH28RVOrivcgpAqdv
         xwxpvgYljy7e2V0/+CnY6r3XvRx7Z0gZW8F8fVtqeOt3BHQW7tAK97RvP0K9llpqJyC5
         zDQbFqojFUu82BQyctTKspf1HNXGmi0JqzBkA4+n5+Gj9vOl8+waDOnrKFkbO4Y35rV4
         Ms1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlrSS5yUAShEhezixAsUhHiQ8yJBaYndv433sNqTA16g5YKef5jrBDn3fN7JetgcEEkbJ3h0Y2Tk360Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7zH2QylyImyvjo1ax6vpMTnvw69oh+OcBcTAtVVRa6OrYTKsH
	kxek3ESmedXFRUkjSkWBJXn6okQkZKTARwPdMpBger+LamM87I2j
X-Gm-Gg: ASbGncvHP10fIZ6JUpUAmpehxCMXsVHTUwMA4teoyqqBddMxAvuv/0Xjl4wDPUnc06w
	cEW5HoBiFsd/Z76CIeU/DTcGZMHs59x1SczHAAcukMQEcI4uUb2kL+QmYRs/qZRvEIDbCJ/kyYi
	YRkZnSggQfttrgv+4TSncGaZRF3+6JUhzMM7PFB5K0mBiA9IcmRnWNDJjLSbXv4ZfcIE9iZnqHI
	DVp/VXZHsbiH3g6IePkHQfUojg/AmYeVnm2VPzjBUcrG/eRokbu+afexVuiiwU9b2Y=
X-Google-Smtp-Source: AGHT+IEIadHV40GVefNw2rbObinrS4tE0/sQtQW/EKwZZz31+a8oP5ZZG675MIKZoWi0JoEYW0EhQg==
X-Received: by 2002:ad4:5bc4:0:b0:6e4:2d8e:5cce with SMTP id 6a1803df08f44-6e4456dd4edmr206717086d6.36.1739163356985;
        Sun, 09 Feb 2025 20:55:56 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e453819913sm21646086d6.16.2025.02.09.20.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 20:55:56 -0800 (PST)
Date: Mon, 10 Feb 2025 12:55:51 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Yixun Lan <dlan@gentoo.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jisheng Zhang <jszhang@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 3/4] riscv: dts: sophgo: add reset generator for Sophgo
 CV1800 series SoC
Message-ID: <bzmczqhop3dok5h3qk4b6hx7kyotshvunoorjmbps67kmjdglo@bbzqrvxuohwl>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-4-inochiama@gmail.com>
 <BMXPR01MB24406BB0EA039CEBDEEBBDC8FEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
 <20250210012045-GYA12775@gentoo>
 <BMXPR01MB2440FA4006BA4E3EDC0CD11AFEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BMXPR01MB2440FA4006BA4E3EDC0CD11AFEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_205558_335857_CFC53DF3 
X-CRM114-Status: GOOD (  18.91  )
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

On Mon, Feb 10, 2025 at 10:56:30AM +0800, Chen Wang wrote:
> 
> On 2025/2/10 9:20, Yixun Lan wrote:
> > Hi Chen:
> > 
> > On 08:55 Mon 10 Feb     , Chen Wang wrote:
> > > On 2025/2/9 20:29, Inochi Amaoto wrote:
> > > > Add reset generator node for all CV18XX series SoC.
> > > > 
> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > ---
> > > >    arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 +++++++++++++++++++++++
> > > Why it's not include/dt-bindings/reset/sophgo,cv18xx-reset.h?
> > > 
> > then first need to answer if it's really a binding, there are some disucssions
> > I personally favor Inochi's way here
> > 
> > https://lore.kernel.org/linux-devicetree/c7e243e3-3f61-4d63-8727-3837838bdfcc@linaro.org
> > https://lore.kernel.org/linux-devicetree/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
> 
> Well, it's fine if you don't want to define it as binding just because the
> ids are not continuous. In fact, for simple-reset, I think there is no big
> problem to define it as bindings.
> 

I add this as a dts header because it is a device abi, not a binding one.

> Actually, in the first link upon, I see Krzysztof also said "simple-reset is
> an exception."
> 
> I recall we ever discussed this when Jisheng submitted the first version of
> reset driver for cv18xx. FYI. See https://lore.kernel.org/linux-riscv/42ad3f60-2755-4d3b-a766-8e4404f76a7c@linaro.org/.
> 

Yeah, I have seen this. But due to the previous reason, I will hold this and
see whether there are any new discussions.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
