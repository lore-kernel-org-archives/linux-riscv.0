Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE71CC6B33
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 13:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:MIME-Version:References:
	In-Reply-To:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1tD22JHla2hQDYN+vJKxS8b4XMrGTga7B1LLew2j2b0=; b=imK5uFAJLUxEZs
	QH1WpWl31mrTabb9cY7g9Pqu8YbrQ2jwQaBAr7msvI4+M3ZcVov57W9sIbk5aFLwyMlizniqXPfoD
	AqbZAIC2Cfk8jvbyHN89LlNQR/IQcTSnKMsI9E8eRxPYZxwsauszWuILcNQVcqY5oZC+gQ6gZI2ek
	vnpONPCmHcP8LDQCv3WydoH1qlQpKXptRjJZnbtin3HqISH4Ty50K7QfEUpQBpy/XP0cmkGVuQqzO
	rHoTSwc5wajEEQMmqfxmJN4kdeje/fJ4diUuulb5ptRByoNykSlviMTOEdKncRePjrZIkMoVIxeYN
	2vGiWAl4wAw6MIXQKTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLNJ-00000000EbP-3HW6;
	Thu, 15 Oct 2026 13:20:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLNH-00000000Eai-2Gga
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 13:19:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AA407601EF;
	Thu, 15 Oct 2026 13:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183661F000C4;
	Thu, 15 Oct 2026 13:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792070398;
	bh=XmTFPFQKWNQCbwKOGMyIvwptcs1NVuc7umRcO5tIaEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g2+OvKqtQbt4MeL45W1VNDsC8TbMWIM6miExxgO6+CoHN2bvfRNW455gOXdFAgA5u
	 jBaaj8CITkLsB6ZmIGx26zvKIjThAV+sL8Vpuzb/+lupc0/ktQBAOTchax63Ku7U6J
	 QXQY3rcDX0oBW9ib/tTHERY7WSHWa3RLNpIq/YtBEmEvqqiIOkKp8GqwZOOzSh/fHd
	 WhP5PQJm6+B3at7BH07/upxc/fPk6A+n5UpzDy19iEo8WgB4pwRbnjeVLr581GSN9I
	 x/RzGYMpedzPMAGzrm1Xy6FwPdKBUEbLDKseX9HkuRA3stx/YU62HYrZXrV4XvgJ4W
	 wais4Bak8XRVw==
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Nam Cao <namcao@linutronix.de>, Naveen N Rao <naveen@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] riscv: kprobes: reject probes inside LR/SC sequences
Date: Thu, 15 Oct 2026 22:19:54 +0900
X-Mailer: UndineD 0.1
In-Reply-To: <20261014094415.374-2-yuanxiaofeng@eswincomputing.com>
References: 20260828091202.1124-1-yuanxiaofeng@eswincomputing.com
 <20261014094415.374-2-yuanxiaofeng@eswincomputing.com>
MIME-Version: 1.0
Message-Id: <20261015131956.183661F000C4@smtp.kernel.org>
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

On Wed, 14 Oct 2026 17:44:14 +0800, Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com> wrote:
> A trap taken in the middle of an LR/SC sequence clears the load
> reservation, so an SC following the probed instruction always fails and
> the enclosing retry loop re-enters the breakpoint, livelocking the CPU.
> Reject probes of the LR/SC instructions themselves and of any address
> between them.
>
> arm64's kprobes rejects its equivalent exclusive load/store instructions
> and, in arm_kprobe_decode_insn(), walks backward from the probe address
> (bounded by the enclosing symbol) to reject any address inside an
> exclusive sequence.  RISC-V cannot walk backward because
> variable-length instructions make instruction boundaries ambiguous, so
> walk forward from the enclosing symbol, a known instruction boundary, up
> to the probe address and track whether an LR is still outstanding.
>
> A Zalrsc-constrained LR/SC retry loop holds at most 16 instructions, so
> an LR more than MAX_LRSC_GAP instructions ahead of the probe cannot
> start a sequence containing it.  Count instructions, not bytes:
> compressed instructions would make a byte window ambiguous.
>
> The LR/SC instructions themselves are rejected in
> riscv_probe_decode_insn(), and an address inside a sequence is rejected
> in arch_check_kprobe().
>

Looks good to me from kprobes maintainer's viewpoint.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks!

> Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
> ---
>  arch/riscv/include/asm/insn.h          | 33 ++++++++++++++
>  arch/riscv/kernel/probes/decode-insn.c |  2 +
>  arch/riscv/kernel/probes/kprobes.c     | 63 +++++++++++++++++++++-----
>  3 files changed, 86 insertions(+), 12 deletions(-)
>

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
