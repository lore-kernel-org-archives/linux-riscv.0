Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7138BCEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 21:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCz2n1fNL01w/KnX6o9tax5NynJYfAcpPVgpE2qlCno=; b=NaSZEDegbdSSAw
	ToKhDheSDumlcZODlc5b5DDcCFdcg6XKs9VRfyopccTj02zYyMxZ7N9ZbYQsmc4CktDqn8+7plxQJ
	q/BSrxdRZhc5/sxS8qZ5UDRbT+B0HckfXphIT1WoSdxfWyv6GHGcA3oSYzlVhL9BYI6aA0Yf4ci2C
	PCtzr6/wTJ6p+bHmOLVz+8LJtPYUm2B0p+k2bkcf/An0jEeZjb/cQzaFQCu2FTF22U0MrtvGXmg0/
	Dwb2hWLeKQttu5N7fRoY0wXEQ2eE/LNope6dMo9rgoUaZHnoVJ4Z4lMQngPGWetlZzyIIVEghWSLe
	fvlfYk9FCIpV7npz9Z/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL753-0000000Gu2C-1nua;
	Mon, 17 Nov 2025 21:48:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL752-0000000Gu0y-16hv
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 21:48:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67D26605D5;
	Mon, 17 Nov 2025 21:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB293C116B1;
	Mon, 17 Nov 2025 21:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763416091;
	bh=4hJGMHam+Dd5gmb1dURmkEFt/9NkYcx2ltvjZviBpfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s6vzTmTbE+LjRign8Xs4NXUC+3fBE+sS/v3dHARqBciO8MFXznCrD2pCAOW4+KUBc
	 ZlIw3GeXn/OOyWJBJX658t8viGviYRYRkAPYUOyhxvHuAJEGry5UrswJQvT3JAR9NH
	 UDy3hWQqTX1/LCzDt9NVd9QWyDWTHJrGmfwfDiXwKCbzZ+oOtMcPwAaObzIZJbR6iX
	 WoPnNOW+KPQns7XtNANSdwHuFiybUqoKZ3aKPudBj4ayw35eNooHZ1myoqirT6tALe
	 RFRCNhNdDd6f8rg4WSHUGKm6r6Nzp3Mb67VTSf8DPDKHLA2Nspd4Ma5FgFg7Stpn0f
	 Zr8c0bokveOfQ==
Date: Mon, 17 Nov 2025 15:48:08 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	devicetree@vger.kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v1 2/3] dt-bindings: clock: mpfs-ccc: Add pic64gx
 compatibility
Message-ID: <176341608757.773703.18386473879112962175.robh@kernel.org>
References: <20251117-shadow-police-56aba5d855a3@spud>
 <20251117-mocha-shelter-4d9aa88e34b5@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117-mocha-shelter-4d9aa88e34b5@spud>
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


On Mon, 17 Nov 2025 15:35:19 +0000, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> pic64gx SoC Clock Conditioning Circuitry is compatibles
> with the Polarfire SoC
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/clock/microchip,mpfs-ccc.yaml       | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
