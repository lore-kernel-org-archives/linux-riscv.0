Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75E6C3600B
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 08:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GCgsSWa4f2BfPGy9jwERPPyHCVukHkg8kRK2ttYTq3A=; b=AUwxLyoHgCbeL9
	zEa3uPlmYYHrU0rR/KrpiFk6R1aFQml5IobNhEwV1pLe7swk+xAiXxYyz3yveJylf3LwNxXmstbrE
	8xqLffIsENTNY2btwxf5ylDY0ndPdRj4cIKcAHYarjtmJQwNVIjPuBO7e6MC7rmlp1RHTWiW9uUta
	04KJncwTPy9ejro/kmO0Wnj34sAE3+PHzuhxCbwjsAzTeG5Z78gM+sBFc3scKP3YqfC3Z4GkD/mcT
	0BOG8Akmq6x1Cr0bwMwY+yRQMfCB2stKxhdXJpSzceOKVb9Q1rdw4GBnfkHHe6gFXmLdKLRUHM4SG
	xZr1x1z5EnSBNnkXXhvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twzNX-00000005AQg-060R;
	Tue, 25 Mar 2025 08:11:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twzNV-00000005AQ8-1KSL
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 08:11:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9618843B01;
	Tue, 25 Mar 2025 08:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E849C4CEED;
	Tue, 25 Mar 2025 08:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742890276;
	bh=sqdqt6cZvQDX0oVFnEsMmomrp/59fMvqIHre9ETCDls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PMAY3ru9tqbAtQHP+Mmh0vHI9ITvVoixjATT8q9BGmYBsUbdiuyw5Hx/u0kdIZspb
	 U27ZCeYIB2w5HMp6W+6gkT79t/2g2nIxcQqN028eqrj29zXDfVu61sGpa6aHVSWe4Y
	 flDNs8AMn7f7tmMYkzsjJSqdKPR2vZNhoJESVKcJeAEQ7rg0/jT+h8KXT89mTu5e8Q
	 p1/VI/ALO8ukV0nhSKs42FfLUUQEn3LL8Umu8U5uIJnhIrQAKUoQ5zhqVTGoGYcSQD
	 cXqGW983DM3/cNO5YhMxxWQxAbDdgCU4QOIJnWbP5ZtLbJ1gO5a4QaWPp7SVkrW+Ua
	 7iGQ0CbFBtpBw==
Date: Tue, 25 Mar 2025 09:11:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	pierre-henry.moussay@microchip.com, valentina.fernandezalanis@microchip.com, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Lee Jones <lee@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/9] dt-bindings: mfd: syscon document the
 control-scb syscon on PolarFire SoC
Message-ID: <20250325-analytic-axolotl-of-prestige-e82aff@krzk-bin>
References: <20250321-cuddly-hazily-d0ab1e1747b5@spud>
 <20250321-idiom-remedial-daeddab1dcd8@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321-idiom-remedial-daeddab1dcd8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_011117_371674_BC7266DE 
X-CRM114-Status: GOOD (  12.67  )
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

On Fri, Mar 21, 2025 at 05:22:34PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The "control-scb" region, contains the "tvs" temperature and voltage
> sensors and the control/status registers for the system controller's
> mailbox. The mailbox has a dedicated node, so there's no need for a
> child node describing it, looking the syscon up by compatible is
> sufficient.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v2:
> add the control-scb syscon here too, since it doesn't have any children.
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
