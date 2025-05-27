Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2D0C54F30
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 07:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qlj/xQ94e7SDpuMKEhF/AU/KtbAMEo5iuxaCW629DHc=; b=vxZshsz3d3pTrA
	fMFmjkWuirNmhRq6FKQPAkIR4nNhcEwurHPZiLycwGapAHPrg0AyoJbMFIeGIcrSBcpQTr5+pcFC2
	e1f0IHUuIvlhIu9ioOdnLhhno+7vDFQNmG/hv2syL1Bwk2zXOL2wnvjWS9dA7pchwD2GBNKsO4zZ/
	F8//1qO0lBuZJeRkfzbKfZH/PvEWzDuWAqN1sGv9OI7Tkw0kkyd16bYJptRtvPvQMm/rOTPrJ6qdk
	mdTg+TTaBo/K+lieAGRs+P3JfzTW4UrjTZvryNTSz8D55uKY6x8fZC/VIzo39JlCWiAlt0vxUbyq+
	5hXBv56pHfEv9OsOzsSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoQl-0000000A7IS-1rbJ;
	Tue, 27 May 2025 07:08:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJo67-0000000A4Ks-0voS
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 06:47:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DF3E5C4BA8;
	Tue, 27 May 2025 06:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC02C4CEEA;
	Tue, 27 May 2025 06:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748328457;
	bh=/pstASAAdU5HMcN6gKRnngJO2l7aRoiRmGIw04Yt6CA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qdO6IYtnl/A0QJHyrMkXYCudtVIAs0GvVdFdvYWhIeFJKbwhNy3CE7zuRM1PX3tqN
	 oXXVxyUHqzExPCwnAjvm3Wfj2PPVUaoRMlp/+aBilqBkuBYf487nHOuWE01D5LriHu
	 NdS4Eg3vzyMgTzVRa9r0Ih1hzVS3KwrJWMztztKEsMcUmeCVi0lxEjv60IBvxwQlLN
	 hmtAiWIDvZV8BuDJxXhKREJs6/Wb1Hz4YIdzkqJL7kaavH8shfkue2i/YVFwzJqaA9
	 fhQSXvDjFJFBfuuEFjJJv3GlYYHJ+/5OOmnA7G125tD94GEcsizwM8WqqHNv+QmYdE
	 c+3yfpTSAOWqw==
Date: Tue, 27 May 2025 08:47:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
Message-ID: <20250527-amazing-hedgehog-of-opposition-bc968b@kuoka>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-1-63e4e525e5cb@whut.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250526-b4-k1-dwc3-v3-v4-1-63e4e525e5cb@whut.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_234739_305409_677BFFE3 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

On Mon, May 26, 2025 at 10:40:17PM GMT, Ze Huang wrote:
> Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
> in the SpacemiT K1 SoC. The controller is based on the Synopsys
> DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
> DRD mode.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 116 +++++++++++++++++++++
>  1 file changed, 116 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
