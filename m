Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789A5CCFA13
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 14:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M74BOsKtashMAb4ip1so/cNBlQGXh50W1gIAjAoZ7jo=; b=j7xroB5RCMnUoD
	IQG/YRVMuB5TfOsx4fL1B/2EGyuSeyybZZfSX0MiLCwSTciSUIWo+S8K4kUvyR1EJDqeNt5Y5lFV/
	d/0XjN3WLJFPsIbJH9jsfeSB+qUWfulD1COr4LX/Tkzb3FQj+YOOCPH2SFRnTJJILVzaY3mltWarZ
	4v8HcphQMIzHQcoNTyLUknjrODiZOkX+ljvVqoTx9CbwxHbBRwE8mnHpZlBeEWMwlgnhmA7EKK3qi
	d58Y5253EtPBg4GrjnjkAY6dWNY7xsM2RS+RoPTQPugx0y0/eU87mqHeCltj8BijYcyEnJI1E+69s
	kdPM3uW7uYJGqxmje/8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIpIe-00000007Iv7-1LFK;
	Fri, 01 May 2026 14:57:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIpIc-00000007Iui-1qUc;
	Fri, 01 May 2026 14:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GWaEOZ6T8RZshC5VNeX+VR+c38seOstsZgFtVZK1Yb0=; b=Er8GF8z4i4fcdoqldcSz6UdIrK
	0uV2fMmb401OPsbWUDQlEgY0WImYvRoaOS/51Kt7cci4PwM0IwWZmDRUbGXw7O9IkTUTcXx4Dq2Om
	1ySnKP5ZPsmA0cdTKwQEUsbejJKOkDxp+xsnqOc9et7bCG9WzZFKFYNxcz4UjijcH9lNIaYGg9axV
	D8CvZuRnVnBvGs0WeFCpwaRxMrcj+ZmM+kVA2Q+aDmR35tDfpqtDlNjfzVDU0ieNT7dT3nkuFY8KO
	oBaeuIlQkfSbM8D3+gtqA/Kl4BULEQcG2OPtDBswRpN88NbjoIlZE7bl29JItAlrzNVWRNazfWERT
	lB1uWyaw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIpIN-00000008wbR-3iIK;
	Fri, 01 May 2026 14:56:48 +0000
Date: Fri, 1 May 2026 15:56:47 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, jack@suse.cz,
	pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn,
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com,
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com,
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <afS_L-5XeWIldTXA@casper.infradead.org>
References: <20260430040427.4672-1-baohua@kernel.org>
 <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
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

On Fri, May 01, 2026 at 06:49:58AM +0800, Barry Song wrote:
> 1. There is no deterministic latency for I/O completion. It depends on
> both the hardware and the software stack (bio/request queues and the
> block scheduler). Sometimes the latency is short; at other times it can
> be quite long. In such cases, a high-priority thread performing operations
> such as mprotect, unmap, prctl_set_vma, or madvise may be forced to wait
> for an unpredictable amount of time.

But does that actually happen?  I find it hard to believe that thread A
unmaps a VMA while thread B is in the middle of taking a page fault in
that same VMA.  mprotect() and madvise() are more likely to happen, but
it still seems really unlikely to me.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
