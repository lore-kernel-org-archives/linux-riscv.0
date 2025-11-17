Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6BACE8D6B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 21:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUI6MUUhu439d57RQDpm70ZhrfEoARgc1IhRLTq3ssA=; b=iPpYzXC5AlhukO
	6nr7KbaAFcZ1Jh6rdaTY4M8zzTyXisGRH8N2J/3HecbsXjSsIxccNVO6uxFjDkDI7vIRHSXH91OPk
	ApN/kkFfiFVX82afUTSbGwpQdGlhIH2JfYWPrHawM9/4mF8AupEPxl1Rpr4bE0pKVzZpGnNpxGNtp
	bWMjGGshz3mmJpy7GaqrehiEoW8UM91sPaMm5tn/1vf2KVUT+k/WaaxyLyuEsAxGeNHYQK3UlGZQf
	/wlGyRdjIoxORQRCgR05xYfgviDeq+ByBqsJMpRyy6veI1iOO+Tfv8Za9csnOImp9aXAa4B+OhZv/
	p6MdX+1i16fGd9eT6sHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL75q-0000000GuLg-3tc4;
	Mon, 17 Nov 2025 21:49:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL75m-0000000GuKZ-3e0s
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 21:49:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46F7541907;
	Mon, 17 Nov 2025 21:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13F7C4CEF1;
	Mon, 17 Nov 2025 21:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763416138;
	bh=/QxgtEDA6YpI16K6FQgJL2zNBpKHW+yaDuCFoKTVXEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DDKWLeD5pd+rNAunQo9FfVBzZs+GmH05H4D9ZSvFyV2O/CZKWT1OP58tQj6TtMfhP
	 B/cUCWoUlNoQEc2MPulayrLCPWsUCO0uEGEY6XQncHgqMTfcQYFuuWCRUzIPZu4dJS
	 mUpKvPW6yrx+0v3DIuMc6kuUygSKFOgtftazvmO6TNQQJ+9JFCPYZ+32BlNz4BOv7H
	 0BQveNj58TFqCW29w/81nuyVJ7MnJEH7O6WyhjHSlJD6RdTKCeQWuUOQ7WKpWM07yp
	 zmFIsQroQE/xhba4AumCyedVKVuXJZU7o+RYrhEnID7F8OIj0O3Zr+x4SZybOLAe5E
	 L5ZfEpCj1FTPA==
Date: Mon, 17 Nov 2025 15:48:55 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: riscv: microchip: document the
 PIC64GX curiosity kit
Message-ID: <176341613496.775081.7467395849902975094.robh@kernel.org>
References: <20251117-paprika-tipping-e7bb3e211d6f@spud>
 <20251117-gliding-sixties-6d06ed7412d7@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117-gliding-sixties-6d06ed7412d7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_134900_284589_E8E23FD9 
X-CRM114-Status: UNSURE (   7.87  )
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


On Mon, 17 Nov 2025 16:53:22 +0000, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> Update devicetree bindings document with PIC64GX Curiosity Kit, known
> by its "Curiosity-GX1000" product code.
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/microchip.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
