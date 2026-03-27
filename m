Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0047610ED64F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 10:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BzGvOj1XFytaLXGHtyWCAvWrW7Nm6XcWroZN/Luh+AQ=; b=U8bwMtskLO9PGJ
	ENS9E8AfDTAvB66tyo0Q+DJTpy+PmLttk+8ztaF4LDzGgcB1JKn7zaATA6N4495TB8ZJRPSR/ofKo
	HBiKwFUHTBCwhF6YUR0larpgWSWFVG54Mz+nTJtCHv5Z23QJ1W4QjvOna/IUghiGoqlMcwhuQnP/8
	C0aMWFI/MaAQBTsytfBcTkRsNxI482OPRFeYBMyzUDQ/WDYUxnxhWqPKvaZgPhXO2+W/l8sH7lYlm
	H2xdM5Pwgycp6CW68Tw+ZDvlcP3AEcKxsceNmdUYOSyzVz2hT8r0Hnn1V5raOP0n9nVCO4+6QqUL4
	koMVjfHL54RLWnc4LvRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63zp-000000077iK-28gf;
	Fri, 27 Mar 2026 10:00:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63zn-000000077iC-1ZIh
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 10:00:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 61DAF60133;
	Fri, 27 Mar 2026 10:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16E5C2BC87;
	Fri, 27 Mar 2026 10:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774605650;
	bh=o+56grdb7ac39ib9dNl2LtTcrr4nD402U9sEfODjWW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHEWFF4DGzAUakw0NqO9GKKRmb+hHKJcxiJIGhVRQzTY7M4bta6YERD/kiroO6Pr0
	 omcNn9ffxRkOkUo0LJIAMQRgmJe+tVO5KlaHYsQ8WlBLduUHKd4UoX17+E35lrRjH8
	 4qcl0+8DqCnKOykRq5jTA8ShIhz+WY+NDIPJlOco+S4BovRxMNxlLCKMlCGMNmOACh
	 8pZIEJp6s8rymij3r5asHb0aS/0MVlC66+pBoMb2rz+1LCeaB9OJfPYIRzVWHZ6cT1
	 xYm5M+WsWB0+fDtrmgfFja5SZncbFWzRtKUDXiE38PdWZBY3wJ8KTK4udTmR1oOqQT
	 wJ8DHYsIKy7fw==
Date: Fri, 27 Mar 2026 10:00:44 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	linux-kernel@vger.kernel.org, Oscar Salvador <osalvador@suse.de>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, linux-mm@kvack.org, 
	linux-cxl@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 00/15] mm: memory hot(un)plug and SPARSEMEM cleanups
Message-ID: <5a7ad1c5-6e06-4829-9971-05d3c599e581@lucifer.local>
References: <20260320-sparsemem_cleanups-v2-0-096addc8800d@kernel.org>
 <20260326195816.60110f50cd464d0076aad0ff@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260326195816.60110f50cd464d0076aad0ff@linux-foundation.org>
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

On Thu, Mar 26, 2026 at 07:58:16PM -0700, Andrew Morton wrote:
> Lorenzo, I've assumed that your conditional R-b on [01/15] is now
> unconditional.

Yeah that's fine.

Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
