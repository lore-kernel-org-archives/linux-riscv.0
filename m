Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D967C4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 07:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=quEP4U2fCg6DMY0rhOXQE79gFiBxj3IrS5oUOfub1cE=; b=M+fDa4GDP46vDY
	UBuJxxXNNSHhJPWZPhNQ4YYjH4kJ8YLyqA1wsg4R52yOl1vTJFOre+lESkZJrM2HjYLsOd3ySY78H
	RDgq325ZHWbg4uEcceHL1XXqR6eLrim3OJ0SVEZt0CB0KDBbcJbQkPemG+/APunMB2e5AfUwnQncG
	xHE6IsORGCx3WeYuXVj25Ey8xX57bTKVBg4qSVm2fQ/fDv/9m92FWaP1NmI9WgcWuO+UKdhep2q1K
	/p9K2+R71UvUExXN5cpIGyhJVKlklLaB1fAgpOdIA4ogmFwIJ7QgvsUHw9+XZNRaV6EE5bw8nxizo
	3haW+GuP5c35MTG16l0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p25ox-00FXja-MP; Mon, 05 Dec 2022 07:23:23 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p25ov-00FXi5-2Y
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 07:23:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id DD0664260B;
	Mon,  5 Dec 2022 07:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1670224994; bh=h+UiLRi0HrBaW4Acn5ZL5HH6vRNTHq7sTp7ruAUzaT8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=mg2aAuXG2q2GH7gmakmzyQOF6333uTCXpEbaNEDvwM5MKwjQBhOjXy6G6y6W2C/V6
	 Mx9QRH4x1YmKFPmtEwDRPV4dRGlrb+5NiXspxWKd1VAubbVtHi2l2whowDDdebooUA
	 IFewudJFv0t2taoZGEnpLkhWgxKtaP3WgQJzN+ekJMQLAtvj3mj8yMsEzlYGbWDAHs
	 2J4hn80tzAXg89RSo0TnYAPFy0bDPmR+ysou/cw8i+TTXlZdKC7+i5ht4yIaP93AVA
	 MZOdeKioK243y1ca7qI5Qv69zfCCWb5PUXnRdK1IWz/ILbqFdlEB3wuDBif8m2h72f
	 6A3THIRMvl7lg==
Message-ID: <975cdec2-3b0b-0557-5040-b483638c4007@marcan.st>
Date: Mon, 5 Dec 2022 16:23:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v15 9/9] irqchip/apple-aic: Move over to core ipi-mux
Content-Language: en-US
From: Hector Martin <marcan@marcan.st>
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel
 <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
References: <20221203064629.1601299-1-apatel@ventanamicro.com>
 <20221203064629.1601299-10-apatel@ventanamicro.com>
 <18abbb1b-ec5e-11c6-ab16-b523f329064e@marcan.st>
In-Reply-To: <18abbb1b-ec5e-11c6-ab16-b523f329064e@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_232321_287573_B2B6FC88 
X-CRM114-Status: UNSURE (   5.83  )
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

On 05/12/2022 16.14, Hector Martin wrote:
> On 03/12/2022 15.46, Anup Patel wrote:
>> From: Marc Zyngier <maz@kernel.org>
<snip>
> 
> Reviewed-by: Hector Martin <marcan@marcan.st>
> Tested-by: Hector Martin <marcan@marcan.st>
> 
> Smoke tested on t8112, nothing exploded :)
> 
> - Hector

Come to think of it, rather than r-b, that (and #3) ought to be:

Acked-by: Hector Martin <marcan@marcan.st>

- Hector

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
