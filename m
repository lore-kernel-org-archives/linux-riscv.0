Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402F4C77B6C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 05:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zyqpz1n7a2IUW3auyPQ2M3dCVKVOdWHpyNF0VjzJNBM=; b=nhJMSkN5s/NvJQ
	B7Uw0aaf26Co3PE5F97tZHTeitqZqPNE2ID9OLHrIqb1WBjK+6YTuwNeHK6XZyNBj03RWu6nRAqbi
	vB3I6jJDufzXD1jpZeSeKsUArI4SYagiYkAietCCcfpM2EzoHpbLaIqXiYz7j7XapL8MXaoNZz8wt
	fFyBCCOKEW2+yrvPdqjA6I9b2SxL+YVxVe1LXil45NPzBOidbvq6Y8U5vC7j3/rWyvRsUKiA8aJm3
	YeGE+SE65bXCLRYGXm+dCaD0OzjlUErVey2zThF0v+LCO/8hYVxP0LtWbDY8WMP+YYaHJrenrqK8J
	MOVB5CM8rTeS2K6MTYDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkej9-009Ch9-1M;
	Fri, 07 Apr 2023 05:33:35 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pkej6-009Cga-1f;
	Fri, 07 Apr 2023 05:33:32 +0000
Date: Thu, 6 Apr 2023 22:33:32 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Samuel Holland <samuel@sholland.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v7 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
Message-ID: <ZC+rLBDkdXWgj7YX@infradead.org>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ZCu1tFrQCVe2sgNz@infradead.org>
 <OS0PR01MB59224C99770F84D8CE2D0DBA86939@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZCxFUb8+eQPzqBmo@infradead.org>
 <ZC9d2DIOMy27AAT9@andrea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZC9d2DIOMy27AAT9@andrea>
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

On Fri, Apr 07, 2023 at 02:03:36AM +0200, Andrea Parri wrote:
> > But other other point is adding more cache flushing variants should not
> > be easy.  Everyone should be using the standardize version.  If it's not
> > implemented in hardware despite having ratified extensions you can fake
> > it up in SBI.  Yes, that's way more expensive than indirect calls, but
> > that's what you get for taping out new hardware that ignores the actual
> > architecture specification and just does their own made up shit.
> 
> FWIW, ALTERNATIVE_X() for "three instructions with (what should be a)
> crystal-clear semantics" already smells like "we're doing it wrong" to
> me, function pointers would be closer to "we're looking for trouble".

Thanks for putting my feelings into such concise words.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
