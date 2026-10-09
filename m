Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D57CA5FED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 06:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QiZdL0Qlih27JnYV+1/RcJVC8WPz7uEfVCPRx0AkYk4=; b=WDSI9y8whZpDA3
	0A2WHEhGzqgz+Vv762cYjIDVitTY7eVqGV5fPkjn5FULAKuuVIJpxCAg2GOjmJSkJ6U8Br1w3RKaO
	Pqm6U7Bq4mFF1KbVwh+K9nl6PdVXTI8h+RktgV/A1rvt8oc9dgiV4/WprDjSvkw+VSb/XQM4vplJf
	3v7K5S0aC83WEtRbebR48YpWlpD23jPpoe0Igapv9nlaKuEtmLxP478KjAQhZhffV3WOe5LKuNYqe
	Rjo1CYTdcoq1IyIRzjHzEZPg02/zgJIwqn50X8MIZepBvqxYlxlkFPgmGHLBWphglr3dguwnfk65V
	bTWaKWrjy/1XirqXw30w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3ny-00000005ahi-2VQl;
	Fri, 09 Oct 2026 06:10:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3nx-00000005ah8-1BaE
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 06:10:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD6EA43E4E;
	Fri,  9 Oct 2026 06:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22021F000FF;
	Fri,  9 Oct 2026 06:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526204;
	bh=uNEyUpqWkIL1k7ckpeKBLtRv7ZKipBMmT5/I3vSkb2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b9pPqQI6LCVJbJ0tdzWdfq1YYVNZ4Qgvc2O7ABA6/0dVfcMRR0FShX7vbK+XR7aJb
	 zu2KzPC4iUhsFg+ufj4xWAKgBlJKe6tzcFlp1sEyiaoxuIaDmM1qUC71ZIoWj/qdML
	 up7HOwx+avtus2K867s0GXtTJ3GnAjCyMwa0owcznFTfNIWyXe+nUbxr2r1cXYSx7U
	 3eLDDDLcdJ4Sv5q5eXFWE/q3RqaAN26H1xWFbIcjnGy7k1VfNcn0iloORsiwaFiOIv
	 vOM/DpeP1Lq4tzaRO/BvEoGMVoA2BMvgVkwbdaomqHxjhbymiINHKkpl8tG8xFiosc
	 +L5EEzoFXDAAg==
Date: Fri, 9 Oct 2026 08:10:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Green Wan <green.wan@sifive.com>, Paul Walmsley <pjw@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH] dmaengine: sf-pdma: fix double-free of the in-flight
 descriptor
Message-ID: <20261009-brave-significant-slug-44bbee@quoll>
References: <20261009042358.3102885-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261009042358.3102885-1-vulab@iscas.ac.cn>
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


On Fri, 09 Oct 2026 12:23:58 +0800, Haotian Zhang wrote:
> The descriptors handed to sf_pdma_issue_pending() and
> sf_pdma_donebh_tasklet() come from the virt-dma desc_issued list
> (sf_pdma_get_first_pending_desc() returns list_first_entry() of that
> list), so chan->desc always refers to a descriptor that is still linked
> on a virt-dma list while a transfer is in flight.
> 
> sf_pdma_free_chan_resources() and sf_pdma_terminate_all() free that
> descriptor with kfree(chan->desc) and then call
> vchan_get_all_descriptors(), which splices desc_issued into the local
> head list, so vchan_dma_desc_free_list() frees the very same object
> again through sf_pdma_free_desc(), causing a double-free (and a
> use-after-free for the pending tasklets).
> 
> Drop the direct kfree(chan->desc) calls so the in-flight descriptor is
> freed only once by vchan_dma_desc_free_list().
> 
> Fixes: 6973886ad58e ("dmaengine: sf-pdma: add platform DMA support for HiFive Unleashed A00")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/dma/sf-pdma/sf-pdma.c | 2 --
>  1 file changed, 2 deletions(-)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
