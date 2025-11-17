Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51053CE8D6B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 21:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKhBoX742Ze+t9Hgcdx7Ktu819kZUtxl6cLEm9D7v3s=; b=TLkS1NembeSWI6
	Gza6UBJ9TiupGUAw4JzaE9C6i4tp82y/tXpz++t4yBuCnvosTXQ2L7Q2dEd8vEipyMwTkq1vHbNHD
	7PBHnGD09Lw45kdHcSHaWRtCXAQYBsJSnXwv6I5NQWetKsesTkrTr4zoYRfjC3YbsGMLit6i54vuM
	BpETHR0W3Tm+PJqM1qJr6/0VX24ykJfPtiEKf9Zp4Qr1QqhGfawjSfcivcrGalP9h3CEDf/KpORP8
	dngf5KdQ/KXBLIXpp598vjLCzF/KZgjHbb9RDqpQmw7RLVAQ6TPgyxj/YAizx0XMZIAqX5Elmw+pM
	XHdN3ljtYoeqU6K8NOuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL76Q-0000000GuTQ-1BpE;
	Mon, 17 Nov 2025 21:49:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL76N-0000000GuSs-2srl
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 21:49:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 144A443DA5;
	Mon, 17 Nov 2025 21:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B45C113D0;
	Mon, 17 Nov 2025 21:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763416174;
	bh=zULtQAEc/RJC1iTsQ1ss10DWTBCe8QVuV0gb7mwTNg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EJ9HjT26q29SD0V781PN5Z9Kt4d3m+zYLfOctcpJY7zxsF4HjXQxLklqEUbjp8LTz
	 a42zajtJ3NeZUNIGbAOQywMtwyQqkwSaArPhg32fcx75aiiPI5+WxpRYJZI+NNdqnr
	 4n+hqjd0fnvLG0kC6JkyI1lhfVI5fi2wgp3UulvEDH9C5aoa6jR1DVMAPcItSpVPjB
	 yCez18DqouQMu5q4sd6udD8BRu4Gf5lSOtg5RZ2e7m3zQDMrXxbQSLEXFvnPwjIY1W
	 bx1kHS9pcbItK7G6/m3KTaJt0salzI+ikEmNUoBlyXSUHN2yKWJUWVXLIFiGH/7CcE
	 PJBnjahqixumA==
Date: Mon, 17 Nov 2025 15:49:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/3] dt-bindings: soc: microchip: add compatible for
 the mss-top-sysreg on pic64gx
Message-ID: <176341617183.776831.8253090739304684550.robh@kernel.org>
References: <20251117-mashing-cursor-6e965a77ce6a@spud>
 <20251117-reversion-distaste-986c81a33f20@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117-reversion-distaste-986c81a33f20@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_134935_743422_D44F2DE6 
X-CRM114-Status: UNSURE (   8.44  )
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


On Mon, 17 Nov 2025 14:21:20 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> pic64gx has an identical sysreg syscon to mpfs, add it using a fallback.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip/microchip,mpfs-mss-top-sysreg.yaml   | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
