Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EE4C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 06:13:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34FBE61158
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 06:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34FBE61158
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6YobG12KPddrWCKgV+6NlJ55hUDK9hiCVdqlihC/Mjk=; b=1wpeMrzE6d91Hh
	P9waldYF2z73oDJA6t8Xd4MQSABllpW3s+YfW88Wv2D7cfyVc/ZshC8btZ8x09xgqNfgc8HydpyFZ
	ebfVJCfITCRk1sg5sbR3Cr2VBBFFmIVFzH7yRiiK3QkWeRofYpVO/AWHdCSIjM8E0Y/B62pvgEEzy
	GoKbvPd63yQCaqm6sXZILYnaBolvB8riZlRRyLfhFDq4z5zFWIv9a9zqQnw2l0UAQD3x+7DyLqd/m
	a9tQzh6YR9zbmq5pGwzeA6lrhya7yxXKKovtqr9rrC1c5aWXaLUXhPHIlfu+oCcEIuebZO6JoeJQ+
	aOQVeZcG6I31z+rt/a5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mODIp-008K5Y-3M; Thu, 09 Sep 2021 06:12:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mODIo-008K5Q-8t
 for linux-riscv@bombadil.infradead.org; Thu, 09 Sep 2021 06:12:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=L3wM+n0HjcXR+5rq2TCpv3fE1OymWFI2TAvgga/hDCE=; b=Xw39TMHR90bPyTmyfzGtLeJg4i
 bh/x1Er9+r0bzRBmBB1HU65DAzY2lUua3FHaklD3yGF4aaDlPrtsR0E2dJozvuvUCBSPhaiitAxv2
 ZbZBAmu1Cg/nbmQ8jCTOqbaBjfH8vetiV6gOcrGJZFb9ZDNSzyis9ufH9f1uMGxRcjllKqH8DpwNr
 pPYtBR3QC57ieJZDjd818pN//eV4ixXDMAGR/zlgqsqGma+6PVyEEXTu2Woutqm2IYol4tTj3nx8w
 7HrGcsxeOn7DwXU61khTL0xuwhvORlsW+Jscx7l23/Ma9/BIej0J0sYUuga6jJBRgQP23tt1I0p0A
 GViGrung==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mODIH-009XC3-Sz; Thu, 09 Sep 2021 06:12:27 +0000
Date: Thu, 9 Sep 2021 07:12:17 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: Re: [RFC PATCH v8 15/21] riscv: Add vector extension XOR
 implementation
Message-ID: <YTmlwTlSX94tltyV@infradead.org>
References: <cover.1631121222.git.greentime.hu@sifive.com>
 <33c485ee595aff1e19a0e43074da59779f58d105.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33c485ee595aff1e19a0e43074da59779f58d105.1631121222.git.greentime.hu@sifive.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

On Thu, Sep 09, 2021 at 01:45:27AM +0800, Greentime Hu wrote:
> +extern void xor_regs_2_(unsigned long bytes, unsigned long *p1,
> +			unsigned long *p2);
> +extern void xor_regs_3_(unsigned long bytes, unsigned long *p1,
> +			unsigned long *p2, unsigned long *p3);
> +extern void xor_regs_4_(unsigned long bytes, unsigned long *p1,
> +			unsigned long *p2, unsigned long *p3,
> +			unsigned long *p4);
> +extern void xor_regs_5_(unsigned long bytes, unsigned long *p1,
> +			unsigned long *p2, unsigned long *p3, unsigned long *p4,
> +			unsigned long *p5);

There is no need for externs on function declarations ever.

> +static void xor_rvv_2(unsigned long bytes, unsigned long *p1, unsigned long *p2)
> +{
> +	kernel_rvv_begin();
> +	xor_regs_2_(bytes, p1, p2);
> +	kernel_rvv_end();
> +}

This looks strange.  Why these wrappers?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
