Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87266C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 16:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8h7tZEzbigGuURpqq7vuX8iKJPb9yKYJ5ScRgtz6f8s=; b=eFo79dGDlGr5f5
	/7J2C8S8ipIAp56/WL+qUkDXn8kAjkkIr11eu8Jli1Ub5MGyuJTTmXLSpVsXurM4upRjcSrUGEMC5
	zC+Lz6oQpaUrVJfbBT9s0aztvNHZX/nv5DT1NFavQJEdtY9wK/bAZYGzAtU3CDtrWlW/babr+LEAQ
	zp3MzAVfBx1CbeVYJy6o99JIoeQJdx0gbWdOk5O8Y2Bs0tPKhlcNuOfhrguOCycgJwE/9XppE+9En
	5fPcPMS/pcZIBLukUsH0hYsYsuNK2MP8FUyVIET+der/O0KIvxBEThjZmekDz32SiZqzKO9ZMLtGs
	8WxJKzmDJQwJUOtl873g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhGo-00AzkY-0k;
	Wed, 26 Jul 2023 16:21:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhGk-00Azk8-31
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 16:21:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9346561BAA;
	Wed, 26 Jul 2023 16:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51C9C433C8;
	Wed, 26 Jul 2023 16:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690388505;
	bh=18NDTqqHohoTLr90XQLxpr4K5+AZj+2bL/ajmxJtfhc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EVBZg2ZbLdRVYWcCdqu3F5jx+QQU/aWzKtgtSWBdD+3DrwcbLPhCALBN0nkQANsFY
	 hHJgx5qyPifqGPY3HrU9YntFvjNF7pJod4M1TCGVAOZn3FbNN7rrQm7pGauGcdWcSJ
	 KSPMWbjSYgsZxLZLU2LWhkSt64nF8GIKOVypy+Nvi3t6/MxeU1licJ2W2ItROHfY28
	 4vD+8KQ35/M5dZiWkUeGpK1/Hw/T8K84t8QDtjQA0N6etOkfiJRVMuJbsuom4Iak5U
	 bmSY5+ucnbhUkTxdvqyKdzPDJ33bxyJ95qd3fdM/jLjdopjMuMNo/gY/8jS2vBaJZP
	 wi8w7X8PJDxeA==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Walker Chen <walker.chen@starfivetech.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 0/2] Add dma and tdm nodes for StarFive JH7110 SOC
Date: Wed, 26 Jul 2023 17:21:39 +0100
Message-Id: <20230726-upriver-net-8490aa69df8a@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724065158.925-1-walker.chen@starfivetech.com>
References: <20230724065158.925-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=563; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=pqWLKNJK9l4lLD6VJLXQH57mRv1gdUVqiglI+UMeLd4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkHPYR2TpIPWzt/4n6VP4c26iTMu2GprHn+fsDd69psM TefS9Y97ChlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEzl5kZHhXoz594zzeKteD T7tZ/VivnHlTpfMw7Zz0mR1sGp8+txxgZDhox6juePxGl2r/piLha33m55LKl9mv/mv3eHdjHzP 3cg4A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_092147_021629_A2623142 
X-CRM114-Status: UNSURE (   9.48  )
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

On Mon, 24 Jul 2023 14:51:56 +0800, Walker Chen wrote:
> These patches add dma and tdm nodes for the StarFive JH7110 SoC, they
> are based on linux-next. I have tested them on the VisionFive2 board.
> Thanks.
> 
> Best regards,
> Walker
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/2] riscv: dts: starfive: jh7110: add dma controller node
      https://git.kernel.org/conor/c/ac73c09716c3
[2/2] riscv: dts: starfive: jh7110: add the node and pins configuration for tdm
      https://git.kernel.org/conor/c/e7c304c0346d

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
