Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58D8C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 09:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3f+18Mhf402psONkMymuCOEjtiLTa6F94rS1WOcCJc=; b=2mbGwWirsHpWXT
	rLLg5fmm6KUy2CB8vBFwiZGhXLVYBbGDxswzN8WFaYbSyY3LANKMVmYX5bP00hZ236EswLYrJp6d5
	QcwynEzNNIeubcT5Uvke75gP5DKtyoWedTX4FshIZq0pLTJ4ncEEOcjFBNifAPSiB3MA7FsI21t54
	4JpkfL/NHAqlLo+/6ertE5FSk120XAdmmDuUssZs3gCMazWpOkmqea3W8pm0YRBNe7WZxd4/bn3LP
	DDcixPB+jxYdaslCIIZQMA5m7pDXEHiuQak7iI6KoMyN7CryFgeDAwpoNxCR/HL3yBN9MPRNhCMmS
	THXrLyayA6drDoG/mCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUmhx-00FZQc-9C; Thu, 17 Mar 2022 09:46:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUmhv-00FZQK-QH
 for linux-riscv@bombadil.infradead.org; Thu, 17 Mar 2022 09:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gyGtFzNeoxStsezjUkQICZnTPdUarjxnpiDNsa6B0WE=; b=WA4v03glmgat2hllQ9wlSLQexd
 tnKPktAgWSrAZOTMlckmuAD/E3aa4B2WOa+YYl5fc+bHKwSd2e+Qfqb419maoCdNulfCQ0IXvtZE1
 jiobU3dnwFBu6n1zW1VVjADF06+GPkeXMiBWNq2bMat8sXBY9lrHk/BHQCk7cRf+FOnfKo88hzQl0
 j5TWYEK/f/kkRo95RFldthbnBVNxSBb36DaJeMcqrddCc8ixjU1fSF2myO3YIcJAQi0fEOuhas+cB
 /rtoztwPtRcPjGJrNs7eP7WW7B0beYa9foYEBf8NiW17OZ/JHQYT8LavxfMpYviCdlH8X86ZgTZrH
 LzCoQjYA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUmho-006qam-K5; Thu, 17 Mar 2022 09:46:04 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3B0813001EA;
 Thu, 17 Mar 2022 10:46:01 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1E1B8201CD1C3; Thu, 17 Mar 2022 10:46:01 +0100 (CET)
Date: Thu, 17 Mar 2022 10:46:01 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 mingo@redhat.com, Will Deacon <will@kernel.org>, longman@redhat.com,
 boqun.feng@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, jszhang@kernel.org,
 wangkefeng.wang@huawei.com, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 2/5] asm-generic: ticket-lock: New generic ticket-based
 spinlock
Message-ID: <YjMDWQ3T5oYU7sYG@hirez.programming.kicks-ass.net>
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <20220316232600.20419-3-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220316232600.20419-3-palmer@rivosinc.com>
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

On Wed, Mar 16, 2022 at 04:25:57PM -0700, Palmer Dabbelt wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> This is a simple, fair spinlock.  Specifically it doesn't have all the
> subtle memory model dependencies that qspinlock has, which makes it more
> suitable for simple systems as it is more likely to be correct.
> 
> [Palmer: commit text]
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> 
> --
> 
> I have specifically not included Peter's SOB on this, as he sent his
> original patch
> <https://lore.kernel.org/lkml/YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net/>
> without one.

Fixed ;-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
