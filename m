Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D46C55174
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 14:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9JfAbQp126u9IEBwSXF/mc8XuIKw0AsCCmV2pHFC3ik=; b=i9SsYIA4V3+XDg
	EhIuRsXdhJsVf5DgIaJYmmhlDJp5FPPJZ2IaV510bvMnINzJsr1JcIyP8IerlQ0zL5hJwoXfW0tgr
	G7P9SlaLRbO4o7vl5tIRJDhoQeFkdNafQeKWvC9M8cpPF2hFzZGLMRzjG6M0MXQe94pY1xfD0/CjN
	4EmHE0x+BekZU56Q9T8ofZj/kKXxOgjWH4KEx4I7QmKNlsK3GG/3h3sTORUv/0n5Z+SIP4Z+bP3DA
	unljHV+d3F/apCeU7rU0Mb08nI3FC4M0nxS/m2bAfWbUdRqXDyLdLSFWv9cTPHqtYYxYFMkU+z8zS
	jsW7d7wFC/Cm+nI7eINA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcpR-000000046DF-0oLG;
	Wed, 05 Aug 2026 14:42:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcpQ-000000046Cu-0C2H
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 14:42:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 853184360F;
	Wed,  5 Aug 2026 14:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82981F000E9;
	Wed,  5 Aug 2026 14:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785940963;
	bh=PPxR34jY6D9VQ7CMGLhqEjpb1OBmeanD7WDc/7omm54=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=UeVV5QWClFvjWxB5PxrHgdGKCQJoVNalA99EYF79GCsfnLKaTa8AxKiXaypJsCBor
	 UrZx64ETpgDXvmGae4rr6mX54oEH4JnNbCPQXFLB2bkrohG4Qimeez54hgEo4bFL1a
	 duq3ktIjuwNbXXJHid+a6HZw8v7EzmUTwgJls9HfIRDjE2iA9VgB+mv6YMFUJxcZFD
	 saHyei6AhqT1+T1Vgfe7cHSDGY/LsGZEZwSwf2ELUaTWMzO5VoVFWnU8ua+CcGPQbM
	 cp+csBFESQotDQnQEA34dIDq6u47p90jLqukmAlhQB52/ToMCyDcpZ9s+dReWfyVad
	 zAvb9nQdfNF1Q==
Date: Wed, 5 Aug 2026 08:42:39 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Drew Fustini <fustini@kernel.org>
cc: Paul Walmsley <pjw@kernel.org>, soc@kernel.org, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
    Conor Dooley <conor@kernel.org>, 
    Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, 
    linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V defconfig changes for v7.3
In-Reply-To: <anKwl/5re7CMFTXF@x1>
Message-ID: <42f428e2-8bb8-b14d-7ed3-e618bb467356@kernel.org>
References: <al+cTw/+z7xoJXxp@x1> <55196187-178b-1f88-0947-1612410372e0@kernel.org> <anKwl/5re7CMFTXF@x1>
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

On Tue, 4 Aug 2026, Drew Fustini wrote:

> Thank you for checking but this was already pulled by Arnd:
> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=6495ae297ceb
> 
> It seems the patchwork reply had a narrow scope compared to my post:
> https://lore.kernel.org/all/178491121788.3229915.9040423834090729571.git-patchwork-notify@kernel.org/

Oh, okay, thanks.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
