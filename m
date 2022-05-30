Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7B6C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 30 May 2022 21:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/Kz2NVbksxNgQ4X+2e5hfAq5XHv3xVGXyDnbmKG1dc=; b=Sdb0k4sEHabuES
	jlgfmCrJVCbpWaLVHQ8MpwpB6Chzhoa9Vl9KkC3BiLTYqo6rr8Np6UDzwqtakjOoKJJLjypJ4xkbY
	4gbxWHem05Nsnnh/D1+5onjomvgFi9T8VWp9NyiaKHN3cypiJ3eOsCeFQD1sy2gQhAfaFy5E/CV7W
	qZy2Xxxdri742yk4LrX5v/GaN1G2H4LTv2GsnmiQB7rbeIl1g30BlHv4z6zEJsjyHbs03UUKkpeip
	tdoOl8B16723kfE/FrDyhhVLvY3E2+zzRnaRZvhUWXPYvc/HZ2qZ1YMYLzqjiHqShhAzpwtah3ILS
	TEsVtNBA0j/ADNDfn8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvmUy-008IgF-Iu; Mon, 30 May 2022 21:00:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvmUv-008IfO-TO
	for linux-riscv@lists.infradead.org; Mon, 30 May 2022 21:00:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B19AE60F76;
	Mon, 30 May 2022 21:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FEEDC34119;
	Mon, 30 May 2022 21:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653944413;
	bh=KnLcGa8uT4mDL9pauNRzvEuxlMfsU4gFkddnssg+gyk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cqpMULpacTG0sPd1SAx2v9AZ8/kpViOVtVxdO6Mu1HcuHNEhmAmvesPhRcTuQc2uP
	 qD1Bdaz1HaoTqvSy0WxpqBvQlz6SYg9csQxo4eqx1oXdv1VQowvluEBHYUkl7yskYs
	 bVo2W8XbtBBYA0IAycRVB1G95R9b800X1KPxGNWfJvP1F90mUgjghOQEGHJdCtYarc
	 YfOS0b/ePUcKafAOty3pSRvly18GLs3AD06NIKlVsooJiLro6WRM6n1M1kxigVYgrq
	 Qmtis2W1UgkPsxf7OGjEdMWJ8Dz7gvf4hyou8hxH+LT7c4NXiKzHNlacvXCJ0r7Nj8
	 BLeQ2z9WGrc1g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E148AF03944;
	Mon, 30 May 2022 21:00:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v3 0/6] Support riscv jit to provide
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165394441291.12813.18139846661607728867.git-patchwork-notify@kernel.org>
Date: Mon, 30 May 2022 21:00:12 +0000
References: <20220530092815.1112406-1-pulehui@huawei.com>
In-Reply-To: <20220530092815.1112406-1-pulehui@huawei.com>
To: Pu Lehui <pulehui@huawei.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, bjorn@kernel.org,
 luke.r.nels@gmail.com, xi.wang@gmail.com, kafai@fb.com,
 songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_140022_028030_BB35A088 
X-CRM114-Status: GOOD (  10.17  )
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

This series was applied to bpf/bpf-next.git (master)
by Daniel Borkmann <daniel@iogearbox.net>:

On Mon, 30 May 2022 17:28:09 +0800 you wrote:
> patch 1 fix an issue that could not print bpf line info due
> to data inconsistency in 32-bit environment.
> 
> patch 2 add support for riscv jit to provide bpf_line_info.
> "test_progs -a btf" and "test_bpf.ko" all test pass, as well
> as "test_verifier" and "test_progs" with no new failure ceses.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v3,1/6] bpf: Unify data extension operation of jited_ksyms and jited_linfo
    (no matching commit)
  - [bpf-next,v3,2/6] riscv, bpf: Support riscv jit to provide bpf_line_info
    https://git.kernel.org/bpf/bpf-next/c/b863b163aa8a
  - [bpf-next,v3,3/6] bpf: Correct the comment about insn_to_jit_off
    https://git.kernel.org/bpf/bpf-next/c/4b4b4f94a4f6
  - [bpf-next,v3,4/6] libbpf: Unify memory address casting operation style
    (no matching commit)
  - [bpf-next,v3,5/6] selftests/bpf: Unify memory address casting operation style
    (no matching commit)
  - [bpf-next,v3,6/6] selftests/bpf: Remove the casting about jited_ksyms and jited_linfo
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
