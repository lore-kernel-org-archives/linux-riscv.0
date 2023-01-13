Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAE8C54EBE
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 08:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5nDxc/3YEuVIWg5RQTlr0NJeLRyvId/ADSKETcRDik=; b=1ERBPIDr8AFoiE
	gTelZPocs6nSg2Q9yDw7ywn5aaAByrnHwbbjj1L6itOMR5ILPm2OPQ42ScuOEzHLtPc9JJX7ZUw+a
	xNETfyPhmNk98Scq0oJ8OnyzecJWtd12vvdwPbZ+N6IpMTROnfp2S9hwlZ+sgR61c8AriKgAtcVpw
	KZ3hGzWH0kC2HWNVffGM5CDJFg1hVgKZl9HF07xBhTbJIT2tdvtZuHOwerPTqA5h1GSKavFkhCmzG
	ct8rp0L7h+36yTjA0o20L6rpkGNwQKIUZlwXO5lQv6DL1sAnLojh/9xA/Vy7WO/oeWAM2gj56i6We
	F+FH+CGNQAjxvqyeYRdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFcD-001HeP-Nr; Fri, 13 Jan 2023 08:40:45 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=formenos.hmeau.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFby-001HXh-DR; Fri, 13 Jan 2023 08:40:32 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pGFbi-00HA2b-73; Fri, 13 Jan 2023 16:40:15 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 13 Jan 2023 16:40:14 +0800
Date: Fri, 13 Jan 2023 16:40:14 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Samuel Holland <samuel@sholland.org>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 0/3] crypto: Allwinner D1 crypto support
Message-ID: <Y8EY7kALf8bYNwov@gondor.apana.org.au>
References: <20221231220146.646-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221231220146.646-1-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_004030_625172_C10A8A62 
X-CRM114-Status: GOOD (  14.83  )
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

On Sat, Dec 31, 2022 at 04:01:42PM -0600, Samuel Holland wrote:
> This series finishes adding crypto support for the Allwinner D1 SoC. The
> driver patch from v1 was merged, but not the binding[1]. This turned out
> to be a good thing, because I later found that the TRNG needed another
> clock reference in the devicetree. That is fixed in v2. I include the DT
> update here too, since the SoC DT has been on the list for a while[2].
> 
> [1]: https://lore.kernel.org/all/20211119051026.13049-1-samuel@sholland.org/T/
> [2]: https://lore.kernel.org/lkml/20221208090237.20572-1-samuel@sholland.org/
> 
> Changes in v2:
>  - Add TRNG clock
> 
> Samuel Holland (3):
>   dt-bindings: crypto: sun8i-ce: Add compatible for D1
>   crypto: sun8i-ce - Add TRNG clock to the D1 variant
>   riscv: dts: allwinner: d1: Add crypto engine node
> 
>  .../bindings/crypto/allwinner,sun8i-ce.yaml   | 33 ++++++++++++++-----
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 12 +++++++
>  .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  1 +
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  2 +-
>  4 files changed, 39 insertions(+), 9 deletions(-)
> 
> -- 
> 2.37.4

Patches 1-2 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
