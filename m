Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F36ECD6E75
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 23:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3toXCc6cOE8IV6V92ag8kv0rGQ2xCLneXR+H+iO/VUw=; b=XkA7AEyw8M43CX
	pavsDTwuL1iaFJxhniLD5HA9YXQk8DxHa0zLF2CckcG97C1URJorgQUdhQHXFtoi0T9Y/ZJ90+ykH
	nOsHb5Ou0+otJgYxG5oXaUYzgXUybnv1P3HInIfly67nrGVGDNNMiSsDKukSBncoS+xfW3HO6zDQh
	yufs7wGD9tXqXsTCJWJc1+A9dc6YTMu+o7wRd+iDxtKQHjTGXx2Vbm/M1SWQK8dLuEW+QwPFT7srk
	pSJj4AxGpvX/35YNZ801IPepfDnLelWrHJFiMNcRa0mW4rR+XVVeswB1zT741CRU0Zd/qN82We9Gt
	ENLUjJgh042Asc93WEgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVHgX-0000000HRec-3RJx;
	Thu, 04 Jun 2026 23:41:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVHgW-0000000HReW-1olt
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 23:41:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D61A3407FB;
	Thu,  4 Jun 2026 23:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461CC1F00893;
	Thu,  4 Jun 2026 23:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780616471;
	bh=0QHV2vYtmnptSefCqHx+b7ZWaXLYqZiwKrxHa/B0vT4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=XObhX4epIbXAvf4gJLVS2l7go87WDWpatv71tnGat+lNo1Cl4lOdhKzQI/3Tyxu9U
	 VfhuMd3xkHIWgOEUUEgX7o3s0uTc8aPUIPTovR9xS+bLvt75MWHjaXRferZhBkaII6
	 U6mhXvJucoNgYf8Whg+1D+sTDTgSFmQACJTBc8d+D6rZHqxknMkd1gHJ+KV0BsX0Sh
	 EdvfHJXRdp5Yi7Fl3Y0rJXU5BV/+zxHS99E55xeJHN5PMOBwJeFZ/uvzQI8X5XhbCP
	 HUSzKRs0X93xryrvAPMbgLe/3V7WhtRQM9FGgxZF2Ej6JD/ZA8mbuiBSC04wTRbm4R
	 jxZt2BEUUyt+A==
Date: Thu, 4 Jun 2026 17:41:10 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Rui Qi <qirui.001@bytedance.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] riscv: stacktrace: Remove bogus -0x4 offset in
 non-FP walk_stackframe
In-Reply-To: <20260603115329.791603-2-qirui.001@bytedance.com>
Message-ID: <f04aa9b7-9118-d9f6-6431-75234dc2a207@kernel.org>
References: <20260603115329.791603-1-qirui.001@bytedance.com> <20260603115329.791603-2-qirui.001@bytedance.com>
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

On Wed, 3 Jun 2026, Rui Qi wrote:

> In the non-frame-pointer version of walk_stackframe, each value read
> from the stack is treated as a potential return address and has 0x4
> subtracted before being used as the program counter. This was intended
> to convert the return address (the instruction after a call) back to
> the call site, but it is incorrect:
> 
> 1. RISC-V has variable-length instructions due to the RVC (compressed
>    instruction) extension. A call instruction can be either 4 bytes
>    (regular) or 2 bytes (compressed, e.g. c.jal). Subtracting a fixed
>    0x4 assumes all call instructions are 4 bytes, which is wrong for
>    compressed instructions.
> 
> 2. Stack traces conventionally report return addresses, not call sites.
>    Other architectures (ARM64, x86, ARM) do not subtract instruction
>    size from return addresses in their stack unwinding code.
> 
> 3. The frame-pointer version of walk_stackframe already dropped the
>    -0x4 offset. Commit b785ec129bd9 ("riscv/ftrace: Add
>    HAVE_FUNCTION_GRAPH_RET_ADDR_PTR support") replaced "pc =
>    frame->ra - 0x4" with ftrace_graph_ret_addr(), and the commit
>    message explicitly noted that "the original calculation, pc =
>    frame->ra - 4, is buggy when the instruction at the return address
>    happened to be a compressed inst." The non-FP version was simply
>    overlooked.
> 
> Remove the bogus -0x4 offset to match the FP version and the
> conventions used by other architectures.

Thanks for the very clear commit message and for the fix.  Queued for 
v7.1-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
