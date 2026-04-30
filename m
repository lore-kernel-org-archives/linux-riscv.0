Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5CBCD13D3
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lr0wjXGKpBPeqDpGH6CAav75BwFE9Fjjqkw1L3VriHg=; b=zy/jpIVM5sDVIp
	djC3MqWtxz1Fp9pUIhs/2GNKM5ZXdRNgcLbgVLS5iLJB58j/fY0ghpbexGIQUI10XJp0ad1Uz6+nd
	2FdgLlhrP8PW2cpr90F6LsJgE8GLzLWEcDbHDvwHjlUhLq2auin3gs4lUYvB/vG2TP2sR5apdn8Bc
	ZqfwjUAdlXHK5HGbBxXYAZcNXoy+FIkaH2wRJ7oQ48RVcJP2alNVJL9OdGXp8+viv52cCJhjfteCD
	ERUeXKdZonoGsI5/B9H6GkeLV65etsj3cWXC8/PLTpQvWD3XR3GhS/GlwIcaWA7UJsZBFzP4gvCnS
	Gy+BwAfjXqWAicfAk6JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII31-00000004X3P-1osw;
	Thu, 30 Apr 2026 03:26:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2O-00000004WR2-44eC
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB9524353E;
	Thu, 30 Apr 2026 03:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7875C2BCC4;
	Thu, 30 Apr 2026 03:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519564;
	bh=u3YoJI6PJeGWY/+fiJtWlQKeltd3H2IlxE1eW7TcW1A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fVM+pktx3qjd5wzp95nMpat78U+9GCLO9zfS0yJaFVt7LtrOzHwjQl5XYjgchazAi
	 GzBT3q0NikQODltSrtECYbwuUtcf5M44X/Khc8VQHfC4kybRnJ1RLFmzq8TS24PfAR
	 DTB83zl0VVO3hZ77nLDO3pxYU3IEFyM8xscIKtHOY4wmR/fE7dWT+mucmp8DqFeqYy
	 zvpMTvGyKhHJqASghT9ckCceQKLSZtOW1vVXXjjPZSLK/8jUTGtyLepmQTw/JwD2xU
	 viwJNWXaDMxcGK9hmTQbpKeZHcvviMpDn9u441MGWrPaIERXtZavQRgOd1S2RKPAaf
	 7R0DVkVfCocLQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DAD3809A07;
	Thu, 30 Apr 2026 03:25:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCHv7 04/18] mm: Move set/clear_compound_head() next to
 compound_head()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751951954.2274119.3235115726287439195.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:19 +0000
References: <20260227193030.272078-4-kas@kernel.org>
In-Reply-To: <20260227193030.272078-4-kas@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202605_094269_7FBE0176 
X-CRM114-Status: UNSURE (   8.35  )
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
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 27 Feb 2026 19:30:05 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> Move set_compound_head() and clear_compound_head() to be adjacent to the
> compound_head() function in page-flags.h.
> 
> These functions encode and decode the same compound_info field, so
> keeping them together makes it easier to verify their logic is
> consistent, especially when the encoding changes.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,04/18] mm: Move set/clear_compound_head() next to compound_head()
    https://git.kernel.org/riscv/c/67c79a5af051

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
