Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B85CCD1BF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 07:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8+3Ms0BmDN3IhbOFszixegj9CQvqZbNKlvulhIQ7Lg=; b=D3dYroghyO7pRY
	4eLjiwbIHRBkhEPxE6Ai8v1utyxJpIctJauEXAB2L2FPpl0XGuUULMEDQuuPNufbXU/CF7ErBeaJV
	uOKPAnrHzmEKdko9U9qHVyi9RBj5czq7AiFEp41Wd9IunL5KQfagfyN4EoZ+xQscXHGOCno/WhIRj
	FOnGE3szjO/aStwWiakG11RPfwl5cSfbRWPfcTeMlJ80dShSEXavzq4xfHv0qmcTzVxMoNqcF5azm
	jEdnAm65ruyD1iRXFOfj93oyRqonPc0zILt2RMN1khs4OAVERNca+y7y+NVa+a9z9RNI+714laDFO
	ohTq6FnMGt8/For+x0IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCYM3-0000000B3HH-3PVT;
	Sat, 25 Oct 2025 07:06:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCYM2-0000000B3Gr-3ryb
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 07:06:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 57E176045B;
	Sat, 25 Oct 2025 07:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20680C4CEF5;
	Sat, 25 Oct 2025 07:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761375982;
	bh=sYp+Js4E3+bzU3qzbHlEnJXPbRsGbFxtzKuDGYHaj5c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=A4Z3/HONJy1z170Q40NOTVjAQTQmJqSgkZSZTM/C29LEmgYJ5IKV7nLfjXL45FY8S
	 Va5GDodRTH1KKH7u9BcS5Qg58F9AJ87Fd4Wfprv9es47U5lC+QG3OfLcmL/0mTUtCn
	 XtGwVS2DLeDV7nMYkYADhYvWYj2D6qd/R89f/IS5UGaQOzgA7xMf/aR1hz1m9nRqYc
	 X/PKYhvhxk4XDrCTK+erYZPzkjrU3liVmh3invDR5paY1IilwLqb9NBzS4RFGy7wO8
	 hRUgZWDocM8bjjR+z2ySjvr27M1QKErJyTM2hKDSKnUz6czPCwRX8E0T2thN3//oNp
	 WzsKUpiFG6AKA==
Date: Sat, 25 Oct 2025 01:06:20 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Alex Elder <elder@riscstar.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    conor.dooley@microchip.com, dlan@gentoo.org, Frank.li@nxp.com, 
    guodong@riscstar.com, fustini@kernel.org, geert+renesas@glider.be, 
    cyy@cyyself.name, heylenay@4d2.org, apatel@ventanamicro.com, 
    joel@jms.id.au, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 9/9] riscv: defconfig: enable SPI_FSL_QUADSPI as a
 module
In-Reply-To: <20251024191550.194946-10-elder@riscstar.com>
Message-ID: <9307eca5-deb9-318e-9ce9-29ade3650758@kernel.org>
References: <20251024191550.194946-1-elder@riscstar.com> <20251024191550.194946-10-elder@riscstar.com>
MIME-Version: 1.0
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

On Fri, 24 Oct 2025, Alex Elder wrote:

> The SpacemiT K1 SoC QSPI IP uses the Freescale driver.  Enable it as a
> module in the default kernel configuration for RISC-V.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>

Acked-by: Paul Walmsley <pjw@kernel.org>  # for arch/riscv


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
