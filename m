Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33063C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 20:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TJHsYiQye/dqL8yQ7xOtcW1Z64HcoIYkLoWEtclVjo=; b=IMyQc+lY8tVYgn
	1s1G/rnRDhUG5jBf8SLsQvtEYOFLXrEZRTh46Je5z8gfFSVfcz6bRA9vpyGD2kClfzf68JOyRYQ7D
	OkU9CVDwB4p2dbIO9xVdEwe9x9tdtEPwfrMQJPvJn3r+r0OAG6vqgxSExcLyM47YQ+CQMCqgUFlkI
	Qa5+10845ZFNJeC//AI5J/xiB1U2ZH/G3Z7hiUD5ZyZOPOIKQvuVJva/PGx+aBA1DwK9RzlDDYGyx
	YBQ/USS/0bd+IyIC8uTCydOdMNEyqygfk6deXsRox8RabZBxwARRPn4Y5mkw5u7r1AV40VLUCtmZr
	RChgE76pNvq1JOIdsq4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAznb-004aSq-VH; Mon, 11 Jul 2022 20:14:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAznR-004aO5-56; Mon, 11 Jul 2022 20:14:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F26D615E8;
	Mon, 11 Jul 2022 20:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FB8C34115;
	Mon, 11 Jul 2022 20:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1657570459;
	bh=Qi9KHdTBSLuKZsaLawDZPDz9HT/wF+gH2hGfQ1b/XB4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j6XVvkVOWxDOzNjGjTDcj6e6ZY1u9GuvGONiK6EGJe21US8g66C0v4Tv4wCu+5Z3u
	 T5lr1fQ/vFxEaXWAl9b5zH6sU86TD4i30OcWtJ4fjtKbOuqrDS6Ez0AqW6I2zqbQ9j
	 6Q9WeeDMfajEfQXiH+eWEM5JFOXvwrthQ0YF7SB8=
Date: Mon, 11 Jul 2022 13:14:17 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, hch@infradead.org, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, x86@kernel.org,
 openrisc@lists.librecores.org, linux-xtensa@linux-xtensa.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-m68k@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-um@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V7 00/26] mm/mmap: Drop __SXXX/__PXXX macros from across
 platforms
Message-Id: <20220711131417.9cac57d9b88eea8bbd7d8616@linux-foundation.org>
In-Reply-To: <20220711070600.2378316-1-anshuman.khandual@arm.com>
References: <20220711070600.2378316-1-anshuman.khandual@arm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_131421_265555_FDB8188A 
X-CRM114-Status: UNSURE (   9.58  )
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

On Mon, 11 Jul 2022 12:35:34 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> This series drops __SXXX/__PXXX macros from across platforms in the tree.

I've updated mm-unstable to this version, thanks.  I skipped the added-to-mm
emails to avoid wearing out people's inboxes.

Reissuing a 26-patch series N times is rather noisy.  Please prefer to send incremental
fixes when changes are minor.  It makes it so much easier for reviewers to see what
happened.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
