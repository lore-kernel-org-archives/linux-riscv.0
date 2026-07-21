Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226CAC4451C
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 13:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOM6t5oM632Kzqy1eNIX2NQQdnnsslOJ01mbnW1JsuQ=; b=ioAscOAoU3nSZo
	+17bu+WWsfAH9HY6Mzt0QeTTPjt19nLFaJHBUdH+OVRl1989Zk/GRZ0y1C3xQQXEWfwL1CqxQS0n4
	po/5dzCRIsO5wGoQerllXJ+1UsbUAwqJy1wZ2FDatz3tn49ut6zbt2JfKpihcQ/rCjmfYX7gkuScf
	rVS+wBmPXqmftTOiUek6vOqSPNDG7qztg5tGEmn/U0GzVcmdbt36xmnAClI5DYW+5gFPCCN0fguHp
	qqqj1MIXdedSljcJuTOUsBoC9uZk8g0+Iv1/LDczpi2mswq4YsP4/druiSFVOVXGS7ALKxlALjvy5
	wT92QUMFUEnBDYkUUNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmACt-00000009UFr-1bUj;
	Tue, 21 Jul 2026 13:08:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmACr-00000009UFa-2PPR;
	Tue, 21 Jul 2026 13:08:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BA4841AC7;
	Tue, 21 Jul 2026 13:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A081F00A3A;
	Tue, 21 Jul 2026 13:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784639301;
	bh=TYa/G9Ikx6NJ1Cb3jjSRc0JJzXsBaNhe6e1UGVGm/9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d6/V2aPEpPAB2I6Ua7LPwlcHwngi1zJi/XHIgdgpWsC+OpJGb8lJA2aRw5XgvUCSk
	 5IZrdAIm+bmynNmQblXUQu5K3mThBRK4gT3ERximvLzMKDANxWBbmBkq/iBUG9clUc
	 4TcfxO32nUe0BTZC9S93Hw6aq20MtO0npuydVBV4=
Date: Tue, 21 Jul 2026 15:08:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: stable@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH 6.16.y 0/6] cBPF JIT spray hardening
Message-ID: <2026072151-outsell-suburb-64ea@gregkh>
References: <20260714-cbpf-jit-spray-hardening-6-16-y-v1-0-2fc3e16263ac@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260714-cbpf-jit-spray-hardening-6-16-y-v1-0-2fc3e16263ac@linux.intel.com>
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

On Tue, Jul 14, 2026 at 11:58:24AM -0700, Pawan Gupta wrote:
> Hi,
> 
> These backports harden BPF JIT against spectre-v2 class of attacks. Without
> a predictor flush, execution of new BPF program may use stale prediction
> left behind by the freed one.
> 
> To avoid this, issue an IBPB flush on all CPUs on JIT program allocation.
> The flush is conditional to spectre-v2 mitigation applied.
> 
> Patch 1-2: Adds the predictor flush hook and enables it on x86 via IBPB.
> 
> 	  bpf: Support for hardening against JIT spraying
> 	  x86/bugs: Enable IBPB flush on BPF JIT allocation
> 
> Patch 3-6: Narrow the flush to only unprivileged JIT allocations
> 	   to avoid redundant flushes. Also adds pack-selection changes
> 	   that minimizes flushes.
> 
> 	  bpf: Restrict JIT predictor flush to cBPF
> 	  bpf: Skip redundant IBPB in pack allocator
> 	  bpf: Prefer packs that won't trigger an IBPB flush on allocation
> 	  bpf: Prefer dirty packs for eBPF allocations
> 
> This one is mostly similar to 6.18:
> 
>   https://lore.kernel.org/all/20260713-cbpf-jit-spray-hardening-6-18-y-v1-0-755f60c55705@linux.intel.com/

There is no active 6.16.y kernel branch, so why is this being sent to
us?

confused,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
