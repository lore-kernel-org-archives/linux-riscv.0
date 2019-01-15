Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C313EC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:40:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93F4320657
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:40:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fBv/kp/f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93F4320657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUzROUzvOzPsG9mCES+FSEuLZZXAH7oiD/30S9buBC4=; b=fBv/kp/fbTzkwC
	p2/CyxIcqTGbveh9dL0qORPtKu8kG5nb7FCsC48FZlSn9+f25IO4hWyT8xYzDKWFBc0SKfZ9qnBgP
	eU2O23lJW1SJN8d35rUYEhlm+NTFxIPm0NSJTR7SutvnYgcJX/UN5SaTHGd5KxNeLbEVU1mJjsTKy
	sGzTztGhfnJzaZQluy4tCDHSBfDTEx7qrpdgHUvJAV2kjUH3Il/Csw7gMCLq3EKBPpUZ8tdCjuDm8
	MFwC8Tk0rCSTXKHjKh7d+uj1t0hZ26B4LB4rYUEfqKec8CBOue8DJsrl/O5B2z8Yco7KX51G9K3yV
	RatjNPLDdGihfDuLdlQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjQpG-00076N-21; Tue, 15 Jan 2019 15:40:26 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjQp2-0006Aa-Ga; Tue, 15 Jan 2019 15:40:12 +0000
Date: Tue, 15 Jan 2019 07:40:12 -0800
From: Christoph Hellwig <hch@infradead.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Subject: Re: [RFC PATCH 0/3] RV64G eBPF JIT
Message-ID: <20190115154012.GG26443@infradead.org>
References: <20190115083518.10149-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190115083518.10149-1-bjorn.topel@gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org, palmer@sifive.com,
 daniel@iogearbox.net, davidlee@sifive.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Bj=F6rn,

at least for me patch 3 didn't make it to the list.

On Tue, Jan 15, 2019 at 09:35:15AM +0100, Bj=F6rn T=F6pel wrote:
> Hi!
> =

> I've been hacking on a RV64G eBPF JIT compiler, and would like some
> feedback.
> =

> Codewise, it needs some refactoring. Currently there's a bit too much
> copy-and-paste going on, and I know some places where I could optimize
> the code generation a bit (mostly BPF_K type of instructions, dealing
> with immediates).
> =

> From a features perspective, two things are missing:
> =

> * tail calls
> * "far-branches", i.e. conditional branches that reach beyond 13b.
> =

> The test_bpf.ko (only tested on 4.20!) passes all tests.
> =

> I've done all the tests on QEMU (version 3.1.50), so no real hardware.
> =

> Some questions/observations:
> =

> * I've added "HAVE_EFFICIENT_UNALIGNED_ACCESS" to
>   arch/riscv/Kconfig. Is this assumption correct?
> =

> * emit_imm() just relies on lui, adds and shifts. No fancy xori cost
>   optimizations like GCC does.
> =

> * Suggestions on how to implement the tail call, given that the
>   prologue/epilogue has variable size. I will dig into the details of
>   mips/arm64/x86. :-)
> =

> Next steps (prior patch proper) is cleaning up the code, add tail
> calls, and making sure that bpftool disassembly works correctly.
> =

> All input are welcome. This is my first RISC-V hack, so I sure there
> are a lot things to improve!
> =

> =

> Thanks,
> Bj=F6rn
> =

> =

> Bj=F6rn T=F6pel (3):
>   riscv: set HAVE_EFFICIENT_UNALIGNED_ACCESS
>   riscv: add build infra for JIT compiler
>   bpf, riscv: added eBPF JIT for RV64G
> =

>  arch/riscv/Kconfig            |    2 +
>  arch/riscv/Makefile           |    4 +
>  arch/riscv/net/Makefile       |    5 +
>  arch/riscv/net/bpf_jit_comp.c | 1612 +++++++++++++++++++++++++++++++++
>  4 files changed, 1623 insertions(+)
>  create mode 100644 arch/riscv/net/Makefile
>  create mode 100644 arch/riscv/net/bpf_jit_comp.c
> =

> -- =

> 2.19.1
> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
---end quoted text---

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
