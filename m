Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC27E7B601
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 12:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gLu0BEOFWCswDjKcvyWMVVRDsjdoZTlhO8vypqPdjA=; b=DlYGWzTWBG+gPc
	g7a4DcgGPqi379p1YoaUMExnIav50zJtKtwAxAUwfGfrsUaNtnoahmR9mwmzNHZJ+vwCXEy+P5bb0
	JRBtevuRbo3yrCAaLLFlx6IB8fTAUDETPKxA4tLKF+P++ylM3VjUA2iLOwI5aMd5j2bkbzysTOrRZ
	Lsj35YTqediywkk+Wsisl8I5+1htvX5Q29Og8MQcH7J+Y2bI3yiZVE9sDNmwwWrb2powjeI0rU2hX
	0jzojLZjhClOXf78/Erbk2QdwwELPjZ3IzBNSW5e3PHWqsWgw1qEOOoE2XCunu40NM8i/TYmvSvmZ
	shopqOMGv/SKE8rZ1bWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0wh-00HavD-2F;
	Wed, 04 Oct 2023 12:25:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0we-00HauN-39
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 12:25:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 40FD6B81884;
	Wed,  4 Oct 2023 12:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73F4C433C7;
	Wed,  4 Oct 2023 12:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696422338;
	bh=rz8nsBRJGgdImTfTRQ7iHKEAJLSF4eOEhtWc3FE31aQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFisLVHo4xPOWe0fhwbNCUkMQeehaqaQXzmq2gwElyLHbB+hlPM+w9q/A0UhGISeJ
	 XLwrKX8yClJIjpyp/MgG2+FzVp4HbGidJDj27Qhk6bHe9ekNtsmcOdr694CD8OVgQB
	 h9QT4RlLtaSjpNEEEpGynpT+4dB2V0FBd6wa1j06w0CzJdCNXlxt828HbuYFsaiAf9
	 EnSNtXjnPRJzG1NhD28ZBLk4yaP6fqQ8O90x0kok38bopHI6fclkb2kLzmFXGrug71
	 dDoSSsGPefEsebjfIQQMnU4FvUWAeBm37gqRnq+BYBGmk+Y82OopJUFOFfsOQheNJD
	 /GW2ghyf2ITqQ==
Date: Wed, 4 Oct 2023 20:13:30 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Chen Wang <unicorn_wang@outlook.com>,
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC v2 6/6] riscv: dts: thead: convert isa detection to new
 properties
Message-ID: <ZR1W6lI3O6Pkjxm3@xhacker>
References: <20230922081351.30239-2-conor@kernel.org>
 <20230922081351.30239-8-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230922081351.30239-8-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_052541_317267_A52EC822 
X-CRM114-Status: GOOD (  12.69  )
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

On Fri, Sep 22, 2023 at 09:13:51AM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the th1520 devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index ce708183b6f6..723f65487246 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -20,6 +20,9 @@ c910_0: cpu@0 {
>  			compatible = "thead,c910", "riscv";
>  			device_type = "cpu";
>  			riscv,isa = "rv64imafdc";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <0>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -41,6 +44,9 @@ c910_1: cpu@1 {
>  			compatible = "thead,c910", "riscv";
>  			device_type = "cpu";
>  			riscv,isa = "rv64imafdc";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <1>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -62,6 +68,9 @@ c910_2: cpu@2 {
>  			compatible = "thead,c910", "riscv";
>  			device_type = "cpu";
>  			riscv,isa = "rv64imafdc";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <2>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -83,6 +92,9 @@ c910_3: cpu@3 {
>  			compatible = "thead,c910", "riscv";
>  			device_type = "cpu";
>  			riscv,isa = "rv64imafdc";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <3>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> -- 
> 2.41.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
