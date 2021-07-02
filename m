Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCFBC07E95
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 21:00:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E23C61167
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 21:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E23C61167
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jtAsEKkAjSX4l465UaaVMvRIEJclZAC7/He0yJ3g0vE=; b=C6q94oR4GcIdZp
	sNOATvZhp2Bl4Q5gD1xbgPS107KgXLtFx9q2rt9IvCzcG8vhN2zxJ5nDsgWk7NP/BSievOmothNUL
	XzDYx+/jajGQ8XuFzSLa0zH9ziqKmuf/8RmfB5Lci29W6V0nY6Lvxg/aeoYm6I7qd2g7TJXIPl0eP
	hzWDYIiy16NzF6Q7AUppkCnVB9OjE2MM/bFjNU+qw8rjm7iYZ2cbYYasSmbYvTI+2YgItyBokgnbt
	9aRA9WKR4PeG+pei89SJt58yoqMwnTHG4VxIybkXtCIYlkEVnZ+qtaas5j1vJriq3Sjn+kE+kLAg7
	BdYqVQzM6LY+yw0sAGfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzQGp-0043Cy-9X; Fri, 02 Jul 2021 21:00:19 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzQGl-0043Bd-L2
 for linux-riscv@lists.infradead.org; Fri, 02 Jul 2021 21:00:18 +0000
Received: by mail-pg1-x533.google.com with SMTP id w15so10857707pgk.13
 for <linux-riscv@lists.infradead.org>; Fri, 02 Jul 2021 14:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oOQvjNwUs6iGdF4qU2K20XA2rSMaHeKg3ys4j3WcHnc=;
 b=hYM4Px7OvwbK9XsUFZfo1RxGbzj90AUFJXgJwyByTUvzILGgndzmwMbIeL8chJCL/1
 jnLgsfXFcJORybUzJlR8Ts4om5iI3vfYCOOaOGhcbqNDqPf5G9HIQDmb575aYR+2mMcB
 UHULog5A9xsnm2hD6O+LvitJflAiWtuUlsSp8b1zC1z+F+GtjwFOkmoxUpEr7qnFab+S
 K4eS+ZSOYZqUI8WwZwd1Xylpf6Tsx1ULc6iiDVbo5T58XZunv+/TzmElGmJCmEBO3KQ4
 9Mgj+VUVg1GWSmLadoePcZyVGiDpn3Gx6gFsQyDn3LxMUHibgihro9oW4eb8GFKbtJ+X
 rfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oOQvjNwUs6iGdF4qU2K20XA2rSMaHeKg3ys4j3WcHnc=;
 b=W+LthvsTUiE7AOakedJNtMiXBtEqaNzyJ38SbqlYnWgZ2bP4bk7D03lN1hdV/15Rmn
 AIfIYm7k0naDE4mEaNJU65f0BNEz+1trvOmfVvaZGTZmPvm8XX8UWffgb+RlvasAlTns
 ur5eCcILoTRAAOaxkh04n2yJC7EKJwmeOcbsCgdrOSDPD44j5mO4rgh6kqINLxl9+EfK
 pUh+//TdxtdYoA6dzKV8Ux6JNG9r3rZI8xxr6CUuKe/B/9h1RnnHyGYUyJYlCLZU8Ks5
 hGKDGKAXvlw2VABSxkMJsfOC40A/YrvWu58Q7NtfNyWZzJ/nQtGbDS9uFF8eFkzYdw6a
 jeyQ==
X-Gm-Message-State: AOAM5312vk2MNuK9tjsYWzgWzY+7ZrkCEa406eMr0v7OUPdR3eHXuzXf
 hhz/BR1TURS9yUlNGA31dOY3MQ==
X-Google-Smtp-Source: ABdhPJwX6MC0pslJVSWjiHUEQMYnxqyk6w0QgIpJI+wow/rFNf/BdwqJWoRkWhXswPubyBwBxdmobA==
X-Received: by 2002:a62:7950:0:b029:30f:cffa:a25e with SMTP id
 u77-20020a6279500000b029030fcffaa25emr1324959pfc.50.1625259614259; 
 Fri, 02 Jul 2021 14:00:14 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:f236:257f:88f9:445e])
 by smtp.gmail.com with ESMTPSA id 11sm4742618pge.7.2021.07.02.14.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 14:00:13 -0700 (PDT)
Date: Fri, 2 Jul 2021 14:00:10 -0700
From: Drew Fustini <drew@beagleboard.org>
To: Michael Walle <michael@walle.cc>, g@x1
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Fu Wei <tekkamanninja@gmail.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>,
 Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
Message-ID: <20210702210010.GB1035183@x1>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
 <8c59105d32a9936f8806501ecd20e044@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c59105d32a9936f8806501ecd20e044@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_140015_732213_70E629E5 
X-CRM114-Status: GOOD (  12.87  )
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

On Thu, Jul 01, 2021 at 08:39:40AM +0200, Michael Walle wrote:
> Hi Drew,
> 
> Am 2021-07-01 02:20, schrieb Drew Fustini:
> > Add GPIO driver for the StarFive JH7100 SoC [1] used on the
> > BeagleV Starlight JH7100 board [2].
> > 
> > [1] https://github.com/starfive-tech/beaglev_doc/
> > [2] https://github.com/beagleboard/beaglev-starlight
> > 
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> 
> Could this driver use GPIO_REGMAP and REGMAP_IRQ? See
> drivers/gpio/gpio-sl28cpld.c for an example.
> 
> -michael

I looked more at the example.  Do you have a suggestion of how to handle
different types of interrupts?  

This gpio controller can handle level triggered and edge triggered.
Edge triggered can be positve, negative or both. Level trigger can be
high or low.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
