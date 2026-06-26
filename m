Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B655CDE00E
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1QmcM2V7aO6zHWwiFgcffYgNeaBhjqaPlWp6h+CZj+8=; b=jAgmGjJY8ymiQs
	V4FwcmbHeP8l4BrabVYyDI9bea+fMtW9jbHXIu13I7tVIp5BP3QdkiJ8e4UiaA5Hl+O/7hjzTqam8
	BpVTMgp+pwUzPx9QKW/NXyGrR9z09IC+mUzRRj1gh2asFXm160lUgnrA3Dmmm9egfI33NfdRulbZy
	mOYE4EWgIxbk0KavKAZFPe4vPUFDiORdy3uk7MHkIKLBe9y/qLlo/nMkbeihWBq7uTUVVhIi8iRuG
	REhlQoQDeAdsPRpZ8l+Nj5HvO0O9BJltukSpJ9+OwdRS/luwaqiXjb8Y1FS/HwCtauWAuNw4B+6Uo
	FIg0sv0OXzyIHm6WhVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oT-0000000AnOc-45s2;
	Fri, 26 Jun 2026 08:21:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oR-0000000AnJN-33LJ
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:21:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C0E1443D2;
	Fri, 26 Jun 2026 08:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F451F00A3E;
	Fri, 26 Jun 2026 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462083;
	bh=52SPPVu3YGhhIMY2BRJv/B3qF4NdywMsMSBaNgtMuvM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=IfgA+z6F+j0/xx7GKl5Wi6w/gMIMYcBz8EgpLDUdDEUcGE9/nXQLUDuFbd52gbFvq
	 KXQFUMzwe40opw1qgweDt6fAS/peeF6vBxP6TqW91YDs4myGtrray33EjDOfrk/Z1l
	 /SiW497iu6789CSenJ2DfZ6E9GhCSlB9oh91N3eZZzTWwSO2r8nrT6v6qvghLNrw6N
	 Cx4uvqEJ6M9khGqhy25NNOWLYs8HN0+fV3j4XBEn0ozRzioz/0pj5XiVGGUxU2WZVM
	 KS6SFSYTBF1waKs9EdSH2ItbsqHMw+l6D+rXLiEHN+cT9WBXJkE+oHfDaf6WVikRCS
	 DWNZvtWjwbf6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A1A39389E8;
	Fri, 26 Jun 2026 08:21:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] perf riscv: Fix discarded const qualifier in
 _get_field()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246207023.3816447.7046697661981822212.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:10 +0000
References: <20260513180721.1179904-1-guanli.oerv@isrc.iscas.ac.cn>
In-Reply-To: <20260513180721.1179904-1-guanli.oerv@isrc.iscas.ac.cn>
To: Li Guan <guanli.oerv@isrc.iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, palmer@dabbelt.com,
 pjw@kernel.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
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
by Arnaldo Carvalho de Melo <acme@redhat.com>:

On Thu, 14 May 2026 02:07:21 +0800 you wrote:
> The assignment of strrchr() return values to non-const char * variables
> triggers a -Werror=discarded-qualifiers warning when building with GCC 14.
> This happens because in newer glibc versions, strrchr() returns a
> const char * if the input string is const.
> 
> Properly declare 'line2' and 'nl' as const char * to match the glibc
> function signature and ensure type safety. This avoids the need for
> explicit type casting and aligns with the design pattern of not
> modifying read-only memory in the perf tool.
> 
> [...]

Here is the summary with links:
  - [v2] perf riscv: Fix discarded const qualifier in _get_field()
    https://git.kernel.org/riscv/c/7378b6656aa4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
