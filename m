Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E891C00140
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Aug 2022 12:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFx71avcf+Tc0WR1GcoLcUzmrFQSPlML6BLXC1OdVgI=; b=FlOZg6SS0+OVO8
	rXOY5me0vDtwvXiOti4vzKLnqV9Jg2rJh4FhuvtPpIirtiwFp/kE+unJVKA2y7Bai4y6YRDjfOoSJ
	VUVz5tuE/CWPM//cZgbkyucphf9CVQU5n7tPsR7F3Ofv/FrhlcUBuit5LdlNfX8+fPOpLRmtZSTxy
	TTlV8elDQFbQuR1uHU6rfopxPUFRG1WNK0ZR9yglOEJxfEBFysMZiF8/Wl48RIP2o+otVKHK/Fmj/
	4JQ/vDK6xbpa2iM/3qIGQZIrqjyjqb+70geV5ZyYhRUc2GRId+HiBn5MM/EJ2GtKRCcUK7Mxk9YRW
	5qORDCQyfRBd8CoBd7sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIqzG-00Dxs4-Dg; Tue, 02 Aug 2022 12:27:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIqz5-00DxlT-PW; Tue, 02 Aug 2022 12:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=i+Zl91q4t+AZoHrEuNohjOyc7HDaxjH2xIeIWp7puuQ=; b=wBqS2CGpTw57Y88TURyJ4aTzj8
	8rA9zlyUQVdeZi0SP6WeltO8x64WM2LPUJbZVVC9vyEvcTQAvLSqpCU4SHM0zaQY9o9OrcdaBHZUh
	chmVGrmleKNL5N3TDrjg+ibrLYbwS53UAzvK3KElODt+f7h/w5gi+6ldrpx7Tm/yeEUiofU0dBDeX
	FbHeAzOiq9gf3BwXU38L2H1pGh5PUVyhGn6vnq+zYqs/YA3Pvf7oi7Z7cPZG0u/xpO9Hz/Tp1HGwz
	oL5k2sD1WrQc2lLN3YLU266NK2sWUfhJXbwwljK9tqmKmI8tRrOhN3HJGG+3q4+Epob0XnjfJ2x5S
	xfW/iZZw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIqz1-008LTX-CP; Tue, 02 Aug 2022 12:26:47 +0000
Date: Tue, 2 Aug 2022 13:26:47 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-um@lists.infradead.org,
	live-patching@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v8 00/31] Rust support
Message-ID: <YukYByl76DKqa+iD@casper.infradead.org>
References: <20220802015052.10452-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220802015052.10452-1-ojeda@kernel.org>
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

On Tue, Aug 02, 2022 at 03:49:47AM +0200, Miguel Ojeda wrote:
> Some of the improvements to the abstractions and example drivers are:
> 
>   - Filesystem support (`fs` module), including:
> 
>       + `INode` type (which wraps `struct inode`).
>       + `DEntry` type (which wraps `struct dentry`).
>       + `Filename` type (which wraps `struct filename`).
>       + `Registration` type.
>       + `Type` and `Context` traits.
>       + `SuperBlock` type (which wraps `struct super_block` and takes
>         advantage of typestates for its initialization).
>       + File system parameters support (with a `Value` enum; `Spec*`
>         and `Constant*` types, `define_fs_params!` macro...).
>       + File system flags.
>       + `module_fs!` macro to simplify registering kernel modules that
>         only implement a single file system.
>       + A file system sample.

None of this (afaict) has been discussed on linux-fsdevel.  And I may
have missed somethiing, but I don't see the fs module in this series
of patches.  Could linux-fsdevel be cc'd on the development of Rust
support for filesystems in the future?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
