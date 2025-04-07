Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF81C36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 23:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4K8YsLwUCzntTM1S4LlaKNuulqekVk1A2x4KdPZHEI0=; b=wW9VSXeIJoqvcC
	zLzOCkT9Imh0jDxkEmSf3HdOFK3rMOkG+ifC8q/VrKngK9h6HO5NgWpsow2BJrsRajSPZv+VFYrAM
	oH9XoZ1PLZ3IdIIwEPfSHYbgyCwBh5HZPFSrgLm63sIViObDOBAhOzaPq85Ho4e/fxLcGfrpTj0Co
	qpRGQGSVsPARRDe6S5S/rvbqZE4ot8EqE7SEVanBI4QsKzpNyWxJfG6uHRAiy2ibnJY3mP7g+cK2K
	UMRkiZ8NbV/6TYCVjc7fe334jfQXEf26AyPpWKS0r0UczdVfLNHCctAGROabjVPpT47w7potqTahg
	flxp2bY/KGkSJyMkUSwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1vx2-00000002IrF-0GgM;
	Mon, 07 Apr 2025 23:32:24 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1vwz-00000002Iqs-3wnr
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 23:32:23 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6eaf1b6ce9aso56133736d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 16:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744068741; x=1744673541; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jJIvZC6BOhqiO/IQEbyhQ90MLD58EsSNP3rWCk4udso=;
        b=A8fotwoGstyZE7GM1UMN1rW6aRcCn/MhI2LF7sAb7ti+4Pq62lND9nPoiuXHhoU40f
         S+k12t6DPlWE3BRYpiNEApRSAmPW3zHwOY8pzTn1DNqDGaFm4X2ob9K7SqYm6ftH61yi
         456zYUk2COa1hEkmDbcnkEyMFaBH92mVZKmgzlNql/PqfMTUqIE6mxio2SBr+CNuP2sV
         egm7q59A/w3PW4aAl+5XSO1JlH+9l6q6gejHFbdSs2jxL9m7L0rcMewVPcakp0hjtPrc
         9SOFxAv2llLA7kSOo36s/1EUMllyupVF7oh1gshAbv8jTOqAZUYtxq5GC9pRdCu4KgER
         nCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744068741; x=1744673541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJIvZC6BOhqiO/IQEbyhQ90MLD58EsSNP3rWCk4udso=;
        b=LnoZL9Tk8n+eW8zSbtm5EYcCNNQL6umd5Y11Ef0/3Am22dUbQS3dAU0Il2fLw/+uPs
         rehrO90hLcN4lPQRXTD/PhL4xB4WcqflmKiUcNbPLxosCEoRVsyzyYy2Xy+UZftjTU3z
         /D1qdOkEjZOU/6tPZ8JoUwre60dD7krnx1WqNzUIFJH8/Kkm3oEqY5QlZBqdkQm04740
         PdRupe+QfV3Jz+afiICbHPuALyOiVA/zDquV9fmEUySVD0r1RkLE9VctDHdf+cukUeQ7
         LdTOCrerDPXMy7gcoN5JpV3yX2m687e/F5/dJsBYt2YjP+SKBSjuCSY0PJ1bK3x5d0R7
         pUwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZa0c37ZouWcuwB1Bis5LVisjXBc5BpNg3FQx03C9JiwlVFOsDjG77oQVSjRekh7V++dtkY4aaZBcf6w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+eHT5q8d3iAw4/4P/54uHoqJ6zi5K0AqDLVSiuuw+rAF7m9XY
	2McF+cd1Y/gWSwgHVe784a0SHexB4UhQwY5qvlqBx+gq8ASnKz8F
X-Gm-Gg: ASbGncsZa84PgbuirjsUBjsPnfptnCIqLRAWjUWlxi0uOq+7xhtCuZiYYeGyBsLbDsE
	wqcg07qJKxnPYP7nnp/Hc+jEZE18IkkgWV7zrYXA+1ILY4fDC4INC8Swgih5JWPRBO739U7UuyZ
	0IrT072yn6fmsgfarR1C4N+GLjT44HF0OvIJLfxWevaUiSS4dY0Lif3pIhjqoj6ckTg/yygW51B
	wNF23kJB4H91rGBKZUP+xZNDfsFuBpObi4EFGnmYUNzqwq7pQy4xsmaspM2Vhohj581mLAhbwKA
	flon8uJmMUHnGxsFzTZ8
X-Google-Smtp-Source: AGHT+IEKkMIItDnAtEbc/6DeDUtD3EXh0WmABN9nky7dyvGG/jJvA+lzzO9SpmOhIoNbdRJ6S7A1Kw==
X-Received: by 2002:a05:6214:762:b0:6e8:e828:820d with SMTP id 6a1803df08f44-6f0b74bfde0mr179951146d6.36.1744068740691;
        Mon, 07 Apr 2025 16:32:20 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f00e821sm65227956d6.34.2025.04.07.16.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 16:32:20 -0700 (PDT)
Date: Tue, 8 Apr 2025 07:31:44 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	ghost <2990955050@qq.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C
 controller
Message-ID: <eltevzydjle25nyte5xn5mwxssi26awl4l4sgrz3v7h7m7vgur@tajtirx3up3x>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-8-inochiama@gmail.com>
 <20250407140232.GA2165777-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407140232.GA2165777-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_163221_979270_16C65127 
X-CRM114-Status: GOOD (  18.36  )
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

On Mon, Apr 07, 2025 at 09:02:32AM -0500, Rob Herring wrote:
> On Mon, Apr 07, 2025 at 09:06:12AM +0800, Inochi Amaoto wrote:
> > Add compatible string for Sophgo SG2044 SoC I2C controller which can be
> > used specifically for the SG2044 SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/i2c/snps,designware-i2c.yaml          | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > index bc5d0fb5abfe..677b39865af0 100644
> > --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > @@ -38,6 +38,10 @@ properties:
> >            - const: snps,designware-i2c
> >        - description: Baikal-T1 SoC System I2C controller
> >          const: baikal,bt1-sys-i2c
> > +      - description: Sophgo SoCs I2C controller
> > +        items:
> > +          - const: sophgo,sg2044-i2c
> > +          - const: snps,designware-i2c
> 
> This is not a great pattern we've started. T-HEAD, Ocelot, and this 
> should all be combined into 1 enum. The description here is not that 
> useful.
> 

I agree and am fine to do this.

Regard,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
