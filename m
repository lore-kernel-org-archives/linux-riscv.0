Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E2DC982DD
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 20:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMYwn+RjBCVwYCXq6cqKvmcAMg13RConDFwulqs9cp4=; b=ZyDTtGpNHMf9SB
	ePGHnFKb8mwIkCcTj/6rmROtdPSvFaHNzIdnSJlpNk6XwFZ8QNFha/zBHNoMMbP1qcLuMfRNV6wsc
	E8MT304b78rwx1RNouQ2447gepRsQB77mr4pW34YsvteRN3DOgjexFeV31cq2eVKZlDPYU19UzXcg
	/zscKuqa+8PVhPA7ekQ4S7ifHaTFduAf8Cov4jLGBca2zEYNhNgzK+XINPZC8pX2Y1/RJ3M1//zLu
	QElTvtbU5tFEl8d4MrOtDfFvsi0MBU0XJmkqVBedIL4nSdAlO91w7OCaK1ZvYp6CtaGUWYEuL0lhB
	luEgvfBKM2JKjzHm6HYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7euW-0000000FUCu-13TD;
	Fri, 18 Sep 2026 20:10:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7euV-0000000FUCk-3QcI
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 20:10:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FE2640642;
	Fri, 18 Sep 2026 20:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D441F000FF;
	Fri, 18 Sep 2026 20:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789762215;
	bh=tmOXqQV+7zVBgHMuAkBfRfzCHNcoIovuLaiy1KVB8YQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Db7G6tmb4SfAN4qnTR24wV4mqtFI4f1Ksr/Ht1LhOu46xSzN+Cj671vTZihTpVQKy
	 L3WUGhgdBLmUD9U6t2iSC2GLMCSLk2+8hNF2Cjt356+XgxtqVSOfEqDA8VYCE19a0b
	 MlS3cfLifn9yIGFtt2qmL83vC23525qCnwmptvOvAR1Hd/29fE+WtTFQ8yL51dyjaA
	 YqKd4APIc4rSLzONjEdvbeQ89Hm6+BXmoZSWOAqi/e496bFVi/XYyomNvLUPK0t6YS
	 LDy5CCmQaC+gEG51cBDYqAofdUhjbCrPE+Z6oyLdL+iWRcOhQ5P2jcqowaMl8O2nxG
	 MMdl1nHNxSS4w==
Date: Fri, 18 Sep 2026 13:10:13 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 5/5] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
Message-ID: <aq2apbFvv5mSPc82@thelio>
References: <20260917-dfustini-atl-sc-cbqri-dt-v8-0-7964e8d73fe8@kernel.org>
 <20260917-dfustini-atl-sc-cbqri-dt-v8-5-7964e8d73fe8@kernel.org>
 <20260917171116.1AD781F000FF@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917171116.1AD781F000FF@smtp.kernel.org>
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

On Thu, Sep 17, 2026 at 05:11:15PM +0000, sashiko-bot@kernel.org wrote:
[..]
> > +	ret = of_property_read_u32(dev->of_node, "riscv,cbqri-rcid", &rcid_count);
> > +	if (ret) {
> > +		dev_err(dev, "missing riscv,cbqri-rcid\n");
> > +		return ret;
> > +	}
> 
> [Severity: Medium]
> Does this unconditionally fail probe for valid monitoring-only capacity
> controllers?

Yes, because this is patch is only adding support for capacity
allocation.

The hardware I have access to only implements capacity allocation. I
plan to add monitoring support in a future series - hopefully with
feedback from vendors who are implementing monitoring support in
hardware.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
