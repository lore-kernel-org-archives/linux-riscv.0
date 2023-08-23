Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2380DC7113B
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 19:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZwhZ/O/Vwi3iXj4003Qe/N/qz/CPKSimSgR/t4GZjeg=; b=3/P57i6sJj7/W5
	S23pPZXhKumru0sashzPEYSUXbK7VeBw/KjeshYF2B8mo+7SkcTX1eALZ0HKSZC8cZg0YwruIsBxb
	aNrTmENEnxosVtIc4wiK3An1BYX3EIr7SlZZ/zpK20MYv0QiiofgFB7QMtlM/+DtP1ZGM5/83Ryhk
	qea8yoaswYygZZX9nhng5/U7pXqefE5HNK3AUp+I+wYEZb+b3CsBQIGfvJsKwMxzkl1mPN70X33OH
	RHk0cV40bUx+iv1uaaYqFjgekQDnec4cwTNLLyQLTdMTCgW9kzHQaGzK/gB4/3H5rYsMzw2rxLhAo
	AfYbDsX2qsRphfX4S1qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYtiR-001QpS-0H;
	Wed, 23 Aug 2023 19:40:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYtiN-001Qoh-1k
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 19:40:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83C0F66114;
	Wed, 23 Aug 2023 19:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF3ABC433C8;
	Wed, 23 Aug 2023 19:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692819623;
	bh=APTOUopKgEYb+dTo2Z/W5GwCE6pyFqmYat1ww1TtZX0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lD0M2Bw8yHZ/vD90FNqSt9+Qg711v6CtVs+nEdFMZRV2wov6yjGToEUiD2s+Up3+1
	 qiEMRSuRxqmFo5Y72GEHIRdyEO1LwKODrMDVXqaeWpStqfZan7/vAdO0RMLUfDra+w
	 1uYy+8SZmASbFMOGMXdf9KDmq9mvsWn72Mg04FH3jZJNtkl0vszXoQDCFpJtJlZkfs
	 funUSbQuSLvxnS4Y5E+/4ozD1MWRAHnHgY5tY5Z1YRUiN4MVyE7QiIiNAml9YDc1X/
	 h+3576CjMsd4xKhBjHykTxmsbj/UkLTRHpb3gExIhjGyRoL/TwOGAGu35QOK2li03K
	 6+XwUXt4YVj5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A734BE21EC7;
	Wed, 23 Aug 2023 19:40:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Remove ptrace support for vectors
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169281962368.18988.16256998915618280339.git-patchwork-notify@kernel.org>
Date: Wed, 23 Aug 2023 19:40:23 +0000
References: <20230810214810.21905-1-palmer@rivosinc.com>
In-Reply-To: <20230810214810.21905-1-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, andy.chiu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_124027_628722_543E8EC3 
X-CRM114-Status: GOOD (  10.00  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 10 Aug 2023 14:48:10 -0700 you wrote:
> We've found two bugs here: NT_RISCV_VECTOR steps on NT_RISCV_CSR (which
> is only for embedded), and we don't have vlenb in the core dumps.  Given
> that we've have a pair of bugs croup up as part of the GDB review we've
> probably got other issues, so let's just cut this for 6.5 and get it
> right.
> 
> Fixes: 0c59922c769a ("riscv: Add ptrace vector support")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - RISC-V: Remove ptrace support for vectors
    https://git.kernel.org/riscv/c/e3f9324b231a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
