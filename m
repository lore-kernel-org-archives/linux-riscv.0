Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA26C36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 03:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2B/MSuCcl7SnTQE8VbO7VZPWaSwX4FEJ8RJu6v9yt4=; b=LqgG3IwVTW/1jC
	EaQSaitzdTMyzzC5hn23rfPDM/kWNt70emmku+QpFwNI+eEk8/YfPZ3MBtaIpFtTaVfCH9N0DIBmt
	ZoZdg7IUANHX9S97x31lS3mHnGyD4uoXQUMRk2feFsO6Af3Ww7k5URV12qCvPfxqdfK/Eo/Rv8Rj4
	OKKAb46IBbiBD7zODeuI5h6ZJxp1XkKiuTtjv22PV0wr9LfqkFuBgaKwQ3pH0SutF/RJ6jA06S0ng
	ntrWn9wjVaWFUflkGqHVU1LGehow/xV7ZrQyduFPeIYFikYyatbSJhsURCv92cjkSDGm3FxOd0GWN
	MAQ6QnYZI0/thiroG3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1dd6-0000000GJ9s-363M;
	Mon, 07 Apr 2025 03:58:36 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1dcF-0000000GJ1L-1ylw
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 03:57:44 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c5ba363f1aso559875885a.0
        for <linux-riscv@lists.infradead.org>; Sun, 06 Apr 2025 20:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743998262; x=1744603062; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R/CY5XdipwMeKeAFsG+OcOmPd/+b3qIxz+N90akQpaE=;
        b=g73RQ++c/LCxTYf60UCvdA05xMb5rTfzGtMqSGPQSfhfw/R0W58uh+nnPXIj9YKthV
         7WOH/xMPCqzFqbxD1cSHFjYpekK426/nI0eYuLJ5Cy5uZeCOqpabD6L9ST3MaSuWttfe
         qGQGdJ8eHHCVCOPLLS5wKUeTVNEuI3E/+kckayK7QxoYJblT2RD7khCrs9i58FQk4MuT
         yihJ15grfSCFz+i3uVYUL6cTMNGpk9gu1VBQ0N+ybiYtmbwoKruYjmeLtFBftOSSo9gr
         z+MX0ncSA/596aFef70D7+s2SRSzL2bch/0j4xsDIPRlU0dm/T7EKq3I1YYxeBhXbJRZ
         wXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743998262; x=1744603062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/CY5XdipwMeKeAFsG+OcOmPd/+b3qIxz+N90akQpaE=;
        b=vDd13X5BNMc9myT9oxM+UqqQiiwTZ9uwQQW70Qmk+RKPMN61A3C3d3wGjz1uHXoUiG
         9zrsxsuo6wOpl1zw5jrf7OAm54AlbYJWQ3uIK0tMUSvvgpMYjyNuFD3fUUFdnXALNpMs
         aMggMtfcWAAxjfPPf/pSUuEm8zPQF8Gcu+VnY6xX+vbINq5sKqOJLRsS5gL4RDSvEQRT
         bU2oBIewqo36IHcXFF3yJG9nQvT7AWjSq5sqOtyY06WMfH0+JdgD+w9DpyI1kccxLaLC
         3At8TrdceApE01pzhzxYRvx+LFnZtiMzSgh9wfZ4kRYq1pSlQvH/ca+q//6ASCh7pAAO
         IZIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo8L+SsK99c1BQZMhgI1hYZSsSpibS9dHQC5yHp7BrNuHMfMyPEhpPLaaKPXWJrkOJBN8gq8XrUlB62w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPhKjCtPjgrgu2CSlOgcqfd+1Ulb9i6QUZBvsvJvxoMvkMDt+o
	yCtGA8691MWiZDCEr8RjK1YITP10KzBLVDV08PDyMvX3wiVAD6uM
X-Gm-Gg: ASbGnctNVDEXDm4JJgqAOcQ2dmYBMj4J4ZPtV1twA5DdCzhJ6WCegnKUwKw1YKfssI8
	rELczNFopnapp2t7t6f6T/4mdf3vl3s1xTORZbxJyOZ4BjBNhDGE8MGqEFD26XCcZkL3hPCvTy5
	7U4iYHmNBIAQP0a+kPvYrnX+OCHVD901yXmknU+tPnCGRCD/bo1fJKf9sWoJIsMGCIj5rZjcJuQ
	teJAS7Jf1hpOb2NSwMIGCpUhKJypYAQiERM2ft8iR22fi9mtzy+SB1p5Ng8mV0/E6tmynfZEtav
	/Gs03ODGZlIpV1mlVI/B
X-Google-Smtp-Source: AGHT+IG7S6m/etaeZaD9RBkFsyIrUD+K4SGfOdf76m1VNO2dvIgZVgFhj9vXuuhtf1aG6Yd6cTKDpw==
X-Received: by 2002:a05:620a:1a18:b0:7c5:674c:eecc with SMTP id af79cd13be357-7c774d718bfmr1429782085a.32.1743998262320;
        Sun, 06 Apr 2025 20:57:42 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76e75a605sm545114585a.29.2025.04.06.20.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 20:57:41 -0700 (PDT)
Date: Mon, 7 Apr 2025 11:57:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, ghost <2990955050@qq.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 9/9] riscv: dts: sophgo: Add initial device tree of
 Sophgo SRD3-10
Message-ID: <geunb7qwiniferytaufnekojx2eoq6g5scu6mddwf7gkspxucs@yynb6kfbspje>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-10-inochiama@gmail.com>
 <20250407020945-GYA13182@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407020945-GYA13182@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_205743_528580_7D5D2257 
X-CRM114-Status: GOOD (  18.83  )
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

On Mon, Apr 07, 2025 at 02:09:45AM +0000, Yixun Lan wrote:
> 
> On 09:06 Mon 07 Apr     , Inochi Amaoto wrote:
> > Sophgo SG2044 SRD3-10 board bases on Sophgo SG2044 SoC.
> > This board includes 5 uart ports, 5 pcie x8 slots, 1 1G Ethernet port,
> > 1 microSD slot.
> > 
> > Add initial device tree of this board with uart support.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/Makefile           |    1 +
> >  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi   | 3002 +++++++++++++++++
> >  arch/riscv/boot/dts/sophgo/sg2044-reset.h     |  128 +
> >  .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   32 +
> >  arch/riscv/boot/dts/sophgo/sg2044.dtsi        |   86 +
> >  5 files changed, 3249 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-reset.h
> >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044.dtsi
> > 
> ..
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2044-reset.h b/arch/riscv/boot/dts/sophgo/sg2044-reset.h
> > new file mode 100644
> > index 000000000000..94ed1e3777c3
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/sg2044-reset.h
> > @@ -0,0 +1,128 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
> you might want to use your gmail suffix? IIRC your outlook account
> isn't preferable? besides, it's better cosistent with your signed-off
> 

Yeah, I forgot to change the copyright since this patch is wrote 
several months ago. I will update the copyright for this patch. 

Thanks for reminder.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
