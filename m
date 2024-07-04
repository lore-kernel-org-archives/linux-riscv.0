Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E96C30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 14:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5qh00Llc5dH47x2XEJeOTIUwb58vufzI7Z1hAgRu9M=; b=exHWu3I7wnlMU1
	q4sNvQObnoqmiphE5FgQf6xjVmZqlGuFfyKdiWbWvgnGJZOe9uiGxEZE5iqsXVKyGvEmTBklMyAJ9
	1B39QfM4EYO9baDgfi2jJdARTGCSpdkSOCWShN1boJ7/iSTga9R1IsZMLyZJChx/gkhIJrC7JA+9y
	BEAHExeLFV2jzjOnO7G6RxWran6MVZYKBJxxQ1GqmWHT4SYCtMUiEbFnmy9NpqWWnfSLkXE2+Zrq9
	XXRHyd0JPn2NjXD1+I02Qh0W3HAlOrX0ShbgjZ2oKwA4ZDoZopHmXUkycZuMJRIa2zlmOrD2AmN2x
	0gDOSN3snlQpQsxnn6mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNHL-0000000DQ4w-32fh;
	Thu, 04 Jul 2024 14:17:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNHI-0000000DQ4X-39Jm
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 14:17:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1BA42CE34D4;
	Thu,  4 Jul 2024 14:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D02DC3277B;
	Thu,  4 Jul 2024 14:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720102658;
	bh=SusMqoQix19RFodccF+ktpMi/I4/Jwdyx6c19a7rm2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sVW9hvGhah5nixxTU7OuPnLSMWSdHN4ZlsVpGf7jARG4mwYV2VEQ6BxAgV1Dtzq1+
	 ULPw8uHgLPJyCcdg96j3HrkBk/oPAwK0qMKzI0nJPScqns+Y3s2FL1XqN1ev+I/M7I
	 TTEmBpGna7qBjqx3fXTeJEnmzBpZGCfvybDT4bNZXce7mR2J2qfhoVomHgcSsKFrd5
	 RL7ssrxm+lbuw0y2aAPK7Acehtwk52T6RNJgUYW2c/WxSRLgbXr4SAIbV1f4TXGMkE
	 tZCe/CE/IKayIGoegNxSYqg90Zi6kq278eiNHQwuM34McuPZ8wivV2xiemfvtldz8C
	 CLUxhh33YctWg==
Date: Thu, 4 Jul 2024 22:03:29 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>,
	Inochi Amaoto <inochiama@outlook.com>, linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Meng Zhang <zhangmeng.kevin@spacemit.com>
Subject: Re: [PATCH v3 06/11] dt-bindings: serial: 8250: Add SpacemiT K1 uart
 compatible
Message-ID: <ZoarsYMNJRu1-_wn@xhacker>
References: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
 <20240703-k1-01-basic-dt-v3-6-12f73b47461e@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240703-k1-01-basic-dt-v3-6-12f73b47461e@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_071740_985696_E53F47C4 
X-CRM114-Status: GOOD (  16.48  )
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

On Wed, Jul 03, 2024 at 02:55:09PM +0000, Yixun Lan wrote:
> Found SpacemiT's K1 uart controller is compatible with
> Intel's Xscale uart, but it's still worth to introduce a new compatible.

Per vendor's kernel source code, all the uarts support 64Bytes FIFO.
So if it's compatible with Xscale, it's a xscale uart 64 Bytes FIFO.
From this PoV, the uart isn't a Xscale but a mrvl pxa.

But I have one question: is the uart really a mrvl/intel pxa uart? or is just
reg programming compatible with pxa?

> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
> index 692aa05500fd5..0bde2379e8647 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -111,7 +111,9 @@ properties:
>                - mediatek,mt7623-btif
>            - const: mediatek,mtk-btif
>        - items:
> -          - const: mrvl,mmp-uart
> +          - enum:
> +              - mrvl,mmp-uart
> +              - spacemit,k1-uart
>            - const: intel,xscale-uart
>        - items:
>            - enum:
> 
> -- 
> 2.45.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
