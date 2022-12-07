Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B96C4708E
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZaZooOO/KYCCR3Vb8EstDrAzlvnVzHP4v/L0pe8huN8=; b=EmiJUVhAN63cwl
	C86n6r5jGK4t/2hqxp+NzD/nwuvLsr4GRSstdfPlcXtCBtOP814+jsxZaOW+9xfeP4rJKPWMp009i
	laEXwr4x2wzRA9vvdRC9tBtpoe8XeTy8Hu7D2obXuJQmjQJ1scn2T7dnh+2PF3oKSlfd7vDyjtpPN
	L/i0nn0wTT2Vyg8TnfPHZXfFmDBtgapLeODZy5dek2NR+k/1NO2EUJCGWKeGyXY40N9JCqR+iIFtg
	v1oINIKlmmhc9eooysbEVcrpm2jNrL4JUQl2Ya6CX9VgDUwr5QwCf4fKhQpKnT6aDjGSkY2ek1URb
	IjRn5Xm46Ky0obn9unGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2wYQ-00610f-V3; Wed, 07 Dec 2022 15:41:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2wYH-0060qB-Cb
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 15:41:43 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p2wYD-000425-8S; Wed, 07 Dec 2022 16:41:37 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, anup@brainfault.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v3 2/4] Documentation: RISC-V: Allow patches for non-standard behavior
Date: Wed, 07 Dec 2022 16:41:36 +0100
Message-ID: <4208290.1IzOArtZ34@diego>
In-Reply-To: <20221207020815.16214-3-palmer@rivosinc.com>
References: <20221207020815.16214-1-palmer@rivosinc.com> <20221207020815.16214-3-palmer@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_074141_492778_BFB6FAF0 
X-CRM114-Status: GOOD (  23.49  )
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

Am Mittwoch, 7. Dezember 2022, 03:08:13 CET schrieb Palmer Dabbelt:
> The patch acceptance policy forbids accepting support for non-standard
> behavior.  This policy was written in order to both steer implementers
> towards the standards and to avoid coupling the upstream kernel too
> tightly to vendor-specific features.  Those were good goals, but in
> practice the policy just isn't working: every RISC-V system we have
> needs vendor-specific behavior in the kernel and we end up taking that
> support which violates the policy.  That's confusing for contributors,
> which is the main reason we have a written policy in the first place.
> 
> So let's just start taking code for vendor-defined behavior.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Link: https://lore.kernel.org/all/alpine.DEB.2.21.999.2211181027590.4480@utopia.booyaka.com/
> [Palmer: merge in Paul's suggestions]
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  Documentation/riscv/patch-acceptance.rst | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
> index 5da6f9b273d6..16b90a31d267 100644
> --- a/Documentation/riscv/patch-acceptance.rst
> +++ b/Documentation/riscv/patch-acceptance.rst
> @@ -29,7 +29,11 @@ their own custom extensions.  These custom extensions aren't required
>  to go through any review or ratification process by the RISC-V
>  Foundation.  To avoid the maintenance complexity and potential
>  performance impact of adding kernel code for implementor-specific
> -RISC-V extensions, we'll only accept patches for extensions that
> -have been officially frozen or ratified by the RISC-V Foundation.
> -(Implementors, may, of course, maintain their own Linux kernel trees
> -containing code for any custom extensions that they wish.)
> +RISC-V extensions, we'll only consider patches for extensions that either:
> +
> +- Have been officially frozen or ratified by the RISC-V Foundation, or
> +- Have been implemented in hardware that is either widely available, per

I guess the "either" should go, as there is no "or" part.

Other than that
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

> +  standard Linux practice.
> +
> +(Implementors, may, of course, maintain their own Linux kernel trees containing
> +code for any custom extensions that they wish.)
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
