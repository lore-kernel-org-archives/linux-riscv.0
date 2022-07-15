Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F952C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 17:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vXcPeeHUfKp3UkqSuhcssnTlHTjd4OS+HYvj2ksXCeQ=; b=GFJNa9pLWPIxWJUYYrfHjsEfgL
	sYfahL7eV4IXeGuYQWNFfJPVLKHrlpXkIaMR61jYJdsxgEMVjrieUZV/X1Cn0rIyc6b6PyLt8qY0V
	a9jUYHhXOhbDamQMAf1BPX6LsenbxIuYbmTLVi6K0fghhMDkVRC9M0mmXkU2mhRvtAWfqX6wZL6/k
	GgTw68AY+HB/UZke3LdizkCTsARjj5lVaVz/83PbTVpIHHaNpKSEZ4/tqgWnIxKBprANUl+In8zZs
	Bv2AiTOk2lmJGlSiKIUBPh3dWfRsYalCA6H7Te07MF7eoWU7rpBZB6M3yqTX61cSss1Dny7pZgMz9
	IO2W2fKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCPAo-009AsA-62; Fri, 15 Jul 2022 17:32:18 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCPAi-009AqD-Gp
	for linux-riscv@lists.infradead.org; Fri, 15 Jul 2022 17:32:13 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 89-20020a17090a09e200b001ef7638e536so12159784pjo.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Jul 2022 10:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=FMOfvIopOBxQCHYl99LpTtFKbEuWoSv6+x2W53JYYLk=;
        b=mQRlV8DlMaaxNeG2XfbAzF1zmK60UayPcSr8VCl/nrS7GD0Hz8Ek6+Xmzkqy9YzFRE
         vTOlFc8HRN7dIU+8p9/FCK8XrYFQGek+Dw8MxJE4OIUKqW9RATDyxsigdjOr+kfppEBn
         BolI/CTr+WxMsIjr/7vOngm24mZPhQhV4wp/SyLKkoBHNAnY737f7X0Yysh8suT3WIe6
         ZfWLCd0q8NZntCoY2QNr64tOPVLcSStDDdzN0Ickzsh5ugUC35gvp5jnWu1GAS4emJvB
         pj4t5piEa1sWssQgPM2IChvKctERbx8d+lzv2cjjvRFCLcLrTTCpxt4DMKHjiMGAlpFZ
         4Uqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=FMOfvIopOBxQCHYl99LpTtFKbEuWoSv6+x2W53JYYLk=;
        b=nzlkJb6Rj3j815M4QSbcQ0cUHBENDRrLG6gRlSs38o5n9DEfvBf3PXWrh3z9bCZaQl
         BC8gYS/yu8mr9v2fOjCp2QKILCB65Nqu9Gt57tPSeaLvMjdhSYUm/hjKqTZQyM1baTI9
         1y0RKWiWYKGnlszNNbh4gmrU3wmLf/H+oKov+2NNBMk36OIzXiynz0mFxd9NYwk2wn1o
         /U20WNUgJyXPDF4B+vB5qay9My2E0vwsS4/272ZdFaKtYz6q6aka61rZYmXroBOW+jzA
         xueUWSC7JYthWsvaV/4rS8FCIpKZhkX38QNj0BFhxbq4AQqqDvU68ICGTqHfxypGSYxB
         iSHw==
X-Gm-Message-State: AJIora8PlW9y9zjerAjII3b89BqZrXgEAvsczhemD7eafR3tnunfVm5O
	pjeFxRoC9rs1vss6ufqzpCHO+w==
X-Google-Smtp-Source: AGRyM1ufpN7BPBos33UytdxFzEwBOqhtIxG1LRso/LfuljWwWM99gIypqhsxt2h1tb1PJap6+bBT4w==
X-Received: by 2002:a17:90b:4c8c:b0:1ef:9d26:3087 with SMTP id my12-20020a17090b4c8c00b001ef9d263087mr23322384pjb.195.1657906329569;
        Fri, 15 Jul 2022 10:32:09 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id y9-20020a17090a600900b001f07ce88696sm3775181pji.49.2022.07.15.10.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 10:32:08 -0700 (PDT)
Date: Fri, 15 Jul 2022 10:32:08 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Jul 2022 10:32:04 PDT (-0700)
Subject: Re: [PATCH] riscv: dts: microchip: hook up the mpfs' l2cache
In-Reply-To: <20220629200732.4039258-1-conor@kernel.org>
CC: daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
  linux-riscv@lists.infradead.org, conor.dooley@microchip.com, robh+dt@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  atishp@atishpatra.org, sudeep.holla@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: conor@kernel.org
Message-ID: <mhng-08c6a73b-d3f9-4776-8efa-d98175c957c1@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_103212_582169_56BF56CE 
X-CRM114-Status: GOOD (  16.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 29 Jun 2022 13:07:33 PDT (-0700), conor@kernel.org wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The initial PolarFire SoC devicetree must have been forked off from
> the fu540 one prior to the addition of l2cache controller support being
> added there. When the controller node was added to mpfs.dtsi, it was
> not hooked up to the CPUs & thus sysfs reports an incorrect cache
> configuration. Hook it up.
>
> Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")

I just noticed this as I was looking over the PR I just sent, but since 
you're sending PRs I'm no longer re-writing your commits and thus I 
won't be adding stable CCs.  If you want stuff CC'd to stable you'll 
have to either add it to the tags in the commit, or do so after the 
fact.

> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/microchip/mpfs.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> index 3095d08453a1..496d3b7642bd 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> @@ -50,6 +50,7 @@ cpu1: cpu@1 {
>  			riscv,isa = "rv64imafdc";
>  			clocks = <&clkcfg CLK_CPU>;
>  			tlb-split;
> +			next-level-cache = <&cctrllr>;
>  			status = "okay";
>
>  			cpu1_intc: interrupt-controller {
> @@ -77,6 +78,7 @@ cpu2: cpu@2 {
>  			riscv,isa = "rv64imafdc";
>  			clocks = <&clkcfg CLK_CPU>;
>  			tlb-split;
> +			next-level-cache = <&cctrllr>;
>  			status = "okay";
>
>  			cpu2_intc: interrupt-controller {
> @@ -104,6 +106,7 @@ cpu3: cpu@3 {
>  			riscv,isa = "rv64imafdc";
>  			clocks = <&clkcfg CLK_CPU>;
>  			tlb-split;
> +			next-level-cache = <&cctrllr>;
>  			status = "okay";
>
>  			cpu3_intc: interrupt-controller {
> @@ -131,6 +134,7 @@ cpu4: cpu@4 {
>  			riscv,isa = "rv64imafdc";
>  			clocks = <&clkcfg CLK_CPU>;
>  			tlb-split;
> +			next-level-cache = <&cctrllr>;
>  			status = "okay";
>  			cpu4_intc: interrupt-controller {
>  				#interrupt-cells = <1>;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
