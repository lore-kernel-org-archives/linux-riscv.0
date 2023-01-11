Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ACAC54EBC
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 00:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqUj1wOkiE/09SUIkajMrpjtH/L5JelapcVMZpmguAc=; b=tDHZmAblD2uqUV
	eFP+frk3E9HvDen/b7ytqIDvANqo0xdGz8I1jgpsENjHrf3pS1NBnzy6zic4XQLlQDCEP7teC08qZ
	VoifVYRxyvO2l0cWjHXuzIrw7ev/f+kHSd1Xy1+9WhTa2XDEeXl6AVe5mtu1XB7chjlc5yDDPL04a
	GsSWU/tILDnhsgJ4NPQq5jYZm90oRPluHZUxggi6Czb/BOOSae3VtsrGLWk+gOUdlIGe1Y306MfNg
	xeg0ZqDJ6tF2apehKkErqkVKarQn4foSns4ymzdwNItKOoZBlXZLsImRBbzX4smLe3yPcrsIEijqp
	6r15E5B4SMzqD+olFt9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFOXX-008xVf-9c; Wed, 11 Jan 2023 00:00:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFOXU-008xTj-5C
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 00:00:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 37569B81A60;
	Wed, 11 Jan 2023 00:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2B56C433F0;
	Wed, 11 Jan 2023 00:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673395215;
	bh=mEWQ7a5qfQ/boPkXx/AzT+t/qpGYEXDz2iCILTDJr0Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Jac3BkS/yd1/YSLGRy1V0F4011VX76GJKKlIt1kbTraK5w+9GffVjXtDbIm6gqrI+
	 Xr/aJVekD8hqf3yWdhl7p4B/JBAG7u/O7TA5Gpn8V8EelpPvL4Xm4NKIHAx5lPKvB5
	 6yDr8VNa6HC3PHI0HmLUtV339LUFF/kE8S9c/2MG2eALwWkGUTHhu5cmEV3F93zsys
	 jLckuK9pckrWZnXuhoF7TB5giybxe9IKwQiUUFpxhpONlcDnhmYu/Cz4gKWVKfahG7
	 h4g1tqvLTFEBeJIuLw370fyanyNknBguQUkYB4jayzkk+nLDi+Me1CXwiZ3Hbqj2ah
	 PiJE0JyEXQGAg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B8A58E21EE9;
	Wed, 11 Jan 2023 00:00:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2] bpf,
 x86: Simplify the parsing logic of structure parameters
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167339521575.26336.15370569553745702242.git-patchwork-notify@kernel.org>
Date: Wed, 11 Jan 2023 00:00:15 +0000
References: <20230105035026.3091988-1-pulehui@huaweicloud.com>
In-Reply-To: <20230105035026.3091988-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, yhs@fb.com, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 song@kernel.org, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org, pulehui@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_160020_362940_219781C0 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

This patch was applied to bpf/bpf-next.git (master)
by Martin KaFai Lau <martin.lau@kernel.org>:

On Thu,  5 Jan 2023 11:50:26 +0800 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> Extra_nregs of structure parameters and nr_args can be
> added directly at the beginning, and using a flip flag
> to identifiy structure parameters. Meantime, renaming
> some variables to make them more sense.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v2] bpf, x86: Simplify the parsing logic of structure parameters
    https://git.kernel.org/bpf/bpf-next/c/7f7880495770

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
