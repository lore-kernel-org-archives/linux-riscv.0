Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFA2C2BBCA
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljaw8wjjuYoCOfUaAFWWRzLewyS89wFRbVyKDrowbIw=; b=JzwXef7+wicax/
	yOwLmlFxauEo30iJLQIE1lFX6xY0/ey9rXOHQVUi20GJgJcFa1X+3hUEfmgle1bLtawJo9dy0ENjR
	4y0Y1MAREqWeKviRuyu4QrR5IfA3Fj3t2ZzCHm00cdfpvW27wMDqOpeA+F1bEz8tbHIZn4FA7uwi4
	4lOFeOrOjsuk+xqiaKEUBsYuCtbwFoaKWdOWNf24nvgUHZEWcwAoid9TAZa/z6xHO3excYVu6IH0r
	bcuY6/PxgS1tktkecI91FVtSJmI9Ut835CXDbDtlLIOFUrYbH6K04co40Ka/FqsZlSIHKd/YzUWgY
	nE0xir7PwfS5fKPgYeig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7Jw-0000000D8Tm-0XvT;
	Fri, 28 Jun 2024 08:51:04 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7Jt-0000000D8Sy-1OzV
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 08:51:02 +0000
Date: Fri, 28 Jun 2024 08:50:55 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH v2 05/10] dt-bindings: interrupt-controller: Add SpacemiT
 K1 PLIC
Message-ID: <20240628085055.GB1752165@ofsar>
References: <20240627-k1-01-basic-dt-v2-0-3ffa8c189c66@gentoo.org>
 <20240627-k1-01-basic-dt-v2-5-3ffa8c189c66@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240627-k1-01-basic-dt-v2-5-3ffa8c189c66@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_015101_420280_0DB67F90 
X-CRM114-Status: GOOD (  15.15  )
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

Hi Conor:

On 15:11 Thu 27 Jun     , Yixun Lan wrote:
> From: Yangyu Chen <cyy@cyyself.name>
> 
> Add compatible string for SpacemiT K1 PLIC.
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml  | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index 709b2211276bd..3d0426b569042 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -59,6 +59,7 @@ properties:
>            - enum:
>                - canaan,k210-plic
>                - sifive,fu540-c000-plic
> +              - spacemit,k1-plic
>                - starfive,jh7100-plic
>                - starfive,jh7110-plic
>            - const: sifive,plic-1.0.0

..
> @@ -71,7 +72,9 @@ properties:
>                - thead,th1520-plic
>            - const: thead,c900-plic
>        - items:
> -          - const: sifive,plic-1.0.0
> +          - enum:
> +              - sifive,plic-1.0.0
> +              - spacemit,k1-plic
I think this is not needed, will fix it (also dts) in next version
(sorry, I missed your comment..)

>            - const: riscv,plic0
>          deprecated: true
>          description: For the QEMU virt machine only
> 
> -- 
> 2.45.2

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
