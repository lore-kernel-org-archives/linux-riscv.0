Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B0EC53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 18:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ET7C6pV1PFoFq3l2jN1Y7bzxJRwjFp44Dc3WF0fECQk=; b=WvLzlRsvUgq9aW
	NWnjb78+pLwFAWSPS1B2pbvFK/fTcnQQL5kQ2f3cZrqJfmJVRQba8rK+ryD7XpbTw+yhbmxLu0Ws0
	hakW/PT5dd7PxtReLk7YyxmvYX6kwUUYtRJLpMCj/D8unnnR4hmNMCFXnBZbfZ2ThWMNWGiKUCT+L
	sel8Eo4NsfSy4uiOja2hC3FyfU45ynUQJh6EYkmVl3m9gN6Rke9Do1EtRFVY+zLnMm52M/J3D9p0Q
	r7GMZKVD25kNEDSGrCHuMy9NgEFx/YLfXIYdRsVCydshARgGKo7unzKSGlowevN4ErieDf1XD1yfu
	gdxpriKLgkJjg6R0KBMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9A5-00000008pLD-2Fzk;
	Wed, 29 Jul 2026 18:37:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9A3-00000008pKx-2Pfa
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 18:37:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 36AE5600AF;
	Wed, 29 Jul 2026 18:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F541F000E9;
	Wed, 29 Jul 2026 18:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785350265;
	bh=co6R1ijG2O/vouwitT1oHuiHSHx5m7N80pU5OM3V/Hw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=QMyiWrqaan5TLLhPaK48QKz5do0PEAvrle94/6ROgb4hn942I1Wb8ByXNGmWKMq+D
	 3+hEObmgs2uY1p3MgGO2cEoAzngzMw4UhwHtpxBQ5wDBfCBUFwkp10MGGykgDb8kKC
	 8ZMz7IgjH0OiKxSQZ3jTa+6EdefSR4BgQn8Suiclx7zviiZgR8/JUf1VYbyK6L3xsb
	 g5aTA1Bx2uWGNr+s1lX8DEfuF+6ShsE40p2WDuHVdrkQ2cUH1o/Htem+NjafxXq00r
	 +Pr33z/jis8VrV9NTbJgcRS755sr96EdZTx0h9d3LO7Lj3ZF1A2pRBbC/Qzjsfj8e+
	 zAyk65PMUOc7A==
Date: Wed, 29 Jul 2026 12:37:44 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Mark default_power_off() as __noreturn
In-Reply-To: <20260727100339.410466-2-thorsten.blum@linux.dev>
Message-ID: <f6c94f20-759c-3d89-c136-c81e557825b5@kernel.org>
References: <20260727100339.410466-2-thorsten.blum@linux.dev>
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

On Mon, 27 Jul 2026, Thorsten Blum wrote:

> Since default_power_off() never returns, annotate it with the __noreturn
> attribute to improve compiler optimizations.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, queued for v7.3.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
