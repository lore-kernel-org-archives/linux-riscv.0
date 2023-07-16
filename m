Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87410EB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 16:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJFXGg9veZCKQnh2OwyBRpLKiF0ze8K1C8+tlj58ZwU=; b=NJc8IbmyJ6Q+wy
	DSiXq9AiPHIXH3VV1LkmiiCka5IlEA3pvHi/IhRNubiN59utyhCLrVZb7evOhBPRkVYoIuwhuiYnA
	zcMakKandupEEYdRfKi2DKIWonMmBv4wKegNaVgPGDe7yQDKiIhIIhsLVMu/9sW7nvCQFQMw8Oran
	t0gg65kejMzDW3fLNMcEpKvgEWiVgwsrfZXphyT4hEGWJn4I39oiFKp2Pwi6zNavZzn1c5tgTaNQ/
	Dt5pwnLW8Po7XGyJl0LFtWfaPOlY6OACr70G4Pf18ewqzzYS5ndLpq+o+GDSWavjAG4dckAARM4sv
	JqDjd3kxncXPyajfjMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL4iW-00CxgW-2u;
	Sun, 16 Jul 2023 16:35:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL4iS-00Cxd6-21
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jul 2023 16:35:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 34C7E60DB4;
	Sun, 16 Jul 2023 16:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0593C433C8;
	Sun, 16 Jul 2023 16:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689525322;
	bh=gY8zTOWN+oMFyatXIo8LTprkvrYU5gzVL1TL7vQ5pLs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bqS3FjIQgJXJNEIliilYLF0zUtQHjRKQMMipkE6FtAcYjKBLJBCtLCy6XHUb0jtbp
	 YYntTBMk0nHLzxyOR05unM4oaFWq3n+Foww+cnuVcfm23DIpfNh3Hzm3Iftv2gUSJI
	 mvywJ5s6ZJlnAiMmZhsHLFAsA4eY4RcRFfm1BEBX32ER8NVsTP5yNaf2EPvWiAJfD4
	 cYvhszHs4rwBlI8UGgUju6wSn9s6VQtj0Z4BF9G/1A5S+lWHcQvmL3VDDGtyat5fow
	 E68a2DbYzS4vb44eLzSmXAWLHcW9+QSeo+dgNNKikHwuzWrywn4Js/vNPst1hPI9eV
	 baiIrcpXntNFg==
Message-ID: <dd5d7fed-cda1-8ab2-d502-7466def675ac@kernel.org>
Date: Sun, 16 Jul 2023 18:35:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/4] riscv: dts: allwinner: d1: Add CAN controller nodes
Content-Language: en-US
To: Jookia <contact@jookia.org>, linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-can@vger.kernel.org,
 linux-riscv@lists.infradead.org, Fabien Poussin <fabien.poussin@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>
References: <20230715112523.2533742-1-contact@jookia.org>
 <20230715112523.2533742-3-contact@jookia.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230715112523.2533742-3-contact@jookia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_093524_729688_4FAE21E3 
X-CRM114-Status: GOOD (  18.57  )
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

On 15/07/2023 13:25, Jookia wrote:
> From: John Watts <contact@jookia.org>
> 
> The Allwinner D1, T113 provide two CAN controllers that are variants
> of the R40 controller.
> 
> I have tested support for these controllers on two boards:
> 

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

> - A Lichee Panel RV 86 Panel running a D1 chip
> - A Mango Pi MQ Dual running a T113-s3 chip
> 
> Both of these fully support both CAN controllers.
> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index 1bb1e5cae602..b185398334be 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -131,6 +131,18 @@ uart3_pb_pins: uart3-pb-pins {
>  				pins = "PB6", "PB7";
>  				function = "uart3";
>  			};
> +
> +			/omit-if-no-ref/
> +			can0_pins: can0_pins {

Wrong node naming. Underscores are not allowed.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
