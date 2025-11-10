Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9B7CCFA13
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 09:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jOAX10KRiRNizx4/0g1ohI7QEvo7xKdqglvRbYUseU=; b=vN3lSx1Z/UVzuL
	IMHwvRLL9h/X0edNDU5SsC2wxa6wsQZRJ7prFenAbpGPEPBgd5p5ZEAofC74ooEZhEhM1iGAHVuKw
	V1aug+ORutDutgJt0I0pW+yQd46rcujq+eg5ORhhRooX7nTQON1IvDXoMI2adPaCkAtvjMP0YjIIr
	ufjrW2dgci806CS96Uthe5QiubWUUZ7kx3dfYOZP07kLLuwH3L+fo8fv95tSkW0Nlc25NoQfsEs4N
	d5AofIh8AKP1TFPmtPZ/68kkuJmkGVR1BOXu+Uvojn6fqw6MTGMq8B9GtbKb/DO1KK+ZZRE2g2O/h
	0MYO6umgW21ag6rOj7iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINy0-0000000544Z-0rAn;
	Mon, 10 Nov 2025 09:13:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINxz-0000000544D-23cy
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 09:13:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8168360008;
	Mon, 10 Nov 2025 09:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C99CC19421;
	Mon, 10 Nov 2025 09:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762766018;
	bh=85HrPyg/hTWliRANeFpxubEYlHWfEwl2bNLk2ditCLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QoC5IbCYiqx9zytH3QW5WKyMIqXWlcHckaZ0Xuq+YECw1Qz9c3LnmAr6hSmJsO2cK
	 QlM2kIPpb35472SeXU+mmBVjEsszbopj/t4U4ipZ/9gQnlOGenDM+x86NEO4KcSeLP
	 /O/EZ614i7QmV7ZbXPwP6W+hWov9l12N+26Z8MEz/e00Nq+vkCgcY3iNQIRQte1AHz
	 rwjlUX+IEq0JFbm+wUlxBea2CzSzWFZULN2rHApnv+0xEmp8PMYoXUps0VilGXvlIG
	 aRAnsGuq+kUhhOkzMD+x3J73kvOG9e9OOMwtXInt3VhAzrnl63kwsX13KI/XeokLeq
	 mObwW4QD/oPLw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vINxy-000000008FO-0TfW;
	Mon, 10 Nov 2025 10:13:38 +0100
Date: Mon, 10 Nov 2025 10:13:38 +0100
From: Johan Hovold <johan@kernel.org>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH] mailbox: th1520: fix clock imbalance on probe failure
Message-ID: <aRGswsgOmPGXMjMI@hovoldconsulting.com>
References: <20251017055414.7753-1-johan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017055414.7753-1-johan@kernel.org>
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

On Fri, Oct 17, 2025 at 07:54:14AM +0200, Johan Hovold wrote:
> The purpose of the devm_add_action_or_reset() helper is to call the
> action function in case adding an action ever fails so drop the clock
> disable from the error path to avoid disabling the clocks twice.
> 
> Fixes: 5d4d263e1c6b ("mailbox: Introduce support for T-head TH1520 Mailbox driver")
> Cc: Michal Wilczynski <m.wilczynski@samsung.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Can this one be picked up for 6.19?

Johan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
