Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2058FF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGF/04hrphxQ2sCmrmG0IEBddrdOY05NlXPabMn0jFs=; b=xdkDU1G7wh30Qd
	8LOdgbD04zGT2rdgcZQ1MoLSPNxUCCC/qVxiQXPmXV4dO87H0qJ/9xrl3EvCPmFQKRM+IkhJMzOhW
	glhz+2ZMx1R+iS+DSw/JAecaQa1V8jGrBfbgi04nphGAHqJKl7xGE7BQciIDczk3zSukbvyiJyPkQ
	R06Yza4KbefNVwzzmGV6S4nqYTvr7OgRKB8rjgtEfdYQDBHZzs17RJoSLloU6QcvSjRYTIilTF8LJ
	j1C25vKjyoo7QvrHqxwWiAUj4EBj5m9HUbnXRNn93V4yA0emgebMjhmVBajgovURZLNZJBpBQdyhz
	B9WrYT5rL5VWuXatcZpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII45-00000004Y7c-1eO5;
	Thu, 30 Apr 2026 03:27:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2x-00000004WvY-3DRW
	for linux-riscv@bombadil.infradead.org;
	Thu, 30 Apr 2026 03:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eBUV1UY51EquXgvsu9l0J1vD54XyfRXbXcUtN91vcr4=; b=I+eVgCJFo5BBRN3hr2lpa4/n7X
	CsURX1z8rk5E7SRK2Fzmi1BJUMt3D0YvpI0ORCqGc/WnKF998Lvi/AsiDDJkRCWPkmmZlvXvDRWzK
	6e59hspRCf1b77gnPDQBkcOnMA1114Lvg5Ham9Toy765onMcpzNwXyi9XeYMCZW4+6s9NBTO+GR3t
	b6Qh3sJdHbq4Z35KT5KdC0kj/Hi5WrNsfn4lZRBrhQUGcfxNr+xHp5DQ+H9rG9Rlbqu35GEUtMwVH
	7bAiCd24+JPlHgcbmx6pPAJQUn5anzp7i9kuFpmPE3L1ekMraNneekENr/FjDwX2mJCCuhSwdA9+S
	gStz27MA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2t-00000006XnI-3UJy
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0412543C97;
	Thu, 30 Apr 2026 03:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76E4C2BCB9;
	Thu, 30 Apr 2026 03:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519593;
	bh=NX3tUbayE/lMyAJb6o3+e820TWiqNMgOixMjRLbyqAw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mP65EIKsJxlWVdg+ZdXsnteOQuTT9vum2+qioBLuE0frnQQRT+QScmlJYMF4r2rSI
	 vRnOVIKGyMypZxqAJx34gvszIqHVXmR+QkkjPihM/bdH5nsCqw/IomU2lfLTIO3qaV
	 fvUnaxQNW+/G2HtGg5iLLamjVYA7JPeh8wZvmVHDfu5iMSPTt1nLar5p0412CtWDgK
	 lyGF9LgaCB6elDJvdu74+k3vsoWGMlR2V3nAuZBmKoikIMpqHRujdbYpu6ZuyNybOl
	 b62emfrFlXYc+v3w4ssHP5Gk2/SwOXz6mEx13YBbE2tukLYy+rUTQphw0/yGbP59MZ
	 ojfVmdQYoJ7+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD903809A07;
	Thu, 30 Apr 2026 03:25:50 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCHv7 01/18] mm: Move MAX_FOLIO_ORDER definition to mmzone.h
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751954879.2274119.13489551409469223831.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:48 +0000
References: <20260227193030.272078-1-kas@kernel.org>
In-Reply-To: <20260227193030.272078-1-kas@kernel.org>
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
X-CRM114-CacheID: sfid-20260430_042636_014794_F45F2B6E 
X-CRM114-Status: UNSURE (   6.81  )
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

On Fri, 27 Feb 2026 19:30:02 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> Move MAX_FOLIO_ORDER definition from mm.h to mmzone.h.
> 
> This is preparation for adding the vmemmap_tails array to struct
> zone, which requires MAX_FOLIO_ORDER to be available in mmzone.h.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,01/18] mm: Move MAX_FOLIO_ORDER definition to mmzone.h
    https://git.kernel.org/riscv/c/a2c77ec320a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
