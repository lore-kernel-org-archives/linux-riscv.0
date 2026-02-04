Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A859E8B396
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 03:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F3qVN9OkEasxv7rtt11W5FaOYCkhPGIoviUYCu1vE2Q=; b=wIpyiNg8EYNYkn
	dUwimbqRohgHxANTpDOeUytD0eZDnAqp5LmEgx8fEBE2qE96aRxStup2kxs2sSpAO2On8hJWGOBvs
	VJ0fcoowyOtX301+Xg7UVsNeLHWIdkh9/Dx2eCBvwMY9ssvgo2CBLaGiz5ZQQVdT/KZNgosP5PhEb
	SvDtMlYVeQ7R2tRixzcjDaOKh+xs1Nx6X39RXbjhoDPHO5KRSdiBzkKMbwz3HztWoJ/3bUuOKSY5M
	anhwr/KTw1r0ku/Xokp+uLW1pZTH1fByhydgJrjNkLgsYicqi1PAKG1/+ksvBG1C+1ewI28xLaekQ
	7EuaxkBTN0/gw/cS8Dgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnTva-00000007rJQ-0ZCZ;
	Wed, 04 Feb 2026 03:51:42 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnTvY-00000007rJ0-0pEX
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 03:51:41 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-88a35a00506so112418246d6.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Feb 2026 19:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770177097; x=1770781897; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kCf4lzrMziBndOsmo8GuusOdBN8cx0cDMD3sdQZPXW0=;
        b=AW+H5b2QbMj9UAaYNqLRHVUn814H+FtZkcMUTyv+abl7Tk91mEHb8PaTIvEviAsnpL
         m503fs+W8/fUwgeaJxX8CrURvitVbCzEuUE5gIBCpDbPtr/mpcub5C30HMJ8eUaVYQRe
         Zt3a3uin1Mn8mzPkFWBf9QcwYrOjOHHGtM1Pfuwi4wLGWK6OiOdnaq/fZAmCS+GjN5WP
         sWKcuoTtlUwtOeWegcjpjnG7a83XEVM32NMuPhDM/W6wWHIxYHGbyXZPBR5Kol5+H1BQ
         wUKAh3NKd1UeiF1Xkws9C0e4+LV1XDTyfqpPhWdnAD31E08cMs5CKj1eHTR2tC2IAev+
         QlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770177097; x=1770781897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCf4lzrMziBndOsmo8GuusOdBN8cx0cDMD3sdQZPXW0=;
        b=ulcKQRrsrzHWBdNfGqfXUSgiL1iM16i/sW4yUusQ/+/+aduS+RQhC+XkLQYl3I4dVz
         SU4G7kTnLjOxg1dcjPvTbANFHRxH1PczJ/BMwloOLWJwPsvlBEI/3MDv3sio4JstqXO1
         Pu1PzNs35JJp1CBUumdYytC1HfGA/3s+QFREBV1Rap1KBGeK2Ezc6zsTKbww+R6TAEx6
         H061yB0nWGrdJaWbkjODc2X3Zdd1BTSHlqa5QVU2oO4t4tjpcfshHPhHgAGwP/dX8dRW
         4ZswDMJmUcqj1kosqK4U8NSjxZti1WCE/RSeBnzUN15J/d7XzhM3VMDsn5sUe4QVAook
         ESmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQHVsVtFSrwBj7spgNbByg4FIGdYm3t1LRUa4UpIpdJs4+IA56k07GHwVyxBrQfaA0eiFJvgSjhBUWjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHzNPbCnBZyLdNLNgneLsGIhZHBNx+Zd1ddt74doJN3ASIGzR+
	UcyNqVKzHKN/6TwcI7vJdM3KivCT9vUDkEieKQ5KJgCtlmdCdeYiGVMp
X-Gm-Gg: AZuq6aKA62vH+dX6TFQXMM1Y/KYmeDHiBGBN1CGhvNVTLSlXwDiSGAl36tcJ5TqwFcJ
	DlPjR1kAvKybUr+Feqd7+R8ptEwuZszl/Wzq9sYzbCwzpdfDwCimL1dySTEnTwLlVzP3R1LbEFU
	kLmiVJI411h+kcRMHbsUUV9iccrL8gf32M4bmgUfM3pZKvebUWndrV+zFYI6mUfcSLi90C35V+X
	PuWuFyfAvz0bV1Jq7VZ+9TkiWShBvMVJ1DqZF7j9OC1Eel2mVhIn1iIDrYUm7UYcQVlUft0np2H
	eKvycZO68YgTIJ9JzWANLHFWuc8wQxe9XxuwMcPd+IahU8D33eBiC6fr0AnztS2TXrMQjDB5w0a
	QTujiwcrdsem1M8bWcwsHAc43TNG/QVQqLlGrY5Lqa+XzPaaeWhkg94911PSMk8LApW4OEVQlw9
	o8lPPS48OwjQ==
X-Received: by 2002:a05:7301:7003:b0:2b7:32fe:4bbb with SMTP id 5a478bee46e88-2b832895197mr603971eec.11.1770171121283;
        Tue, 03 Feb 2026 18:12:01 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832fafc2fsm746589eec.24.2026.02.03.18.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:12:00 -0800 (PST)
Date: Wed, 4 Feb 2026 10:11:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Yao Zi <ziyao@disroot.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Zhi Li <lizhi2@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v4 1/3] dt-bindings: net: Add support for
 Spacemit K3 dwmac
Message-ID: <aYKqh7SmoHO83Avr@inochi.infowork>
References: <20260130022705.1059214-1-inochiama@gmail.com>
 <20260130022705.1059214-2-inochiama@gmail.com>
 <aYIyuulFADU_j3V0@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYIyuulFADU_j3V0@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_195140_246076_03C9EB62 
X-CRM114-Status: GOOD (  13.32  )
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

On Tue, Feb 03, 2026 at 05:39:06PM +0000, Russell King (Oracle) wrote:
> On Fri, Jan 30, 2026 at 10:27:02AM +0800, Inochi Amaoto wrote:
> > +  clocks:
> > +    items:
> > +      - description: GMAC main clock
> 
> If you know what this is in terms of dwmac databook clock terms, it
> would be helpful to use it here. I suspect "application clock" would
> probably summarise it, that being the clock for the bus interfaces
> that dwmac provides to the host.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

That's a good point, In fact, I have no dwmac databook now. So if you
think it is fine, I will change this description to the "application
clock". Thanks.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
