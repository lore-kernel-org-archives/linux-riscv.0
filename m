Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C163CD1297
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YD3YbjaQZlbGtwirJE0XGJsqbWYCJ7ts/pnbC7FXTgc=; b=TF0jSIBEy1yuqs
	5Fgv61nzX3z9ljnu+Okhu8W49LBohnd/eV1fId1y+35E9+uWqVzEGY5dsOjyNn/kFNqIG8gi4HlGF
	L3Zwuk1iSrP+VRi/G0eDz9FAHISO8TftWwYHtwbibnmDeeu2Jsq/1t4oD0zLkOuiBtxWgHJFMwVZr
	X1JjROekLOKAKsN3Y9IjzOAsCcIkPPE0cQ2Yl8ik6bMl754b9fi0TMEBnrspPvd6UGLtTNKS+Ft1C
	vCt3DqgUovYcug5+AvsDiF7o6o8Vznw5tMLNMVkrZWcy4e0GWxphZgPWSdYbZYrGO0k/8+hKwuiaD
	cCjR6d35oJCkdp5XfFtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII4l-00000004Yx6-2VbT;
	Thu, 30 Apr 2026 03:28:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII3B-00000004XD9-31b0
	for linux-riscv@bombadil.infradead.org;
	Thu, 30 Apr 2026 03:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uv0/AeoPfpXHb5/5volWmUsGpOV4SzoHoygFS3Y1v0g=; b=BDruGDpmqxPFfprE7UW0JrJ0eN
	yuxde4KsSFKmtMKFEYHuyyM/LmKkNXmFnDiln8EXTWB1ACkl3oLRQ7mjminYHzLhnJMXoPLsFWI0i
	Y4rZ1J4qpXvVqbOsitUS2+rh295QFa5ct46Wn/l9BssyHu7oP9Wx/2ZFS0leq3ghwKBsJ169zU7Uk
	01rtSmjuL/48a2bFJuwLdC0q/fRf8Q2GatJaYy/duDvE8I9M/TFHcl/zIDilqtoqspeHW1/Fm5cC1
	o36dCrkhUl9F6rNB/g8bllj0v179IaBlC0vsaRZizB+6wCwe+d11T/XKTdbj32z4HMG2xQFtSbagf
	6lqQzfDQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2u-00000006Xjc-3Jsy
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A8094443E;
	Thu, 30 Apr 2026 03:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF196C2BCB8;
	Thu, 30 Apr 2026 03:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519591;
	bh=D6nRuLlNtWNYvvWuUfjCi9f8beZLcFCcGwTLfTAZV1I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Wo1L0FAiDsetIA/SZIMY+AZ2u3wX74XqfiqwNIt6PNAuDwjaG2jrM05nbChaS/1w+
	 RCmeQ4j1ATh57HbuwNvIYf9y01C7fhsragL/4RLWcSfcjeArvpsZCIf4D1+2JzF+lu
	 QvlapmT1r6mGtpC/JBtb/i3oKWYqTNCWdDeT5Cjpio+S+IfZdGzYd1U9UsNmsiPiDd
	 SQqYDrMvbc6Q+NbWiVgZLofEOiO1goK2HygUtaTFo5Mcw/hy5zHqRYL31iLH4Ql9Yi
	 iOqQUeeCRrWIjMN41eaD8Tm3MbEk7Cm5c/f/cH4xsZ4sj0M9HzOVh3aiLNeN/s5MxX
	 eA864zTCr1jHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FCAB3809A07;
	Thu, 30 Apr 2026 03:25:48 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCHv7.1 17/18] hugetlb: Update vmemmap_dedup.rst
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751954679.2274119.8307144944681814627.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:46 +0000
References: <20260302105630.303492-1-kas@kernel.org>
In-Reply-To: <20260302105630.303492-1-kas@kernel.org>
To: Kiryl Shutsemau (Meta) <kas@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org, alex@ghiti.fr,
 aou@eecs.berkeley.edu, bhe@redhat.com, chenhuacai@kernel.org, corbet@lwn.net,
 david@kernel.org, fvdl@google.com, hannes@cmpxchg.org, kernel-team@meta.com,
 kernel@xen0n.name, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, loongarch@lists.linux.dev, lorenzo.stoakes@oracle.com,
 mhocko@suse.com, muchun.song@linux.dev, osalvador@suse.de,
 palmer@dabbelt.com, paul.walmsley@sifive.com, rppt@kernel.org,
 usamaarif642@gmail.com, vbabka@suse.cz, willy@infradead.org, ziy@nvidia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_042645_620518_CC5A03F7 
X-CRM114-Status: UNSURE (   7.84  )
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

On Mon,  2 Mar 2026 10:56:28 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> Update the documentation regarding vmemmap optimization for hugetlb to
> reflect the changes in how the kernel maps the tail pages.
> 
> Fake heads no longer exist. Remove their description.
> 
> [...]

Here is the summary with links:
  - [PATCHv7.1,17/18] hugetlb: Update vmemmap_dedup.rst
    https://git.kernel.org/riscv/c/fed8676ca2b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
