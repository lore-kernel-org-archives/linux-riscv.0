Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50623C02181
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 22:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jF1doC96crp1EL3LnQnXUfXKOaQ60z/7RdlksLaLGlQ=; b=wqhi6lAwRE8p8p
	QPZniu/m0tqnxl3sxP5Juo7LjtbDiV4CKfjmz4dvwCVmrWl8M1DUgVRp2a76oLVlEJLWMG6rCLLxk
	LkjiEuQICe684Cih8YFDh8CAGOT/MAH3yP7DRCP2tS3v9CH9H+GMQ3e8bLk5H4TA9DhW45U3UF2P0
	HcuaB7QP604kg3cR6mc0qw1JV6JNMACjUdyfCq64DzTcM5axIBEhIVzX4kk6bGLxu87t7nw4viae+
	5M4c4vsY2OzO29M7KV2lYx0JUij9M0LuPxGojhqjcemaNDoQOlgUOf1/2OcEV4YWomIMzlmrNisF4
	5YiVMqhM82yMGByrEGFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tajRL-0000000BLwK-359u;
	Wed, 22 Jan 2025 22:43:15 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tajRJ-0000000BLw0-41FX
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 22:43:15 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6d8e8445219so3083956d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jan 2025 14:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737585792; x=1738190592; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E6OZqE7iIZIdCEqIDoZhlJdC19YJ2tsXKOstsn7nEBM=;
        b=ecTmJKozq/JFFVbGWoSv2ahk11d0Sv5yTIPRVuyvnbYLJPXrZIXHbKd7Y4HP+Tv6+D
         ryIC8ba38sy03KjjAsrwMADnT312yRhFBRFUG1joNQ+fffxQf6QAEXdCMwN3QloYnfUT
         U3n1ZsMOW8zbudTm/09Aqod2myrHcuzH8UJj0rmZGLNgmVundzNHLGAgeWyjMs2pmg6B
         TdweGZrZJ6iE2Yn31CGoiTMXfWwWcsfAPK0N8537RMbK1xrTkaCho8c6egYZbMPmali9
         OwcFYD49MTaS1agd8Z8V6rjXquGpDG8f7aAEtGuOl4vIiYFIx9WwKziFuHpI/7KbmalE
         bEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737585792; x=1738190592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6OZqE7iIZIdCEqIDoZhlJdC19YJ2tsXKOstsn7nEBM=;
        b=URFpCUJ2D8S/g01aq2ZLQQnIFH0ACSndtilFByV9Ejw6DvCL+/HHGw/lx/n66yYZgN
         OYAt+TumonBgPODM5C+Gi8Bg08R7gf58Hufm2xX0Cq8TiBG9CZUxuLGVNwJ3ipN+yVQ7
         hobxJBMNEqsQzKXs5lwTykfrgJ03Jt5tqSlcIsPDR9iPAF/yNsZNWiTzGCZ7+EuhTXi2
         AWw/c/UxbfQXghXxWeMFjoCcdxRBs2JPAd3bOxjv6DMMqKVI7Ndi6uZmJ4JYEf+HYgBw
         4VomaQljsvI5WpBgEDXZLGzHujRUDVUCFmYeQrYQR1YJYD4UWetvzyHkjn+Fm/6gxIZj
         sjfg==
X-Forwarded-Encrypted: i=1; AJvYcCV2/GCNAM3egHXRACMXeVCacMdJF9SDgjqmBVD8sHTN/CyPrdnQZHfUPeLEmxG6vbV9DMSaVlZYKnS/Qg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwL9N1H9niYoNVAN/B2TnBcU+6bK3nNxq78bHXAOKS52tcH5EV4
	HQdx/bweNE4N8TG6IWpltjEbLazt/jbYd6/F716tqVVGAY8bHrjp
X-Gm-Gg: ASbGncsl7rzxzWORvslW/xr3h1Ca44CA/22LUyvZuKcyqitRVNfMzeJdS2OcJlyzsCc
	Zg7TEA0qxt3NGhWjH4rypE9QGLce8L6wN8wpT8lcJ/IWHrW9BSa3o75e8YDtpeagS0Rk022png3
	p0pmbpwONujnWv+CEP7FOIPRMYfMRrIApbwkRWeJYizkfknZ3bgLSpLY80TjYPPTnQw4gsoUmi6
	vNeOcSMc2U4eLV6QdS1ln/4LqwbNnRKEdeTE/bZvhOKVw==
X-Google-Smtp-Source: AGHT+IFoyWf4t/CIJ0HKL6Xnq/hJ7/kW4C818cLFawa82wfPl4faqNL1VWj3EHe1I2PuOVEWgcSkAQ==
X-Received: by 2002:a05:6214:240b:b0:6df:97a3:5e76 with SMTP id 6a1803df08f44-6e1b21d13e5mr384406186d6.27.1737585792443;
        Wed, 22 Jan 2025 14:43:12 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e1e0a39f89sm24469386d6.19.2025.01.22.14.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:43:12 -0800 (PST)
Date: Thu, 23 Jan 2025 06:42:23 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com, 
	aou@eecs.berkeley.edu, arnd@arndb.de, conor+dt@kernel.org, guoren@kernel.org, 
	inochiama@outlook.com, krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	robh@kernel.org, tglx@linutronix.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com, samuel.holland@sifive.com, 
	christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v3 1/3] dt-bindings: interrupt-controller: Add Sophgo
 SG2042 MSI
Message-ID: <wwgb5kx7o3s53tzpjcizrw7ftkxze4ynrwvgxshk6cl3crslx2@erbjvg44h7cb>
References: <cover.1736921549.git.unicorn_wang@outlook.com>
 <c9dd12c3ad77b13dcdfbf4accd51e92e6ea2a4a9.1736921549.git.unicorn_wang@outlook.com>
 <gyf6cdqjnvom3adf3cr7l72e7xevewhrsv4koelpnfm5cd22ge@t4ru6avsihzd>
 <BM1PR01MB254564DCF4004C3E60177331FEE12@BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BM1PR01MB254564DCF4004C3E60177331FEE12@BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_144313_999927_835E92E5 
X-CRM114-Status: GOOD (  15.24  )
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

On Wed, Jan 22, 2025 at 09:51:05PM +0800, Chen Wang wrote:
> 
> On 2025/1/20 10:42, Inochi Amaoto wrote:
> > On Wed, Jan 15, 2025 at 02:33:23PM +0800, Chen Wang wrote:
> [......]
> > > +  reg:
> > > +    items:
> > > +      - description: msi doorbell address
> > > +      - description: clear register
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: doorbell
> > > +      - const: clr
> > please reverse the items order, the clr addr is more suitable
> > as the MMIO device address when writing device node. doorbeel
> > address is just a IO address and can not be seen from CPU.
> 
> I find dtbcheck will report error if order is switched.
> 

You should also change the unit address to avoid error.
I think you forgot it.

> On SG2042, address of doorbell is ahead of clr.
> 

It is the same on SG2044, but there is a problem that the
doorbell addr is a IO address and it is not suitable to
represent the device addr in the dtb. It also lead to a
weird unit address on SG2044 which is hard to understand.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
