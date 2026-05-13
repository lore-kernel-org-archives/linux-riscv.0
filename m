Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310A9CD4F21
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 22:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lZ/aKioJ3kyQxYCoPLK6RcQPAKy/Al6B/jSK049lNw=; b=QsXMjZ6PgLO0SP
	G8mJhlPLa46RD4P6LbFHbN0XGbiiRlMB0mIBGHCSMfDwYPbEZwEGWhDvQ983rU+l9DewBkGlGNrkB
	srnu/qRxMQ2p8DyTZkG7YKHqopvpWtm/svEK/KByBcYqp0e2O27bKR5cB2UvLg51gPAVx87cIXcQk
	kd4i18ENVQAjmcbURncFhRdS3OIg/X0HYWKGy52Qp9GqCAiZZGpIKDO2GR9Nk5mad4U/79Tn/66Hr
	nG/pqi7ryTJSvgXH7qeY3wKN8jkbt3dWIJW2JRBCK62naD1gmy/3xgiyx2p3crUNk5hNbCMmvouuO
	xYQd54AlLAh0VcjT/Mcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIXB-00000003y6B-2o6E;
	Wed, 13 May 2026 22:58:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIXA-00000003y5x-3HSL
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 22:58:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42C5F60129;
	Wed, 13 May 2026 22:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85569C19425;
	Wed, 13 May 2026 22:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778713112;
	bh=pEjsKVcbr1uOcZ6QkKzISLXZqZnkV/nO+AlfiX5ia7A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bmomhca9/LPxnsEjtxwW4Dt433a6nheQohFS47r92cfSGGP2KoIxz8i5/rF5JPVOU
	 KUoOfCOGxMURXpb9AaYiJvNgi+7YDNIojkkA4iPpdwB8YRLjJ2tmntEJ0BR89vQ4kR
	 svbBF2j7FmqhGeLwkUd/nV7jaFMdkpvv3or/8d5ztVjCp8zvZnUTXUV9QcGVfBgvna
	 09SzBV5O/ijSP3iD8bBwo80XGTgSgFOP9CYyZ7JJ09fbyq0fru69dinjAxvYKW3fRZ
	 5gR2tnbdDwi1sqNJGsi0zXphvCBP0rUrxQ0vomq4h6drae4jTGIQw8Qe5ZRIOQQyIH
	 x3bpRuyswryig==
Date: Wed, 13 May 2026 16:58:30 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: use sysfs_emit in cpu_show_ghostwrite
In-Reply-To: <20260510165420.109453-3-thorsten.blum@linux.dev>
Message-ID: <7c39147d-f6d4-5c14-a47d-2496a745c9f5@kernel.org>
References: <20260510165420.109453-3-thorsten.blum@linux.dev>
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

On Sun, 10 May 2026, Thorsten Blum wrote:

> Replace sprintf() with sysfs_emit() in cpu_show_ghostwrite(), which is
> preferred for formatting sysfs output because it provides safer bounds
> checking.
> 
> While the current code only emits fixed strings that fit easily within
> PAGE_SIZE, use sysfs_emit() to follow secure coding best practices.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, queued for v7.2.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
