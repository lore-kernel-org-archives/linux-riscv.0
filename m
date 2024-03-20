Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9E4C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 20:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4OZlTcUSaQxjzUsiQ4EQeRfCB0eEqHE8x2g5mavpqzg=; b=NzriKQDU7PT1Bn
	hN28cEywd+3SOkRLko6as6QXPPZqwIt6gUUC23nrPr+pnM/CrN48u7BB1Ko7x2oVCkdew5zL+jwGc
	5OQRABmOwMapl7VfSl3i9RQ8zg0EaPmjCFfpWcBwOEWn8H4vYbDb+ux0NkMkaoPa6i7GveSA1zzHx
	55qwrnbEGciTJSpyR888USWyQTlF7kixxIAX6WWBWbvc8lShS3hHLgdYHy2uwUgbM9UeoJ6UBB5Yb
	uHyfBuQxvKy22YfGH7Pzs9LOQTZQMCpklNdqMo/kCdIaAM1SN2K9CnSmlqy1ucYYXU8YFR37M8gxU
	Zg2yAy8VrmJzogbHm0Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tg-00000000vxj-1m0W;
	Wed, 20 Mar 2024 20:50:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tV-00000000vpj-1dMz
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 20:50:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E65F61122;
	Wed, 20 Mar 2024 20:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73813C4167D;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710967839;
	bh=i1YYsB3MkP8iWkMd09oORaDoitK5kjLZDlxRsz79N1Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iJj/jQiLmTJUJiTcmVysHQ35TqjzpH6Xv7OMXSzge7zuIjAgmJkWNvKGx5ly7nUKd
	 w1mJzh9SXKMmv/6yq9A5uNV6GwWJkwn7rL7h5/uwndCaBH2Nnjw0K/N4jqnZtNBoCS
	 a89v3+a3sav5bNZZ9DhDJanqyKwWR96AOgQzJ+7AjWggcdTwCRZreXQQGV+ov65WjF
	 8lcQ1/9IFMyafWO2P2jv5h92222ipyp3uP1y4pTncDD2xQvquj9elRnYTsdRSvKi5T
	 me5vXqyw/h3lLTQyTT/dQDDlRppUVMQqdWsHkF7AuqC3E5uiOBzcqnCH/LTqb0S6s5
	 JfUdxK6D1jcuw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 699D8D98302;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/3] riscv: mm: Use hint address in mmap if available
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171096783942.6804.4445478539972921604.git-patchwork-notify@kernel.org>
Date: Wed, 20 Mar 2024 20:50:39 +0000
References: <20240130-use_mmap_hint_address-v2-0-f34ebfd33053@rivosinc.com>
In-Reply-To: <20240130-use_mmap_hint_address-v2-0-f34ebfd33053@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, alexghiti@rivosinc.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 shuah@kernel.org, corbet@lwn.net, cyy@cyyself.name, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_135041_586174_EBAF4AC3 
X-CRM114-Status: UNSURE (   9.20  )
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

On Tue, 30 Jan 2024 11:04:29 -0800 you wrote:
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
  - [v2,1/3] riscv: mm: Use hint address in mmap if available
    (no matching commit)
  - [v2,2/3] selftests: riscv: Generalize mm selftests
    (no matching commit)
  - [v2,3/3] docs: riscv: Define behavior of mmap
    https://git.kernel.org/riscv/c/371a3c2055db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
