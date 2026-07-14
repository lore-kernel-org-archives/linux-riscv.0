Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3CEC4450A
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 17:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a08Mk83xQtftNquRVdWSwXcGinV1KCZ0LJzAn8tzQWg=; b=kcA/lAheETJjHx
	MJJCio2E/WQSMaHSR9IK9jLq/qiMNoXtc3oiQC0sCSGLjRfQvtjrkAzHt92bdPLjT/a3ls9WP8Wu7
	b+GZNhRxzEbuwRy15UPwE2WbqXelWYXs77AovoDYLdGe+V1m9KfAVDyqmTcELj1XOWgfcAYuWpXCN
	HmjsSYv1R57WJ33BCMgDyaMxXIt9G6FG+7lCNMk4Y/Y65omhliwVYl6D9FIr/dVa2XjLiPOtJesXJ
	ZvUiyzrtVUldqMlFZKf+cpFeGzj5LFWIRP7TnRJ5Sw0BfSV6irnPZ5Rx1BeUTX2r0Pjn11FurtD8x
	vAOXftVXSjqMonajFzNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgnR-0000000CkhA-1Z49;
	Tue, 14 Jul 2026 17:19:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgnP-0000000Ckgs-379q
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 17:19:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 88CB860103;
	Tue, 14 Jul 2026 17:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6251F00A3D;
	Tue, 14 Jul 2026 17:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784049589;
	bh=Q6USvoTXBFFHxgzXspxaaDau+LCZNuY+4ZI83XUqiII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eJqOaedKsInact5HfkdGY2PEb02kf+JP3O5HveQqAhy9DlWS7ChifvUYw17XUKkEh
	 KOJfEZnnWl8Lp83M5h40L04L2Db9HFWYGj4+/RlwCpUHC8WuUz3XnSRD9+kqjdIK7G
	 /i6ynCyb9GtUtFD9nJBg7+BZzG4BApYJwEaCLsjz8m/kfw6OwMtsLlVe/jMrr+kpar
	 T8VuxZgnx7PDkmxc1tTQoOIX/Qi4GqmH8IbtbiQ5cLypALztY3QBDPvZXtrr0CworM
	 vSPSGezUM6v/ZayTh2hh47qzYVdfx8tyRL/6Gm3JwncR1AHcdOHC/iZjvywXW38Kz2
	 CBOAV4ORMQoJA==
Date: Tue, 14 Jul 2026 19:19:44 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, troy.mitchell@linux.spacemit.com
Subject: Re: [PATCH v2] i2c: spacemit: fix spurious IRQ handling returning
 IRQ_HANDLED
Message-ID: <alZvn3D1JXiAz_IK@zenone.zhora.eu>
References: <ef8b623f45d4e430721e46572c2598d882044aed.1783667603.git.xiaopei01@kylinos.cn>
 <ef8b623f45d4e430721e46572c2598d882044aed.1783667875.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef8b623f45d4e430721e46572c2598d882044aed.1783667875.git.xiaopei01@kylinos.cn>
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

Hi Pei,

On Fri, Jul 10, 2026 at 03:21:13PM +0800, Pei Xiao wrote:
> When the interrupt status register reads zero, the handler should
> return IRQ_NONE instead of IRQ_HANDLED. What the return value
> actually feeds into is the spurious interrupt accounting in
> note_interrupt(): falsely claiming IRQ_HANDLED defeats the "irq XX:
> nobody cared" detection, so a stuck interrupt source would never be
> caught.
> 
> Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

merged to i2c/i2c-fixes.

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
