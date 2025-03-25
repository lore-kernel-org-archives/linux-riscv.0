Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DC0C36008
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 03:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2u4JhN+fh+E/ZkQ3FYitQ5wOyxoaecCXgm/IuaUg/JI=; b=Mx0dby46ko5E3v
	JmjQ7LP8w0CKIVrthXvY23AHcsklhclBScZWgNz6vQCPFeC3eoqfFcchasf6a5HZHX3mSCTJfBBPf
	/01wVFUZlDD68//aYwe+Fx+VYBPm+WUnGtuI4/SW8fNMNtCYcr/0dxoCntV0MByqE4ogaohiH+IiU
	9q/HS/4ghmC3I7eqHNO7tShw5hApbBdhxwxUFL8RkXEW9UxQtiarYMdYzglkU/xi7p4X7tTShWwrY
	/BH1gF4zwwyJJ822MtnBaU5cZlJ0CHUozk+3KGrA2S1t3x3A7ttn5eqEfHP04ddUKp8/EoPoHHFwo
	t1J6PW+olazb1o7Clv4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twuqx-00000004kx9-3umd;
	Tue, 25 Mar 2025 03:21:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twunf-00000004kab-3h9H;
	Tue, 25 Mar 2025 03:18:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 34D295C597B;
	Tue, 25 Mar 2025 03:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E1BC4CEDD;
	Tue, 25 Mar 2025 03:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742872678;
	bh=WcCXntLzQZit3QH6kE07eF3DJST8a8sxgtc9AKLM/C4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EtR8HaKIzsyqurMH3hl+zowqyTXnZbefgn8nTrqgS6D0JLDXQZJCBx/Bmp5Up9CY1
	 gnw7310T3/E81oCGVOl3M/0h0GT1t0oXtBWhpPdDErgzlmpZeT97ZPwkzPJGPCBVcF
	 yWcry+K4QCr0QrAridbY4k5lNwXkQRUdV1AWce0aAakiTFoZ1DSG/yGqkYCjlkc3KK
	 bH41B4uKAHyFihg0FHXCL/Gj2iHRlhglv3qNRplI4dXwns6PpmRRW2b8Kx2K/7NeFg
	 y0ei9AwlZcdHapHGTMiifYhxh3nzcoJzzVw/6/HBE5LbQYcd7KQQIO9nF/4OVRDC5O
	 C60gLEjrmlbig==
Date: Mon, 24 Mar 2025 22:17:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Michal Simek <michal.simek@amd.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pci@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Jim Quinlan <jim2101024@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greentime Hu <greentime.hu@sifive.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	Tom Joseph <tjoseph@cadence.com>
Subject: Re: [PATCH 2/2] dt-bindings: PCI: sifive,fu740-pcie: Fix include
 placement in DTS example
Message-ID: <174287267578.1624713.1754304673947660629.robh@kernel.org>
References: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
 <20250324125202.81986-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250324125202.81986-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_201759_973480_461F0631 
X-CRM114-Status: UNSURE (   9.54  )
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


On Mon, 24 Mar 2025 13:52:02 +0100, Krzysztof Kozlowski wrote:
> Coding style and common logic dictates that headers should not be
> included in device nodes.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
