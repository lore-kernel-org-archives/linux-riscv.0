Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B191C77B70
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 06:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zgMNElf9cEhFREGbqsqC0HAr8ogNEzYLfsTvaPZ3SbE=; b=Bz4YxB5vsAl59J
	NheWSc0QTYACSYYsGgnb6qQHpEf5Ark9hu0G3blpgnHVCbFWaMPvelskmFK87k6LIUnax2fgeqKlT
	djvDYWOrhQjsodTCJZOugfgL/JTH3suIJZLXMGWPa9buneUCxntUKnG5tqbYosVAtIvcTgjALbMhE
	suyzTc0rMYHDaxOmGkupADDqBrqJU0CozYekfTMEQIxpFIqlQSG2DULFZEG8wVxEgqmfRqKXnb67t
	Ti9eSTieXdNf5Pt6agph62iICznLzZgt7rkMqxVjJM5eDW98PsPofrFwgMorJcxUEgvO1CLfkRhiV
	hb6yk40hwznSmm3/PAMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poIjn-00F6CP-2z;
	Mon, 17 Apr 2023 06:53:19 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1poIjl-00F6BL-2v;
	Mon, 17 Apr 2023 06:53:17 +0000
Date: Sun, 16 Apr 2023 23:53:17 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Conor Dooley <conor@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
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
Subject: Re: [PATCH v8 0/7] Add non-coherent DMA support for AX45MP
Message-ID: <ZDzs3eYIKPFcv0HQ@infradead.org>
References: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230412-populate-busybody-4c6d7cfc4667@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230412-populate-busybody-4c6d7cfc4667@spud>
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

On Wed, Apr 12, 2023 at 09:32:30PM +0100, Conor Dooley wrote:
> On Wed, Apr 12, 2023 at 12:08:53PM +0100, Prabhakar wrote:
> 
> > Note,
> > - This series requires testing on Cores with zicbom and T-Head SoCs
> 
> As I said last time, I dunno what actual Zicbom stuff exists, other than
> perhaps the Ventana lads having something. I did some tyre kicking on my
> D1 and it was fine, although nothing has actually changed materially for
> either of them with this series in v8..

And as saying before, there is absolutely no reason to add non-standard
non-coherent DMA support and let this cancer creep.  If you want Linux
support implement Zicbom, be that in hardware or the SBI.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
