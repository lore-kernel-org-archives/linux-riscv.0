Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2882F483DB
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 23:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wYefsmNF0H0xwo39KVmJOMvD3L/2RORfx7/iANaGG3Q=; b=VOUcr2ld2y90dB
	r3CsEaiXjb5v4G5STqlmkRN6KgW5kJz8jOAGsOLce/XcLv4+kyhmP8Lrsh6dQEgUY/hnvbyX0MbWl
	J028b7bMFZToRZ7N8/NMJTfp6MZ8wV7MslgRGlNCbSHKMg39SVWR6BEwrVLLxgOyAkVJu5Gvz4d7u
	V+JpLadvfzHfwSh3cHr1HP5p6sYpBIxRRy9LDwYq1dHQIZVNaoKvkzUNZXiG8uIv06pI2YGchf+ba
	eoHlL/eskUJVZv+QZLkMiGV0u7EWZzqLWlQIvQVHqlSk1otHGoXyz5UNRLd87l8cMS4m6VPp2Nw0b
	HsgD/x/Ys4LxYwHHr+FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4p1E-00000000ALQ-0u54;
	Mon, 23 Mar 2026 23:49:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4p1C-00000000ALI-2qwo
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 23:49:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE7E5600AC;
	Mon, 23 Mar 2026 23:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D157C4CEF7;
	Mon, 23 Mar 2026 23:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774309749;
	bh=poPr9Oh5kt9jNQCEarwOpBBrs6p5VTMKsb5XcaP8a0A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dIKVbioBOjYNL4g6U8tp9OmOa00gg+4IpKyjLk/NzOOlMptJbCPzSWtdLk5DQlVCq
	 dyBSdZRVmSHQhFvSIg3xjcaH4Oi76qhcS+doymzhR7KSluB1nNi1E7We+ZJm3Fxz5L
	 FCQam57ProMwiT+T//ViSSSr9sQnLMQK3r9Uo5yg/dW7rpRu5wO1c63kuKb33ColuA
	 HNcGxDK8Eok3J6U7EFvjWRx36ZX8uzCKNJOwhCokW///TBTxxcIcd3FijLY2nt17XG
	 3F+iQu1GDAZ6R63C0RGzF5ZYkmBL+D6wBpbU/b0atKxWUTNHCKxrxEWaATbgnAjXWZ
	 F/+c92acdcDfw==
Date: Mon, 23 Mar 2026 17:49:07 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, danil.skrebenkov@cloudbear.ru, 
    ajones@ventanamicro.com
Subject: Re: [PATCH 1/2] riscv: remove redundant check for CONFIG_SMP
In-Reply-To: <20260304033403.238012-1-hui.wang@canonical.com>
Message-ID: <eaab0148-0d31-37c1-bfeb-b9df0a7b73da@kernel.org>
References: <20260304033403.238012-1-hui.wang@canonical.com>
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

On Wed, 4 Mar 2026, Hui Wang wrote:

> In the arch/riscv/Kconfig, the HOTPLUG_CPU depends on SMP, hence if
> the HOTPLUG_CPU is defined, the SMP has to be defined, it is not
> necessary to check SMP here.
> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

Thanks, queued for v7.0-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
