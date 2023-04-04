Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFACBC761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 05:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uA54pLRtnHgVqYVb1dME7nLfudgVS5bJNudAM99B+yo=; b=ffav1X7q6CGDH3
	9pTmPUxMRjQD1qN1I7kDNpfTSsd/dfANP4XK0/5h57brj2OVWWFHTMHrmRySb4v1m3Vn1NwVmmPrt
	GHH4rhMZSuy3hASMVeBETFueEedmH+LLTB6K8u+kw0eozy3COTg3BZ51JNuBbk5z+KuxTUFODTUVm
	BRGKlB2bxDClM8EeUk+CzN2VMgC5rRQmapnbF2kYprXjdJsqFBG0cfDStwzNEycRs+rU2hSwmQesw
	xvJ92et/lcScKX5PnIAlchOXg4/07s5c9USY/KaQ7CBA2lDCopQzQJKg4qbZfCa1r2OYjFp7w96Uk
	EqSMlKDg4oRx2hW3ix4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjZEW-000617-2u;
	Tue, 04 Apr 2023 05:29:28 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pjZES-00060U-2V;
	Tue, 04 Apr 2023 05:29:24 +0000
Date: Mon, 3 Apr 2023 22:29:24 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v7 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
Message-ID: <ZCu1tFrQCVe2sgNz@infradead.org>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Thu, Mar 30, 2023 at 09:42:12PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Currently, selecting which CMOs to use on a given platform is done using
> and ALTERNATIVE_X() macro. This was manageable when there were just two
> CMO implementations, but now that there are more and more platforms coming
> needing custom CMOs, the use of the ALTERNATIVE_X() macro is unmanageable.
> 
> To avoid such issues this patch switches to use of function pointers
> instead of ALTERNATIVE_X() macro for cache management (the only drawback
> being performance over the previous approach).
> 
> void (*clean_range)(unsigned long addr, unsigned long size);
> void (*inv_range)(unsigned long addr, unsigned long size);
> void (*flush_range)(unsigned long addr, unsigned long size);
> 

NAK.  Function pointers for somthing high performance as cache
maintainance is a complete no-go.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
