Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222B4C0015E
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 16:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQGzqQHdSSDB2OoD52xpmtxtdvCO222YabyPcOJdSOY=; b=nXxnXcIb4a9+ju
	S046/0jnVaNGgiS7FWpVZYuXa4kYwDzbpDFF5zqGJBkfysp7kGPlNWdBe/AFsOaBgy4rTbazbPNEz
	CA3ynrT261j+/VCe8Hupm4TfUa1hlayNvfjPgk8X1HtZwxl74+bfmuSqXaGyzfiJFjdth2MXP2KpX
	FExfVn0en1aHzHAokejr6EkE0tmhJza9tMFXTWr4Ps9qOag6ARq93O38/5A61/k1Rllk4o5czNkmX
	lrHY6BLvaw1AbgPAEcJ1747/1xqX1La6LZwDhrw2q7EDI17kZGFx+27wg6Kcmt7+4PSG1QQ9w4sYL
	0WHsUFcwIfpu5f3y2oYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSKZ3-00EMeU-1S;
	Sat, 05 Aug 2023 16:55:41 +0000
Received: from out-118.mta0.migadu.com ([2001:41d0:1004:224b::76])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSKZ0-00EMdP-1b
	for linux-riscv@lists.infradead.org;
	Sat, 05 Aug 2023 16:55:40 +0000
Date: Sun, 6 Aug 2023 02:51:53 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691254534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vYiFCAoB7u7dk9JF+5uYfQo9xx6aksS21sN43dAesb0=;
	b=JrgfMyBOF+ZiXCAmC60LBYPR24oFRCx33u0KZKY303F1zTsxaeJJ7iEE6sA7OWwJCUtxVw
	A4UvLxWn95TKqI4CkmGVAhWOqcAk4CvjbA6aGNLXTBYeY5prTGoIAKBqUNZfh8PsTWAhSx
	mkMIlM80OTxepI54dfk4DvO/fhfio2g2w6Zzi5o65Zgb64BkrnRxk/0vcwiQ5WIdKQu7ws
	UkUlMgbKObQ9hReGcP3QkIQBOowRV6faBzQyCP3EDy5F73PN6SkeTDX0F52E6eStUZpU+6
	lQWwk6FI39d1N9Wuz7kOXLbqbOsByN6rNvid4pDiwRHmDYcOJf+RggI/enu0Ew==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: aou@eecs.berkeley.edu, conor+dt@kernel.org, davem@davemloft.net,
	devicetree@vger.kernel.org, edumazet@google.com,
	jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org,
	kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-can@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
	mkl@pengutronix.de, netdev@vger.kernel.org, pabeni@redhat.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
	samuel@sholland.org, wens@csie.org, wg@grandegger.com
Subject: Re: [PATCH v2 2/4] riscv: dts: allwinner: d1: Add CAN controller
 nodes
Message-ID: <ZM5-Ke-59o0R5AtY@titan>
References: <20230721221552.1973203-4-contact@jookia.org>
 <20230805164052.669184-1-bigunclemax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230805164052.669184-1-bigunclemax@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_095539_239305_96622CBE 
X-CRM114-Status: UNSURE (   8.00  )
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

On Sat, Aug 05, 2023 at 07:40:52PM +0300, Maksim Kiselev wrote:
> Hi John, Jernej
> Should we also keep a pinctrl nodes itself in alphabetical order?
> I mean placing a CAN nodes before `clk_pg11_pin` node?
> Looks like the other nodes sorted in this way...

Good catch. Now that you mention it, the device tree nodes are sorted
by memory order too! These should be after i2c3.

It looks like I might need to do a patch to re-order those too.

> Cheers,
> Maksim

John.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
