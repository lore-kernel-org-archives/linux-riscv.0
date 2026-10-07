Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513FBCA5FFC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 16:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YrpSLjlSrfoQa1I0BEvjHrbPT9aPE1gyu5iUoOuqcLA=; b=SSOaoonmevd90o
	x/ZgrdQY9J9Ybop26rqXkQVhhLd60ik0KTm6ExvdisY+QQb8c3XHu3rUKNv5NdmFAveQHLdABoZSK
	BC8spxhUNDFugRMNS9av1S9Vsf4spqbvE5CRgcMF9M9UIN8Gkmdv1xYwghIrjKJKW9VyDLBlDTxUM
	LPV/uPg+pf8+wqT94DIABvn5HEGPZYnuy0gz8cIHHvm6U5XLH8torq6cWaaoK6H3uy5f3gL2QEwhX
	EHk9XICOU4H20eNmp/vOPZSaqcEO9RUTi/UimtjqOHdcvF5JQYJkWyH+/XMJpUQJ7mryeS2BnRiue
	mCdudq3bruXSm1D5xAQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEUmy-00000002mfe-49P2;
	Wed, 07 Oct 2026 16:46:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEUmx-00000002mfY-1Y9x
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 16:46:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D1F9742ABE;
	Wed,  7 Oct 2026 16:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944471F000FF;
	Wed,  7 Oct 2026 16:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791391602;
	bh=JUPw1N6sew7FNQGiyeXK5J/jxX2zbg2kls5/1gDqOFw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=XPkxciJyLfVTs/KNaF6MYolbEav5BkVpD8tXV0MKUSLJF2EknKZJW6dBIM1fJ2KlQ
	 2lnd1O+IAqPmDT9TNj4PkL0/ctw/tEr3+/rgpHBKPjiE0h+KxsdbYSgcQUxt64QV10
	 2+B8xB5g6WdEu4hH0udZzQggOFJPPxh55f6IZ6MFuuukDnZJWirGv7h4GsvKb1rM6A
	 wwODj7/bc4OIXXK4rGoqJMg7hN76CUDNMtm+btGjXkjGwpJH8D/fwL3afevIfsEodx
	 dqJFvJ0RTgXJbL0wcgAfBN4JD5nfTZC3tlaN2Pjm2xe+FmfcA0edIh0jqevVlO8B3b
	 J3/zJdyZjDyZA==
Date: Wed, 7 Oct 2026 10:46:38 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Zongmin Zhou <min_halo@163.com>
cc: oleg@redhat.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
    alex@ghiti.fr, andybnac@gmail.com, debug@rivosinc.com, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] riscv: ptrace: Zero-initialize regset buffers before
 copyin
In-Reply-To: <20260826115711.86861-1-min_halo@163.com>
Message-ID: <9daae172-b921-2422-b089-df9255e5f218@kernel.org>
References: <20260826115711.86861-1-min_halo@163.com>
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

On Wed, 26 Aug 2026, Zongmin Zhou wrote:

> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> user_regset_copyin() only copies `count` bytes, so a PTRACE_SETREGSET
> request with a short iov_len leaves the rest of the stack buffer
> uninitialized. In riscv_vr_set() that garbage is validated and copied
> into the target's vstate, and in riscv_cfi_set() it can be stored as
> the target's shadow stack pointer. Zero both buffers, as the get path
> already does.
> 
> Fixes: 9300f0043974 ("RISC-V: Add ptrace support for vectors")
> Fixes: 2af7c9cf021c ("riscv/ptrace: expose riscv CFI status and state via ptrace and in core files")
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>

Thanks, queued for v7.3-rc.


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
