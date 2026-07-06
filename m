Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D59C44500
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Gne8GQMci/bA/Atu2kuMJur/VRac9oiq4i1lWgKECc=; b=YkLb3EN2egtzy4
	mYzF+Z5K/fkysFPs4zBXO+sYnk+nKYyUHHwfAcJuHJ11l++RQqwjfCInfW/wfZxprzO800rjxJFP8
	JOfXRPMri8UJNyMfUzrUILDk80JjhuqvdDJFiq+lAGs4xZySkjy6li3ifBt8Jo/VaXG0FcQTLFXpZ
	9ankxBu1gXnUXkNGRZ5XfPRGQiBj0LQGX/44e9qAjPe74NddWZ4NJ48nCIPguCxUtM4hmfQaV1JH/
	WwVyOKQdK0bPN0PR7w7rEoR7axSF03Q+eObKbi77CbqzfV/SjxpEEsu9pzVJSb9IJN44atkbtqSjw
	sAyLuEzM02DppRnf1bUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmpS-0000000DACG-3xAP;
	Mon, 06 Jul 2026 17:09:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmpR-0000000DABs-0DVm
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 17:09:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 49BD060098;
	Mon,  6 Jul 2026 17:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8AE01F000E9;
	Mon,  6 Jul 2026 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783357796;
	bh=yB4oIgQGO46PMb4gsctC7iLJbIKv1QcdvH35LXpZ/A0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fu3xXM12KkAoeUJxxRJD4DNhzvpS5+vhRXhqM2DAYemlpuUZqBJd/Dqc0Uqy/U6T8
	 pn/Qq6KBxvtS1SFe8AeA8qLHUdm0nyxN1jx6Iug65VGdVamzbsSGVc75gT0uBpzDY8
	 m6bqNX5nHSa5Hu4Wp7EAUPSA+FxLF8lFsywKBvTlRUFJQkGVQOGceqRS7qAJAn3T6I
	 0iqqAeyegZiAeznbBIw4o0EBATTcEkFIc039i2nYQ9t2RL7bUE5qHjGvPbSBQIEOKI
	 ZJ17SF7TCUGzAAGeli3KZcO9xlt2jDFQvNRasm2ib+FvRjVOF5Z9mS8ULSi3vQyh5o
	 LQgZ23V9IezPQ==
Date: Mon, 6 Jul 2026 10:09:54 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 8/8] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
Message-ID: <akvhYsHxMsTfBEnv@x1>
References: <20260628-dfustini-atl-sc-cbqri-dt-v3-0-c9c1342fe3cf@kernel.org>
 <20260628-dfustini-atl-sc-cbqri-dt-v3-8-c9c1342fe3cf@kernel.org>
 <20260628212744.1AD731F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260628212744.1AD731F000E9@smtp.kernel.org>
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

On Sun, Jun 28, 2026 at 09:27:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] cbqri_capacity_probe() incorrectly uses get_cpu_cacheinfo_level() to find the cacheinfo, which will fail for split caches (e.g., L1I/L1D).
> --
> 
> commit 1a6b06fa1768e5d101b318b8e5167a959fc10696
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv_cbqri: Add CBQRI capacity allocation platform driver
> 
> This commit adds a device-tree platform driver for the RISC-V CBQRI capacity
> controller. It reads the cache level from the device tree and matches it
> against the system's cacheinfo to get the resctrl domain ID and shared harts.
> 
> > diff --git a/drivers/resctrl/cbqri_capacity.c b/drivers/resctrl/cbqri_capacity.c
> > new file mode 100644
> > index 0000000000000..2172432eb3287
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_capacity.c
> [ ... ]
> > +static int cbqri_capacity_probe(struct platform_device *pdev)
> > +{
> [ ... ]
> > +	/*
> > +	 * Associate the controller with its cache instance via
> > +	 * cacheinfo. The matching cache provides the cache id and the
> > +	 * set of harts that share the cache.
> > +	 */
> > +	cache_id = -1;
> > +	cpus_read_lock();
> > +	for_each_online_cpu(cpu) {
> > +		struct cacheinfo *ci = get_cpu_cacheinfo_level(cpu, cache_level);
> 
> [Severity: Medium]
> Could this fail to match split caches, like an L1 data cache?
> 
> The get_cpu_cacheinfo_level() function unconditionally returns the first
> cacheinfo leaf it finds at the requested level and stops searching. If the
> given level has multiple leaves (for example, L1 instruction and L1 data),
> and the device tree node refers to the second leaf, this loop will miss it.
> This would cause the fw_token check to fail and the probe to return -ENODEV.

riscv,cbqri-cache points at a separate unified cache node. Split L1 I/D
come from i-cache-size/d-cache-size on the CPU node which have no
phandle. Per the CBQRI spec, the capacity controller governs a unified
shared cache, so a split private L1 is not a valid allocation target.

-Drew
~                                                                                                                                        
~                        

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
