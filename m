Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE687F532E0
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QYhJmJ7OoBUqpO/1wNU4IwYneD1FZeS47x39GGvZFsM=; b=lVClbBsmnLPB8R
	r5AIhD0Y1zOH+pdvbIYrme5vG5IuHoSYaNsvTYI2Jtjzo6yyQeRybykRuUNmtwTJtiDAlD6LTSwX1
	qQhz4b5K9tgaLKdDNGls8Dfvki3CaP7HixgenUKsq3C1hSaYXc61wdYLAtD2VzmT9oXPKp88+LTqN
	89ElrqhATUW0ywsWzHZrwpJpewl8YMv53yXZvvrVP+vFXONlh6khFiZN/tEllXbNszDZRMnG+3Gzs
	Optrq3KfoKAJbz1vqFy8dHxwLa4SXLZpv/DumQFZJNPP25ZGNb+KiICP6qmpRD+Lu1chDDv97unrD
	9TatJehzwt8yG9s91dJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvV-00000000dIf-3Vqk;
	Tue, 24 Mar 2026 06:07:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvU-00000000dHl-0UqI
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 06:07:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BAB760103;
	Tue, 24 Mar 2026 06:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 587FAC2BCB2;
	Tue, 24 Mar 2026 06:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332459;
	bh=TT5lBm7eFK7nQkMzbSkiD0ZpgTSP9lB6Y+WQbG92bDY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=c9IMZw96dsnhrnQzBOWLIHmAeVarlxgOqtcYTgQpm/uaayVF5dZgHWnhRtPboRxPw
	 TwpVCDMR8eKbMqpWaVlUfIpq7EVXV3Oa8OT7E6GE4OSc/BWiJIX4xAyOn5d2eB6aXf
	 cclMkEnuVmUoHGXln6w5FP45wk5y1F4PoFP/SqH7j3l3+NpsnZVGbhsdRP452FTr+G
	 10BxTjY6AgjaVTTtPY5oL//mbl30alGLpHi5Eou7X0fQPj/PRwVIUTbXimCx5npmBT
	 wSAs+dVLF64bV2hzNChgy1w2Zj0nmMYAjwJBb6cZOOqtP1Egib4TNKHZxkIcMEFl9F
	 dHL3xPVZah3iw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AC3F43808200;
	Tue, 24 Mar 2026 06:07:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v4 0/3] bpf: fsession support for riscv
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177433244748.469836.11256130083444261497.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 06:07:27 +0000
References: <20260208053311.698352-1-dongml2@chinatelecom.cn>
In-Reply-To: <20260208053311.698352-1-dongml2@chinatelecom.cn>
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: linux-riscv@lists.infradead.org, ast@kernel.org, bjorn@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, pulehui@huawei.com, puranjay@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, jiang.biao@linux.dev
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

Hello:

This series was applied to riscv/linux.git (for-next)
by Alexei Starovoitov <ast@kernel.org>:

On Sun,  8 Feb 2026 13:33:08 +0800 you wrote:
> Implement bpf fsession for the riscv architecture.
> 
> Changes v4 -> v3:
> * fix the build error
> * v3: https://lore.kernel.org/bpf/20260206122002.1494125-1-dongml2@chinatelecom.cn/
> 
> Changes v3 -> v2:
> * fix some comments.
> * v2: https://lore.kernel.org/bpf/20260206115823.1070354-1-dongml2@chinatelecom.cn/T/#t
> 
> [...]

Here is the summary with links:
  - [bpf-next,v4,1/3] bpf, riscv: introduce emit_store_stack_imm64() for trampoline
    https://git.kernel.org/riscv/c/93fd420d71be
  - [bpf-next,v4,2/3] bpf, riscv: add fsession support for trampolines
    https://git.kernel.org/riscv/c/35b3515be0ec
  - [bpf-next,v4,3/3] selftests/bpf: enable fsession_test on riscv64
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
