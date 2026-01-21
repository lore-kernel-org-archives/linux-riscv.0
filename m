Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639C7D6CFAA
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 01:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KUwvzJjmsxLzjqJnDKkSywUPKSBG8I3AbNhaVcA2QLw=; b=DqkF7qppnU6h+5
	WT4NsG0Y67ItFjA5/X4tlwsRwU36ccihTegVeKgHfXt2HfNuzNhMm3rNnYsjBRA0EnUnD4xBayTSG
	i2RzXTm8j9rAv7+pb69f/ppdSHGHg9mu7rVSAdXlkGegidR4uUpOepoJXmTQ2f/siHIwjyXFXA2n1
	aJaYwtj/4uHc/ilfj+CdgWHQfH6Jrnms0atVs/CdnV2w/FkgS8MSFKZ2El8efdGTKtZfBckegJUfX
	t+JHaqN+H3E/q4nYXBgPO3QM3ncmoqxrDO5L5HhuX3YrlAMtpVQJhQ0EzswJSWHheKiN66/RcZNuT
	eiuGlpcxGrYIhdv7z0+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj63C-00000007yG4-1l5Q;
	Fri, 23 Jan 2026 01:33:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj63A-00000007yFg-3IXm
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 01:33:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B3F043EFA;
	Fri, 23 Jan 2026 01:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE91C116C6;
	Fri, 23 Jan 2026 01:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132003;
	bh=qSSPryv6W9bOlha6k5nKfgyHQyZos4KXehGO1XfOwYc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kCdLJv0NVjCCaZSNDangU9kexw+zOXkD4hpGEHWwYLQMZmHxSoLELbdeF8ydIFcb8
	 43UsYWb+OQUq6fYlTJQIP3TGo6wRJsTf9bKCExkGSP5N1wP659juniPx8zcA4upzJl
	 REjJe4bn7TOmem8Cg23FqaeqMyImeb8eAjOOoKpCyDyFSrWjkY64KdhKddWcpfphec
	 gGHffdrkYkdvkzOKSmZ4wKyBKM6GeQ4R1iDhLFFNRT3J/TgWL07ysGW167jVy9BASK
	 poW9Z/YonjDfD2DFNVHZgLbwLiHAH3a7CfRqPvIi3xceC6LFVFBlaiY1JkEUz9YNx0
	 2kme3aEV3gXpQ==
MIME-Version: 1.0
In-Reply-To: <aW1TSYOA0KgYN4rw@x1>
References: <aW1TSYOA0KgYN4rw@x1>
Subject: Re: [GIT PULL] clk: thead: Updates for v6.20
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yao Zi <me@ziyao.cc>
To: Drew Fustini <fustini@kernel.org>
Date: Wed, 21 Jan 2026 12:35:51 -0700
Message-ID: <176902415127.4027.15296678851046084048@localhost.localdomain>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_173324_863486_4D1B8F8D 
X-CRM114-Status: UNSURE (   7.77  )
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

Quoting Drew Fustini (2026-01-18 14:40:25)
> Hi Stephen, sorry for not sending this sooner. There are not many
> changes for this cycle.
> 
> Thanks,
> Drew
> 
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-clk-for-v6.20
> 
> for you to fetch changes up to baf4fc7c03bd0f68c768cfe27829674bd060c6b4:
> 
>   clk: thead: th1520-ap: Support CPU frequency scaling (2026-01-14 17:26:47 -0800)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
