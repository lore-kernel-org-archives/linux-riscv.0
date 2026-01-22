Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B12D3EE64
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 13:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=St8j8UKBT+7HWZzGz548AnYtbef1WsxpsWsjsXXia7w=; b=OqMPRLV6c9iOu1
	b93zGHXo+eqRdtxCG52TgaTvEgYrbLU1j986Hrzv8p+fsGIraCfkj3eQxBNBRYiT4p9fjSVXRS5az
	kYISnTgza7WxKLg0uPEvmBww7D9ykNpA6f3ZMReu5Uel2MhTf9Ug8T5c7Vkr3XG8rKEIqiJaIRf6w
	Fi7xfxhdkscq/vdJkRwZPeVfC6Dx9D+XLvrz6rqJsazoYkdSgPjrkaH0mjdLvPjLVwAx9upZwcmQ4
	P0IBK1l+i5PWQF0DQ0tV+qX3l0CeoC2QgOOZ3VcKxDklPACxci8hXgnhlEpyGhvwUQPaWQGyng9gc
	MlZHAHvHEfPgQuPJkcBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuVp-000000077Nx-0Tqq;
	Thu, 22 Jan 2026 13:14:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuVl-000000077Na-30iv
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 13:14:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA63F42D65;
	Thu, 22 Jan 2026 13:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4094FC116C6;
	Thu, 22 Jan 2026 13:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769087648;
	bh=8k1LjBvIpqNRmEfQAczgAJsNgpdot1XoDuz+xT21Yds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LgI+oYGs6Dck1/OLZZkU2DIAZ4zRqoTrAfPbF7BBUUO5UtqZM4MyhF7CTXnLJvjpd
	 DHWxFPeCbwjVU+ZxVBtfn1jiBTINl6wZ2JYkjQp84NJX1gC/aaKaUJqLY3Gl/xWlf9
	 ZN/LCFzsvjHUBddA3YZw5eftLUzx7S8wa9BU0nU1O9HxvCPO9nDVf6Wkl5guxjjxgf
	 y29oooCoRJE4oRunmLCn8SydxRnVn6IeQyl1bYDv4tbLkgcKZKBI2uPtcXaxZgIV+D
	 08gitftdapP3icfelqKmZCPKvFK9E6JfWBwPvWysLY5T9YKIS422QODo6uXRJnPBD6
	 sVPo6vwS9SR1Q==
Date: Thu, 22 Jan 2026 14:14:05 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Alex Elder <elder@riscstar.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] i2c: spacemit: drop IRQF_ONESHOT flag from IRQ request
Message-ID: <aXIih2q2lWw2wK6Y@zenone.zhora.eu>
References: <20260122-05-k1-i2c-irq-v1-1-9b8d94bbcd22@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122-05-k1-i2c-irq-v1-1-9b8d94bbcd22@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_051409_774956_726A6CDA 
X-CRM114-Status: UNSURE (   7.59  )
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

Hi Yixun,

On Thu, Jan 22, 2026 at 07:52:00AM +0800, Yixun Lan wrote:
> In commit aef30c8d569c ("genirq: Warn about using IRQF_ONESHOT without a
> threaded handler")[1], it will check IRQF_ONESHOT flag in IRQ request,
> and gives a warning if there is no threaded handler. Drop this flag to
> fix this warning.
> 
> Link: https://lore.kernel.org/r/20260112134013.eQWyReHR@linutronix.de/ [1]
> Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Yixun Lan <dlan@kernel.org>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
