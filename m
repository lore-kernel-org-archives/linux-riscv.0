Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EB8CAC59A
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 12:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0NrX3etuOMwQOysCVk7KMmIMExyY5OGEuCh9JHUF04=; b=cT4nb1UHCxMkk7
	t4+/2bltwRNxBU+irmcChcFPT7Ns+syyEVJgRVJ6VjNzrWHEuwZeNrUpjCYC48qkLn4RvRgnjw3ZE
	I26+i4DTRs0VwY1DOKGYhbQweVQMgLX7NBPsuS05/s+gYZCjeKMKUm9huVr4hYFI0/3q7wfTlhKGY
	HiGldLNUr0qDh1wsraOs2hkLzyau7H2uL/8kqDAiDvxy6FsCApGvfNt/JQleLz6cPvDncOkzazzy9
	1nm/zABHO/2rbOILXSnp6mpSeQJ9Uu00UjR02rcHfQKXqbgYpn7VyvLZ0oRCKadsQrDxAWjZVyn9j
	cUbf7/IVfO6jza1Df8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqzx-0000000BF9H-0FDb;
	Wed, 17 Sep 2025 12:10:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqzu-0000000BF8P-2dtc
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 12:10:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0820741998;
	Wed, 17 Sep 2025 12:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F0EC4CEF0;
	Wed, 17 Sep 2025 12:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758111052;
	bh=4b+3wgBOJBBGgs10wnxQNnQa4YQksLnQvgDmz/atCHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o1ia5Ba4JC91lN3tqjfIYJNEE6Sj5awnPtnsY4WrxQlt0GrEhCSnlhH9/at7CpyaR
	 ahZCSpp74RNyY7DBQHIq43XSVLJEChuF2F+UwrIleYDQ97oRt/21wb31ItPD4yODzP
	 LkkPHlzBpcLyPdSxs5k1o/clildq2LgiyfsPllw3wK06Q37iHczN9U37+sXuQpAZd2
	 ZwwR+tO4gpefQ6FgjPcwEBSXg8fA7pg6nZMYgg4qD+np/vPCO7GrcuQWiFjK0ftUIL
	 CJ0FwF99/2OtEg9hyVvUg1i2GaYq37RC3ScLQSjcAVDDCiHUKLs38+nRVMASMCXt+v
	 q7eLWIBjVuQ4A==
Date: Wed, 17 Sep 2025 13:10:47 +0100
From: Will Deacon <will@kernel.org>
To: "guoyaxing@bosc.ac.cn" <guoyaxing@bosc.ac.cn>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
	iommu <iommu@lists.linux.dev>, tjeznach <tjeznach@rivosinc.com>,
	joro <joro@8bytes.org>, "robin.murphy" <robin.murphy@arm.com>,
	"paul.walmsley" <paul.walmsley@sifive.com>,
	palmer <palmer@dabbelt.com>, aou <aou@eecs.berkeley.edu>,
	alex <alex@ghiti.fr>, anxu <anxu@bosc.ac.cn>,
	wangran <wangran@bosc.ac.cn>
Subject: Re: Re: [PATCH v1 1/3] iommu/riscv: Add iommu perf driver
Message-ID: <aMqlR4vDOgrFuCUj@willie-the-truck>
References: <20250915020911.1313-1-guoyaxing@bosc.ac.cn>
 <aMfsj1U7NY2m68T4@willie-the-truck>
 <202509161827232434929@bosc.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202509161827232434929@bosc.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_051054_683762_D0EA8FF5 
X-CRM114-Status: UNSURE (   9.06  )
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

[nit: your email client has made a big mess of the thread here]

On Tue, Sep 16, 2025 at 06:27:23PM +0800, guoyaxing@bosc.ac.cn wrote:
> > PMU drivers are better placed under drivers/perf/
> 
> I did a quick reading of SMMU pmu driver in drivers/perf/.  However, If
> the RISC-V IOMMU PMU driver is placed under drivers/perf/ as the SMMU did,
> it would cause an overlap in the iomem resource region between the two
> devices(iommu & iommu pmu), because it needs to share interrupt-related
> registers (such as the IPSR register) with the main IOMMU driver.

Is that not something you can resolve with IRQF_SHARED?

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
