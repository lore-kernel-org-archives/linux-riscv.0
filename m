Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42977C531D0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 13:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3PntX2zkPjqhXLhiYQyhQCLgBYu/LjJu2bAa9w+k4k=; b=G9ZXr2cnjwQ7gU
	fkBIQKb3uWaiUE9F4Y5iSBo+cANuzRxlZwO/cohL4Fx6DlVu1svegTOJByU2yHBUXS/5Rcsx0aSYC
	ZuJTnFPpSRvBO19PD1bjF/olnBc0DpcH/Ckb0J9X2ST9mpWV5M0cpQZXA5mNrRlPcuyR+4kxDzrBH
	uW/0T2FNdf0lp5YB7zo0D53t9Zmh2LMZrWXWkRZ2N9D5L7x2o5mPBsEFOduxYZElFTLJ7vUKgaWzx
	vGnOq3/Ci3fvxdW/4Cbx0d06j1uCRO6TtnWkz2x+X7kWSs55oTqgMv3HOba+EmhdO7CZZiqcAF9GE
	CDitH14aOFjo7AvxKDqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncQG-00000000NZ7-2DdN;
	Sat, 25 Jul 2026 13:28:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncQE-00000000NYo-3Dmc
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 13:28:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1734341215;
	Sat, 25 Jul 2026 13:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AAC81F000E9;
	Sat, 25 Jul 2026 13:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784986090;
	bh=h0WVTrNqm2vTc3/56dVsB7JggUAIXw2Y+0evxBAD9XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G25tGZQwqVd7GR58SDdll5vPMe1mOc0QskFm3OxBAi8xWD8lJWgKWeIHgth+cShU5
	 dxTToTDkeE5eK/ySOsHJxKlctJzyx4gIu4fdfKUaGB83LAzLbnsPshw5/sWQEEL8yE
	 +FkGVSdoh5kdi9eWaT/KxI8yTp7llg2K1nYKfIaayUbUJS9uKGZ5BohcwKPNUiVn+u
	 Lc1Moj4roRR11j9DfLFdg3S081jt6KE2TLosdsA4fI9L+cEqV/7EQK8Bk0LQBgPlHZ
	 85Wk/zBkHJqKocNbK3psiScKS603E7/mtg9cVa0kzJd7OKCGZJzYSG5Tuv4y3hNmC5
	 GfLYXvKbnj2Fg==
Date: Sat, 25 Jul 2026 13:28:05 +0000
From: Yixun Lan <dlan@kernel.org>
To: Jennifer Berringer <jberring@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: dts: spacemit: add eeprom for K3 CoM260
Message-ID: <20260725132805-GKG77545@kernel.org>
References: <20260722202848.1817988-1-jberring@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260722202848.1817988-1-jberring@redhat.com>
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

Hi Jennifer,

On 16:28 Wed 22 Jul     , Jennifer Berringer wrote:
> SpacemiT K3 CoM260 Dev Kit has two eeproms: one on the compute
> module and one on the carrier board. Both use a Giantec
> GT24C02B-2TFLI-TR.
> 

Patch looks good, so

Reviewed-by: Yixun Lan <dlan@kernel.org>

> Jennifer Berringer (2):
>   riscv: dts: spacemit: k3-com260: add eeprom on i2c2
>   riscv: dts: spacemit: k3-com260-ifx: add eeprom on i2c1
> 
>  .../riscv/boot/dts/spacemit/k3-com260-ifx.dts | 15 +++++++++
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi   | 32 +++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi  | 12 +++++++
>  3 files changed, 59 insertions(+)
> 
> 
> base-commit: 199380e4d8cd22e539a08d4949e9582b09390bd5
> -- 
> 2.55.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
