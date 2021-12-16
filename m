Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD53C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 21:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ALjzY/qcn7EYiHsFO1TaHXsMMcfGewwmh5i/M0of1c=; b=JSbDFmdtrOm93C
	ufZvDFXDj9jPYevGDuqBN5gCuJqimXJ+z6VrqQgAD53OqmzPUFXBYQJuxo3ifSZQd7+I9EA23AHGR
	FrsHCYuWZLFP26Qrgj55GvGmX3BMH0pk6qjHCrP7ITTUWrckg9bkUNsZE1KR1TwNqrkjvoTBIHVgH
	oUC+eArQKGnqWM5dzGjp4AmVGVFV6OQi3z+y0ywr7Gxb9V6lI8xec0cQMqCFmuKs+oOEbfEkBQ9A6
	+QaYg9wK78GpbgExhVcrlp3+38zKdF8Xo4vLq8uf4IzGWn3G9XJgFgVqwXFwLO3OCt4ty9gHXYLZ4
	uDx4U160Icb79fKIW4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxyIs-007ffV-3O; Thu, 16 Dec 2021 21:28:42 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxyIo-007fd9-Tg
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 21:28:40 +0000
Received: by mail-oi1-f180.google.com with SMTP id t19so815023oij.1
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 13:28:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F4WrGs7AdiwIx2WRnezyl9BaCDZ2jmqPsdo8O4vRvLg=;
 b=dZn3zzYhA3TI6974FjW2acUQAGlr8OvHR+M0ndd4wL9f4NBg8DfUVYb3fSmyEBlztQ
 7W1CFTRRT+isfaM3HyShVRSKReMy9Y+WB18DZQw1wgEIvra7JUlr6w/nErQauLf+bVQg
 iI6oFXlgyftX0T4P6Yfx8IV9wpqFqU3RHVWdz9M3vPB0CItSmU+MEpitW1D3oRPnH2ez
 3rv5y8wM6shIQwtQpRLKyEBcPFY+ta/CI8P3hGfk+2rk6XMMsBGEhDxoEw3/OGJpiagx
 S4RQAAZCA6bIo+fNyCPlYOiVcXrITd31tNYyBAiLafj9754w3JL18Ghm8Re8izqizZT1
 6kPg==
X-Gm-Message-State: AOAM533AfWwur5cNme2e7bYRsoZLoEA5FXxfmKrp3U6kWvVAzp5zbn+p
 a5+1xHCinUIrkzVOk26K4A==
X-Google-Smtp-Source: ABdhPJwMsfm6t0C73XAGqvrX19MQsCB+oVAihTHhjvFl3IBepH5UAiLP2WGaDOH0asSNG05WV2Js7g==
X-Received: by 2002:a05:6808:23cb:: with SMTP id
 bq11mr5580232oib.2.1639690116754; 
 Thu, 16 Dec 2021 13:28:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k8sm1302776oon.2.2021.12.16.13.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 13:28:36 -0800 (PST)
Received: (nullmailer pid 796072 invoked by uid 1000);
 Thu, 16 Dec 2021 21:28:35 -0000
Date: Thu, 16 Dec 2021 15:28:35 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/2] dt-bindings: interrupt-controller: sifive,plic:
 Miscellaneous improvements
Message-ID: <Ybuvg3h+VLCMji4J@robh.at.kernel.org>
References: <cover.1639661878.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1639661878.git.geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_132838_995109_DD869A86 
X-CRM114-Status: GOOD (  20.82  )
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

+ Konstantin

On Thu, Dec 16, 2021 at 02:41:20PM +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series contains two improvements for the SiFive PLIC DT
> bindings.

Lore is thoroughly confused with this and several other series. It seems 
to be doing subject matching and pretty loosely.

Rob

> 
> Changes compared to v1[1]:
>   - Split in two patches,
>   - Improve patch description and document limit rationale.
> 
> Thanks!
> 
> [1] https://lore.kernel.org/r/20211125152233.162868-1-geert@linux-m68k.org
> 
> Geert Uytterhoeven (2):
>   dt-bindings: interrupt-controller: sifive,plic: Fix number of
>     interrupts
>   dt-bindings: interrupt-controller: sifive,plic: Group interrupt tuples
> 
>  .../interrupt-controller/sifive,plic-1.0.0.yaml      | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> -- 
> 2.25.1
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
