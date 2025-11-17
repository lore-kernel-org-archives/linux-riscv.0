Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF34CEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 21:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=irsuzLTg4KTZNWZV6JsawA+DTDXc/66ZGP2VrvlWALw=; b=N0Yv38ZAUa3KHU
	LsNK7yA/BUjAnhsBdFPTQ0CkAu7EakKSWUvdxOfnc5ovlGQpzTbFTFAIMqnrwR2m8kxFdp9S0seNx
	kO8iHGaCt9eN7LOClSNK9ouCMnACSBUUwJKMeh0gLBveHesKurcnVIF/x9wZEmDj4D/ft+nwPBH53
	sZhDXw2INMgbQ2mHl/lPKId8kAGOWbDgqfmL9cvzw7ZN4fh8sdDtCFO5y7MGLM3Fm35AFCrBRFcD+
	QFbBxZcudYO1CbrSX7lkcr/qNkdZWm5M+CP195wUsqrwH9PESitfS8f89B096PVbAUtU1a7qIntZC
	QSEMlO1jW1FF7q/7pbKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL76p-0000000Gua3-2Zv3;
	Mon, 17 Nov 2025 21:50:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL76n-0000000GuZS-2B7v
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 21:50:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DD6E41E65;
	Mon, 17 Nov 2025 21:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586D8C2BC86;
	Mon, 17 Nov 2025 21:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763416200;
	bh=k5gQnXjT4Zu1zVhxsAyW94xCW2aamw7XMtP3OXr2bZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bd8XnHp/htgHuwpbHhkXKbENEs9mtDc4i03VmxgOTSEE8gv9Ly/ijqwPcVx8JM0/W
	 7NLcMgQKwteAIitbZUdaOLHC4hXQ8hNjIYQzJswWup92AWL03jL4SI3KCrWK2/iVFu
	 VFRuxJ+1CTlruV2UzNhpK2J2VOPUzdLZ5P/9INWA5yo0RT1NVloYZA4nA1gIH8hN4Y
	 Mt8CdLbiwNXrYg2qO8c1SIKGzVWbY6x0qyPL9NKu6VQS1e//7QfRFenLfALLynT/v2
	 iC/C6tiBjNHas2qaZWYe8eVIEgofa5kfm7JnbJbMRhvNrProNbH2GLMWkPdruI2POm
	 n2/Lj7nFpKdrQ==
Date: Mon, 17 Nov 2025 15:49:58 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] dt-bindings: soc: microchip: mpfs-sys-controller:
 Add pic64gx compatibility
Message-ID: <176341619765.777522.18084516303513018104.robh@kernel.org>
References: <20251117-mashing-cursor-6e965a77ce6a@spud>
 <20251117-enrich-tricycle-aad89e430b0c@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117-enrich-tricycle-aad89e430b0c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_135001_578282_D64CB5B3 
X-CRM114-Status: UNSURE (   9.85  )
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


On Mon, 17 Nov 2025 14:21:21 +0000, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> pic64gx is not compatible with mpfs because due to the lack of FPGA
> functionality some features are disabled. Notably, anything to do with
> FPGA fabric contents is not supported.
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/soc/microchip/microchip,mpfs-sys-controller.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
