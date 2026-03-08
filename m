Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124C9EA8536
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Mar 2026 17:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQggxGj6zaCRGWepkEK6UqxxMRO2QN6dr+pI/Vbk5QE=; b=Fk2FZmuI4cymqC
	iBFZRPVedEZjFNSJOSOS8/wUobf8AKrQgfe4S8BQTs3+SNf6L3/xEgdrg5ylCWEwdpLdo+y6DJmtV
	EcyQaM4/KtBiDyonCX9OXnN0EqIMTqU2F00QQ7CbWEgENDdV2SrT0xnwxofYIP2SavUjuqslZh7Xk
	+PkybuWXbAk0h5xieEsyiZAJi9NwhfG/g6JdOsvu6cHxAU8FTrP/TMhwulkuuEAy81LUPf87agLId
	OEplmfiXI69A0vQthFT5shIqmhd7vcKA9SMx46T0aD6WFKVKxh+tatBOTegT5FJ2ru+f4PqqxN+tF
	54d86q6wjECZqp5IVjzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHd3-00000006Ct9-3vnP;
	Sun, 08 Mar 2026 17:09:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHd0-00000006Csn-1dDp
	for linux-riscv@lists.infradead.org;
	Sun, 08 Mar 2026 17:09:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9539943CA2;
	Sun,  8 Mar 2026 17:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D52C116C6;
	Sun,  8 Mar 2026 17:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772989757;
	bh=fYAwFnYbTqXMySr4ooZVkVt5HYSTH5OncHeDP+vD8Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vD5RyWKvYAURCKReKXUuO/oOv+Z0qII/26bjFgtKQT4t9tzbSMHC55EN+H5SwZOzS
	 2wA2Y3mQJ/IvbcA2yxrv8CJYW2OH+mfgPtXxvfD2b/OsddhOS81jTgr5snBOqks1sp
	 qBZ8OKcpbd6GlKJJQjeQFi52SbPvF4qy3/8gz0HP1Ob29r0I/KBM+kaGcZiQh7TVs8
	 JgisiZHCNolIlt9MgzfrhhiYZw5cIFqkbnEdiRPTkxPYydjJEN6qYT7/vtGg/9+1IZ
	 q86FuvuTOj5Jyyud1cQ68g2HQn24n3IFIveG30vAD3szSBQVhlkAJhkUyMs0xwXt8v
	 Uhc9/HeTn26Tw==
Date: Sun, 8 Mar 2026 10:09:15 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v2 2/2] riscv: dts: thead: th1520: add coefficients to
 the PVT node
Message-ID: <aa2tO5OQ0kk3Mubn@x1>
References: <20260305144044.44208-1-zhengxingda@iscas.ac.cn>
 <20260305144044.44208-3-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260305144044.44208-3-zhengxingda@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_100918_472854_2D958C32 
X-CRM114-Status: GOOD (  16.92  )
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rahul Tanwar <rtanwar@maxlinear.com>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 05, 2026 at 10:40:44PM +0800, Icenowy Zheng wrote:
> The manual of TH1520 contains a set of coefficients a little different
> to the driver default ones.
> 
> Add them to the device tree node of PVT.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> No changes in v2.
> 
>  arch/riscv/boot/dts/thead/th1520.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index bd5d33840884e..2160c8b6c2261 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -753,6 +753,10 @@ pvt: pvt@fffff4e000 {
>  			reg-names = "common", "ts", "pd", "vm";
>  			clocks = <&aonsys_clk>;
>  			#thermal-sensor-cells = <1>;
> +			moortec,ts-coeff-g = <42740>;
> +			moortec,ts-coeff-h = <220500>;
> +			moortec,ts-coeff-j = <(-160)>;
> +			moortec,ts-coeff-cal5 = <4094>;
>  		};
>  
>  		gpio@fffff52000 {
> -- 
> 2.52.0
> 

Thanks for the patch. This matches the information in "Section 15.3.4
Temperature Sensor" on page 866 in the TH1520 System User Manul.

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
