Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49AAC35FF2
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 20:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcHP7GcHXfMusA+Q+EDDx8TAMfrh8r9qOshVF/QYofU=; b=nn4v4HXG4k2Wad
	5gHq+UUqEMa7rCXPWrqveo/LYKE124HsFZFXzvDo42UtNyI+NZ2rTtleTnWUZsh6CE8dOMUmwjBlA
	fx4axk1Ea5+oBFPRskAnGtL0WGXxInh8xZiZjHTZ0NoVzTc+l27znDWnSkwrTrRmoFHbGibeVEZjE
	34ww3W5lk/tBjgr7K1+W2by5Mje5T8g1PT4GdkjzCM16C0BF5YzG+WX718y/kc9y/eF9cI3l7dn3t
	zmJSyiVkLkhUjzTAmUsZ+TL5bddfdlnlxohnaxyOF1LkTYio8E3dO76d73ttHpYkWdrf1Raznvufk
	/IrUTXlKiggvvSAPfXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts6Io-00000006vjf-2ioF;
	Tue, 11 Mar 2025 20:34:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5lc-00000006rTA-2D05
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 19:59:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E8AAA46796;
	Tue, 11 Mar 2025 19:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB074C4CEE9;
	Tue, 11 Mar 2025 19:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741723195;
	bh=a7ft1FG1P7enHItsLHhcaGuRIOritOtiGuKBj8oJcz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rBPJVxj5GfO21nu2i/ZfFuupxvCFPw+ws7YV96bY5T36lgy7bR1ghLdlq6zhwpjYD
	 AjFkGbeiwuXM8XLoL8oXgzYKFkxw6Mu5e8W3L7nh10Lygxx9aEC8lKjPb74hTiBW6Q
	 dcSSc9ncWHoMFz+4dw6VwSbOkH/FrVu8b4IHsr1WpYQGIzBs3Cg8I6PSpe5OobeAE3
	 hm/VSJhkpO+RDpIY5lvajhX3CSu7qTezLTvk2qQcHIhCMK3tBg7nqkAmpjJOj56Au0
	 bepj+jVJftYM6Cd+mEWGdHYLehGGfh7cqwwNlC303BfLQb40Qi6YME/WOVxU7Gucn7
	 Uz0C8nD1UoW2w==
Date: Tue, 11 Mar 2025 14:59:53 -0500
From: Rob Herring <robh@kernel.org>
To: Nick Hu <nick.hu@sifive.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: timer: Add SiFive CLINT2
Message-ID: <20250311195953.GA14239-robh@kernel.org>
References: <20250311051903.3825-1-nick.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250311051903.3825-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_125956_655464_F8793F9D 
X-CRM114-Status: GOOD (  14.72  )
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

On Tue, Mar 11, 2025 at 01:19:03PM +0800, Nick Hu wrote:
> Add compatible string and property for the SiFive CLINT v2.
> 
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>  .../bindings/timer/sifive,clint.yaml          | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index 76d83aea4e2b..93d74c504b5f 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -36,6 +36,9 @@ properties:
>                - starfive,jh7110-clint   # StarFive JH7110
>                - starfive,jh8100-clint   # StarFive JH8100
>            - const: sifive,clint0        # SiFive CLINT v0 IP block

Notice that we don't allow clint0 by itself. We shouldn't start now.

> +      - items:

If you don't have a specific one yet, then add '- {}' for the first 
entry.

> +          - const: sifive,clint2        # SiFive CLINT v2 IP block
> +        description: SiFive CLINT v2 is the HRT that supports the Zicntr
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-clint
> @@ -62,6 +65,22 @@ properties:
>      minItems: 1
>      maxItems: 4095
>  
> +  sifive,fine-ctr-bits:
> +    description: The width in bits of the fine counter.

maximum: 15

Unless you know of a different maximum in which case why aren't you 
documenting that too?

> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: sifive,clint2
> +then:
> +  properties:
> +    sifive,fine-ctr-bits:
> +      maximum: 15
> +else:
> +  properties:
> +    sifive,fine-ctr-bits: false
> +
>  additionalProperties: false
>  
>  required:
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
