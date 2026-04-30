Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88ACFF8864
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ZkyZAB08m6TTRiBVqTQZ8fpCG7w5GEHV7902A5HjeE=; b=auL5csoorfkTW6
	Xby8b+/x+gkCArYDFjhkap1B/aeovUpqnyJADBmMOMrjImI9NXyosTJlc5vH3qOzT0q8C2BN6a1dt
	qN/PSktES34tIA0dT2lAZEA+KNYugGEq/b2A/7t0+RzeFwcE4ldhzILL0f4yE0a2NeTCCqLLe/XFK
	ePy+Z9vCPNT+yhE9wbjRgDPqpszeGLh6PQ188OQ5xewsYDIZAvKjh6IXlwDwMPDF07/5mtjA+WHu+
	MG4D6rdD+WPhBvb9tTUQJEzqn/CfwcwE9kqqIqlZy59QFJ9wZIhxh+BZGSEgtl5VkttGuRGsA0m2l
	4qra+D9t44pbyqPs1TGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII4F-00000004YKj-0Qwf;
	Thu, 30 Apr 2026 03:27:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2y-00000004Wxt-2KAT
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F265B6133A;
	Thu, 30 Apr 2026 03:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35E4C2BCB8;
	Thu, 30 Apr 2026 03:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519599;
	bh=qiWsFnvghBXNIkuBScVpFgUN25eAK8sfKgLJRxbUuL4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=N+rUA1CabGjbI7N7bttoPb3GmTGr0zK5YcDinIrMTNz8LOA/nYcKYZu90HcC73Jgc
	 h5YAbBJ2SR1TwRxmrSF0vJDo+hgHIG60Wz9pF4sYooMH6rXUFQUb/ETFocmoX44g6J
	 J+auvxIiTtEkAj3I9PqMraUpRRzWvNE6cLTFP6d0QxR5tApKvXaC/eTTMP9soVVQWB
	 hi6cbt2o+eRvnVzv1g/kLMClhFpgI3gJVp3YNYredvjmXgw2jf54NktRIVKw4yE5n1
	 Gv3W8Fise08cpOmQq3Q5g8ByL3SoK9YHL072fVWI8uuLZOjjliCnaEFrAfH3pSY7dK
	 4SOxrim9gnT4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D1F3809A07;
	Thu, 30 Apr 2026 03:25:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751955479.2274119.1708184854494774643.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:54 +0000
References: <20260227193030.272078-13-kas@kernel.org>
In-Reply-To: <20260227193030.272078-13-kas@kernel.org>
To: Kiryl Shutsemau (Meta) <kas@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 muchun.song@linux.dev, david@redhat.com, willy@infradead.org,
 usamaarif642@gmail.com, fvdl@google.com, osalvador@suse.de, rppt@kernel.org,
 vbabka@suse.cz, lorenzo.stoakes@oracle.com, ziy@nvidia.com, bhe@redhat.com,
 mhocko@suse.com, hannes@cmpxchg.org, corbet@lwn.net, chenhuacai@kernel.org,
 kernel@xen0n.name, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, kernel-team@meta.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, david@kernel.org
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
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 27 Feb 2026 19:30:14 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> With fake head pages eliminated in the previous commit, remove the
> supporting infrastructure:
> 
>   - page_fixed_fake_head(): no longer needed to detect fake heads;
>   - page_is_fake_head(): no longer needed;
>   - page_count_writable(): no longer needed for RCU protection;
>   - RCU read_lock in page_ref_add_unless(): no longer needed;
> 
> [...]

Here is the summary with links:
  - [PATCHv7,13/18] mm: Drop fake head checks
    https://git.kernel.org/riscv/c/32c440d67e6c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
