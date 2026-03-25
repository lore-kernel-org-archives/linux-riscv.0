Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEA7109C05D
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 21:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VoQPj/auwRKS+AZUUjakAxRBtfaaUQ/yGoDUtvBvmdU=; b=LoZ+/9qHmkTbTI
	mjFJfiWPGBTZ2qgGInrm4k828wSZvYX85GARUtvADjVsejVtVr7PKLtqdZN5feBkqIhfaoi27mVZQ
	7cpyQZPPJWR6awB3jCBtSGtgO61GwDAw4nRh8czeunpbgVKVAfsbrmVglMp76Bsv5csqPz+dAuRLj
	2DfB4k/Kg4NIQTQLsiW5D07KNbtb9R2OuixbCpvwTmi0wC2Bhcw5wBE4Bd9OwUgHj+hX4erpJUPEP
	VozvMvh/ol3WYxnyFDqR4AceBjdPpsP6eklaVm29/mhkV0ruk9WyCnBQ28vITpjpUQR2on6vy1zpB
	uvBwhn93k63w4t8a62qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5W3e-00000004IIi-1Swl;
	Wed, 25 Mar 2026 21:46:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5W3b-00000004IHy-3J7E
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 21:46:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9C3243D05;
	Wed, 25 Mar 2026 21:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEC6C4CEF7;
	Wed, 25 Mar 2026 21:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774475190;
	bh=4Fe2RtyviX4XAyMQSkJ4js2V2P1pz5B/N7YGrsl9zcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gd+skQjS3BMVlPvY/Wq2/oTBkb3Q/8to8HmZ2p3JV8T6KVAB0Hdh3NuBqQibWG69O
	 sTIdjVfGv/pVHtEboALTgNO8qC4pctE9+BrgnOFbNoSJQWvd2ho2m3stM8wW9QVRrB
	 jsqc/XHaccHO/YHl2JI3wRXJnr8s+HTlQS1fYge0ucJe2vG4RpE1nTr/0s53cFYJ/N
	 M8eYlciKHFcCoh2AdKuge+r0/BbSunYysDZqgLvqP47ttBFcfh4pPQSraN1QvsffbX
	 wKW1iYoqH26weoB/8paywGKkmu9d+XwJSxkzsv/ju6Gl3XS97nHfty+38gOL8CePP/
	 NBfC4CCUN+hUg==
Date: Wed, 25 Mar 2026 16:46:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"David S. Miller" <davem@davemloft.net>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Valentina.FernandezAlanis@microchip.com,
	Alexandre Ghiti <alex@ghiti.fr>, Abin Joseph <abin.joseph@amd.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>, Ryan.Wanner@microchip.com
Subject: Re: [PATCH net-next v4 03/13] dt-bindings: net: cdns,macb: replace
 cdns,refclk-ext with cdns,refclk-source
Message-ID: <177447518882.6335.6622280371140449690.robh@kernel.org>
References: <20260318-surpass-puzzle-f94b46aa8808@spud>
 <20260318-mobilize-rule-d4a704468218@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260318-mobilize-rule-d4a704468218@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_144631_849499_E18A6834 
X-CRM114-Status: GOOD (  15.67  )
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


On Wed, 18 Mar 2026 16:37:34 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Ryan added cdns,refclk-ext with the intent of decoupling the source of
> the reference clock on sama7g5 (and related platforms) from the
> compatible. Unfortunately, the default for sama7g5-emac is an external
> reference clock, so this property had no effect there, so that
> compatibility with older devicetrees is preserved.
> Replace cdns,refclk-ext with one that supports both default states and
> therefore is usable for sama7g5-emac.
> 
> For now, limit it to only the platforms that have USRIO controlled
> reference clock selection, but this could be generalised in the future.
> 
> The existing property only works on devices that are compatible with
> sama7g5-gem, so mark it deprecated, and limit its use to that specific
> scenario.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/net/cdns,macb.yaml    | 56 ++++++++++++++++++-
>  1 file changed, 53 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
