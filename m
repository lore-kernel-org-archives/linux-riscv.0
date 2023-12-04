Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398FDC4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 21:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=l/Ul/qE62COF5Uaq7Jvvd4cegTL37JRH6ixfSGoyZes=; b=IaJfSfroE8fIMb
	yMn2VKfI/bNxV8GfPZdXrVD8EWbmIzDmg+RflSKqv+KNgxh9I0N5qT4hk07VmhlkIlzEsa58B6Usf
	gj3NeM4zJU09o0GF6zhLQYcqro3lnROtr2jOJiVKzRG5ipFnFenyrYNxuX/gU7vTFpUdJBGB9JV9H
	VOz2u2kx9hqaGl0rhv05KP286w8UDBvT326948lj/IOb53SvV6U8JbOBLutuKmCRBXav2G1jTAaGB
	lZUAUvXTvYsjt2mJe4skg8HVED+R/NYmjN0OopLSPB60Sj3urOTQfYD6AtuEsYO/aIMW7gJ5MUZqK
	zf5xU4OrIQ1F6GzgMD4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAGUB-005eiC-0g;
	Mon, 04 Dec 2023 21:28:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAGU8-005ehZ-1B
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 21:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0FFBACE12DC;
	Mon,  4 Dec 2023 21:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F5AC433C8;
	Mon,  4 Dec 2023 21:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701725289;
	bh=GrS6re0Pnw+uBm1V2qdt1ie4VrYb1sT11XMmUaB1pJo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=H/J7lopGl2zOh80yIab32Hw2C21PBA9XV4prHzPUMF1TwgbcoRR2/AMyokVQ/WhhK
	 +Sz1zOkMRXEtMdG3piW0ZaK77Iew3pWvoZAuQn7G/0yxh9I1t/Y7VqLWSeQEgcN8mQ
	 TaHqdg5/yqMAVWNdBGgK9jX98z2cmqTVCR/qUEM6PYLhPC67HaLL2I4OAk3mSajXIi
	 7ymuNm1HL5nquwdwPfvJHdckLcZZlJ6VYgompaD+aM/PU79N2QdRRIDSPxZc4um7s9
	 K/GvYgYEAOfjFuk/ndFVC8h7ULdXR7jrH8RNexCSfMHtQNm2XJGa3HYlHneNsTtvaH
	 2Le+5VdZDX1Ig==
Date: Mon, 4 Dec 2023 15:28:07 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v11 0/20] Refactoring Microchip PCIe driver and add
 StarFive PCIe
Message-ID: <20231204212807.GA629695@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c4154501-5b93-4eaf-8d2d-690809d26c57@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_132812_584629_AEB89D3B 
X-CRM114-Status: UNSURE (   6.75  )
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

On Sat, Dec 02, 2023 at 09:17:24PM +0800, Minda Chen wrote:
> ...
> Please check this configuation.
> CONFIG_PHY_STARFIVE_JH7110_PCIE=y
> CONFIG_PINCTRL_STARFIVE_JH7110=y
> CONFIG_PINCTRL_STARFIVE_JH7110_SYS=y
> CONFIG_PINCTRL_STARFIVE_JH7110_AON=y
> 
> BTW, Maybe you can reply e-mail to me only.

There's usually no benefit to replying off-list.  The list archives
are very valuable for future maintenance because they help us
understand the reason things were done a certain way.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
