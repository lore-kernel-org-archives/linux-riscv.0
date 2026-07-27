Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91028C531FC
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 07:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4K5HjpVkxyqNB3XcrLkVgEUV6yUItePmuZrzO8u+rc=; b=HemWInA4Yv0IIe
	0fNmn2zQuKbdq4CMWl2zd+QKzlnUG31SeI7L4RrdQ9y3t/z+xcjSr998qIIwHYdrJuRfJEa3BenE0
	TQ9qcFMdvK/cF76eLFYrs6gkS/PC5S+LeguAOkYYTBQPVFKqSnlD5dy/Jqk5T+QtXas4QLF0Wld35
	A56ok9cldydtZxJ8VB7JLeQ/uNhsHmxglFVLvOef/84qh4sXM/QHEp+6azuaR88v/vGWbaaB2GbSC
	Y3sOGI9Mw1DQXGmk60ry+U7OkGy3xrYse4pkubTswQnaVtLOiz0oGUT+fg08SyrxDVFTG9xHDDzIZ
	EO3fCww342PizPbXq6EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFWD-000000025n4-33xa;
	Mon, 27 Jul 2026 07:12:57 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFWB-000000025kv-1Z9w
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 07:12:56 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785136371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3v9EuBJM+CGkBe7LykhWWRzcPi8hSL6aBBXQb9t5Lfo=;
	b=pon3tzumMBs0fyFJqWphbG7Ccx3chQwSYuUJnE2+qJKF4sO1w9humYcCG/OIkiqKLNcvud
	25YY2tgX9l8bv7Jc5TZY0EMPoOmPd5kGJAhyOPMm0Z67feilRNoadPS+/gGk8T27w+ilXS
	I4HLoXjk8IZbZ6JEm784emoGga+cc7M=
Date: Mon, 27 Jul 2026 00:12:45 -0700
Message-Id: <DK9610Z1F0G9.3KQ7JB8NG1HO7@linux.dev>
To: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <spacemit@lists.linux.dev>, "Anirudh Srinivasan"
 <asrinivasan@oss.tenstorrent.com>
Subject: Re: [PATCH v2] riscv: mm: fix SWIOTLB initialization for systems
 with DRAM above 4GB
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
In-Reply-To: <57a24fb1-1ca6-3bb5-1c1e-bdcb50ce2b7e@kernel.org>
References: <20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev>
	<k55h7j5qnn3dryqro2oof7kgjcdhyoarvg7uvtm6sbrgdtnfzy@br6areeqp4ng>
	<57a24fb1-1ca6-3bb5-1c1e-bdcb50ce2b7e@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_001255_617261_A810FDF6 
X-CRM114-Status: UNSURE (   8.76  )
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

> > > 2. kmalloc() bounce buffer allocation failure on non-coherent systems:
> > > For non-coherent hardware, a bounce buffer is still mandatory for
> > > cache-line-aligned kmalloc(), even if 32-bit DMA bouncing is skipped.
>
> I'm not sure I'm parsing this correctly.  Shouldn't this read "for
> *non*-cache-aligned kmalloc()" ?  Or am I missing the point?

You are right; this should refer to kmalloc() buffers whose
size is not cache-line-aligned. dma_kmalloc_needs_bounce() requests
bouncing only when dma_kmalloc_size_aligned(size) is false for a
non-coherent device and a direction other than DMA_TO_DEVICE. I will
correct both the commit message and the corresponding code comment in the
next revision.

                                            - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
