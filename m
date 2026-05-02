Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5B8CD3423
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 12:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXOxDEqlJ+8DjEhXtAOsZFcH2PNfJN59MuD9jQEU7t4=; b=09J5+SOdgip2X+
	egC6dlyyCKmo94903BtNcOgdw4Jf59hLkUMVA4layk2rxAocH+qos1kHwZtSPAldaariMF/SZYt7f
	w/8NYyAJufsbjGGvDQKJtN5nhBq/0A36Tx/v36cMLBmShenCJejgm9zYn/TpIUlWzG0ioCGIZdjn5
	uOX1Zt6KhkRLRy4Irvr7noDVaUq1yIW+KZw4prvMfm6aS8zYpbJwSW+ZFgXANvPe+VBxypW4JHGSP
	akI/17k677oSjBskBfxlKifkMcA5Y+kVs6g1wPZaMFLrHMadlxW2x7BW4rfF//s9hfpbDCAJPNWrA
	QpfBEiDl7Odu7q2Jpaaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ91v-00000008x8Y-2aPU;
	Sat, 02 May 2026 12:01:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ91t-00000008x8A-1GdN
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 12:01:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 957CF44468;
	Sat,  2 May 2026 12:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF21DC19425;
	Sat,  2 May 2026 12:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777723264;
	bh=cYlEA7J2N+YnE4244ODfbSDfbaz+mByM60A7ApfHpIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ADpu4nPMCwKotBgOh9ShhpN69OY0fmaT5OWxlb/QysGsFrMl0tM6PJiBgpgQnel7O
	 3dFhDG5c+mbc9GuxK76cx1a+n9jPZpK7bkPLRfXSAe75g1uxWlZpiMCR3/70BbxMkJ
	 ZSdpgYAR/TTpeRtO4mRZz9WlNJNM8Smdsz+TVPw7uumxDtkz7aeEyEIGatnzdXIr7o
	 X3ymaszfjAaIwXCloJilEIgl0zZMmJ2fBa7FJQT208mztCGiFpjtplJlTQvTNYB0nV
	 0Exqtvu9wQTvJ6UJV/ujYTni9aCzDENeKZ67vVRMY0f56N0bAk8HfUq6A9bklBeiUF
	 o8NNjUaKfuGsQ==
Date: Sat, 2 May 2026 12:01:02 +0000
From: Yixun Lan <dlan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dts: spacemit: set console baud rate on bpif3
Message-ID: <20260502120102-GKC3266396@kernel.org>
References: <20260430-reword-overstep-3be08b7eab25@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260430-reword-overstep-3be08b7eab25@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_050105_384947_12955DDC 
X-CRM114-Status: GOOD (  18.09  )
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

Hi Conor,

On 19:52 Thu 30 Apr     , Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Because the default console's baud rate is not set, defconfig kernels do
> not have any serial output on this platform. Set the baud rate to
> 115200, matching what is used by U-Boot etc on this platform.
> 
> Suggested-by: Vivian Wang <wangruikang@iscas.ac.cn>
> Fixes: d60d57ab6b2a8 ("riscv: dts: spacemit: add Banana Pi BPI-F3 board device tree")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> CC: Yixun Lan <dlan@kernel.org>
> CC: devicetree@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> CC: spacemit@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 2 +-

Looks good to me, but I think the fix should also apply to other boards,
so do you want to fix other dts? I'd be fine if you keep it to BPI-F3 only


>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 5790d927b93db..333ac8ebf3f51 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -19,7 +19,7 @@ aliases {
>  	};
>  
>  	chosen {
> -		stdout-path = "serial0";
> +		stdout-path = "serial0:115200n8";
>  	};
>  
>  	leds {
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
