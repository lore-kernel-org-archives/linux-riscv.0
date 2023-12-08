Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F774C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 16:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ultur3hYxuP7kH5rXgc1akEAAUOJNJi8rfKoTh4+qtM=; b=nAwNzraUFU4+zd
	qOeOl9pgvkyuV8h07qLgYHmCPn7r3GvaPr3G5RNJbYKijMDxiYoo8L4QwtU4+hW445OimPPuAxFfr
	4xz7o+5DI0YbX1nqU0obimtf1HAkOWbFhz8v+9Pwr+Cff/DRq5c2+kpwt1IXe0vI1Ju1nIpsovyDZ
	QHMEGpb8POCvE0hJxv5cf2yKRMaq6POwjMOcM1cv0ASJHBxdOf1pJbbItZIwmmP9KWLKCJElM1aXS
	LcXX2hZ6MIz0ASeYVX2R63IpYR990ufxKd2yiSa3vVc+vBZ4FZ6rMH38nnSFm/NuGGRP9nKNOA024
	lNevorNy4NEoUQiUoiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdnJ-00G2Db-0w;
	Fri, 08 Dec 2023 16:33:41 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdnF-00G2DB-33
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 16:33:39 +0000
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6d9daa5207eso1151534a34.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 08:33:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702053216; x=1702658016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GKuWGx0JJFRVK4jl2gAQwDPO2YGwHUxaXRf8Tzo4vI=;
        b=gZeQfZFibccafxxNy3O38ZVYrWWbom7GVAlA2oqM9HRIvlCucGUsB7LNQu3U9ajaa4
         EEFfi7A+uLa8Eag5VEufrtcE+cF8M9GbMJ0J9Efhs0Zl2T7HZPmvc3G7hg4OP5ltpAGa
         MMlgC839b7edv+OistVSOXAm6qT2iXl/SM1Q0rqYbn+HMYbCIdNCKtX9Z/48QstWJN/a
         x8dpYE/BrffAZ1c6emP81Q5g4K3q+IHEaIPOwv/zG7dAZDecJ7xn17uSEvirkWAktgmy
         YajVczztRlT0x3HSnaPN3bzWlBTMH4tQADBMe2yEbc4FxEBVryla7NH4LbAQch2OdKPz
         Qs1A==
X-Gm-Message-State: AOJu0YwekMExAHP442nbtZ02PdJpTVDF3dcyXU/Kc0y3k6jRDquWD5SR
	zvYUrWULmaO4lxsYe+ODKw==
X-Google-Smtp-Source: AGHT+IGJgyPhFszyyuv/ahTq9jCGY/uMbNvjsmemLXOK2SmMafrlPlw/OCBI/pVSJYLPRtpk1/ZBmQ==
X-Received: by 2002:a05:6830:1e75:b0:6bc:8930:a1d4 with SMTP id m21-20020a0568301e7500b006bc8930a1d4mr300120otr.15.1702053216777;
        Fri, 08 Dec 2023 08:33:36 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i2-20020a9d68c2000000b006d3161e612dsm346476oto.30.2023.12.08.08.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 08:33:36 -0800 (PST)
Received: (nullmailer pid 1696654 invoked by uid 1000);
	Fri, 08 Dec 2023 16:33:35 -0000
Date: Fri, 8 Dec 2023 10:33:35 -0600
From: Rob Herring <robh@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Keith Zhao <keith.zhao@starfivetech.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, tzimmermann@suse.de, paul.walmsley@sifive.com, mripard@kernel.org, xingyu.wu@starfivetech.com, jack.zhu@starfivetech.com, palmer@dabbelt.com, krzysztof.kozlowski+dt@linaro.org, william.qiu@starfivetech.com, shengyang.chen@starfivetech.com, changhuang.liang@starfivetech.com
Subject: Re: [v3 1/6] dt-bindings: display: Add yamls for JH7110 display
 system
Message-ID: <20231208163335.GB1659919-robh@kernel.org>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-2-keith.zhao@starfivetech.com>
 <46ad8c2b-5be2-4cfd-b771-a8d95a5b5d8f@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46ad8c2b-5be2-4cfd-b771-a8d95a5b5d8f@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_083337_983051_F3C59837 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
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

On Wed, Dec 06, 2023 at 08:50:29PM +0800, Sui Jingfeng wrote:
> Hi,
> 
> 
> On 2023/12/4 20:33, Keith Zhao wrote:
> > StarFive SoCs JH7110 display system:
> > dc controller, hdmi controller,
> > encoder, vout syscon.

[...]

> > +description:
> > +  The StarFive JH7110 SoC uses the HDMI signal transmiter based on innosilicon IP
> 
> 'transmiter' -> 'transmitter'


Thank you for reviewing, but please trim your replies especially when it 
is only 1 line reply in the middle of 100s of lines.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
