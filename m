Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FB6C25B50
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 09:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1jASUPnUmbXG3k3up7FUl0lXZIAGciLVUtjLPG0jUI=; b=HsNAtg8LhNhkhp
	2XTaVcPIxWoueDDUKmwHAiEVjQgVnqy8/tszCnU40n1ujCzUQclfxOEECLtTUrSwgBU1dxcPV61cH
	Fkz60Cj7QXLBr1N2Gbiw/rDzh+7cbEwWapB5BhBgwlZNOG0mIr/m2GuAPrst9TO1e4cQRYi/Tzm35
	xqoVIlFIAcLv3I3Ef6ZAu3d2kpm09hqcIcyDIRx77pzI6hiZK2XzvhViuYZb7pKq4JVXUlM/2W8h5
	CY8eEJa1qEMkIZRf4B9Jvyi34zxtAXDO3uhhqjP0qQLbp9GsUTStudBpScOvLL/UiUREy0uFAGMgm
	krgrTiUeQxsok+WLnouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtN6-00GYwz-CU; Mon, 23 Jan 2023 09:44:12 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtN2-00GYv5-PA
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 09:44:10 +0000
Received: by mail-ed1-x529.google.com with SMTP id y19so13875458edc.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 01:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tzw7rVzTiAE2k/bJcZBk03eWLle0ey7P0sqdJk1vnSM=;
        b=Plu12ZxwGb6JsyyWkxd2rHh4SjNlcEvN324p4m6LtWds1GO+Hax8AGLJ6wHcRXrmeG
         WxEcfNUpxC6KQytDKSE2msAWJ6ukXAyQPcxTtxOuhe6uwbVjbh8JMjCIJXZiOBa/D/YY
         VJLw6jw/JAuObEKslK9X0NTn1zhFYUA21kzoDGN8RVsy3q8RtvGprz03VpvMqxbKZRro
         HbqfcUdCEIG4svaIQJ22q/9nFKQzzhgQicTpZ25PKXw0Gg2Nr+a4ntpzAfeVtu1ID3Ux
         mBiGrabv3QCuRAtEb7O+DKYfGuZrp3is9C4T6W9FlZ60qwSNCv+oaHW1OHbGxBdgdf2U
         dCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tzw7rVzTiAE2k/bJcZBk03eWLle0ey7P0sqdJk1vnSM=;
        b=r1U+SuDydtzxF9jjYc4jA490UT16Ve/hYZktQIOH6BcpZtBw6SpNyJIQzm+S5wfJJ4
         JuftdvqvDYnjgPWr/+veLsXsKnRbNmB4j39LqAtRk8twmQ74gnJzsSF+J0anidKbNvYv
         hXgByUQ17gCJgpcvkcZ8Od753dcVbhHytHCe2Je8D2dz/ttL7CzlvxQOPFoZUHuXqIlQ
         OKNomnQ6IynZTZzDbMweSK3YYyFPot69VT3ImwewtZNzn6wwkgQtIAynJmBOwmO1n97o
         TAEwbrCKyeipsVTHZ/ICyVkcevki28DOXN0AWD5OZPF9s2m5IHxTWSiDbYXCmbBUJT4Y
         u1+g==
X-Gm-Message-State: AFqh2koeP6nQIFEO9iGY0a09apVCqcark9HuVhX6z4wp5OeS1lkDCeXU
	plr0Zitli+CniV0W2WG4cc9H+g==
X-Google-Smtp-Source: AMrXdXutGuQsdwPBdG0nyzaFoN1CE+Hi1ozPIjd2kpvHRh/7ZdJXcy0rLy+58kuMSsp/lk+rggSzlw==
X-Received: by 2002:a05:6402:602:b0:49d:f448:878c with SMTP id n2-20020a056402060200b0049df448878cmr33389242edv.2.1674467046664;
        Mon, 23 Jan 2023 01:44:06 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id v17-20020a170906293100b007be301a1d51sm21720198ejd.211.2023.01.23.01.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 01:44:06 -0800 (PST)
Date: Mon, 23 Jan 2023 10:44:05 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>, g@orel
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Document cboz-block-size
Message-ID: <20230123094405.2ageo63zauqt6g2n@orel>
References: <20230122191328.1193885-1-ajones@ventanamicro.com>
 <20230122191328.1193885-3-ajones@ventanamicro.com>
 <Y85A+3MW2N/jPTHH@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y85A+3MW2N/jPTHH@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_014408_864875_7225257D 
X-CRM114-Status: GOOD (  22.08  )
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

On Mon, Jan 23, 2023 at 08:10:35AM +0000, Conor Dooley wrote:
> Hey,
> 
> On Sun, Jan 22, 2023 at 08:13:24PM +0100, Andrew Jones wrote:
> > The Zicboz operates on a block-size defined for the cpu-core,
> > which does not necessarily match other cache-sizes used.
> > 
> > So add the necessary property for the system to know the core's
> > block-size.
> > 
> > Cc: Rob Herring <robh@kernel.org>
> 
> FYI bindings need to be CC Krzysztof & the devicetree list too.

Thanks, hopefully CC'ing them now is OK (I just added them). If not,
I can repost.

> 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index c6720764e765..f4ee70f8e1cf 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -72,6 +72,11 @@ properties:
> >      description:
> >        The blocksize in bytes for the Zicbom cache operations.
> >  
> > +  riscv,cboz-block-size:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The blocksize in bytes for the Zicboz cache operations.
> 
> Do you think hardware that has different Zicboz versus Zicbom block
> sizes is going to be common, or would we benefit from just defaulting
> the Zicboz size to the Zicbom one?

I'm not sure. If it turns out the block size will be the same in most
cases, then we could add another property named cbo-block-size, which,
when present, would be parsed first and used to populate all CBO-related
block sizes. Then, these specific properties would only serve to override
that general size for their respective block sizes when they're present.

> 
> Either way,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
drew

> 
> Thanks,
> Conor.
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
