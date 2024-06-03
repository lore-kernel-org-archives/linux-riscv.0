Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAF4C25B75
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 10:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gfjOvC2jHpTFpjcYlA6biqNndSn7EIbec+e1VmM45rU=; b=2efsZzP5yIoZsg
	7r81RjOV/m25zFM5iG7mmdrS6ty3j8w43HoYFRk0rfv/OgVEa1tQF2ia31e27E5ERi8zLdv3iCQIS
	JS4AkkKudUIW5fsMJQRL1cfYvOr5gf2marsVNPbVThAAwKGU8Q1c1/uUeTdMjDD8re8GOgNhjkSjY
	mtef50mNQixMb4tdHcdvk18i6ebl/xTVqXtWxT3eH7FdMD/5OngDdSE8BiZGmx2XGfIAy6EidB8ut
	1UdFjXw/DMBQeM9b7D2wHhdgnEyEgyKgslHTHAebXXoJSZ5E1TcT2AtzufbeGQzq9ylWG44OUSFmg
	+6SgN5PknK9aS7gWZ6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE4ys-0000000GODF-0urf;
	Mon, 03 Jun 2024 10:31:58 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE4ym-0000000GOC5-0k3s
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 10:31:54 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1717410708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dw6ePzHbwRmOxnZvZra90XJR8ZCLgB7OaUV0mI9CXCI=;
	b=c4b5RuowHF2emjMj8GHkw/3LR09d9ILa1cgho4ZCE/E/hePbMLG7Vqr55K5X1LA9MO8jFu
	j3BW/fExLZ/kARh6jeBuXGcFesbfSWYuDOKVrQWb+j1KCVLUMTioT+mmAP0fqktdWRRU+u
	DJil8JqfM2KwpUKhY6/vRzatglcGisRwC5Ce1KoQ4+6Hn5DUYH5sp3aZEgwpXwQVK0uybK
	n7cic/o3RVBj0BWxgyn7s+TxQl9kFVMPdMxM7Jer7+BrM5HXKYLNwR4uDChy0U/UVZdD92
	Qac3eYXgzcG3g3N9Lsuyy1KUt9QeinhCf12LGB7ImYwVk3wtgLAhh7/dAtb/PA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1717410708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dw6ePzHbwRmOxnZvZra90XJR8ZCLgB7OaUV0mI9CXCI=;
	b=LWqIwvWflXs3kt+rRg7aGqtTWLHWnWxQc7StPOG+nq1Vh0BM4VUD74zlsL1TxfTXeJ5SDr
	uX/sHCA4mdEzCeBw==
To: Jinjie Ruan <ruanjinjie@huawei.com>, anup@brainfault.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH] irqchip/riscv-aplic: Simplify the to_of_node code
In-Reply-To: <20240527125000.3502935-1-ruanjinjie@huawei.com>
References: <20240527125000.3502935-1-ruanjinjie@huawei.com>
Date: Mon, 03 Jun 2024 12:31:47 +0200
Message-ID: <87ed9e71ws.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_033152_378344_AAD595F7 
X-CRM114-Status: UNSURE (   6.08  )
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

On Mon, May 27 2024 at 12:50, Jinjie Ruan wrote:
> The to_of_node has is_of_node check, so there is no need to repeat the
> is_of_node and to_of_node. And if is_of_node is false, the to_of_node will
> return NULL, the of_property_present will also return NULL, so remove the
> redundant check.

Please read:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#function-references-in-changelogs

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
