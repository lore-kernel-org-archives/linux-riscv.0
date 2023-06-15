Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5FDEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 06:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xPXUl8r7A8T0Wscr+SU73Gv3Kpt9NF1IxbGJkWeBncA=; b=iHFkDXyFmDpW7G
	deF874CirmpNGBFrEKtdDXMEy20/Da9cmEzGBkx2aSji7Yx7QqvcQ5ZSmUP8sA8yuVTmldAlJyyKh
	6VK1JNoodeI1ysMdIucQ+Xy2+5/zKDv7jVCuCXMdl33GhYAPnMCwIuApJaTWgnAEuQAkf4nBCqZ1P
	tmC2MXEHOf15UnH9Vg4dHmXY4HQ/QBz4q2vv5iMDSA5YXUYPnOAcyI68AI4pb9YvGRVE/EKhr+/e/
	dMnuno4syJsyjEFkApPn15FgdV1XdVh1e7rcGqZ+PjVSnCYOEHib5OqDeKzUvsW/f7hKRO+hE2akM
	Hp+1RLaWKHGJ38ZBHFvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9g1c-00Dn45-0k;
	Thu, 15 Jun 2023 06:00:04 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1q9g1Z-00Dn3R-2f;
	Thu, 15 Jun 2023 06:00:01 +0000
Date: Wed, 14 Jun 2023 23:00:01 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	"Conor.Dooley" <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	guoren <guoren@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v9 3/6] riscv: mm: dma-noncoherent: nonstandard cache
 operations support
Message-ID: <ZIqo4TsHJr9vdQaU@infradead.org>
References: <20230614104759.228372-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230614104759.228372-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <4f69fcfe-debb-4979-9070-1d58ba35032c@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f69fcfe-debb-4979-9070-1d58ba35032c@app.fastmail.com>
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

On Wed, Jun 14, 2023 at 02:35:44PM +0200, Arnd Bergmann wrote:
> I understand that Christoph will still not like this, but I think this
> is as good as it gets, making the standard variant the fast path,
> and using the function pointers only for the nonstandard cases.

Yes.  And I really do not want to make the non-standard cases easy.
The extension to do cache maintenance have been ratified for a while
and under discussion for much longer.  Adding random crap because
vendors suck is a bad idea, and we should not be adding this crap.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
