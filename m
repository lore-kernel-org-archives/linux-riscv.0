Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E601FF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V6vbSM88EWTuVxp9jys/tnGuZ3aOKdWLasTdjkLJPZE=; b=VkcxTzq/X2SLsT
	jeA72n89VPE+xPKF32+u/qzRiN2AcqCFzfaK3NTcpx/m6tBwVOUOs7w1Pr9FW6hAAXL/cDYMlaNYG
	vmElxHhsHoZNtkwzCQz2+UkFHBvOgkRi2huc0nteYchj3csBLQ6j5Bzh7CpzTnUO7/LhdSDlR7pcc
	DBT+NLAiZq0MfEiqquFyga7YpqBQfNT482XV9Ros8/OIVQnhGa93Ojf0GoFb4sOhLwPlqrNoa43UN
	AcrEu+P8kXhMtdzQs3Ekyx37uNWpFEWc5gTmotnG1+ngwqh4216qYUZGytqGzi0tU2isWj816GJXB
	xuK8KnsKKuHXYD22g4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII3r-00000004Xs7-3OZG;
	Thu, 30 Apr 2026 03:27:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2j-00000004WjS-19tI
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B319461143;
	Thu, 30 Apr 2026 03:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A6EC2BCB8;
	Thu, 30 Apr 2026 03:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519584;
	bh=YLRZtfFNTmgVRKQzL/ebIB7raBLyFWP+zBt/tIh6/gE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UjAkF/lBjBrztJbWPv7Nv+P1UQwRCadHgjZmyc0gOUgdshtZuG6fNVk/6qLysPWxN
	 cz3t4kVUzVaOpLfzu3/LvCeUqmfdQT6dbyfvFdGZNQHqe7dDD+3xhXDuPWm/HOBP21
	 VsujrCdKA7P5NzUJawotOUV3pfAKyP5Yrx/+iF+rLLBRmw14+ARbGsY7rcYMIaN7wf
	 gsJtpuEKSJ0kv4CkMyk1WFaP6qzknZqEk/n17a9tgeWy90WQ/ridNgrm3bd19S3mGg
	 5rq7JRJwBfVmOzhnSjH+krjZbWYqvNs94J4FiTD10T46AqKz3xXRixPmEAalrrEVRf
	 TM/g5vnXuYiJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E993809A07;
	Thu, 30 Apr 2026 03:25:40 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCHv7 07/18] mm: Rework compound_head() for power-of-2
 sizeof(struct page)
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751953941.2274119.10364319398429839294.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:39 +0000
References: <20260227193030.272078-7-kas@kernel.org>
In-Reply-To: <20260227193030.272078-7-kas@kernel.org>
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

On Fri, 27 Feb 2026 19:30:08 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> For tail pages, the kernel uses the 'compound_info' field to get to the
> head page. The bit 0 of the field indicates whether the page is a
> tail page, and if set, the remaining bits represent a pointer to the
> head page.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,07/18] mm: Rework compound_head() for power-of-2 sizeof(struct page)
    https://git.kernel.org/riscv/c/8c846c879e22

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
