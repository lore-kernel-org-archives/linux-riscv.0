Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE88CCD8C8C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 07:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cf3rcgFzMkYeOW23vr3C7I+X/rGXAck57iw9tNgWpmU=; b=AeV09WhzWKg86D
	EomSV8T0A0+KvBwGyQ9ofvuCkXVq69Jka5GHHRmREL9PbsBDJY9ooacHWsBuNqSFRvp9rz7kXG3pJ
	IwiyZQ/k3ueQyaxWyDf1Q5h7JSugRqxQm+vlOQ2GgPFAREqVqshp/RhNETrhwOg+NIlI7Tul8yDZ3
	4cjbkBnP8lzExMbLJGT2Eo2vZdYLh8AGBIlpYGpeNvxD/D4ogqRzv6OcXupmKrGGbHKv33swWXACo
	LXuJCgYMoWHtL2PIGOkc/zy4lj1ec9YJIZvgZxn18ZP/vc4s9ZgV/23KV/vMhbeBfflfGoeAQvlAs
	qlgttRQ7LX7dgA0PXsSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW7U8-00000002586-1tXJ;
	Sun, 07 Jun 2026 06:59:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW7U7-0000000257y-1qzL
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 06:59:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A22A60008;
	Sun,  7 Jun 2026 06:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC831F00893;
	Sun,  7 Jun 2026 06:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780815590;
	bh=kPU1bNy/4Q4HxkbeU6Yk2EwGc2AfSDBCEGpK3v68MsA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=UXVVKMWpbyYpxZaqvMx8s8a+zAQ0MGhTNM/WT8LrMYu4WRGif5Ib3yEUgxrbDPwFm
	 XVzCvsoz3zNKujsbg8YZ2AvQ5ScZkJsLX3mD7Y7ePLezR2VWT3eM4vJ8LA75iS2LpP
	 5Z6+P51w/k33oojPoh8b/6CvR/9dUW1qLnh9BA2MR76b9sM4G7tRVT/qnGwUoXGpD3
	 gEZdYf/BhT03ro6cQvCaoFcEIkGfIEk5TkKB2fz26ycuGCHTvkQ3sessVuY2bXQiXg
	 b/srVJrL4VBwIur/ZRxAOUQiyvjJTNCQPZgXm/1hR7nU58gMNiCCmexoLEuPojuzSb
	 NCVB4T5xCFe2w==
Date: Sun, 7 Jun 2026 00:57:46 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
    Thomas Gleixner <tglx@kernel.org>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: panic if IRQ handler stacks cannot be
 allocated
In-Reply-To: <20260404185522.21767-1-osama.abdelkader@gmail.com>
Message-ID: <773527c2-760d-60c6-23c3-0f1f60cc3fea@kernel.org>
References: <20260404185522.21767-1-osama.abdelkader@gmail.com>
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

On Sat, 4 Apr 2026, Osama Abdelkader wrote:

> init_irq_stacks() and init_irq_scs() may fail when arch_alloc_vmap_stack
> or scs_alloc return NULL, call panic() in this case.
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>

Thanks, queued for v7.2.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
