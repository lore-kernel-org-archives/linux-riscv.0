Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAA1C4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 00:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kx/6vqm1AekNv1rwHtuDqNvj4rxnyNGsC73oS3ccYP8=; b=J3rWSUf+j4oXao
	wrisqRnYa3/YEHUijRtXaBILsiiXNKqZil3bUi5vFzwO6onYyCOHj2jiq8F9Vy7CUI0NvrDAa5Ek0
	Cesv9M8u9n84dvaRirrLK2DWz+ksDWnMxDoFzcX7n9QkCUP2Pv0pgP5BWePMJoAafUNPoSt+oTKWU
	KnonxqKvl4+Zm0cr9JvnFvVHdqCNLPPvxla+neaJJYcDTtQkrQgtecuO1DNbup+nDAoTUCcDz3nLM
	Mkcv6pdHiG+iwRINW4OjIFOv/WC4Ug9kC1ZxkGRZyf7wM9ZnHUKNTbqLfjmFTeijAc98N6c4ZkLEe
	MCv3eSj8NOzJ0I5D4G3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1ylY-00BWmo-1x;
	Sun, 12 Nov 2023 00:55:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1ylR-00BWhD-2t
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 00:55:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 13CFBB80765;
	Sun, 12 Nov 2023 00:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42B3DC433C7;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699750546;
	bh=g6sSrrVwZDGVPiE2PDTxknYsHB0fe/FH8seuAIgjE4c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jIrkMdFYXfoc6646t+fgdmy4sIr1F1ywDUgFixpiXVK2S8hG40s3w/ls/pmJisSN8
	 TDIGXkLEgC3a/4p90siHf+cDU78je3Td25ZoX2ykDajR5fyvmfG6nqTybR75s0F48X
	 dhCva+EM+Bb/7XjWSY23pHKwDlaXUgBmmr7RUB+ArjnyC0qTvqnvuv3vHCsNL2LctV
	 0tXOdFgW8S0nqhX62C+KuwoToju/qNBjgv4ixifAFJngU54rqK79Ui6Hb4tkBa1nhX
	 eW82M2tmZ+GzdWlCgBnP0vPjBB3jXsurXY6nG0HHjB/zS3YwI2Qi/5HDUR9t2KdWG2
	 HzjUf7qn1KASQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2A27BE00084;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [RESEND PATCH 0/2] add loongarch and riscv support for kprobe args
 test
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169975054616.11360.3939944763451576227.git-patchwork-notify@kernel.org>
Date: Sun, 12 Nov 2023 00:55:46 +0000
References: <20231018020858.1304218-1-liaoyu15@huawei.com>
In-Reply-To: <20231018020858.1304218-1-liaoyu15@huawei.com>
To: Yu Liao <liaoyu15@huawei.com>
Cc: linux-riscv@lists.infradead.org, skhan@linuxfoundation.org,
 liwei391@huawei.com, rostedt@goodmis.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, mhiramat@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_165550_083485_73CE2F3C 
X-CRM114-Status: UNSURE (   6.89  )
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

This series was applied to riscv/linux.git (fixes)
by Shuah Khan <skhan@linuxfoundation.org>:

On Wed, 18 Oct 2023 10:08:56 +0800 you wrote:
> Yu Liao (2):
>   selftests/ftrace: add loongarch support for kprobe args char tests
>   selftests/ftrace: Add riscv support for kprobe arg tests
> 
>  .../selftests/ftrace/test.d/kprobe/kprobe_args_char.tc      | 6 ++++++
>  .../selftests/ftrace/test.d/kprobe/kprobe_args_string.tc    | 3 +++
>  .../selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc    | 4 ++++
>  3 files changed, 13 insertions(+)

Here is the summary with links:
  - [RESEND,1/2] selftests/ftrace: add loongarch support for kprobe args char tests
    https://git.kernel.org/riscv/c/2eadb3299256
  - [RESEND,2/2] selftests/ftrace: Add riscv support for kprobe arg tests
    https://git.kernel.org/riscv/c/11df28854bee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
