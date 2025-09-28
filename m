Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45EDCAC5BB
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 07:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYMCzKYY0lLv08N9zFfE8Pq50/XLwB7H/A+Q2zi7/8k=; b=vLazsn6IEGE9k5
	crnRFqj1HpkG4CwdAYuNhSfehrrUHKFTv+VEkd4UmBoXOYbLbmyY1gzp/vJ/9SGc09FeEwIx0Pl8D
	jkpnfLQCbwgaOs4P6+7HUOzI96tqkBTRGqRlYZxuZqsj44v8tP0WKetZkjGbapX735MhNR/E79Jxv
	i3BL3Zv8wu49hQEreV/kp3JAhMixdZGqHePZ0ahPZae7AIH/49Gvw+7esVdzehhuE1tGMEgRmmRYG
	RluKTy7cvoX1KNKGQ9OaOkYQ3rXUZ6a8j3t4ymk+2E7TcDboHzoE1CVTLSUl/z+qxz3dDhhRcdVPn
	6iViomdkOtuUHHhL/thg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2m9s-0000000E8Rz-1n2Z;
	Sun, 28 Sep 2025 07:49:24 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2m9p-0000000E8Q0-41F3
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 07:49:23 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BC76E340D6C;
	Sun, 28 Sep 2025 07:49:19 +0000 (UTC)
Date: Sun, 28 Sep 2025 15:49:14 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: riscv: spacemit: Add MusePi Pro board
Message-ID: <20250928074914-GYA1344940@gentoo.org>
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
 <20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_004922_023178_8CEF233B 
X-CRM114-Status: GOOD (  14.30  )
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

Hi Troy,

On 12:16 Sun 28 Sep     , Troy Mitchell wrote:
> From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> Document the compatible string for the MusePi Pro [1].
> It is a 1.8-inch single board computer based on the
> SpacemiT K1/M1 RISC-V SoC [2].
you could wrap at slightly more characters, I remember 72 chars
(haven't spent time to find a formal document link..)

> 
> Link:
> https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf
I'd suggest to list core features of this board, while using this link as a complement,
base on previous experience, vendor may change the link address, thus the link vanish

> [1]
> https://www.spacemit.com/en/key-stone-k1 [2]
> 
pleae keep them in one line, no break, and no blank line between SoB,
something as below
Link: https://.. [1]

> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> index c56b62a6299ac24d3cdef7edcdfc407dc62a1846..52fe39296031f21d1c28c4f1ea5ca9fe28caf45a 100644
> --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> @@ -22,6 +22,7 @@ properties:
>            - enum:
>                - bananapi,bpi-f3
>                - milkv,jupiter
> +              - spacemit,musepi-pro
>                - xunlong,orangepi-rv2
>            - const: spacemit,k1
>  
> 
> -- 
> 2.51.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
