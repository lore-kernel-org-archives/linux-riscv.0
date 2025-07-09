Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217CBC83F17
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 23:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6NS3EZovXFkJWpN3/mpqlULQjnhNwzpMNvNvW+EmGk=; b=HfdZtaQa6F7Byj
	G5b3mFkfWU/ZOM0w3fdNOExb6Svyy+fcCjgwdtN9gJCOsgCNaiEDPdIxHOUYgGFW9YJEEGGsiB817
	7I10y1m9IhxipAAG6vN5CfdpXaP/X9PAsvJnUiZQEQuY1HhcUrcCPckYEQBJojglBB1DGGTFWzCxb
	nWNV/JacoIcFPqSAXniEI9ASSuldLbOzUqxVXh4uYoWBZtOmnVKyGc+4YbhpOe7v8B3OjKvej91S9
	CFKO6REB4LsFu5Z5vFZmPS9GPcwwi6Mx/bKICpmoZHRX7DqZRMnVzCKWLtARXTB2DcZe0YjCq5HKb
	9OkFf/H5/Orl3FNDG0xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZeAv-0000000AFN2-32VM;
	Wed, 09 Jul 2025 23:26:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZe5x-0000000AEvJ-0sdY
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 23:20:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B89CF61139;
	Wed,  9 Jul 2025 23:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B402C4CEEF;
	Wed,  9 Jul 2025 23:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1752103254;
	bh=LJA/fZobR2N3EAw7d6reLtpat5yHcpKJdasf0bzzcnE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=McLfgi2a29KScXBa2gqR61wGCP3cdlCkxaJxtVqkr+d5iQ2aFa7fkRTSZFhlBcGRP
	 taT9QeO5V4Sj2u8EdPcl71XOGTRsLsUXlxe1Y++eFh/5Vc5zfPP+rc14FyQ+HUdmg5
	 A7T0zoSv5FuuMdBUgqXH/oHrwAluR6ihGKOjqq78=
Date: Wed, 9 Jul 2025 16:20:53 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw, Yu-Chun Lin
 <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 0/3] Optimize GCD performance on RISC-V by selecting
 implementation at runtime
Message-Id: <20250709162053.0389d4068832d98bd11daa00@linux-foundation.org>
In-Reply-To: <20250606134758.1308400-1-visitorckw@gmail.com>
References: <20250606134758.1308400-1-visitorckw@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Fri,  6 Jun 2025 21:47:55 +0800 Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> The current implementation of gcd() selects between the binary GCD and
> the odd-even GCD algorithm at compile time, depending on whether
> CONFIG_CPU_NO_EFFICIENT_FFS is set. On platforms like RISC-V, however,
> this compile-time decision can be misleading: even when the compiler
> emits ctz instructions based on the assumption that they are efficient
> (as is the case when CONFIG_RISCV_ISA_ZBB is enabled), the actual
> hardware may lack support for the Zbb extension. In such cases, ffs()
> falls back to a software implementation at runtime, making the binary
> GCD algorithm significantly slower than the odd-even variant.
> 
> To address this, we introduce a static key to allow runtime selection
> between the binary and odd-even GCD implementations. On RISC-V, the
> kernel now checks for Zbb support during boot. If Zbb is unavailable,
> the static key is disabled so that gcd() consistently uses the more
> efficient odd-even algorithm in that scenario. Additionally, to further
> reduce code size, we select CONFIG_CPU_NO_EFFICIENT_FFS automatically
> when CONFIG_RISCV_ISA_ZBB is not enabled, avoiding compilation of the
> unused binary GCD implementation entirely on systems where it would
> never be executed.
> 
> This series ensures that the most efficient GCD algorithm is used in
> practice and avoids compiling unnecessary code based on hardware
> capabilities and kernel configuration.

I removed the v2 series from mm.git and added this, thanks.

v2 was in -next for a month, no issues of which I am aware.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
