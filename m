Return-Path: <SRS0=CXC0=UK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AF0C4321A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 06:51:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E5CC208E3
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 06:51:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i5U8PIE8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E5CC208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mqTuYe2akUcuEZpuAb0ErweDPFdNc067/StnEEvBEc4=; b=i5U8PIE8XlhgU11OO48g0F1KW
	jQ8Z5bE1/6YSsUBV6mhi2bBTTSyufa/ZX4N6HiLW/8n0PGyMSTq1LY3QYxSBMu9RqdKghPPQK2XRx
	bEPj/fK///w1DRbfwJoaPtYj8S3kaLoxmWnv6ZF6W9LVN2OHLNuHCILLiHGnU+xptnaYN/nJxnvKZ
	R1DGH9Fy3Zs9tYNPkSRVIfyw5RAr09wPXxBADc1KkocSrObFwEIxriF0VWWwXe9i/liKdUOUn3mI3
	DnOtYkAJ417bpIlwSqxBaYcTvizKn1oaCLC3+Dsn/A396yVX4STRcVyMDtCqgDlrusT3D2eSTVf4z
	DN37W8rqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haacq-0003wC-8j; Tue, 11 Jun 2019 06:51:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haacd-0003mD-F5; Tue, 11 Jun 2019 06:51:08 +0000
Received: from [10.44.0.22] (unknown [103.48.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C20920896;
 Tue, 11 Jun 2019 06:51:04 +0000 (UTC)
Subject: Re: binfmt_flat cleanups and RISC-V support
To: Christoph Hellwig <hch@lst.de>
References: <20190610212015.9157-1-hch@lst.de>
From: Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <6e5fb7db-1d6f-7d49-553c-edc18f14f641@linux-m68k.org>
Date: Tue, 11 Jun 2019 16:51:02 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190610212015.9157-1-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190610_235107_523031_80060661 
X-CRM114-Status: GOOD (  10.32  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Christoph,

On 11/6/19 7:20 am, Christoph Hellwig wrote:
> below is a larger stash of cleanups for the binfmt_misc code,
> preparing for the last patch that now trivially adds RISC-V
> support, which will be used for the RISC-V nommu series I am
> about to post.

Whole series looks pretty good. Just the one comment I made.

I normally take these through the m68knommu git tree,
if you have no problem with that I'll push it in there.
It will hit linux-next from there.

Thanks
Greg



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
