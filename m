Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D185FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 17:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UtiwQ1pJi5wgE6GVNhEEtWkDb0Oe9Sn+xtmBCASwooY=; b=uoa5K0FDShrLke
	X7Ugw9QPYQ9FPLhy5HFWV+YC/bg17l6k0cYgGkBHrS7WaT54tQ+Z+gIMzsHegl3ako33jzzKvMqXt
	qu1FCrck39glg1t+1zfTowyqndZb5/o9pa7EQkiDrKMFR7SkZYQggBwJG+373gRFDnrF6zxG0Xtj2
	Tr5S2RlFiWlX2chwUhvWa9vONCLjjJbTf/YKQgPwDTxJMHBrH018mgu3Uavn4Az86RM1BikreU5KC
	ELJp0UhcYy3sEiko5DhywsmWKN9jLw5LqRdz2ybhCW1bHhCEzB8bJUI3HcGHlXL0lsVWHrCdTRJDp
	LDafVNevVPXAvEJa7Nzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDVUl-003GXD-Ca; Fri, 28 Jan 2022 17:57:11 +0000
Received: from mail-4018.proton.ch ([185.70.40.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDVUj-003GVO-3q
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 17:57:10 +0000
Date: Fri, 28 Jan 2022 17:57:04 +0000
Authentication-Results: mail-4018.proton.ch; dkim=none
To: Geert Uytterhoeven <geert@linux-m68k.org>
From: Conor Dooley <mail@conchuod.ie>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: interrupt-controller: sifive,
 plic: Fix number of interrupts
Message-ID: <D-55Hk0vrg2vkivFR3NXwnyI8hno6J5TA6gRHi3GbGVflgVPOGQNM2auwcIoHVt3fuzkg-pe7MAARda8PG8-KPoEnarmha7U6TI-pA7V6uI=@conchuod.ie>
In-Reply-To: <f73a0aead89e1426b146c4c64f797aa035868bf0.1643360419.git.geert@linux-m68k.org>
References: <cover.1643360419.git.geert@linux-m68k.org>
 <f73a0aead89e1426b146c4c64f797aa035868bf0.1643360419.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_095709_340789_1DD69B48 
X-CRM114-Status: GOOD (  14.39  )
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
> maximum of 15872 interrupts.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> v4:
>   - Use architectural maximum instead of practical maximum of 9,
>
> v3:
>   - Add Acked-by,
>
> v2:
>   - Split in two patches,
>   - Improve patch description and document limit rationale.
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index 28b6b17fe4b26778..57c06126c99502fa 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -62,6 +62,7 @@ properties:
>
>    interrupts-extended:
>      minItems: 1
> +    maxItems: 15872
>      description:
>        Specifies which contexts are connected to the PLIC, with "-1" specifying
>        that a context is not present. Each node pointed to should be a
> --
> 2.25.1

As with the clint - clears errors on the icicle dt, so fwiw:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
