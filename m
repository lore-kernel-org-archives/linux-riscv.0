Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2063C54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 20:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRsbizmLc/Q2XvD+ATPybH65W1d9Inh8h+KEcJMFkPM=; b=FojAX557rMxNXo
	TtL8L/BcKc8N48SvOE3P5o8/5iDgrfeMFMgLAcNiWJ0wBxIYVRvZ8LVFt4jAIdDOUx2eujS/pNSlM
	Ud/z7/q7EG2N0TAAW49NEgu1y1Sd8yDYU39UTBYpzeWlkPy5sGumZaRDTseEExN3NfUuENkglQlZq
	pSedXKjlx13XVqrJtD4UsUwDUNo0cldIQeLv9lj4fkzBYv3YM6Po7+ruTnLp0FRAGkmUe5h6k0ElO
	LpbFfhmO8UJWZvJcoXIfscoyMJ0OZZfWO39JyAA7hRIadMuLi+ADonEqqf1EOzD4B1OpOsfAe9I0d
	l+8on8cP6shfYOFIH4ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tj-00000000vzl-1CIM;
	Wed, 20 Mar 2024 20:50:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tW-00000000vpn-1ukA
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 20:50:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8DCD8CE1257;
	Wed, 20 Mar 2024 20:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 363CBC43399;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710967839;
	bh=EzEXn434C3owX412vSu+v4rWnWZ62rkj4t68PC+Dsko=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=p2SZ4abIHqa0sX56hiq9Oa4dlfTRGDjvfk8Y8fyToXrUFH6p70eIBYMXbv6BXfzJD
	 ma2JVua77H0tlR3uDlAg34AZYLeRJn1+Cw8WdB6LA0JpQW7evERiJwnV2rtpc/6rjx
	 uxbI6cJGRHKkHun9R3uzF/c3gbVDfOz6JFFu3S5AHHDjj7ZfAV7N49SBnurBkfxOVX
	 lvO2zh6x5QIcjYfxjBY98dWjAht4n6ACGf3efE6DYsH5rGKPn4eFvJx8Q9HmYrSFe7
	 ffLL983k/ZXiKYX41v8dhlDJyiB9/GamYg9e8kxBRGCg2MhFiaLKLyZMpBjrcz6TQ0
	 LeH0kSGFIls3A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2569DD95060;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/4] riscv/barrier: tidying up barrier-related macro
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171096783915.6804.16329473999832420687.git-patchwork-notify@kernel.org>
Date: Wed, 20 Mar 2024 20:50:39 +0000
References: <20240217131206.3667544-1-ericchancf@google.com>
In-Reply-To: <20240217131206.3667544-1-ericchancf@google.com>
To: Eric Chan <ericchancf@google.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 conor.dooley@microchip.com, parri.andrea@gmail.com,
 emil.renner.berthing@canonical.com, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_135042_708865_7D082B31 
X-CRM114-Status: UNSURE (   8.53  )
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

On Sat, 17 Feb 2024 13:12:06 +0000 you wrote:
> This series makes barrier-related macro more neat and clear.
> This is a follow-up to [0-3], change to multiple patches,
> for readability, create new message thread.
> 
> v5 -> v6: [PATCH 1/4] let this change to pass review by checkpatch.pl
> instead of overwriting again in [PATCH 4/4]. for [PATCH 4/4] change
> the error message example in commit message to make it more relevant
> 
> [...]

Here is the summary with links:
  - [v6,1/4] riscv/barrier: Define __{mb,rmb,wmb}
    https://git.kernel.org/riscv/c/89f4fd7b1ab7
  - [v6,2/4] riscv/barrier: Define RISCV_FULL_BARRIER
    https://git.kernel.org/riscv/c/b3c8064ccc44
  - [v6,3/4] riscv/barrier: Consolidate fence definitions
    https://git.kernel.org/riscv/c/c85688e2b0f0
  - [v6,4/4] riscv/barrier: Add missing space after ','
    https://git.kernel.org/riscv/c/9133e6e6908d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
