Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54351FF8864
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0aWhdnrWBREgCNqwyjEJddQ9kZJuRlGcd1YGYNZ1tZ8=; b=A6I5+jHRNv2CIi
	KUCPiDCpGv3MyVG7EEkGn/j9TSvsbwNRs3Qe3qgFp/BB/bdm6OSdfSBkR7u/kni7BVDicXxgf5Wsl
	BW2i5t5Zznen+ej/RXNwb8NQIruTTrfnWK/ae1Yq7o+vSybmglSRjVNUyoXxzw+KjxPjqhAQPBJkk
	Bc/RkSAhd8nOf4rdEJYnHSvUiJ52PhcKC11aBIF4JsEmLlZrgs4ZAbLjUS9qtQl7VRTQ1ZAOc0FpJ
	b78slX3HkqnwaeDMP9vMfpMljHd96AthA8V/KcOd+sCOBYKfIDaOssEi9qjAZVK49aRFnNNygYTwn
	afEjBU12YZb8F+1nviCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII4o-00000004Z2F-3A40;
	Thu, 30 Apr 2026 03:28:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2v-00000004Wsn-1kN9
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BAAE4458A;
	Thu, 30 Apr 2026 03:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF135C2BCB9;
	Thu, 30 Apr 2026 03:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519596;
	bh=bc+dg0Bc8LDaQ9OEb5RjsesIcFKeDCO/6xovARLSG30=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=geUpuuDMCyhCp6bEdcbfN0LxnZCUCG0dgvu3qA/x+vL21nkrLzZ8fbVpg72WGZE28
	 GW58cY5htqwvpdHnIBBxusd/QaNcLFa+lj440eecLAww3/Tl672LYNkzLLEjf/tTSC
	 BpJ/B2ryHel/66TKXqJYyWj2hlvJjZgUYAyyblpCJqEkiH+W7IzZtgCsm05BvXOqTC
	 7UXOUp/0g8nuPuEp/UKXTadmyETa8KxH8Ey5ukE8RHBtYyFcXm2Y2LcaUH2nkGobnw
	 UofVwlyT6LtPYOcYzQrW4VSyZ9ncKX38Ij7OlcUNxKwM+79KdZnCJOFbQp/inSmfSd
	 OIy8h9cqLZpvQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDD13809A07;
	Thu, 30 Apr 2026 03:25:53 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCHv7 12/18] mm/hugetlb: Remove fake head pages
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751955179.2274119.2481489263486900849.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:51 +0000
References: <20260227193030.272078-12-kas@kernel.org>
In-Reply-To: <20260227193030.272078-12-kas@kernel.org>
To: Kiryl Shutsemau (Meta) <kas@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 muchun.song@linux.dev, david@redhat.com, willy@infradead.org,
 usamaarif642@gmail.com, fvdl@google.com, osalvador@suse.de, rppt@kernel.org,
 vbabka@suse.cz, lorenzo.stoakes@oracle.com, ziy@nvidia.com, bhe@redhat.com,
 mhocko@suse.com, hannes@cmpxchg.org, corbet@lwn.net, chenhuacai@kernel.org,
 kernel@xen0n.name, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, kernel-team@meta.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202637_575516_92D650C9 
X-CRM114-Status: UNSURE (   8.57  )
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

On Fri, 27 Feb 2026 19:30:13 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> HugeTLB Vmemmap Optimization (HVO) reduces memory usage by freeing most
> vmemmap pages for huge pages and remapping the freed range to a single
> page containing the struct page metadata.
> 
> With the new mask-based compound_info encoding (for power-of-2 struct
> page sizes), all tail pages of the same order are now identical
> regardless of which compound page they belong to. This means the tail
> pages can be truly shared without fake heads.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,12/18] mm/hugetlb: Remove fake head pages
    https://git.kernel.org/riscv/c/622026e87c40

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
