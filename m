Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4802C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 07:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6smtaSy0nGytvvtc+Uwv3ipireDwSHi3QNWM3khkte4=; b=TcFhcwrDqnbzZo
	KC4DnwLkZJ44c7jxhhtSFCWyHfXQyQlOrbf1Nw37T7IqLxlTiWXVjaKMofPs8dEv+qk5qSjb6H5Jr
	3k74pgBrXlFFCwLLWanQ3E8MMfGoLgU6NnGHyVmV1sah9L8Vs1Dxul0ipzoy4jam2vfZUIw+pyRk2
	yJOqG6kVEggP5GDVtIOPG3cPZ/4QTwt8RjNatKRSobHVQsBWH+yyssVOYJfF6jrxb/AI7ZYGFj+uc
	4tB8hkTl5Ft9uIEgtIE0/QVkoXd1aCDU1Vtjqs/XnfoJ5uBbpupGIJQFm+rVu5BJwI36Jl7jRJEXd
	y3TYIniNf+owhdq8TjIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p64kH-00DIlD-Rh; Fri, 16 Dec 2022 07:03:01 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p64kE-00DIki-Kq; Fri, 16 Dec 2022 07:02:58 +0000
Date: Thu, 15 Dec 2022 23:02:58 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: geert@linux-m68k.org, Christoph Hellwig <hch@infradead.org>,
	soc@kernel.org, Conor Dooley <conor@kernel.org>,
	prabhakar.csengg@gmail.com, Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	magnus.damm@gmail.com, heiko@sntech.de,
	Conor Dooley <conor.dooley@microchip.com>, samuel@sholland.org,
	guoren@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, jszhang@kernel.org,
	Atish Patra <atishp@rivosinc.com>, apatel@ventanamicro.com,
	ajones@ventanamicro.com, nathan@kernel.org,
	philipp.tomsich@vrull.eu, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Subject: Re: [PATCH v5 6/6] soc: renesas: Add L2 cache management for RZ/Five
 SoC
Message-ID: <Y5wYIrMZIqu5f+WM@infradead.org>
References: <CAMuHMdUO7iFvh73u+m=EXYyxyePXHahJ=OVwQHdt0ap4vWDG4A@mail.gmail.com>
 <mhng-6160c058-408a-4ff5-8a7d-4fb2886d3d95@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-6160c058-408a-4ff5-8a7d-4fb2886d3d95@palmer-ri-x1c9a>
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

On Thu, Dec 15, 2022 at 01:40:30PM -0800, Palmer Dabbelt wrote:
> Given that we already moved the SiFive one out it seems sane to just start
> with the rest in drivers/soc/$VENDOR.  Looks like it was Christoph's idea to
> do the move, so I'm adding him in case he's got an opinion (and also the SOC
> alias, as that seems generally relevant).

Well, it isn't an integral architecture feature, so it doesn't really
beloing into arch.  Even the irqchip and timer drivers that are more
less architectural are in drivers/ as they aren't really core
architecture code. 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
