Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1C5606A326
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 18:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CHZnFamD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=KR+WWrD1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7IrXkNC1GLkQWCA10Q+x0gOM3iKXQY2PLm2P0YnpXME=; b=CHZnFamDg0Om/j4k2qmvp+pA1V
	Xe9K25kg5r622eEFYzcf7okPhynR7AN7Rad48OKWsst/rHXfg3nANDw07PrJHZAwIecWEP/x/q5Vj
	RcLTrzvIrEKx7UVb8H5nhWpbAdsTUN3ffpALMC003nqMAbOsSy0gCwInlIIqcRHSEWoYpUE5siHm1
	twiGzsAuzB5FBj7SOSX1vhqNyS5MtihjcyII/t7gqkt+YflTaifV3j1FaQV9PI8E0k+qCyGU9s06f
	XmFWYj0mK1dkBsfskUykS3ZMh7p9lThhI8v1gYW0FNrXNcbXrihlLLWMg78DF5vu84F8vs3QVoj1W
	YNv+EdpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPP2L-0000000DSaM-3IaF;
	Fri, 06 Nov 2026 18:51:41 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPP2H-0000000DSZL-2XmK
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 18:51:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1793991064;
	bh=iJbBBhTmKjC5dRrCLy16aHqmWzeHhMuPJOjPj2I65fU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KR+WWrD108d0d/sYexPx39IKW86oSjbsjrOCmPuw3W34yzkDbyeNaeBIS8XMhO8WB
	 7tMxeUMUhoTElvyviKL11+FSdDQlft2RsphBOXrxsir5wHr/h57XLvqyEYKBBFlPc9
	 +80VI8yoTKjKH2oomZX1Bo+yyz1MtF4/RsEJ8WcaFi9MbdPwhSAkjxtWtRjwYAVraT
	 3s+O/QIvfPivtDJg61+vT27QTIJE3j8WBZZuEU67v0cfHDA1dWTQcjULWLZI++/U7k
	 0ySb2nbxgLCOLRbEYF8WjPbrxUfJl8KPlW9CtPraMUkH4t60DMg/gaa9hoXuP1jR6W
	 ZqqRemClp+ETQ==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 8823EB220432;
	Fri,  6 Nov 2026 19:51:02 +0100 (CET)
Message-ID: <179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de>
Date: Fri, 6 Nov 2026 10:51:00 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status
 power LED on
To: Owen O'Hehir <oo.hehir@gmail.com>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261106184055.3891621-1-oo.hehir@gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261106184055.3891621-1-oo.hehir@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_105138_232060_898440B7 
X-CRM114-Status: GOOD (  15.25  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Owen,

On 11/6/26 10:40, Owen O'Hehir wrote:
> The firmware turns the status power LED on, but the node has no
> default-state, so the LED switches off when leds-gpio probes and the
> board looks powered down.
> 
> Default the LED to on.
> 
> Tested on a VisionFive 2 v1.3B.
> 
> Fixes: 1ec99dfe9eb0 ("riscv: dts: starfive: jh7110-common: add status power led node")
> Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 64de468f2..7ec94e968 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -44,6 +44,7 @@ leds {
>  
>  		led_status_power: led-0 {
>  			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
>  		};
>  	};
>  
> 
> base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b

I think this change may disagree with fastboot select function on
VisionFive2 Lite, where (if I understand this correctly) it is read as
an input; see that schematic listed as the "VisionFive 2 Lit Schematic":

https://www.starfivetech.com/en/index.php?s=docs&c=search&keyword=schematic

You may reference also the ghidra archive
https://web.archive.org/web/20260718140236/https://freeshell.de/e/riscv64/hrv-jhre-JH-7110%20BootROM%20analysis_2026_02_22.gar
for decompilation of JH-7110 BootROM loader, and there (to the best of
my understanding) it is not interacting with that register so it must be
purely the SoC reset state.

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
