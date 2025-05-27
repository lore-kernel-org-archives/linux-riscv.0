Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80512C54F30
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 11:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5b3tDli9Z/yoZQdZeLDa85m/RMJa6kiFSXXSejadsBY=; b=GZal+iWkiij28o
	xIz0odCsPYJfkD92yJCs99bw5f+CkVilCH7F7rjWUll3aHc52jjniPrCdYO8u/HQerMP9rbRN81uS
	7/94lnLjgnEghRLNhIuakztCukS4R7bzQo+Zpaa/tlX23UlvfQg7VNT04NNzxDBjKyISiM4qkn+5K
	VU2Bjqbwlhohccm+YacyoXE8ehpsRIoPCGjJn+Jsbi1PkiyC4MMeOKlZvLbm4lM9+56Dh+7r4dDmb
	/mWQyt4dZUZk2mcDTypbqXrTc9HZuOMu6ACTaLj69i32zONUVQPZa2Mt3mpjlfkLTc2WW8obXEuue
	TvTmoXmWsVHZhnDr+xvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJsHW-0000000AXxZ-3msI;
	Tue, 27 May 2025 11:15:42 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJsHU-0000000AXww-3Cw0
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 11:15:42 +0000
Received: from localhost (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1691f3efc;
	Tue, 27 May 2025 19:15:37 +0800 (GMT+08:00)
Date: Tue, 27 May 2025 19:15:37 +0800
From: Ze Huang <huangze@whut.edu.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ze Huang <huangze@whut.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add K1 MBUS controller
Message-ID: <aDWe2StmB-dhQNtv@jean.localdomain>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn>
 <20250527-friendly-armadillo-of-snow-5bec9e@kuoka>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250527-friendly-armadillo-of-snow-5bec9e@kuoka>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHx5CVh5MGU5CGUhJH0kaHVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktISUxCS1VKS0tVSkJLS1
	kG
X-HM-Tid: 0a97117482bd03a1kunm64e0c64ea7480
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KxQ6Cyo*VjEwFFZMKRYOTzRP
	CTcKCxZVSlVKTE9DSE9PTkhDTEhLVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFJSUtKNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_041540_959948_778016B0 
X-CRM114-Status: GOOD (  13.69  )
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

On Tue, May 27, 2025 at 08:54:42AM +0200, Krzysztof Kozlowski wrote:
> On Mon, May 26, 2025 at 10:40:18PM GMT, Ze Huang wrote:
> > Some devices on the SpacemiT K1 SoC perform DMA through a memory bus
> > (MBUS) that is not their immediate parent in the device tree. This bus
> > uses a different address mapping than the CPU.
> > 
> > To express this topology properly, devices are expected to use the
> > interconnects with name "dma-mem" to reference the MBUS controller.
> > 
> > Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> > ---
> >  .../bindings/soc/spacemit/spacemit,k1-mbus.yaml    | 55 ++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml
> 
> Memory bus controllers go to /memory-controllers/ directory.
> 
> Best regards,
> Krzysztof

OK

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
