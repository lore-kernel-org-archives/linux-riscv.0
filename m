Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E94CCD193
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 18:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OYrE5CLYHOD7AzhY0NB8e39AlsNa6wmPfJz+F6VKdqk=; b=hWPx+xMcU27fnj
	ejcl0VRnNr5nmAq8uWnVU8gHcZ8oPoUiJ3dgf6gOxAXSRpM9CtOhlVACbAl8JvLBkUU4C1EgXHr1q
	xeZkcgpuhvjHRxkBPcrvWfzSp6Q8WZI6bHzF1+d2EhVBeeaq15TBFGuj2dopn/eEAX8UAc6Eo0z9S
	SUraFrzmDX3F6wATi4hKzPD4wAWnVyyf9cuu1Jp+ILruaqJZsZ9H2X9yW53887qNU9KMSOytpsQ3K
	+JRo1V4LCPjSBr48ncn5zk3sAzWrXAX9AJq5ABq1zRDfS/7pMCrB3ap/hEgSVHM57w26m2ug+rf0y
	+q9alswH0U0NyZ03ryIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0DI-00000007Fxm-3NiT;
	Thu, 23 Oct 2025 18:39:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0DG-00000007Fx7-27TS
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 18:39:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23FF94B070;
	Thu, 23 Oct 2025 18:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86289C4CEE7;
	Thu, 23 Oct 2025 18:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761244742;
	bh=CMLdyhpydVR0/Nx6iPY2zTrIJoMIDwh4t2xWU0ZSEq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bCMGI8uviTWrDUJwu13OthmrVIiNYPGmqEKz6srTaDiSoG+lzBU2ZoefXj3t77Wwv
	 C0Q1189DmcWWNvgMJXjb+3bciCyII2LVyE/3iYHg6yw7IyCCJz5Gv33OmwfDwa+kTG
	 CD+bElQ0GD+hSrr36Xc0J5UlBLXlwaVjOE8k1xUoY3W6+ZoKUEeUhasDge2lnj+FZP
	 Y3YfjTmYxQZl1VbK92QiRrJN33npn41Zg/YdVuXpYkMWGGcvLHqasZXywz+shuzYxg
	 P0aUlrTtmGFDgowhBIPrArbaEcRuulLW5g2/D65V7SZ/jJRyyjsu+8VSwZdmr4b6N3
	 UExTM1ZqDWdYw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	stable@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	Cyril.Jean@microchip.com,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Jamie Gibbons <jamie.gibbons@microchip.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: dts: microchip: remove BeagleV Fire fabric.dtsi
Date: Thu, 23 Oct 2025 19:38:55 +0100
Message-ID: <20251023-feminism-rewrap-39719eb7832a@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021-dastardly-washbowl-b8c4ec1745db@spud>
References: <20251021-dastardly-washbowl-b8c4ec1745db@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=575; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=JhXib/kn2jozWLbz0WSVdzkOIm/eAov7GTmNvhuhfhA=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBm/yuyZ1TesPGn/5NQ/h538J4qzTlzbuLU0S2+unHkip yaH4uoHHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiI+l6GP3wNtyrXVtpFNBdO OF8z6UnKaXH+On4n0ze6pS9dmJ9piDH8L8s9/+3g7CvvtFbOZ3ogeMSj0/JJ9ryJHNYv7yWs1jV KYwQA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_113902_582634_69BAD1BB 
X-CRM114-Status: UNSURE (   7.62  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 21 Oct 2025 16:38:37 +0100, Conor Dooley wrote:
> At the time of adding the fabric.dtsi for the BeagleV Fire, we thought
> that the fabric nodes in the Beagle supplied images were stable. They
> are not, which has lead to nodes present in the devicetree that are not
> in the programmed FPGA images. This is obviously problematic, and these
> nodes must be removed.
> 
> --
> 
> [...]

Applied to riscv-dt-fixes, thanks!

[1/1] riscv: dts: microchip: remove BeagleV Fire fabric.dtsi
      https://git.kernel.org/conor/c/5ef13c363640

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
