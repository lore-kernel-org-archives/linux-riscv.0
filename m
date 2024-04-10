Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8B1CD128A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 10:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVfVDUyy+M0vCQ9sUWfJ2+9h49hY2v5QO4DtFRe9/5c=; b=kXc/Wp5pTW1zxO
	OxLYHalIGNdTYxhrfEq4FFeUDlo6FcEBXTjtxcxhvp9d2JAlQK6vgP9DYpMcgv4vPXj2vK0mPJItJ
	tCzF3R/lTh8x4ZqPq62X+XSYnr7rmd9Svp7d++Gl0MPojeFdEWUyAxYFbG2I19jzbxi56w0kyKN3f
	3ukDd83v0ekqp6wv/lvrM7w9hWNPZ5YchSzIdFl3wfK8wWHBZN+Ux9uMhqzAhkwA4dh+n4A9LyJkP
	776IOAUPgXRtmvxJqH5beWgh3bfq4NLOVUgnkdERdWNw7fYuZSmAnxat3iJPTRwy2i50Hbu/DANY2
	s9x+ny+Ek93X9lQloKtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruVKx-00000006QpV-1AXq;
	Wed, 10 Apr 2024 10:37:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruVKu-00000006QoK-0gV0
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 10:37:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1711DCE26C6;
	Wed, 10 Apr 2024 10:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71876C433F1;
	Wed, 10 Apr 2024 10:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712745465;
	bh=V6nc2YAKdgKWZHfMO2mdSMDfQwBidaZh7CVlmeQ/RdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJSundnX+JygdMMTXQhsQvXdAUdTSBEnAWses4V2MkmKT6RU2v7u1bBHWViP4nhOV
	 hmRE6TrSpSr/OukV8DB98dCuiH3oV+7b1g94qsVe23pmwp83G8CqpK4BX0ZgaVCdZU
	 qwDUlnRnarHC/3Q0uMj/feOBJIprsLyHzP52RzrpwaMMMCsjUO/zd/+Qp8grH3GmWU
	 xCs+Z9JvsGIOFEKB/juDLMTu/pDe64Dg+CMCh48WceL1y1dO1Jf8DGySeDpyMYw8f8
	 jnzJYgMQABhIosVmdnijjnE8hzMWTWXlgy45WBSX+h2rcULdQ4yhEYl40BhK89tzws
	 v30JLUDt92KHw==
Date: Wed, 10 Apr 2024 18:24:18 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: add initial Milk-V Duo S board
 device tree
Message-ID: <ZhZo0iJFSn1te-6d@xhacker>
References: <20240409064504.4010353-1-michael.opdenacker@bootlin.com>
 <IA1PR20MB49532A8D4294ADCE0C33A654BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240409-prevent-deepness-2d22bf009b16@spud>
 <IA1PR20MB49534E00CAE29D24F7D7E718BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
 <1514d28a-5e96-4531-a972-894e41902efa@bootlin.com>
 <IA1PR20MB4953CA04D33EA0C7902DFA3ABB062@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953CA04D33EA0C7902DFA3ABB062@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_033748_607941_10CAE255 
X-CRM114-Status: GOOD (  24.65  )
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

On Wed, Apr 10, 2024 at 09:24:40AM +0800, Inochi Amaoto wrote:
> On Tue, Apr 09, 2024 at 03:08:17PM +0200, Michael Opdenacker wrote:
> > Hi Inochi
> > 
> > On 4/9/24 at 14:27, Inochi Amaoto wrote:
> > > On Tue, Apr 09, 2024 at 01:13:32PM +0100, Conor Dooley wrote:
> > > > On Tue, Apr 09, 2024 at 03:17:35PM +0800, Inochi Amaoto wrote:
> > > > > On Tue, Apr 09, 2024 at 08:45:04AM +0200, michael.opdenacker@bootlin.com wrote:
> > > > > > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > > > > > 
> > > > > > This adds initial support for the Milk-V Duo S board
> > > > > > (https://milkv.io/duo-s), enabling the serial port and
> > > > > > read-only SD card support, allowing to boot Linux to the
> > > > > > command line.
> > > > > > 
> > > > > Hi Michael,
> > > > > 
> > > > > I think your patch losts the board binding and have wrong compatiable.
> > > > > Also, the SD can have rw support with proper property. See link [1]
> > > > > (need 'disable-wp').
> > > > [1] doesn't go anywhere useful.
> > > > 
> > > This is my fault, I copied the wrong url. The right patch is
> > > https://lore.kernel.org/r/20240217144826.3944-1-jszhang@kernel.org.
> > 
> > 
> > No problem, I found out.
> > I confirm that using the "disable-wp;" property does the trick to make the
> > MMC writable.
> > 
> > However, it wasn't mentioned in the above URL...
> > 
> > By the way, do I really need those under &sdhci0?
> > 
> > + bus-width = <4>; + no-1-8-v; + no-mmc; + no-sdio;
> > 
> > My board looks happy so far without them ;-)

setting the correct bus-width is necessary for better performance
no-1-8-v can be removed, but it doesn't harm anything because
the board doesn't supply 1.8v

no-mmc and no-sdio to make the probe a bit quicker

> 
> FYI, Jisheng. Could you share some suggestions?
> 
> > Thanks again for your help
> > Cheers
> > Michael.
> > 
> > -- 
> > Michael Opdenacker, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
