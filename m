Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B4710706E9
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 16:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WirfSr/lGilYGWHbMG1KKGSdgbxQrO8G7m+Vt5PKgZI=; b=u4Rk9h4JkfzG/I
	Zs8bjtbpsUXmm8OK+FPJje/uV/4Bg9/nzAxmHwFK/lIBHMkH4AS+FY6qK8wFZDrj3DwoLLPESNBWG
	uUBJmUcZjLMiPxRQzAm+feJbftsPm4kR3dq5iXt205BmJFNueMrXGXXxoRtYF8LC23gkyvQtQRj9j
	FnIUlpr741JwJT01aXWZCqg8UBso7Wr6JTCF2Mx2VMj1Apv5T3hsMRkV9ysWYZ6nfjQnRnhl8+YGG
	82leL4DoPz/bkhbTrQ1TpYiDX6n0VSRc0nYw5jzkySzhRJnh5oX+4w6btD+szTPaEWOBqaUvXC0G0
	ZmDlAy6A7qRiJ/FV/Hqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1SJA-000000020jk-1QE7;
	Sat, 14 Mar 2026 16:57:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1SJ7-000000020jD-47Kg
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 16:57:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C1F343E85;
	Sat, 14 Mar 2026 16:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3899C116C6;
	Sat, 14 Mar 2026 16:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773507465;
	bh=1QgLBpuzpumxuzLwiduaG7BRUXzEsWH9tCQ1NLudE8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBhpxFbxjovN1pMXc5+sqAYNmShCKqCCyPvMkI4tqtFmDWvmRzovEEjhSdRZgoXil
	 aBGufqNe/a3q1NYbm5dXhoNVZUPPYOAdzbKgl6N9nPoGnW4jLiwG1MgN3R/64fB8QS
	 MW78SLQJuOBnmRbmwG4nA/vQ/dVrt0jQZa9OJdrzeCzlTxBeY94JHCzSYD5OewNUQn
	 Jwi2f02iERKsUAVQSO6x63WD6GrZ5LqigbS5nAE4cYfuaO7/tDumj/HnmtAo4JKSft
	 8jwlKJGCTrbNPfZIH0/09yDkb/AUSZA6H57GBrEiiXDk8SQA0bGyEleaoqglERplrC
	 SL2cyuxjpuGIw==
Date: Sat, 14 Mar 2026 09:57:43 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v3 2/2] riscv: dts: thead: th1520: add coefficients to
 the PVT node
Message-ID: <abWTh/HkVAiIjInt@x1>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-3-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309162457.4128205-3-zhengxingda@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_095746_035082_BC38915F 
X-CRM114-Status: GOOD (  16.23  )
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rahul Tanwar <rtanwar@maxlinear.com>, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2026 at 12:24:57AM +0800, Icenowy Zheng wrote:
> The manual of TH1520 contains a set of coefficients a little different
> to the driver default ones.
> 
> Add them to the device tree node of PVT.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> ---
> Changes in v3:
> - Added Drew's R-b.
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

I have applied this to thead-dt-for-next:

https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=thead-dt-for-next&id=2592a7072a816be80337b0a85e6279f75498262b

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
