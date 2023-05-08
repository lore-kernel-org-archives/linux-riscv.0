Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5B2C7EE2A
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 14:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgmJ07KiF0ZHr6L9F3qlb21ZtMeQB8uM7kpT7Ivr/ko=; b=ggvoBU2p+6g+wU
	EHyMuaAgkNvjB8IzDiTYLDtJYFUiAT2QxE34hf7wZ+mm2iVL81xU7Ibu9Iddgl3KvN68O8+O9DeVU
	3HhtNKQnLaLiYx9OiMrbeocq1UDbqIs09XLKWYBElkAqUuSHhJYJWFScKYqKuChjfaiSBiL2Ngsep
	8yxT/tRyKN0WwKNSWCIL0TCemcoeUGi/k8Ugn5IuBRSbXG/U6BJ9WMjjcHgLxwGV/QHi1nCtHg2Oj
	zoiNXv52+QzOJRblLpq82q6QCMDKwnm4mBIfDMlkjFm7YvPNDt+X5fIb2HYjVI92hSa979dhHW8vi
	Gi4VQeeHxNgBqVUJHPKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw23v-000mYS-2f;
	Mon, 08 May 2023 14:42:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw23q-000mUw-2A
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 14:42:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 92FBE640CA;
	Mon,  8 May 2023 14:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FFD1C433D2;
	Mon,  8 May 2023 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683556916;
	bh=eAOT+NHmXh2QJqEgJ9YZFhBuoVP6a8qQZVhJ1sJRZHA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=euf9Aa2Z7hjHuHjV/3m1HVsFRDsNxFrLu7KT6qMiHLyr98PAoyX1nvFb30R/QOEmj
	 b9RaXV/0bKrysX+sh93F4T2fXyF5RIhqPjXG5NnYlfRzIJZHwGGySFcwPJl0YzNvUn
	 O3QFAsCA+09RIb4Tdz8vEvDcJ9JLf3nDEFI4/hU5S6Pl6dgo5xtD5iR+lXlec+fsbx
	 uS67bgj6VwtBu+mvlp3N0Vy9DkG7QBG54ch1Eq2xzgkuKDyHmu6chRo/Pa76MGqrJ6
	 oniwt2lmozGIq2remUBpVL30EpyxUXZnJreIhCa3xbPyKcTh+IAt/HkNNOsxZcJYea
	 QAlyBGMMybe+A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4FE2BE4F0A2;
	Mon,  8 May 2023 14:41:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Move .rela.dyn to the init sections
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168355691632.25692.12423469985952426151.git-patchwork-notify@kernel.org>
Date: Mon, 08 May 2023 14:41:56 +0000
References: <20230428120932.22735-1-alexghiti@rivosinc.com>
In-Reply-To: <20230428120932.22735-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_074158_755421_8C68057D 
X-CRM114-Status: UNSURE (   9.66  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 28 Apr 2023 14:09:32 +0200 you wrote:
> The recent introduction of relocatable kernels prepared the move of
> .rela.dyn to the init section, but actually forgot to do so, so do it
> here.
> 
> Before this patch: "Freeing unused kernel image (initmem) memory: 2592K"
> After this patch:  "Freeing unused kernel image (initmem) memory: 6288K"
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: Move .rela.dyn to the init sections
    https://git.kernel.org/riscv/c/4db9e253e701

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
