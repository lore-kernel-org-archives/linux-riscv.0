Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355E7CA5FED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 10:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBebiUw10KtHvrfngx2zA6xcpWePvRITV2fzD/jmC+Q=; b=DdaffDo/17atWB
	mNAlJNuuvRDVdAAWU7j2XHCmkeyj/jOpDsA90nIvmm/xfWzIiwdmq8IS+jed2VvuQE4FKX14OAdO5
	lwYHwRdkMcT+h7WqJl9Gl+JINATk9fkoto8ooXekBzBurDkQhz3rhFb4CEY5OHrJ5YdR2T/zD0f9/
	d3jWvCsrYrEEF6ffSPbXv0f4TzOt/lEwQ/uQewA111n82K6w/uz03sK4T9kbDzo7AIYRkn+rx2lYv
	zhrOrLlvQ+RG5ZFTXEJh3XJi9P0H2Zrvc8qx0Vhyb2zyd7K65hOnOjZ+AMx88ooCUA7p+Wll0t8sR
	gsld8lPQLDyAjHSoqZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE20Q-00000000Ree-3bHX;
	Tue, 06 Oct 2026 10:02:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE20P-00000000Re9-3JtV
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 10:02:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B1BE435A5;
	Tue,  6 Oct 2026 10:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6591F000FF;
	Tue,  6 Oct 2026 10:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791280961;
	bh=A39VzXRsHbS34EkJ/psmhi1766KD2XKbN2N/lEv/6Zg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=MecrNhTwQ0vEq0Gx4TT6x1lr/4yWnp3c4V8ZSjQdIxq/aRSUw/6fXcgghBozZMpyP
	 rki8Ep7g6eSlIgJd37W8jBUArT2kPhZG+h1rJ3vPHhQ6PGbtxCi/z5haMa6Cf2Wuhz
	 +0f/jvRKbUJMCJQGW2+wUefAaPCpYGYMD0Dtr+gXHWQS+nkMlBpaMq01B4G/Ucx4QH
	 ZqFVAINmjRLh0QcySjjtLIxEtl7spmcHHFFEaAXKoRr7SynwYCklyDj/tSjAccBH7w
	 rpruu2B0gMHiwAsQnQw9mWYcRwgc6g97hvzuwNvd4ZiWfcW6nDIXdWFOrAcDEqcEsr
	 2h3C+nVRX2gMg==
Date: Tue, 6 Oct 2026 04:02:35 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Andy Chiu <tchiu@tenstorrent.com>
cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
    llvm@lists.linux.dev, andybnac@gmail.com, dfustini@oss.tenstorrent.com, 
    greentime.hu@sifive.com, Sergey Matyukevich <geomatsi@gmail.com>, 
    Zong Li <zong.li@sifive.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: Re: [PATCH v6 3/8] selftest: riscv: test vectorized user copy
In-Reply-To: <20260918215154.2481482-4-tchiu@tenstorrent.com>
Message-ID: <a4044f84-5b45-f58d-caba-ef0223b9581e@kernel.org>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com> <20260918215154.2481482-4-tchiu@tenstorrent.com>
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

On Fri, 18 Sep 2026, Andy Chiu wrote:

> Add a test that pushes a 1KiB pseudo-random stream through a pipe, so
> write() and read() copy it in and out of the kernel on the vectorized
> uaccess path, and compares the result against the original. Both buffers
> shift every iteration to sweep all relative alignments, and 16 processes
> per online CPU keep the vector unit contended. The compare is a byte at a
> time loop through volatile pointers rather than memcmp(), keeping it scalar
> and independent of the user vector state.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>

Thanks, queued for v7.4.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
