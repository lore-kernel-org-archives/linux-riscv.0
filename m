Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6123C001DD
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 15:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ScfxhlgdXod/GoTBb74r2LxqOIZ/8GcP76hBZSkcnqc=; b=XQ6zL/PuEweGAQ
	4r6nq5MRIrRMAPdaH7H7vzqtbIm3btMnufZ5SOfDyQhNx/7q8v+ZLbjDDImnI5pykA0ig/IwuvXR9
	LqFSzU1KI+SPcRPfvJHnrXe+986F2mBAIihyvgoxPFRSvlnkl/8woyIOeGw6SE8cLYT9Q6SELaO1u
	BbjorjfsfBzHxcMEhtjtKShkCDOqn5STqyzrhL6qXWfyjUVCP+WjBQJJDujlaVvrt1rc3k9gaMera
	RcZc+D5SV9+bmYpye5YgHbuSb7QHIYFjR9JscZHYKjoeoeK1Xsg3qJrR3U4ZxLYcoBZAlPbwL8rGE
	wxrdynyKsjHhxaYV76Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r015j-00Gvgp-2Y;
	Mon, 06 Nov 2023 15:00:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r015c-00Gvbv-1J
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 15:00:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4536560FB0;
	Mon,  6 Nov 2023 15:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15B3CC433C7;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699282830;
	bh=inSvyAXRWVhJKzxXGHYkYj/Xog6XFtFACxlgXU8Pmhs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=P/GcyVWmubX8jMX6sQ3RvB1MPQ9k0zVhYtU7pSSJ7ZAJ+tr5boFRL0ChQW63nJ592
	 F+JAmTYAKKofKS1nTNuqXjnmGUn0z9L3fBXO6CUaEfafgFscxkInlq9YAPj4MdQ1Cb
	 +3uTNjo/t3+i12ndHeaCBpW3FlPrdCSvAi1icvIWbDX8bFNDL+i+d2t8DbGgizVfF3
	 H8fFGXBnuYtp0/cE0juLJ3luCiyls7ugd2uvVSWCR44xG/EUi6SySTJmH9CMm1ZIpV
	 jzunLfcJOdmNZciL5FuVM8Tirah7lSwk6R4F+w5W3Zvu3eJbFBRJzFZoVfQfwfCIms
	 pC0x9+sYMCMfA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F0BB8E00087;
	Mon,  6 Nov 2023 15:00:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/3] Improve PTDUMP and introduce new fields
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169928282898.16503.17999232797960429532.git-patchwork-notify@kernel.org>
Date: Mon, 06 Nov 2023 15:00:28 +0000
References: <20230921025022.3989723-1-peterlin@andestech.com>
In-Reply-To: <20230921025022.3989723-1-peterlin@andestech.com>
To: Yu-Chien Peter Lin <peterlin@andestech.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, david@redhat.com,
 akpm@linux-foundation.org, alexghiti@rivosinc.com, bjorn@rivosinc.com,
 linux-kernel@vger.kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_070032_493389_60C9926E 
X-CRM114-Status: UNSURE (   8.33  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 21 Sep 2023 10:50:19 +0800 you wrote:
> This patchset enhances PTDUMP by providing additional information
> from pagetable entries.
> 
> The first patch fixes the RSW field, while the second and third
> patches introduce the PBMT and NAPOT fields, respectively, for
> RV64 systems.
> 
> [...]

Here is the summary with links:
  - [v4,1/3] riscv: Improve PTDUMP to show RSW with non-zero value
    https://git.kernel.org/riscv/c/d5d2c264d33b
  - [v4,2/3] riscv: Introduce PBMT field to PTDUMP
    https://git.kernel.org/riscv/c/0713ff337173
  - [v4,3/3] riscv: Introduce NAPOT field to PTDUMP
    https://git.kernel.org/riscv/c/015c3c370472

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
