Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52A1FF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=62QXODrSB07jF4JibwP6g548dwfTFbTRAHB9mVO36Xk=; b=dh4qhvrK5AN9mS
	mYVfhhgOOOa3UXv5ynNUIKImHnfwQgiTrc2nT6JKkv2GnXoU0rol4NNcRs+VKUYkxeph8iSRkIIZK
	cspmNBJ+4X0acqwyTTwnAuQdfow+VmFjOmWIFiduS2qNDXzB5R/9VI+ywKiu3PveNjXuQEo9Cr/Gf
	wkL2aHWx7pMf9t4w6kXe+pnBIkiborP4+wjrTRC4s7b4c5fLczF3l+L2QSsJWop30wcL8kk03bgDC
	JZyN6kFt9cF3q63J7KvGu/l6JhVyWZ7YGr4sXWdumF2Kbx5ieHmTiP2es/WLAv8dmqdLBMlKAUF37
	LeGea/d5UZLWK60qHYTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII4p-00000004Z4o-3yoi;
	Thu, 30 Apr 2026 03:28:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII33-00000004X5o-1y6v
	for linux-riscv@bombadil.infradead.org;
	Thu, 30 Apr 2026 03:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Z1Bc9EV5y+bhYycUp6wLBzpUNqNF28WMRZLrHkhnHUE=; b=EvLl+fbI4qFSapB5vuL9I2E6Ol
	gNoJAHnHdTRmWtIwUmTGGVz/UIS2IfWlrZLuIr1iZYNxqNgCYgXWzcxTQ5/YRdH99a3nRFCwpWhr0
	H5zTKibYSj34xZgw4ecGcdIz0/SUtwfKE2/Jr0oeIIZAngq18WMpIPLv3cV2L5nZkzuVMV9lyIeXC
	Gs+1y0rqo7fdWpI0PO9fMkbUZno1UJRpdYwpVL/79q4iCiK+BGHQjIUwlveBZyogb8nR/QDU2ejnK
	NE8HyIPiBD4UH/rb5UTjkWbz3wZ1A1/Bqd+4x1iYhmSxH0vcEnxQWTYl4Vh9ngaXVRz47zch2Ubg+
	X8/gTIAw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2n-00000006Xi5-1Adi
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CAA9444D1;
	Thu, 30 Apr 2026 03:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68048C2BCB9;
	Thu, 30 Apr 2026 03:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519587;
	bh=013+JQB3BOWcgJhPqdubZ1XsxYbnthONCnm8Hl39HsQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZJ6OmXOMpE+dTJPzp+xtAqL+VAk4ePieug406a8qk2/dHpymUK1JjCTkKOHPysOIj
	 INPaAGoTWRR3yYCB5hELjnfdvAfGK4/sGDb+7eKy4KcyPn66lNIN1AaypMkVLUWRno
	 7mvTCzzvR+eFzmFD0As9ZNiX2e/asCEu9Bt/Ir1neq8SH3sHmTB1VpBR5W91Ed2cp8
	 vwrXvOOhet4pbTRNVpG8lw5+rnuaKpNo6/Hy8IdkRQBmQg6ZuAtLQfTaHppkkwkHi8
	 +xwHkUQkz6fLJPc01QgnX70Wy4T0kzoqFakSpqhh5J9lYDGXyJBUznVtbJbQXiu6wY
	 hb5+2ZtbiY3QA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F543809A07;
	Thu, 30 Apr 2026 03:25:43 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCHv7 06/18] LoongArch/mm: Align vmemmap to maximal folio size
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751954230.2274119.12654930976338727655.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:42 +0000
References: <20260227193030.272078-6-kas@kernel.org>
In-Reply-To: <20260227193030.272078-6-kas@kernel.org>
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
X-CRM114-CacheID: sfid-20260430_042631_603398_6FCED561 
X-CRM114-Status: UNSURE (   7.51  )
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

On Fri, 27 Feb 2026 19:30:07 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> The upcoming change to the HugeTLB vmemmap optimization (HVO) requires
> struct pages of the head page to be naturally aligned with regard to the
> folio size.
> 
> Align vmemmap to MAX_FOLIO_VMEMMAP_ALIGN.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,06/18] LoongArch/mm: Align vmemmap to maximal folio size
    https://git.kernel.org/riscv/c/2969b42c8f99

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
