Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B9ACCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 05:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZg9G3DyWd/Z1A+eIw8Kpi3RloE82vqQbOdDPofSFtA=; b=NrKBGXkH80Tgvk
	OEB0IsvtmqN2SIZz1N+Z5FGb/fiwcdWUTRvu843KIdxOFu9n++qA7xdWRBqU9hFV/p2gCkt9AqNpw
	VuBnto3CtqioOfa4h+XPDX7/qVBREgu/QpmFuGspxuPEAI1sWvBbO2J9Uvxe8wD8Y1CrXghzVjVhb
	lniaGVSTqPQWbOtRCVGrP7P382XIgf8KCctNFo4eEXtIQ7wGFCHBSN3uJZ1wVp/2FUaeMLU/8nAkP
	u5S/DA9DzGbAGiYGyoZ0aS8EXmVp/Ug0QWlPVWKZXRmVpYKZIAiVWQLO+Zi+XUUDfDN9z63pCO3kj
	kD5/GtqLzSi/fEjyc6tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ilq-00000005BZN-0Jsa;
	Thu, 09 Oct 2025 05:00:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ilo-00000005BZC-1Liy
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 05:00:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EBE5A620F4;
	Thu,  9 Oct 2025 05:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1356BC4CEE7;
	Thu,  9 Oct 2025 05:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759986049;
	bh=uM3x9ifdbeSCRTPz6Z1yuQ6p99Wfh//1kqt2rykLfTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MLYUAy1qaDvimbkU8zp/wLU5+DeClg5nTcZ+dJQcbewZIbyH7eD+j+QJ6sfzO3jdW
	 GYU1uhhcUcd+ehiqxvcabuPlWVrEh3zundBsH3ox0zlllO/i6IRb/RBXsTUEwBORvk
	 sUiaddxl1xt9jrTMnqoAW88X1nYVBUQZzcUB4AYA=
Date: Thu, 9 Oct 2025 07:00:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: Re: [PATCH 6.6.y 0/2] riscv: mm: Backport of mmap hint address fixes
Message-ID: <2025100920-riverbank-congress-c7ee@gregkh>
References: <20251008-riscv-mmap-addr-space-6-6-v1-0-9f47574a520f@iscas.ac.cn>
 <2025100812-raven-goes-4fd8@gregkh>
 <187fe5a3-99b9-49b6-be49-3d4f6f1fb16b@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <187fe5a3-99b9-49b6-be49-3d4f6f1fb16b@iscas.ac.cn>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Inochi Amaoto <inochiama@gmail.com>, Han Gao <rabenda.cn@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Meng Zhuo <mengzhuo@iscas.ac.cn>, Yangyu Chen <cyy@cyyself.name>, Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 09, 2025 at 12:19:46PM +0800, Vivian Wang wrote:
> =

> On 10/8/25 18:20, Greg KH wrote:
> > On Wed, Oct 08, 2025 at 03:50:15PM +0800, Vivian Wang wrote:
> >> Backport of the two riscv mmap patches from master. In effect, these t=
wo
> >> patches removes arch_get_mmap_{base,end} for riscv.
> > Why is this needed?  What bug does this fix?
> =

> The behavior of mmap hint address in current 6.6.y is broken when > 39
> bits of virtual address is available (i.e. Sv48 or Sv57, having 48 and
> 57 bits of VA available, respectively). The man-pages mmap(2) page
> states, for the hint address [1]:
> =

> =A0 =A0 =A0 =A0If addr is NULL, then the kernel chooses the (page-aligned)
> =A0 =A0 =A0 =A0address at which to create the mapping; this is the most p=
ortable
> =A0 =A0 =A0 =A0method of creating a new mapping.=A0 If addr is not NULL, =
then the
> =A0 =A0 =A0 =A0kernel takes it as a hint about where to place the mapping=
; on
> =A0 =A0 =A0 =A0Linux, the kernel will pick a nearby page boundary (but al=
ways
> =A0 =A0 =A0 =A0above or equal to the value specified by
> =A0 =A0 =A0 =A0/proc/sys/vm/mmap_min_addr) and attempt to create the mapp=
ing
> =A0 =A0 =A0 =A0there.=A0 If another mapping already exists there, the ker=
nel picks
> =A0 =A0 =A0 =A0a new address that may or may not depend on the hint.=A0 T=
he address
> =A0 =A0 =A0 =A0of the new mapping is returned as the result of the call.
> =

