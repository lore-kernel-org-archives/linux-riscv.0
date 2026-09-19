Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A6CC982D8
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 00:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHOGYcdEY3HMAic5tjM1Bya2kFCxaPreF5FCDOmwv1I=; b=OFWBryxpUfqdau
	xw6g5QrSIRKtyXyWxpEgi9fX23Exn/ezHnr5a00Tb9842XXVjnAdoGQCRv5npvoznkFa/yok9GZi8
	6fiDA/NbvlDcFgw/EtuxFTemc3kItk/M9gjtWc0tpUjtMOju+SqN5yYzCiVVLwBJwANX+Fggqm9fW
	rgE0F6ggxdNFYzVKa/87KzL3HbAKN3n9EqH4Hhlqr26tftoxYFNbgdBhtG2PeJatS+unX/boGpSZt
	x3QQHMVwV5h/T2AkIwtK9oId8ZSJGw3sYcap3jfUhcpkTiMZfiPG6DEHsDGjevvv1qijmhh1qq3VS
	HOCXCeR7jyfa3qtIzAZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7jGN-0000000FnMc-2xGh;
	Sat, 19 Sep 2026 00:49:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7jGL-0000000FnMI-3pNf
	for linux-riscv@lists.infradead.org;
	Sat, 19 Sep 2026 00:49:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A877C417E2;
	Sat, 19 Sep 2026 00:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044FC1F000FF;
	Sat, 19 Sep 2026 00:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789778945;
	bh=eojZnvOcSsz8LvMhoUSOyuMtKiOL0VubQ9yJAzFiREQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Z1452jYhpo+Z+sNqjAFdqu3auX7mTqJcsOMMzCz8MaXJKlgoTqOvu5k+6o2p0kHST
	 4vNVoqDYwi6617OP9l9SwN6zIK4sRuWRDz89kS75Y5bbYzEYVOdaxOMZoB7zZKFjJ7
	 o+pjiMwvSvbbglMvyPVXLbUU6fg6HwUu2f5vASLh+GQfAujpTKTTWO5G911rP0iopQ
	 sfBnS+JHy4im5nPuZT/ijpaiozrb94iZYdwWM4u/L6lEOjPyBRdlhqaWDg4vxf+E8o
	 LSPP/8sW3tXEBt/VrJgCHZeQjBLSCOi0BAqX8D3fMtGrCbLhtth6GF+QM/P/t9FuXr
	 uE7FIhMaImWSA==
Date: Fri, 18 Sep 2026 18:49:04 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
    Charlie Jenkins <thecharlesjenkins@gmail.com>, 
    "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: vector: Fix output operands in context save
In-Reply-To: <20260911194218.3379486-1-aurelien@aurel32.net>
Message-ID: <d925bd35-2b26-a0c6-6a81-3a886b5f368e@kernel.org>
References: <20260911194218.3379486-1-aurelien@aurel32.net>
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

On Fri, 11 Sep 2026, Aurelien Jarno wrote:

> The __vstate_csr_save() inline assembly declares vcsr as an output
> operand while the assembly only writes vstart, vtype, and vl. Remove it
> as it is later saved by the C code.
> 
> Fixes: d863910eabaf ("riscv: vector: Support xtheadvector save/restore")
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Thanks, queued for v7.3-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
