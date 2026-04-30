Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A665FF8864
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ASnIU2nIi/sHxA/kKKgsf8iTZADO9yH0sdn2bQGVNk=; b=TnG+vvh1ZfS2uv
	WgEFOu7PXudnYaHrjX/3zYTXMzoR/7oLfybh2XmQsyq8SgZfYsZeWX7O9KO3V1rCGVcIMFMIbdok3
	o25gIv5V9dUrTEV0mVDy4CW2olEpo2cY1R9rSdZH/0ZSiF0FnGXWhxXcs/ZiT/bFUDgXoqUU63snE
	JRdsEWb+fOVd5+fpjH8x0A3KALbLP+Xm5ykN0b6xlCi2yi4hKXeVnfBQDbDOGfH4KpXqk4s8MCPrO
	todwlKOkcbungGoAcK6LlfPSn09V6w/Wpf6Oo/hS9peeMHk1MChdm4EH/zWh+lcqriL07hChvPFXF
	CkKX6NeShALCOETVtxmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII3I-00000004XL6-189E;
	Thu, 30 Apr 2026 03:27:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2S-00000004WRp-3rPx
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C5CC6445ED;
	Thu, 30 Apr 2026 03:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64A6C2BCC7;
	Thu, 30 Apr 2026 03:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519568;
	bh=Mv9m+6QFE5X2BSGU25QtTcnJE8P+nH7SNS4s/QHDQxg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=juZ89lUUjlVInyNLudhGL6gKUdYypOgVutLeQYu7+Zv9S1ojQMn1fsbg4/q8HA9kf
	 uytXyHEjScBl37xivNSPE4ryJhsH6K+fNiVEE3Tibqd01DfSHLLdV6DIGHiyfLM0j1
	 7lINbKqurIbK3kXn8ov3jBGtqjt9zr1HJOqGLUPQmNjzT4ay7v/AFZ6L1jO6UnQ4rh
	 0keCg/YHJh/PxXoT6xU3vqXVkdyYSyavz0pn2sGolZ+WXuho12ORsn1aVio9mo8Pvg
	 7/PlMZGkUL4uMfmMsq6/Hm8MqMlXxt9gGwLkoqjr+NZqDNUWGsEQTi8myDrLsVuFeA
	 HFH46Dai3te4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02CFE3809A07;
	Thu, 30 Apr 2026 03:25:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCHv7 03/18] mm: Rename the 'compound_head' field in the
 'struct
 page' to 'compound_info'
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751952355.2274119.4433106526683678449.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:23 +0000
References: <20260227193030.272078-3-kas@kernel.org>
In-Reply-To: <20260227193030.272078-3-kas@kernel.org>
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
X-CRM114-CacheID: sfid-20260429_202609_033841_D1D5082B 
X-CRM114-Status: UNSURE (   9.85  )
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

On Fri, 27 Feb 2026 19:30:04 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> The 'compound_head' field in the 'struct page' encodes whether the page
> is a tail and where to locate the head page. Bit 0 is set if the page is
> a tail, and the remaining bits in the field point to the head page.
> 
> As preparation for changing how the field encodes information about the
> head page, rename the field to 'compound_info'.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,03/18] mm: Rename the 'compound_head' field in the 'struct page' to 'compound_info'
    https://git.kernel.org/riscv/c/d50569612c29

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
