Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B380FCD4F26
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=62bjw0E+dCjyTBe9AMgKDc4NyaseB72LwBW0ZSXIQ9k=; b=jgJG0Fyw8bnUUa
	zXP7ci8fRwM2NrlIGZC8gWHp/2TmJ1cpdfh3eEFLGg42MaeSxciAaiPMeMYZiBkH+qNhisKbpN5nf
	ZJuPrIbWW7jJuHYG+UpzaFrAdSw5pEjc6Ul0Kl8rUNttODntsy4tqtQpQecwZmGiv4CmxWXTE5n2G
	HVkwkAU+Q/I8sYs8q2u8rSi3NJtUlRpDRwCxu4jdRBugeZHYhn8ZODhNuiRDTp581Fou50QVZA/4o
	WoreUttj79bQc5uteeRD/PosAw04KC/DbhOESofsTe4lGmHK9i5dUY7811Mtc0pCu/i1nUarqkYaw
	Kp5oSyPKPcX9nhG5mjLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1ol-0000000Antq-2oWm;
	Fri, 26 Jun 2026 08:21:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oX-0000000AnVK-0qZb;
	Fri, 26 Jun 2026 08:21:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FB9F60132;
	Fri, 26 Jun 2026 08:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A8B1F00A3A;
	Fri, 26 Jun 2026 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462087;
	bh=8Gh35kQAbF9NJda9I6lHvwWhKBgWUfcBmP3w8KkXOio=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=P2rMods2RZJ2WUH9fceMLGk+MpRiyzpYQRjH4L1pJ6AqR61HFQvucLW938qDFyqSa
	 FrkrECMukEjHEVzuIjf3V5yv1Q9p5xzHWGE+6HTZgD9e8Q+Z7nOezHkV6X/Sw+wiEW
	 UPxEJFogBt7IvXPhQEsLsvxrjA2ZUZ+sJUU/SjGsUQqENcjHgmsRWXaKB8JJOigNrD
	 z/e7SPqqHF1NDBLkiCfywon1PNKm2pb6Q3QrCHZx2g16/jVLKpx0YZhOf14SdseVff
	 79jb5rym05v6a+Y09V7n67Wwd7zqoPAjo6ZU1rDj2vUgGPcpWRf3ejlG4/+MASOcl2
	 CdcLmqI3QOqjA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199D739389E8;
	Fri, 26 Jun 2026 08:21:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] mm/sparse-vmemmap: provide generic vmemmap_set_pmd()
 and
 vmemmap_check_pmd()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246207479.3816447.9419541647213093704.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:14 +0000
References: <20260404071720.3577290-1-songmuchun@bytedance.com>
In-Reply-To: <20260404071720.3577290-1-songmuchun@bytedance.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: linux-riscv@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, davem@davemloft.net, andreas@gaisler.com,
 akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
 kernel@xen0n.name, alex@ghiti.fr, ljs@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 ryan.roberts@arm.com, kevin.brodsky@arm.com, dev.jain@arm.com,
 anshuman.khandual@arm.com, yang@os.amperecomputing.com,
 chaitanyas.prakash@arm.com, wangyuquan1236@phytium.com.cn, ptesarik@suse.com,
 austin.kim@lge.com, vishal.moola@gmail.com, junhui.liu@pigmoral.tech,
 willy@infradead.org, alexs@kernel.org, chengkaitao@kylinos.cn,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org, linux-mm@kvack.org
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

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Sat,  4 Apr 2026 15:17:04 +0800 you wrote:
> The two weak functions vmemmap_set_pmd() and vmemmap_check_pmd() are
> currently no-ops on every architecture, forcing each platform that needs
> them to duplicate the same handful of lines. Provide a generic implementation:
> 
> - vmemmap_set_pmd() simply sets a huge PMD with PAGE_KERNEL protection.
> 
> - vmemmap_check_pmd() verifies that the PMD is present and leaf,
>   then calls the existing vmemmap_verify() helper.
> 
> [...]

Here is the summary with links:
  - [2/4] riscv/mm: drop vmemmap_pmd helpers and use generic code
    https://git.kernel.org/riscv/c/abff0ecf7602
  - [3/5] riscv/mm: drop vmemmap_pmd helpers and use generic code
    https://git.kernel.org/riscv/c/abff0ecf7602

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
