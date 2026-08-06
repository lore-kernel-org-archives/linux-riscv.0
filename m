Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12EFC56205
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 17:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qqzux5Cact8gGgRQnfoY5I2syban5KR81lFdAwjDOxE=; b=B52RgOv/W4DGRz
	athsTlshuuiku0yj7NNVS+0jZCHhaTIw2gUNguGl7iE8mdc42M7jls1VAs0tu3zRjUWZaIj2deBNj
	X7e1AgHUqlC85W5V0ck0QddbgYF+QArn/8sX2rSH2Zr6Gi15JYBEshDDhB/AGAkfjvVMyTmRHVIFi
	SMXzcuVXr0qo2/SKF7AU4pxkNaAIHUQx9dPjITqv2k3hovb/gmI1mGQxCZfjf+N9RTqA815beAL2w
	q9lGJfg0MSrShJoRJQUZCoAzm5IQ2zec6POKyf9BXzavKV3OxQlVQBAWHoidfg4hlWEZ7rLvqIaeV
	l0UQXZkVo/aR37gTNa0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws2KH-00000006PkU-46BD;
	Thu, 06 Aug 2026 17:56:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws2KG-00000006PkJ-2nGn
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 17:56:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E61DA60AB0;
	Thu,  6 Aug 2026 17:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34B21F000E9;
	Thu,  6 Aug 2026 17:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786038975;
	bh=pP8/+IPjApPrhg92srmtesvabW4LFYQXAJXR3pd5Fbw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=EI0vijPY5rBvJdiBHvxF5mK9Tlgu4Gjn/wB6Mn/YEegWUoCgEorGfIPIfvu3yps1P
	 xWLpq6a8hcqiQYB61qQDCIwvQWtUNbXgXL7ZJA8PO3B/q7iaQ3HRmSsQmeNtkg5WFk
	 qWQYvlMtvwLsWh2IJ+I3HcrnSku+5WAaX1uEM6zQXZ9z50dYxCMRKkchVFjMVbEs6B
	 VkpiRlTKtoX+Ndy1tzHCPfMVXYfXC9o2lU3xSeDJiMhER+Ytey+SYiQdkOM91WNvrq
	 rP7DBJcdNLuNovQLLMEP9lE2lhiSTLxOB2VR2URDOeOX86kobIHy5W5QRcg3bcgHTF
	 jrQ9ueHPseWAg==
Date: Thu, 6 Aug 2026 11:56:14 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Milan Tripkovic <milant2002@gmail.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, kees@kernel.org, 
    alex@ghiti.fr, andy@kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
    Dusan.Stojkovic@rt-rk.com, Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: Re: [PATCH v6 2/2] lib/string_kunit: extend benchmarks and unit test
 to memcmp()
In-Reply-To: <20260520123954.379630-3-milant2002@gmail.com>
Message-ID: <94d47e77-3cec-158f-c214-248d00e41529@kernel.org>
References: <20260520123954.379630-1-milant2002@gmail.com> <20260520123954.379630-3-milant2002@gmail.com>
MIME-Version: 1.0
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

On Wed, 20 May 2026, Milan Tripkovic wrote:

> From: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
> 
> Extend the string benchmarking suite to include memcmp().
> Extend the string unit test to include memcmp().
> 
> Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>

Same comments on this patch as were posted here:

  https://lore.kernel.org/linux-riscv/81c7c1b0-2906-96f6-6f7e-c859a7578c8c@kernel.org/T/#u


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
