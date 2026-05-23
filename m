Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264BFCD5BB3
	for <linux-riscv@archiver.kernel.org>; Sat, 23 May 2026 00:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FMyoXhCJO6524mBaTLGgx3THhwPa4p5Tejtcm+LZCwY=; b=yHYPnHQwbH/Wvt
	4HryAKZ+tgl3p4LgEmeg8PT1HQm7oXKWhMmejsmBbPsDY/YuG5Vbn7rKz7/IIgRrSUpFM9Dq6ZoQh
	XvUwViWcdV/eK0W5OuHIIxkl+0hqHxi4X/TL5BphbtnRlJCXWwLckCFQr/7ZrXsHzETCXE5c7VOwD
	HdKett4eDJjsXf6H3TwUZ9CgCkMthAJmumDFRw8S0eKmAlyGf2NfAPLxHXYflynDQGfatTpA49US0
	j4oziR5xXVh8AXsZ7GKGH1UhxOneJ3rIVT/iKwD5cF32gftn6y1oUFcVS+PlZKy+Z5OPptBQKOYyA
	GzGRhyC3ktzEhxGIZ5uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQZpA-0000000CH9a-3TNg;
	Sat, 23 May 2026 00:02:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQZp9-0000000CH9G-0dlX
	for linux-riscv@lists.infradead.org;
	Sat, 23 May 2026 00:02:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 97DC160103;
	Sat, 23 May 2026 00:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E301F000E9;
	Sat, 23 May 2026 00:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779494558;
	bh=BGTkKvSPuE5al+MftdgA9e0ramgmtr0IIHqjMaXwx04=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=h9GVleRJKUXdUhTip+xz6cMjbDOYNtn3Xh1gIy0zbrlaxezb/5rJ88G3TJA1Y4YQS
	 QmA2sicC7w1LM7RMDeMLMj5fgMngt02/P+ynQ+pW0oiLv1W9if7ifzOd8ClIio+KiF
	 L93vcztxZ2W+XiRa3L8hSK+uozTi9FoF7kA9VNTZ+BjyyjD52VS4IM3F+MfpbwPvCA
	 hnBImDXhI1vruuxCvAQfbhKcpX5AxyMrRVXyx30oqgA346PjevKB7nYlv6GoKwuSw4
	 4ydgogNxbHebiuS+mR5LjO2GOdbN//L3mFcstZOJ2uJKpHsXTDuvp+LLIMXzI4NwY6
	 A2AOwAHidcUJw==
Date: Fri, 22 May 2026 18:02:36 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
cc: acme@kernel.org, alex@ghiti.fr, dapeng1.mi@linux.intel.com, 
    guoren@kernel.org, irogers@google.com, linux-kernel@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
    mingo@redhat.com, namhyung@kernel.org, peterz@infradead.org, 
    pjw@kernel.org
Subject: Re: [PATCH v2] perf riscv: Add SDT argument parsing for RISC-V
In-Reply-To: <20260508082658.3982-1-cp0613@linux.alibaba.com>
Message-ID: <b9f0c9a6-01bb-c111-2153-60c2b3407dae@kernel.org>
References: <20260416124945.121699-1-cp0613@linux.alibaba.com> <20260508082658.3982-1-cp0613@linux.alibaba.com>
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

Hi,

On Fri, 8 May 2026, Chen Pei wrote:

> Gentle ping.
> 
> Please let me know if there's anything I can do to help move this forward.

Probably the best thing that you could do is to find at least one other 
person -- ideally, more -- to review and test, and to send a Reviewed-by: 
and Tested-by: to the list.  

> Thank you very much for your time and guidance.

Thanks for sending the patch!


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
