Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E788C3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 20:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mQz7ltk78Pngplf/O9MiwVPKYJTvloMNVOxtYgIkBUI=; b=jCxOZ8L3clkNfX
	AppVcs/XLVBkpKBKnvleCi+3W46pHdfCC0Nk+7xxz+rCQMKcHFYu/cXqS3+17+HP9DWNjmffxzFFb
	4KjyiSxQtYBrZttso/k6BJ5wzI5pNE3rPRf4D/tK+yTdoi1jIGbcxndDMc8WijJkmdnTLDqWChPDu
	Xfbf/wiemV9zDMoUo+qJzS5aNSxxWybNVzCtv3msiHIagRxZdcpw9MLU+o3hG0iaN2OAJNrK8Egvz
	05bOG9qDJL66RfvnVaiqoiK0UpW9JkKa3fpU0OhuO5OE299OxArRZ5kgWaYGGhtFq7Du6Ls4jaEwo
	vGs98C6oYST2bGzl/gbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2yts-0000000BqUI-030l;
	Thu, 10 Apr 2025 20:53:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ytq-0000000BqTO-0k7M;
	Thu, 10 Apr 2025 20:53:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B62BE68452;
	Thu, 10 Apr 2025 20:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B6DC4CEE9;
	Thu, 10 Apr 2025 20:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744318404;
	bh=BALhi4UrMbOHA37ho5uqHpYpjwN+INMK6vrW7q6TxLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T8Vyz6cfJb/zRX/vLBSm8X+PPVyWrHbSmVVfybfeJ25+JlQOaUtD0X9QKcHfOSUY4
	 ejqEG36LkwZ0X1thU8D3+5KGySCJJ8OoPMp5rz7kuVNnZVIjl0HZbO5h3FvCpOLbuo
	 ZjsGQNqEj8XqjX9icWiqTZlPyy5NOVoomW6aFXTar7Tv49ayJuvgef0UU6SNq1S2vI
	 rKphEYb/zcsM2gzUVXGW1EwI9a+su8oreolWTPBWzhlDtBWeO11xFdmAGfP3Ivtz8L
	 GgiKk8Bg3NmuHJSLAcD5HYi7qNOKhMbI1juoCitot4icgIVzohwjBbgLmW1f/kglbS
	 +p8eQKJSg+/Bg==
Date: Thu, 10 Apr 2025 15:53:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
Cc: Conor Dooley <conor+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 1/7] dt-bindings: phy: spacemit: add K1 USB2 PHY
Message-ID: <174431840229.1041655.15249977458763916963.robh@kernel.org>
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
 <20250407-b4-k1-usb3-v3-2-v1-1-bf0bcc41c9ba@whut.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407-b4-k1-usb3-v3-2-v1-1-bf0bcc41c9ba@whut.edu.cn>
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


On Mon, 07 Apr 2025 20:38:46 +0800, Ze Huang wrote:
> Add support for USB2 PHY found on SpacemiT K1 SoC.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  .../devicetree/bindings/phy/spacemit,usb2-phy.yaml | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
