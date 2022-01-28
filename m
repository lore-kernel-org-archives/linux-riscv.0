Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B52C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 17:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88sSMo69ZdpXgBZvdLXf2elAoH+RkTM5A/tzOYNFx+8=; b=N0fxjpqzY0uGc4
	kS3R6BK9Sg/Lp+n9ySQtQc/aoMpeAlXZ1CD7PtafAfFC7V5eLh6laQ8O9ovq5ctx6D+noxMjHW0vO
	5L9kd6R50D32k1hZ8mWl1DLFesSL2c56ZQL9kILBFP0GVwanFhpnJ9r+GHcMlLCKdkHrRuolfi/0c
	b04peZNCutMuqN1SEQrTIhohJegn4UT9tAmWMMGeYuM3G874C6lp2HyNNV82/eA0ApqXKlar3cJ28
	0v6nIN4ensIqO5NYIeqxeBpsxoZzDiK6TsQIP/omt+Nt7iUTypFtinC2K3ARirFj0+5Eku3B3PTJa
	8edbE03UrQgLLa3SSfow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDVTA-003G9P-Rp; Fri, 28 Jan 2022 17:55:32 +0000
Received: from mail-4323.proton.ch ([185.70.43.23])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDVT8-003G81-5P
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 17:55:31 +0000
Date: Fri, 28 Jan 2022 17:55:24 +0000
Authentication-Results: mail-4317.proton.ch; dkim=none
To: Geert Uytterhoeven <geert@linux-m68k.org>
From: Conor Dooley <mail@conchuod.ie>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: sifive,
 clint: Fix number of interrupts
Message-ID: <57Vhxv8ckv7WroKy1FfDqfQsDLTkgIaUSc-aiOIftZeBHjDkXLAqDfcsCMHgEYQvPebzA9iZExDD2HfRw-Vmm03d-h-MlwJqH8T8JDSVWrc=@conchuod.ie>
In-Reply-To: <e6a4c5b20d2acb52125d7d6e6c7e3694d7cb182c.1643360652.git.geert@linux-m68k.org>
References: <cover.1643360652.git.geert@linux-m68k.org>
 <e6a4c5b20d2acb52125d7d6e6c7e3694d7cb182c.1643360652.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_095530_393660_9F67F82A 
X-CRM114-Status: GOOD (  13.02  )
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
Reply-To: Conor Dooley <mail@conchuod.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> The number of interrupts lacks an upper bound, thus assuming one,
> causing properly grouped "interrupts-extended" properties to be flagged
> as an error by "make dtbs_check".
>
> Fix this by adding the missing "maxItems", using the architectural
> maximum of 4095 interrupts.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> v4:
>   - Use architectural maximum instead of practical maximum of 10,
>
> v3:
>   - Add Acked-by,
>
> v2:
>   - Split in two patches,
>   - Improve patch description and document limit rationale.
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index 8d5f4687add9e81e..fe4b73c3f269fc0f 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -44,6 +44,7 @@ properties:
>
>    interrupts-extended:
>      minItems: 1
> +    maxItems: 4095
>
>  additionalProperties: false
>
> --
> 2.25.1

Clears errors on the icicle dt, so fwiw: Acked-by: Conor Dooley <conor.dooley@microchip.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
