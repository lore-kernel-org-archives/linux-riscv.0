Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EFCC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 05:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2HoW6NiaYqnBBjzBbvsIgUhLVzYemsJDecRqYIL6OM=; b=hG5QS5FuuU+L6J
	xiLM43fMJ61EwAWVIj2g9ryTkofZ6Q+PApujpRuvciJtFEmlc2CGO21JBsJ+2cNgzNThSogXTO7hG
	Sml35E7rSCqM42Ms7DeYSZmGb6jrmktcoi3K6wbThslqtNtG/XrOf9Y3uYIeDThttJdVdnUgzvLne
	azNFKWOxCVkBt5dDzBSX+qaoMaIH7yzB2/jwuUPrZRbxHoTnxQviYuj8qSefhUY4u3CzLHctr8rFi
	cpeksOHNriK/PRidGob31GEXvNz75ieinw2r/3ssQbf1SRVmymQfcAAZljAlm1cZYlFB2PV7YHjqb
	+2vO/2haOsyg6cyxsx5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8xqp-006IAd-H2; Wed, 06 Jul 2022 05:45:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8xqm-006I6H-3c
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 05:45:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A2660B817F4;
	Wed,  6 Jul 2022 05:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99381C3411C;
	Wed,  6 Jul 2022 05:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657086320;
	bh=3D6JnTyqnPP2jiPpHSlGQDcx4nSOuFUKoMkf/By5jzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=beHWBKQE3jSY94shQkm5jd1+RuTdBb2ueweYw6N0sIMjpCw2iwAnt8svfD5/V1CtD
	 +vfgei5ddElQG65X38w3m5VNNcfCgo93Bxb9axxKSjaZrjE1ecnx67Gne94S1fa7jc
	 wCrKVt0N9qXQAmLWQyTSdhELrOsNNpHSnPVlYEKGNE7Ha10OJunLksj9WryWN3ijBE
	 ywM0gzVZ+2vvLmJJwJaquNZXVnS5i2rFXFTdSnvcIP8HVrRhMVJBBqY7txkB5zrP7B
	 3FpKbIw7odrseCf9io6Ui7Jc+cDP1wMWpf4ONB+s6Vto9h3LgpizR6VrjUSLAufLYC
	 xHpUiJRr4WxMw==
Date: Wed, 6 Jul 2022 11:15:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 03/13] dt-bindings: dma: dw-axi-dmac: extend the
 number of interrupts
Message-ID: <YsUhbD0zJk43/4oa@matsya>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-4-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220705215213.1802496-4-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_224524_378626_5C6BB2FE 
X-CRM114-Status: GOOD (  10.22  )
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

On 05-07-22, 22:52, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
> controller, but according to the documentation & devicetree it has 6
> interrupts rather than the standard one. Support the 6 interrupt
> configuration by unconditionally extending the binding to a maximum of
> 8 per-channel interrupts thereby matching the number of possible
> channels.

Applied, thanks

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
