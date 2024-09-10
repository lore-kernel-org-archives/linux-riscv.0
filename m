Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8604CECE582
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 07:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fmVZljeDsG95zxCiU8yr8mg6vjZfwRPThppV21mWqQ8=; b=J7BHhz5dYfldOB
	0pohbIsi5w9BUvAEP3VQaVAiGTT7Ex7uE8TwzYbFKl355wjYBcCWnsnaLTqNwW0d6TfYdee5TCbos
	J5Zv3sJzT5MvhwCKVk2DQhhTmN2AGda49rozgMq88bEm6ytEuedupnuP5vMCSHdteVU+mq49/exTB
	5SGJ0+zveuZfVgDzbYc8ELLZdlPQAhNV/pQDBsUVKKetSpDBWSiZecBZqMiz52O5OR7jeBUTA65S8
	WRZb7vSllamr+C5lXhaA6nh5I2ZVetA7heNMF2LacRxSwKF9vgBpT4bYgvAalTsU9511PvPkob53+
	lavejpLhJn522NFWoqaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snvMu-00000004bpb-1xV9;
	Tue, 10 Sep 2024 07:32:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snvMK-00000004bli-3L8c
	for linux-riscv@bombadil.infradead.org;
	Tue, 10 Sep 2024 07:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oupfuvI1qFP52gybwFkSmWRoflYygTkYVGfmy0pnAXU=; b=FvL5lnEFz8kIZjf4HpMyLm4Vm0
	p1GXiRBs+an/rRjL1J4RsIRlNhuSp5INPsYT1HXoPdaKymz0oJLCIMRvnxFD476Sc/rRTuXJpIsoE
	shP0Y8y+Rw/V/zv+xDsNDYYL+u8AzCdxoTV1Hbc3A56NA58gDWWI1yUYWA9GdQsaw8P4ikj/4Ggej
	RF8XJsYIH43TTdv9ZQXMooQ/rrYJ7fSik7UuQg1Meu/L5lH3MDROViYAt/IchKfn7cOkdnvQ0Ol9U
	ohMa5ydUt66Zf7yTplyu0brrEAbgnTJYh4gAb/viyj34OtaDiSKN+yxGoovFxRdwOwDXXcqVhnNvY
	Glz5KxPA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snvMF-00000000gn9-3OAK
	for linux-riscv@lists.infradead.org;
	Tue, 10 Sep 2024 07:32:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 27DC95C054B;
	Tue, 10 Sep 2024 07:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50A4C4CEC3;
	Tue, 10 Sep 2024 07:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725953533;
	bh=Wt3I8iEDKPg35JSenun0Nk2iBIDnFaPNA3lYXP3Yk4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UcszCMuZNY9rpBWYCUlpAx6I7oXcWxHhUQfGs4FOETXF3tyEjS8aQXwrT1pZFCcEU
	 LhhUwaaWo+my1Lf8s57xE0KDl498Qzn3WzAmGpip6FtQGnRPZN5ry0i6ja1U0phOTU
	 7Vv4Z65RInrd9LnCJ6L/4HTNUhxM7ipbuJK9+QW8=
Date: Tue, 10 Sep 2024 09:32:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: stable@vger.kernel.org, sashal@kernel.org, parri.andrea@gmail.com,
	mathieu.desnoyers@efficios.com, palmer@rivosinc.com,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	paulmck@kernel.org, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	brauner@kernel.org, arnd@arndb.de
Subject: Re: [PATCH 6.6] membarrier: riscv: Add full memory barrier in
 switch_mm()
Message-ID: <2024091002-caution-tinderbox-a847@gregkh>
References: <10F34E3A3BFBC534+20240909025701.1101397-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10F34E3A3BFBC534+20240909025701.1101397-1-wangyuli@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_083216_054456_FBD5408A 
X-CRM114-Status: GOOD (  14.95  )
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

On Mon, Sep 09, 2024 at 10:57:01AM +0800, WangYuli wrote:
> From: Andrea Parri <parri.andrea@gmail.com>
> 
> [ Upstream commit d6cfd1770f20392d7009ae1fdb04733794514fa9 ]
> 
> The membarrier system call requires a full memory barrier after storing
> to rq->curr, before going back to user-space.  The barrier is only
> needed when switching between processes: the barrier is implied by
> mmdrop() when switching from kernel to userspace, and it's not needed
> when switching from userspace to kernel.
> 
> Rely on the feature/mechanism ARCH_HAS_MEMBARRIER_CALLBACKS and on the
> primitive membarrier_arch_switch_mm(), already adopted by the PowerPC
> architecture, to insert the required barrier.
> 
> Fixes: fab957c11efe2f ("RISC-V: Atomic and Locking Code")
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Link: https://lore.kernel.org/r/20240131144936.29190-2-parri.andrea@gmail.com
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  MAINTAINERS                         |  2 +-
>  arch/riscv/Kconfig                  |  1 +
>  arch/riscv/include/asm/membarrier.h | 31 +++++++++++++++++++++++++++++
>  arch/riscv/mm/context.c             |  2 ++
>  kernel/sched/core.c                 |  5 +++--
>  5 files changed, 38 insertions(+), 3 deletions(-)
>  create mode 100644 arch/riscv/include/asm/membarrier.h

Now queued up, thanks.

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
