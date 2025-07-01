Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD33C7EE30
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 21:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bGjK1HRd4TnkIgYaJ1sDlB3BY8gWx11dk1wcxuwHk0=; b=buBK/RTRAb0yQ3
	Xye1PjSWQV7JNGQsyYeVva9s0sIxgaAPn5T9dSxSsNfU5mXWC57/Ch+uuCB91Oa1tQ4ael1rQbZy0
	xr+me3QqQg/OjtcrqjQWNJ4d2JKhfjD8iKiB1+cpeBxXz3Qf0iNNBy4My4IRyNUl+Ulv4+xoqCrNw
	Rl7D2iyOPpdYelFDjlALSbcdZAuQK11s3VncZZzjvSGO3HKsXNOzVf8m/Xg3MQ0UhkE2vjFs8PnYC
	+Nk9v8pXWKBDUrzlQxOuFP8LDPqjVE8XN3tvOiEPKhJ6Xq95UdDhWTeya5A9t0WO/fsZSIgQhffKS
	kzl9IODyIGz/BIO11sEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWiO6-00000006g1l-0uCf;
	Tue, 01 Jul 2025 21:19:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWiLk-00000006fua-1iIf;
	Tue, 01 Jul 2025 21:17:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 242455C4742;
	Tue,  1 Jul 2025 21:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5CBC4CEEB;
	Tue,  1 Jul 2025 21:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751404626;
	bh=7eGyOEV7x7wAt+ZhaYCGZplsavyBFsM2rS6N9UhFUQ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=12uUgrBKhm5i1StiXqgwObMK+FWuQQrAJLnv40gfKzaoYNpfhtSzahhZDh6i2wdSx
	 Kt4EAgzr1RioihUsPzPA7+YOjbKfXJdx+YdDCXABOh5F/4v4Je8BZEIqdB0f/jwGPx
	 Qpf5uc2iRbb2/S/DxNqVppj6dWpS1S1SKJi4omsE=
Date: Tue, 1 Jul 2025 14:17:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lance Yang <ioworker0@gmail.com>
Cc: david@redhat.com, 21cnbao@gmail.com, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, huang.ying.caritas@gmail.com, zhengtangquan@oppo.com,
 riel@surriel.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 harry.yoo@oracle.com, mingzhe.yang@ly.com, stable@vger.kernel.org, Barry
 Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v4 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
Message-Id: <20250701141705.ff1a446e6a25d7970b209c3e@linux-foundation.org>
In-Reply-To: <20250701143100.6970-1-lance.yang@linux.dev>
References: <20250701143100.6970-1-lance.yang@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_141708_491703_22101623 
X-CRM114-Status: UNSURE (   9.47  )
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

On Tue,  1 Jul 2025 22:31:00 +0800 Lance Yang <ioworker0@gmail.com> wrote:

>  - Add Reported-by + Closes tags (per David)
>  - Pick RB from Lorenzo - thanks!
>  - Pick AB from David - thanks!

It generally isn't necessary to resend a patch to add these
things - I update the changelog in place as they come in.

In this case I'll grab that Reported-by: and Closes:, thanks.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
