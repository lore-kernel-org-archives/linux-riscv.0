Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF43C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 19:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FqoaNk0vlZ3yQBY01ercHGSFuC3TTyTAoTV9OPYvjj4=; b=t5H25XW0nVEhv6
	KV4J0lkiCCSuNHTQFw1dYL+9tiRg2mkoXAjheICV3pyvx7lW12qiN/HACGF+Z/D/2j1UmiZ0bq4vr
	fgT/d8xtaZYYSUOFm/SmEtbu6CvDZdScINmVNbJqp7TrtrBRCjHBM67bSWH0hXZUdqAFKgHCN2lYU
	8ASi2HYhPy8hL2+WG+zZxCmbGDJcn2VFZt2yN7qGLLryLL1gexnIGs/fYlGLC4cpbyB//rUCssL+/
	sGZHuIHhkOqGdLxM5R5ActyZlAITZqSyV0u5C/jzDtZZX/JVqQT0JO2qJ1KonUyTuerqHwAel8aqi
	Dyidy6I8oAd5qixHliQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrmmX-002C6U-MH; Mon, 29 Nov 2021 19:57:45 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrmmV-002C5Z-HM
 for linux-riscv@lists.infradead.org; Mon, 29 Nov 2021 19:57:44 +0000
Received: by mail-oi1-f177.google.com with SMTP id bk14so36742291oib.7
 for <linux-riscv@lists.infradead.org>; Mon, 29 Nov 2021 11:57:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HfsUR5L7A7mtic8OAeLVF3BR2S9QhZbq2Zd9TYiAIUw=;
 b=do17cQuGHRhIznOp+estZl+dSC+HbaBumOknEoI6vbmohYfqictcKALaxsiyA+2hYT
 cQ487nyX8tRXyMeT9aHhTG+99iOua2bpRCLkf3D1mXB2dPsNsrWv+d/HHNtBivckHats
 0ZbxkW6CTtUZju1wnf3pT3CDz2Nk3Roi+wJfQZQWFcjfWQoab45+EVm8ExHjWErmz7sH
 vTtZB9sRWfpy8rnFXFu79xBvdhX4yzvu8srlpYFg5lx81ATACKQCGTLrNt0rR/kLKiQ8
 OU10nJVWX6XuzanSh0HgCMHoZ+xIdmdywBrMuml8kr4VoutOTYhzt+c7EdPbkGBolR8R
 U3sQ==
X-Gm-Message-State: AOAM532tZAZaRD/ciFd1jzdxoQW2eTYqxV+7nHn11rahbEhpKC0c1KT9
 bMhxUqknG6gmrctTsN9DPg==
X-Google-Smtp-Source: ABdhPJzP2oHSFJrUqX433xhlxSbtB1tFwj+rRhSRXyeRyaBNTiCllu+XkavzvOWSuvIiREO4uWcIhA==
X-Received: by 2002:aca:1202:: with SMTP id 2mr153130ois.63.1638215861431;
 Mon, 29 Nov 2021 11:57:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bb8sm3226530oib.9.2021.11.29.11.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 11:57:40 -0800 (PST)
Received: (nullmailer pid 504791 invoked by uid 1000);
 Mon, 29 Nov 2021 19:57:39 -0000
Date: Mon, 29 Nov 2021 13:57:39 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: paul.walmsley@sifive.com, alexandre.belloni@bootlin.com,
 daire.mcnamara@microchip.com, bin.meng@windriver.com, palmer@dabbelt.com,
 a.zummo@towertech.it, linux-kernel@vger.kernel.org, jassisinghbrar@gmail.com,
 atish.patra@wdc.com, lewis.hanly@microchip.com,
 krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linus.walleij@linaro.org, broonie@kernel.org,
 ivan.griffin@microchip.com, linux-spi@vger.kernel.org, aou@eecs.berkeley.edu,
 robh+dt@kernel.org, bgolaszewski@baylibre.com, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-riscv@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 01/13] dt-bindings: interrupt-controller: create a header
 for RISC-V interrupts
Message-ID: <YaUws4nu6iLvHLiF@robh.at.kernel.org>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211108150554.4457-2-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_115743_603735_54D7380F 
X-CRM114-Status: GOOD (  10.46  )
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

On Mon, 08 Nov 2021 15:05:42 +0000, conor.dooley@microchip.com wrote:
> From: Ivan Griffin <ivan.griffin@microchip.com>
> 
> Provide named identifiers for device tree for RISC-V interrupts.
> 
> Licensed under GPL and MIT, as this file may be useful to any OS that
> uses device tree.
> 
> Signed-off-by: Ivan Griffin <ivan.griffin@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../interrupt-controller/riscv-hart.h         | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 include/dt-bindings/interrupt-controller/riscv-hart.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
