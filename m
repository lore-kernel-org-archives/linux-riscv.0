Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB53EC71157
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 22:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wEgZ4N7CXJ1TA1rMqXiUc9UQTVIW9LmPdQiPKc4E0U=; b=Rl3HMT1d+SsOR/
	C/1x0M/NL174xHdVpctE0aQX5S/H616BL3SRBPjfTDxbLJuSsk+PYqV9eViT0GjUSmbG7uncaoyfG
	45vPxyanCXULeK4MsPAzgsvubC+F0pEH/rqxe3HVjD/bv64kPNwEok8X+BKJOQkE3dk2GaIvsZyQG
	ltpTKKh7KsITRoC6k4o+LV6Saxf3mPd3rdig11t95mFuXInizducYJq+w3eUai2jBQ5MV+RuHG3c1
	n9rqB/l1TKPyAHgDeyT5BKeyUnmNHsDS227lJtRUFBCGradjGoCGyNH0kNcCZXfRgcGMbTozkYV76
	2uzvN2fb36HVBNGxk6Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReMq-00000008TdF-1hRC;
	Tue, 17 Jun 2025 22:01:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReLU-00000008TMi-0zq9
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 21:59:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1CDA1A51F11;
	Tue, 17 Jun 2025 21:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42247C4CEEE;
	Tue, 17 Jun 2025 21:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750197594;
	bh=xHHJixx3Lxtq00FONQcRlica1C/F7ozio9W9iiXkh7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XZduI9lL6OMAMscActEx013XDU/ayDjOiiDBPbZEjoDIV6gsYdfGEIWe37onzI9Q/
	 2xP5OAubN2dqsesmxEd/kbCxIn1w2r6CStRV4E3w/IHvAlzZg/O7Sb8g/ta4/7+ynQ
	 8HR1V4DBam6pQmIRp9PF8iTU0aDqrG6GttY2MhTO9URNoNwSCWw4+Dw6s+6KqRd0Um
	 jGslPQWP3GHJtlmkVDy3hF4aLKev8S3snfPnCcmy0UGDqpVRTQn4ATp17z2pGa1Ecx
	 oUjzib5uBz2+l18YDB2pU4BBUfla+Z7Vtq3Ipvyb9vQ46pASRgfhhMwPGAwpQfLihq
	 kk4Yn85/w71/g==
Date: Tue, 17 Jun 2025 23:59:48 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: dlan@gentoo.org, troymitchell988@gmail.com, linux-i2c@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: k1: check for transfer error
Message-ID: <ivxsr6vvchk4eiih3mkwrmskquywuzit33ibt4hrxwif5k6h3z@rxx4q2jhrrli>
References: <20250616125137.1555453-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250616125137.1555453-1-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_145956_345902_CBC274A7 
X-CRM114-Status: GOOD (  15.62  )
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

Hi Alex,

On Mon, Jun 16, 2025 at 07:51:36AM -0500, Alex Elder wrote:
> If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
> complete, or if the hardware reports an error, it returns a negative
> error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).
> 
> The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
> which is the i2c_algorithm->xfer callback function.  It currently
> does not save the value returned by spacemit_i2c_xfer_msg().
> 
> The result is that transfer errors go unreported, and a caller
> has no indication anything is wrong.
> 
> When this code was out for review, the return value *was* checked
> in early versions.  But for some reason, that assignment got dropped
> between versions 5 and 6 of the series, perhaps related to reworking
> the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().
> 
> Simply assigning the value returned to "ret" fixes the problem.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
