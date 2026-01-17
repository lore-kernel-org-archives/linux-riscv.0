Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD2BC9830B
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 00:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PNWgyZdJ9N1fOLqUlvUpgetw+IM2o/jOaolfHkPnVv4=; b=AahQ6/VDncAm+F
	3oGxp4750JELDVN5eida4XvZXfx+3inAbv5QlxO3U5wnaFPCucqpY8ILR1ySWMMo2z0nTlA05lmhu
	8Wv0C+rtDR8APV8mC6hHkwI8hD/Y9Kn5OVm9HC5ECBFYfvEdtGrkLRVNBGeJ6foaUo6eei3WOzYa+
	sqXxSBGjy3q6ft6FKvuX70u1m9WOA7ZP9eeZuR9aqG11PzdWKIXa0FpRyRkjjM0ZY8mbt1c2k8gYL
	cNr4l9mn8DkuQwEnN2ar7xFun8pNj+4qGXrYTywdyEEmClHhQtK0dnHgTBx8vilJ47an0pkkYt04d
	VlMggZP5Mw/F7ti7OVmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vguKB-0000000F3ge-13vp;
	Sat, 17 Jan 2026 00:37:55 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vguK9-0000000F3gD-18sP
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 00:37:54 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1232d9f25e9so4906392c88.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 16:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768610272; x=1769215072; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QwUvDT/SlBc0Eqpr7nL2iXfaEJNSim3jrEuKQhva72I=;
        b=FluP08Wuc3Z+Aw7z4UqHYKxUfgNMxa79WX+wxrvvHnw3WSsyXnTzMT7hpMTZwVbHFF
         XjwZ+Rz9gMoCTqnqh2fz9Oh9pih9OBy8YE+D3DVRho7kRQYOxJ+fUKI/X5BRRcR8QOHX
         i8EyE8nbX+Cw4i+emUp2eFp8jf8lIPCB10NlVDIQbFbANJcVclxTvyB+MdtK6rcZ1YF1
         KM9TjvJoyr6ETGTNN0RlVau7ZC1F49z+DCxhiyYBvuKUWVBPY26BwzEJzxRK89mh0eYB
         w2TwSx6LzaRsGmbHlYCrt1Mbnu0S/+cDAo9W/O2MSffDcEtlyiHmERr6wxn/SyaOp04N
         J72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768610272; x=1769215072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwUvDT/SlBc0Eqpr7nL2iXfaEJNSim3jrEuKQhva72I=;
        b=twhjxo9CIXu9ixb1/isKXlXEePw/29JdOnIlIJwIb7W0lxIDjXUQiNFZLiunhsJK9s
         OYD08waGSMuUGyN+2ONWygXXCMroZqRMYNxGnsSq0IzC+aXRGdbqk55pJirxG/jfx+6f
         RqZnPGoaNoQctzuoKWWP42KFVDD6KTTuUO8nl1lmYJl5coy8OcjYVBS64RAHbDfCMJ5t
         Txb1AMiyfHMdqy96logKQ9jgDFqjFpSf3dwMocgs4cw5tjE9jqHKPYNa7Uilokx6UeCE
         Dg/GDp9bLk6Q7lpNtgfEfgfGHLs24wiV0b3eqvEr+asJMu26/0Iadsn86LUOaQoLh2IL
         lhiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhFWevKpm6lUU7zgSZH5uw8QfT3c8v5JCQDLJOtWhHZoT3pO+ULj9FbjnZZDKE8eOqERVNuHexmNYBjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDBtE1swj9ZbbNd/BgEkHupMY6CcJiuuNh9LYSM1BmdYiUwTyI
	t60diDWod/ZFKx3XV8hqW9mNUn2aL7q8rDU3UYIm2FLHjDm/DWt3+0ym
X-Gm-Gg: AY/fxX4VldIBt97Ic621ps4VK7AWMt+y6PgxsBgqB0VTPrD5qpG+XpP8Rubj/6pGTFo
	D8PsLXWpySL46Z5VJlEk2MSqlCPlUxlfxAMqe18rSVhxmlGZkgumhv7v734CY5pqJRLqMmBVfkS
	J1QtHsrSijGDHlY6X2eBlruZPZI7DkPKb9q8mHQMTVpfv2m3nhVnprdgir0Daq9Vah5/a2SpVit
	I2KO1L3EgTX2V+wpWDkikSIKjBhYo60ZFcccvtVGJpUr066VdNRIZZ3VxZmqgf9Bv7vP2ekSNvS
	cxTZz2q4w+GUPKtxPTBWdxtVAJP7vgEWi5EFvxPcsxkVI3Qbh3mI2Aa0DxPQ0wYjdbq+Joaruuy
	qAZrHdA3m+Sq+ekTcUaUPr/CDtnduFIicoUdRw7U6WSjyYy2i4EVof0KvKm3V6agIROMKhaFC/S
	W0jKd8TI7TUw==
X-Received: by 2002:a05:7301:650c:b0:2ae:57be:86ef with SMTP id 5a478bee46e88-2b6b3eee816mr3461799eec.4.1768610271891;
        Fri, 16 Jan 2026 16:37:51 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3619a7bsm3954639eec.19.2026.01.16.16.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:37:51 -0800 (PST)
Date: Sat, 17 Jan 2026 08:37:45 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Han Gao <rabenda.cn@gmail.com>, 
	Nutty Liu <liujingqi@lanxincomputing.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Zixian Zeng <sycamoremoon376@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Move PLIC and CLINT node into
 CPU dtsi
Message-ID: <aWrZpoMOwTnFqlGN@inochi.infowork>
References: <20260113023828.790136-1-inochiama@gmail.com>
 <MA5PR01MB1250082D757C8DEFE005EE71AFE8CA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA5PR01MB1250082D757C8DEFE005EE71AFE8CA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_163753_317395_E7F3C8D9 
X-CRM114-Status: GOOD (  17.90  )
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

On Thu, Jan 15, 2026 at 08:49:54AM +0800, Chen Wang wrote:
> 
> On 1/13/2026 10:38 AM, Inochi Amaoto wrote:
> > As we have a separate CPU dtsi file, move the PLIC and CLINT
> > node to the CPU dtsi file. This will make the sg2042.dtsi force
> > peripheral devices, and make the CPU dtsi force CPU related
> > devices.
> LGTM, except for the word "force" in the commit message; it seems a bit odd.
> Perhaps it would be better to write: "This will make all peripheral devices
> are defined in the sg2042.dtsi
> 
> and all CPU-related are defined in the CPU dtsi."
> 
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> 

Thanks, it should be "focus on", I wrote a wrong word, If it is
OK, I will fix this mistake when merging.

Regards,
Inochi

> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 305 ++++++++++++++++++++
> >   arch/riscv/boot/dts/sophgo/sg2042.dtsi      | 303 -------------------
> >   2 files changed, 305 insertions(+), 303 deletions(-)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > index 94a4b71acad3..509488eee432 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> 
> [......]
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
