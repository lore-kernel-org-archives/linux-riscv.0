Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F860C021A0
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Feb 2025 08:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJZgzaIu0fu+zIf9fEAIuiVXtojdOP6fbpPjaFXNHDQ=; b=Lo3CEmVQJDO7Ca
	MmPqS2XuaWdTvxLUGl1Ly7h9YP+XUKlDfV4jiMmpAOvbQbh9CkzqIm5ZP8RTpIrgbCc6hPhe0RVYN
	GyypoZiR9VVZI6M53k60E2zkO9vqbdV47e2qHr7MtFB3C0Nd06nOpOynr81cVm9HzD8lMbq2SeVaH
	AEu/OqqwzKaYdhpTXHbRg7SkxFpp0XLRw5EtKfWZiTSRXzFVXntrPRGPX0Zndeb3OV1VLLAjIMDe4
	DUd/p6t2RqTxcCFMxItcP32VkBUIshC5aogcsVAB2LGruv0MTQiRW/aIxQzi2bWKMBkSUdnk/LyNE
	VjVqUSOusJjRwbMnj8Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjDeu-0000000HFly-0D5L;
	Sat, 15 Feb 2025 08:36:20 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjDes-0000000HFlU-0HLn
	for linux-riscv@lists.infradead.org;
	Sat, 15 Feb 2025 08:36:19 +0000
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8E3BC341707;
	Sat, 15 Feb 2025 08:36:14 +0000 (UTC)
Date: Sat, 15 Feb 2025 08:36:07 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, javier@dowhile0.org, rjones@redhat.com,
	abologna@redhat.com, spacemit@lists.linux.dev,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>, Yangyu Chen <cyy@cyyself.name>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/2] riscv: dts: spacemit: Add initial support for Milk-V
 Jupiter
Message-ID: <20250215083607-GYA22673@gentoo>
References: <20250214151700.666544-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250214151700.666544-1-javierm@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_003618_128252_2C4F1B0D 
X-CRM114-Status: GOOD (  15.51  )
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

Hi Javier:

On 16:16 Fri 14 Feb     , Javier Martinez Canillas wrote:
> Hello,
> 
> This patch-set adds a minimal support for the Milk-V Jupiter board.
> which is a Mini ITX computer based on the SpacemiT K1/M1 RISC-V SoC.
> 
> The DTS is very basic but at least allows to boot into a serial console
> and get UART output, similar to what exists for other K1 based boards
> such as the BananaPi BPI-F3.
> 
> Patch #1 just adds the compatible string for the Milk-V Jupiter to the
> SpacemiT bindings and patch #2 adds the minimal DTS for this computer.
> 
> Best regards,
> Javier
> 
> 
> Javier Martinez Canillas (2):
>   dt-bindings: riscv: spacemit: Add Milk-V Jupiter board compatible
>   riscv: dts: spacemit: Add Milk-V Jupiter board device tree
> 

Reviewed-by: Yixun Lan <dlan@gentoo.org>

>  .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
>  arch/riscv/boot/dts/spacemit/Makefile         |  1 +
>  .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 27 +++++++++++++++++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> 
> -- 
> 2.48.1
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
