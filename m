Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D1BC54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 20:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8ZBl+DQNPMDoPFBy3JJy2wORjoOKmNv+QCnkaHZ310=; b=oYm/CNDrCz+GpB
	euQIgtbCPp23C2j0Ny8pjAO1N8aOmuKWpxDS3XP3e9vo+uV8wMS8bsLpftTL09OAeeayG7ty1tdBT
	eDMPlkv3RUfPjtcJ6FLaTocN7iM6mFMDFS7Rzmp9o8waYA5AjfsXDKWe468pflPhhfPv7XHKhj8Ea
	BT8hAGAgn5yT91Se48ge3D+oTT+ICK0d5OClppSuDoc9JSVq6lvqAQYlUtBhFajIucSnlCZpHYS3d
	tTNOXfcD5gm5ZOZF0skHxfhYWhGZTGbuFwNTqF0YKmxlqOShe5FRMxD5BgweqYwF/X090NVZYQBPL
	lpAeSOJpxmGoRedIgD3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tb-00000000vuh-2763;
	Wed, 20 Mar 2024 20:50:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tV-00000000vpf-1Efo
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 20:50:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB15F61115;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38841C433B2;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710967839;
	bh=feaZEDxIe578pwpNMawFSPwGBKbYYi/Q1YQaICgmoFw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cW+aLSi5jdXZfNarQIHyoYMGoUZea1B/zZBZrwJqpt3dZZ6YH9TRozAboosZRfmFt
	 nxtTN+rQq47DGxsMkZ90tqCtCQ1fS8in2Fi8i97aYL+l3VzKd0rr9YmBx90+t9O6gB
	 ldgCCliszdcKc+yPJUtSWjMSmQImrca0BcZ2QaaI+mNo5zVLAa5dnupRbHZ/tpN+QL
	 vUEAftYjaKRmhX3jErql7VgbO8tankxJtDSJor4D+PCk7ACvHjwRpSQPehkWfwkK6X
	 GsBmqkRJUigFl1y53JvBe6+RqtMUP0cl8Pz6KtxTrGNzf5yMF98WjngLGHNn2o/trb
	 lCSjMY+kxP0zg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2DA33D84BB1;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/3] riscv: mm: Extend mappable memory up to hint
 address
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171096783918.6804.10596170298204766032.git-patchwork-notify@kernel.org>
Date: Wed, 20 Mar 2024 20:50:39 +0000
References: <20240130-use_mmap_hint_address-v3-0-8a655cfa8bcb@rivosinc.com>
In-Reply-To: <20240130-use_mmap_hint_address-v3-0-8a655cfa8bcb@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, alexghiti@rivosinc.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 shuah@kernel.org, corbet@lwn.net, cyy@cyyself.name, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_135041_509632_9DA317E6 
X-CRM114-Status: UNSURE (   9.12  )
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

On Tue, 30 Jan 2024 17:06:59 -0800 you wrote:
> On riscv, mmap currently returns an address from the largest address
> space that can fit entirely inside of the hint address. This makes it
> such that the hint address is almost never returned. This patch raises
> the mappable area up to and including the hint address. This allows mmap
> to often return the hint address, which allows a performance improvement
> over searching for a valid address as well as making the behavior more
> similar to other architectures.
> 
> [...]

Here is the summary with links:
  - [v3,1/3] riscv: mm: Use hint address in mmap if available
    https://git.kernel.org/riscv/c/b5b4287accd7
  - [v3,2/3] selftests: riscv: Generalize mm selftests
    https://git.kernel.org/riscv/c/73d05262a2ca
  - [v3,3/3] docs: riscv: Define behavior of mmap
    https://git.kernel.org/riscv/c/371a3c2055db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
