Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1DCC2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 22:01:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 988EB206CB
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 22:01:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bGEPSO/G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 988EB206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mV7HOnJ7Z58Er0Ru5SqLhk4yJpEQLQHHAAJ6e1N6RUI=; b=bGEPSO/GbULbDwxrPbccnf79z
	sN5eKqjPilPEegyTaxi3rm0mT58Vx1Y3aQahN27993bza+MAceR3awcLubR9gxQRuUV9X00ZSz+vl
	YD0poh1KlBt6/W2iyl0KSi/YuUKyDO4OgxtzyEZs3DVO1WbXuKFQ5G6JSqiOCtQViCdZOad2cFjgh
	++xuICJzNwpJkbGcWD5MwP3DZCUNCdXh+YTLNlXFzrfwz8M/rR9aaXWqsqaNMSWFg5hUT2EY8n2jO
	cgeqQR1AjTTjC6xghWrK33Nigf+hemUWqGKA5ep/nN3OaCYBsE+dyG7SYoatPoxzQUi3o5oZFpC90
	gWrJMvo3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcFDq-0005Fm-Do; Mon, 09 Nov 2020 22:01:10 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcFDo-0005F7-0Q
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 22:01:08 +0000
Received: by mail-oi1-f196.google.com with SMTP id o25so11086845oie.5
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 14:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7wxEK8r93xFMQRm+C6rEop1thQQpZHU7Kw+qAO4PP6o=;
 b=ZCINNXveOW8a1leVAUYuT9XEzGTbZi3D2/ScaFEspEzC3N8pjQo73be77ecyvTCM4V
 /0GNq5t+1rsJcGGGqennGk/CzBJEAjpeY8vki/OEt4nhF5jvT4SOAepq1JfqPFmi/GXo
 K8lgkuoBDO4K1brydzRHaSwGVbe2W8CEXhKQh+4Ev9eNYa9DD6l4Yiexhtc0vkBrDYxE
 nPxAtPOmM6t1exYcABsTIVMjXk+6bp/IGheBEP7CwHNfLL4GZ4NenhNuABss8F7RnPfr
 8v2PTcHzoUqmo0FWmyXFUsa03cEsfvkwoVIEhEiTh23Xnz2YruqtdOAL8cebDKa9pGem
 wV0Q==
X-Gm-Message-State: AOAM531lEFKeW4rQ+yesmwwemzzVCmtEjiPeSylbmU6mqMmOHWhF6Xyb
 kmVNBQpVSQPw+/WyNvqoWg==
X-Google-Smtp-Source: ABdhPJyW9JGGk1VpbrzoajOyxnNt6WDJHvuOvs4tyQbZGJ6qyr3YYwnsnYbumefAA8c0DHcsISbu1g==
X-Received: by 2002:aca:4a51:: with SMTP id x78mr903938oia.86.1604959266864;
 Mon, 09 Nov 2020 14:01:06 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k20sm2821577ots.53.2020.11.09.14.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 14:01:06 -0800 (PST)
Received: (nullmailer pid 1832318 invoked by uid 1000);
 Mon, 09 Nov 2020 22:01:05 -0000
Date: Mon, 9 Nov 2020 16:01:05 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH 21/32] dt-bindings: Add Kendryte and Canaan vendor prefix
Message-ID: <20201109220105.GA1830760@bogus>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-22-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107081420.60325-22-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_170108_070313_5DED1CEB 
X-CRM114-Status: GOOD (  14.78  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, Sean Anderson <seanga2@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 07, 2020 at 05:14:09PM +0900, Damien Le Moal wrote:
> Update Documentation/devicetree/bindings/vendor-prefixes.yaml to include
> "Kendryte" and "canaan" as a vendor prefix for "Canaan Inc."
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 2735be1a8470..f53d4d8e7f2a 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -179,6 +179,8 @@ patternProperties:
>      description: CALAO Systems SAS
>    "^calxeda,.*":
>      description: Calxeda
> +  "^canaan,.*":
> +    description: Canaan, Inc.
>    "^caninos,.*":
>      description: Caninos Loucos Program
>    "^capella,.*":
> @@ -537,6 +539,8 @@ patternProperties:
>      description: Ka-Ro electronics GmbH
>    "^keithkoep,.*":
>      description: Keith & Koep GmbH
> +  "^kendryte,.*":

AFAICT, this is a marketing name for a series of SoCs? That's not a 
vendor.

> +    description: Canaan, Inc.
>    "^keymile,.*":
>      description: Keymile GmbH
>    "^khadas,.*":
> -- 
> 2.28.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
