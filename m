Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0C6D2ED0F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 11:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=etRK7Z9Y3ikLdouqVKcxld/KDsiN+j7qsbSeCgmm6U8=; b=RKAZr0l/yGOkZB
	wu94LDqB2Cb+OqcqhuwxG8YyODGSNrlK1OzG3rdVbkgo44L+yNdel8WBpnY25CsU1rkF4IA3D3+AF
	ZPoIkQDG9qqsbQ3VsQ7xnKfzl4E2YuybwFC4Twp2HVLjVAWwqgYeuCSd535lC1Z3PSip+YiQHLwt0
	l9ZQ5xAgRi9lzcb3WtIE4LRoWdzBXH63ApT3lRbFgcd36g0bxWoIs2RuGJuTN3RHF6rgIw234pVIU
	PZ4UFXc3S81jn60ptp0w/cNDWyiHtiCU9BTYzN7jiZ3rBJ9PzyseHTZtoLLw5X+V+MNdAjuEY3OKT
	gNHF1SZDvS7FzexV779A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA5d-00000003jHP-09tq;
	Tue, 20 Jan 2026 11:40:05 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA5a-00000003jGr-0Ef3
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 11:40:03 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2b1981ca515so5659897eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 03:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768909201; x=1769514001; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QeACF3mv4Ishn0NV7RQhnzhSMHx1UMVLhYGwPqoV7AE=;
        b=c7J5Rd9IPmCPInQEN9rNX8GpTC0xNK8sI5BInaXGYpwWIk1dvu3r9ohz4Y0mQFdqQt
         /FHrzCQz96hD0KDINAouQavGUM6jd4RzBYJC0mr6V0Sy2BEFSzr+HiwG1sRW7+4atUdg
         mlune4VmdgzWzcwP+ou1sXoQm4sKeEMZNn+UFzRxCFpAqFQOyPKd3VAuV9V6TNnjwyZq
         OdwPo3Uia8la7Z6sLnwjS9P/7c3MPwJGF4BKVdjMwQp0KWZRL8L+e6FvqOeSxqKBfe1C
         OTb6MFdYYSJbn92bZsVIcCdcGcBQ+TUMYpl/ezZ6y730qYxRwGcXZtHzSPCARfRsZJIe
         yh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768909201; x=1769514001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeACF3mv4Ishn0NV7RQhnzhSMHx1UMVLhYGwPqoV7AE=;
        b=WPBWqWRzcZsQZ3r57vHvSWHKOyiKWa+9WbL59TcxJAk7dfRJrvK9QXhvUFFfhCB7pZ
         2/0Tx0iyPV5cdD6Yq5s4g6M1EaFEFneJJrGlbz2d2qO40hFkIyvyK64pM8ZZ7gpDte8Q
         Ee43c7a0M0cewZGEdLRFo57gvI1kLDGyrrH9xTS2TJ0+ez+pzDPH5xanrnuJ/ClLecdB
         04o6b84DD3HY5+k0WI8mKSpQFKwAaelYvrSstcoHGSaSDVjKZfujI2bdyhF5W//TjQhN
         zTzenNGjZ7fMpTA0bD0l4GngfujYl5Za7D4uEElN7xy4K6tj4x980HcDAPbxqD+rsxLp
         rmnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqeCBFB0HZLlensF5IgpR8EmaglDOW1vwdZmUi2KOOrCvR4sG7PnJ9BGrJQCkkBpzaLEjOVOyLZTs++Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+lLLZJZaCuNWMBxsc5nc2SAtAcQVr3vnS9cRrKsPU+OPrcXEX
	jnMrNzdcWFRu+Hz3OYEoU9TQFSGWfjtdYiI6yv7n0MRwuyguW75WHUXzexhj/iAf
X-Gm-Gg: AZuq6aKfDE+X6pNNgSyTRk/CKwXNGnzOcH4RCvAlh25WOeoxHLPUHdv2byz6q3T+56S
	D6GOtkOWk0ybJb3xOqceLhjzzDqcKfxJ8OCrWJ6RL/7PjocYgk9X8JGBsMSXF0dcok0D7wyrsQ/
	uTkvjKrnMjlFq3M97ev2C8nxmuUIQOA2QPoMB3+g+niyl2Oe/e3uKs6TwA9np126ZyQIp8vbP+0
	IzYnekgNSgzoQoMusZkU5VwAw/FndsWMkk7pNjobvfOnXqJF8f77re8pOWMnMb11c5l3MCrStm3
	448ijLl7s2VJpL/8NUbBRrILtHuI/DkmN0GK9kMsiDqxmP4hgIJY/QcRi0w9iJAnzQmkmqdZNry
	C2K5tPDfURI+cVmRfVHBr/G4pZh+MVSwrMGMIRRYlArmWMCOytx5Mfmt2NX0cywPPrr+edFB780
	iVOxsIXthquQ==
X-Received: by 2002:a05:7300:2315:b0:2ae:5967:db5d with SMTP id 5a478bee46e88-2b6fd746cacmr1048269eec.13.1768909200775;
        Tue, 20 Jan 2026 03:40:00 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6beeb4b9csm17558900eec.30.2026.01.20.03.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:40:00 -0800 (PST)
Date: Tue, 20 Jan 2026 19:39:49 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yao Zi <me@ziyao.cc>, Inochi Amaoto <inochiama@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: Add support for Spacemit
 K3 dwmac
Message-ID: <aW9ou-lsQQ5dVzqW@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-2-inochiama@gmail.com>
 <aW9fL7r0AM0flALJ@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aW9fL7r0AM0flALJ@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_034002_108429_5B093904 
X-CRM114-Status: GOOD (  23.90  )
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

On Tue, Jan 20, 2026 at 10:55:43AM +0000, Yao Zi wrote:
> On Tue, Jan 20, 2026 at 12:36:06PM +0800, Inochi Amaoto wrote:
> > The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
> > MAC (version 5.40a) with some extra clock.
> > 
> > Add necessary compatible string for this device.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
> >  .../bindings/net/spacemit,k3-dwmac.yaml       | 107 ++++++++++++++++++
> >  2 files changed, 110 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> 
> ...
> 
> > diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> > new file mode 100644
> > index 000000000000..58dd98f79e8a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> 
> ...
> 
> > +  clocks:
> > +    minItems: 3
> > +    items:
> > +      - description: GMAC main clock
> > +      - description: PTP clock
> > +      - description: TX clock
> > +      - description: PHY clock
> 
> Why does the MAC require "phy" clock? Shouldn't this be handled in PHY
> driver instead, or I get its meaning wrong?
> 

IIRC, the "phy" clock is used to pass the phy from the mac core, I will
double check if it is possible to connect to the phy directly.

> Also, I don't see "phy" clock is acquired anywhere in the driver. Is it
> really necessary for the MAC?
> 

This is a mistake, I remove this by accident, if it is necessary, I
will add this in the next version.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