> Therefore, if a userspace program specifies a large hint address of e.g.
> 1<<50, and both the kernel and the hardware supports it, it should be
> used even if MAP_FIXED is not specified. This is also the behavior
> implemented in x86_64, arm64, and, on a recent enough (> 6.10) kernel,
> riscv64.
> =

> However, current 6.6.y for riscv64 implements a bizarre behavior, where
> the hint address is treated as an upper bound instead. Therefore,
> passing 1<<50 would actually return a VA in 48-bit space.
> =

> To reproduce, call mmap with arguments like:
> =

>        mmap(hint, 4096, PROT_READ, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
> =

> Comparison:
> =

> =A0 =A0 =A0 =A0 hint =3D 0x4000000000000 i.e. 1 << 50
> =

> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 6.6.106=A0 =A0 =A0 =A0 =A0 =A0 =
=A06.6.106 + patch
> =A0 =A0 =A0 =A0 =A0 =A0 sv48=A0 =A0 0x7fff90223000=A0 =A0 =A0 0x7fff93b4e=
000
> =A0 =A0 =A0 =A0 =A0 =A0 sv57=A0 =A0 0x7fffb7d49000=A0 =A0 =A0 0x400000000=
0000
> =

> When the hint is not used, the exact address is of course random, which
> is expected. However, since the address 1<<50 is supported under Sv57,
> it should be usable by mmap, but with current 6.6.y behavior it is not
> used, and some other address from 48-bit space used instead.
> =

> There's not yet real riscv64 hardware with Sv57, but an analogous
> problem arises on Sv48 with an address like 1<<40.

As this issue has been fixed for many years now, why is it just showing
up now?  Shouldn't you be using 6.12.y for new hardware?

> One real userspace program that runs into this is the Go programming
> language runtime with TSAN enabled. Excerpt from a test log [2], which
> was run on an Eswin EIC7700x, which supports Sv48:
> =

> fatal error: too many address space collisions for -race mode
> runtime stack:
> runtime.throw({0x257eaa?, 0x4000000?})
> =A0 =A0 /home/swarming/.swarming/w/ir/x/w/goroot/src/runtime/panic.go:124=
6 +0x38 fp=3D0x7ffff84af758 sp=3D0x7ffff84af730 pc=3D0xc9310
> runtime.(*mheap).sysAlloc(0x3e3c20, 0x81cc8?, 0x3f3e28, 0x3f3e50)
> =A0 =A0 /home/swarming/.swarming/w/ir/x/w/goroot/src/runtime/malloc.go:79=
9 +0x56c fp=3D0x7ffff84af7f8 sp=3D0x7ffff84af758 pc=3D0x67944
> runtime.(*mheap).grow(0x3e3c20, 0x7fffb69fee00?)
> =A0 =A0 /home/swarming/.swarming/w/ir/x/w/goroot/src/runtime/mheap.go:156=
8 +0x9c fp=3D0x7ffff84af870 sp=3D0x7ffff84af7f8 pc=3D0x824c4
> runtime.(*mheap).allocSpan(0x3e3c20, 0x1, 0x0, 0x10)
> [...]
> FAIL=A0 =A0 runtime/race=A0 =A0 0.285s
> =

> With TSAN enabled, the Go runtime allocates a lot of virtual address
> space. As the message suggests, if the return value of mmap is not equal
> to a non-zero hint, the runtime assumes that mmap is failing to allocate
> the address because some other mapping is already there (in other words,
> it assumes the man-pages documented behavior), and unmaps it and tries a
> different address, until it tries too many times and gives up. This
> means Go with TSAN fails to initialize on Sv48 and current 6.6.y.
> =

> (cc Meng Zhuo, in case of any questions about the Go runtime here.)
> =

> Patch 1 here addresses the above issue, but introduced regressions (see
> replies in "Link"). Patch 2 addresses those regressions.

Ok, that makes a bit more sense, but again, why is this just showing up
now?  What changed to cause this to be noticed at and needed to be fixed
at this moment in time and not before?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
