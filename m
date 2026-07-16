Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00453C44512
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 20:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eT3qxynNVrG3kQRjlUSdZrHhwRvhm/C+k5R7z0vRsXc=; b=qbs74l1RfXcZLY
	7DojzEziKI00hqcnvp1zLVLHgYpue5FLMYmIzmP9ksDfYRumiseb0K3m6APCaBg59GO7HAgrPSzTA
	Oz2UzzsImNjSZq/TS7tGciUeB9JQtbNQwG5Rt8EcGW29kOKFwMVUwHykZow1PRxzztSUN3X935zui
	vl07E/TzlQ0FvxEq1S4IxgWO7TbG+Mw+AwBxRElkV/fcZbHcQa2+2KEX2nKTJPbUsJspWGsv1mQ2s
	hlBOu1c1Flx/KnB3IlRBQO5UA8ayZhmGp3SHuaI2u+0Naf9Spl9JoOTQnSQuOjoCcc7wbyxj3lXiO
	eotSawGzoQDjgBNZLBzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkT4B-00000000XDc-3jOI;
	Thu, 16 Jul 2026 20:52:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkT4A-00000000XDC-17VH
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 20:52:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 708AB40565;
	Thu, 16 Jul 2026 20:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9051F000E9;
	Thu, 16 Jul 2026 20:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784235141;
	bh=EvHV1pVV4qzoVfR956q6ToCZBhjKMPu1tVO7pvo9JGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PTNnjblk9AdZs4ZbqjHCDpuk6WCRWxsb0WiZuQZ4SQlv9CyXF23K+ZAe45/6HZ5Gj
	 0jcRy2hqglfqsNSnf9u+TPgG6/WqLDocT582AveS3gO5AJHmr2ed1ytiKWThZZsTSO
	 ja5uaut5qMB0RyzJA6o6hr0gLXrePuL8oN0k0+WJDLyoMgXaiN0QmNRzKBynqR6cu1
	 lkNJI4hrkrTaXVFryRfpJJeSScS9fhD6j7VbB8+xZy7H19WlBeX3+r24m76zdfNcxv
	 NTTEdR5vQtVAu+hyPbIaIeC+Vi/DpttckPgkHuqRpQ8LhPuCh4HtP+esdLxSvT456q
	 +JvzMPkqZqiWQ==
Date: Thu, 16 Jul 2026 13:52:19 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v2 4/5] riscv: dts: thead: Add IO labels for the IO
 expansion on I2C1
Message-ID: <allEg/A+Gt/em0Hs@x1>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
 <20260714074515.1959352-5-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260714074515.1959352-5-zhengxingda@iscas.ac.cn>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, MoeLeak <i@leak.moe>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Paul Walmsley <pjw@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2026 at 03:45:14PM +0800, Icenowy Zheng wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Add labels for GPIOs on the IO expansion chip on the I2C1 bus.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [Icenowy: Splitted off the patch adding all 3 IO expansions]
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> index 74b120c6b063a..78f5979a56c14 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> @@ -128,6 +128,14 @@ ioexp2: gpio@18 {
>  		reg = <0x18>;
>  		gpio-controller;
>  		#gpio-cells = <2>;
> +		gpio-line-names = "",
> +				  "cam0_reset",
> +				  "cam1_reset",
> +				  "cam2_reset",
> +				  "wl_host_wake",

I am not sure the line name really matters all that, but it seems that
pin 4 is also used as a reset gpio:

  wifi_pwrseq: wifi-pwrseq {
      compatible = "mmc-pwrseq-simple";
      reset-gpios = <&ioexp2 4 GPIO_ACTIVE_LOW>;
      post-power-on-delay-ms = <200>;
  };       

Did you notice that too?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
