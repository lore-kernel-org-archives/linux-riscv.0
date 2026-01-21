Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD73C44506
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 18:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLV2wvaGsYWKwA5x/mgW9Rw0JCVyVXtQc8AahjIzF18=; b=1Ud3/vWkzPNMqI
	Tdx6E5emFelah6ZL6fbLFkgMjI5pxuCGDSKpz+WhfAFByzsL4vABhVriZGvb0KeFrjyZhbSzwDRVk
	LlzXoWtTChIHd8ef3plnwIdKGEIc8WARAHy6PYwWFMt2NqnD3P9SYzTw4rj1ti0PsCpfuTgBP5L3T
	WtUPj/mgRRiEWp6ZvIIpU66vH6xtIAJJuC84LnaoP//36mfHgyQEQlgsA/4r9riTaMgqBLAtHRO3H
	Mya+ql+LTijjTnZDgmZt3CbqwBpFuzvxtLfQrjzyjtt0l33QhfciXYMf4VtvM+C3gn/vZGBsbICxc
	wIhIAA+Ui2v0AOYTt5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vico2-00000005uzr-20Aq;
	Wed, 21 Jan 2026 18:19:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vico1-00000005uzd-3FAJ
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 18:19:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AAC426012A;
	Wed, 21 Jan 2026 18:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B8DC19422;
	Wed, 21 Jan 2026 18:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769019588;
	bh=3CcvuOymMDRK29xRNEntJWvnGy/LwN0+SLFJAFzMZ8E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FUOmjg4HrSD61U4mlQAZ2io3Zte8HunIIzqI9X38l4TxHj4+sXDnnimRkkzhg48z+
	 pKmK7u/0L4SIbZ/zuD/cDr+S7Cn3+a/RVXE4zrZDnQJgCZF8TbYaFvoDn/mOtcARYX
	 9If04c6uexTGdhoS94fjzqkDqv1i8HSe6gfUwlUniMn35nMslP4CetvR8fKjIcLWDr
	 K8ICPXuReV9hvuAu/ZhJS+OEXpMFvP7By0SeDnlUlaRkcDpK13YtvFy17RqofV2O96
	 URtUOkWEYp5OnNss1sdZ4Rl7cDUQwPys+BpScyomcz3hHAaH+ofdCXsNOwH53fYxl0
	 AWkav6kw/5FCg==
Date: Wed, 21 Jan 2026 11:19:44 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
    Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
    Gary Guo <gary@garyguo.net>, Yury Norov <yury.norov@gmail.com>, 
    Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com, 
    torvalds@linux-foundation.org, olof@lixom.net, 
    aleksa.paunovic@htecgroup.com, arikalo@gmail.com, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Support for Risc-V CPUs implementing LR/SC but
 not AMO
In-Reply-To: <20260120-lrsc-only-v2-0-a522e640d27d@mobileye.com>
Message-ID: <6201870b-b50d-f6e2-814b-7a1fdbf064db@kernel.org>
References: <DFSQIY6WV4U7.3B3RY31KE739B@garyguo.net> <20260120-lrsc-only-v2-0-a522e640d27d@mobileye.com>
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

Hi Vladimir,

On Tue, 20 Jan 2026, Vladimir Kondratiev wrote:

> Primary goal is to support Mobileye eyeq7h automotive platform
> based on MIPS P8700 CPU [1] having only "zalrsc" ISA extension but
> not full "a".
> 
> Such platforms need userspace to be compiled with correct
> "-march" flags to generate proper instructions for the atomic types
> so there's not feasible to use universal userspace for it.
> Thus there's no point to do same binary kernel suitable for both
> "full A" and "LRSC only" platform types. Do a compile time
> alternatives and require CONFIG_NONPORTABLE for this
> 
> [1] https://mips.com/products/hardware/p8700/
> 
> Patch 1 do most of work to provide compile-time LR/SC alternatives
>         for the AMO instructions
> Patch 2 adjust tests for reported CPU extensions compatibility with
>         the code
> 
> Changes in v2: switch from dynamic atomic flavor resolution to
> compile-time one.
> 
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

Thanks for updating the patches so quickly to deal with Gary's comments. I 
think we should hold off on merging them until common userspace providers 
(like Linux distributions) or distribution builders (like OE/Yocto or 
Buildroot) merge support for this configuration, along with underlying 
projects like glibc.  That way, the rest of us have a way to test our 
patches on this unusual configuration before sending them to the list, or 
sending PRs upstream.  It should be straightforward to get the Zalrsc-only 
userspace support patches tested on existing RISC-V Linux hardware, since 
it supports a superset of this behavior.  I guess the only question is 
whether other projects are interested in committing to carrying forward 
the necessary changes.

It also would be good to see publicly available MIPS P8700 boards being 
used on an ongoing basis by at least one active participant on this list, 
who can post Tested-by:s for key series and who can post review feedback 
and Reviewed-by:s for other RISC-V patch series.  That way, we'd have more 
confidence that there actually is an ongoing user population for this 
board who cares about upstream.  This is particularly important for folks 
who care about these MIPS P8700 cores, which don't seem to be a 
from-scratch design for RISC-V, and which don't have AMO support like all 
of the other cores we support.  (For what it's worth, we're trying to 
foster this engagement for other core microarchitectures as well; thanks 
Joel Stanley of TensTorrent, Andrew Jones and Anup Patel of 
Ventana/Qualcomm, and Andreas Korb of Fraunhofer working on the Core-V 
designs for showing how this is done.)


thanks,

- Paul



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
