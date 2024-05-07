Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389E4C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 21:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QCeHyho1S6ihRY7wRcTvMRA3/jljvRpy3R/+g+p16F4=; b=Bl9lK9LDqR5Dea
	q/XnTOfn2xPCG74Kx6wfo87VwePWLkEGaiY7OePyHf9r590mU9SdXgcRddqsg0YXyI2oCh3sOIKq/
	/jrqsjnA0S1I7+wJErgU+NX1h5UxOUmHEpzgCihRHPN903BRYapCpRDP1m3V082kXoP/7W1DIRRpJ
	g2XjcOSagpgFR943wf38lyaA9L/jgekuVJxFKIoqkjx2PkoFr6u25I4E8851uqgecwxTiWDH/Gfis
	WSz/BsBd3ZGfXLrbEXItRv8WUMCOcwPoGPCcQwRjyh6TMnZMnvlII21CfdZ6f5g0LNzHQGW/DBO0J
	cPS7hJ418L3Yd3yxcAYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Sp8-0000000Cyw0-0qCF;
	Tue, 07 May 2024 21:58:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Sp5-0000000CyvP-0B3Y
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 21:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9434ECE1710;
	Tue,  7 May 2024 21:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C277EC2BBFC;
	Tue,  7 May 2024 21:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715119083;
	bh=RW4OSGaRnGj+c4JPG8WuylRGEfAh4Mm1J5a84ybOX+k=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JEO6xxj0J94kY8g51lzZAzuoLnV1f9e5TfwrdScRznipN9Nc97Rt3N4UJseM4jqZg
	 vEyA/WAfciJ+wmejNaHW9Ak89+glhZI1T7agC6Y8SsrwUcuHJwMb/eEuEYLrnMwzny
	 jmnNlqpU//J0Max3RqSnNawijbVVaW1fRt4LQK/9q0g63slMbh1V7sOk8PX3VVqf+8
	 t1Wl0ELTyhcbBqcgnG0KpCgJr1fu7QFhlF/aFV9aaadbUnUaCd7du392/OFdwsPbDu
	 ER6DanocQf2kzV/pgOFJ/fHmfYViymaymV/s9dmhQ59VQorhGU2AWXyHMQo/GPwcUr
	 tg7TvVCp5vn4g==
Message-ID: <3581e567f37fea1b67107d65f38d74ca.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240424-strangle-sharpener-34755c5e6e3e@spud>
References: <20240424-strangle-sharpener-34755c5e6e3e@spud>
Subject: Re: [PATCH v2] clock, reset: microchip: move all mpfs reset code to the reset subsystem
From: Stephen Boyd <sboyd@kernel.org>
Cc: conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, Daire McNamara <daire.mcnamara@microchip.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Date: Tue, 07 May 2024 14:58:01 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_145807_285911_46154EB3 
X-CRM114-Status: UNSURE (   7.02  )
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

Quoting Conor Dooley (2024-04-24 01:42:08)
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Stephen and Philipp, while reviewing patches, said that all of the aux
> device creation and the register read/write code could be moved to the
> reset subsystem, leaving the clock driver with no implementations of
> reset_* functions at all. Move them.
> 
> Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
