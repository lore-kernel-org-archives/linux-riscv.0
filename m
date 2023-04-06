Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16055C77B6E
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 05:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vi3ag6PKQAM+/BodBLI2/vhK0d341XKALAAgwyVFYO0=; b=vjLjSg7PTU1tl9
	Fb/d5GWDXMHm3U8Dg1bGpMIIIsaB9A722k2fYQ9sQyyeOb3CZ30ZxFowjKuPtosTiZ3n/P8m+KPoZ
	deOEPQbr7/1KSBv4B/W4lY1qP3RoWSf/8xCqLlG2YhnxZl27YiSbLPhB4F4lmhglMj7clMf4yb4Yc
	UxMyGeADv5tHovD2ImXVGg0LQQAvOqzPB49cFF8N3N9XdLFvCygrYgnvbKEOHmWUKeXkgceGyuRgi
	dL9EcZGaG29AWRBKaqk6n2oMwkfO3+T62DTgyTutdbsVTexrrw65HjueiZf+GyC+CPql/0Mi1XhiA
	VFOVbU7/TsIbPjamxZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIFT-006NgD-2Q;
	Thu, 06 Apr 2023 05:33:27 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIFR-006Nfx-2M;
	Thu, 06 Apr 2023 05:33:25 +0000
Date: Wed, 5 Apr 2023 22:33:25 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mathis Salmen <mathis.salmen@matsal.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com
Subject: Re: [PATCH] riscv: add icache flush for nommu sigreturn trampoline
Message-ID: <ZC5ZpVlN9Ypgy/sC@infradead.org>
References: <20230406001104.3361877-1-mathis.salmen@matsal.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230406001104.3361877-1-mathis.salmen@matsal.de>
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

On Thu, Apr 06, 2023 at 02:11:04AM +0200, Mathis Salmen wrote:
> +	/* Make sure the two instructions are pushed to icache. */
> +	flush_icache_range((uintptr_t)&frame->sigreturn_code,
> +			(uintptr_t)&frame->sigreturn_code + sizeof(frame->sigreturn_code));
>  	regs->ra = (unsigned long)&frame->sigreturn_code;

Please add a local variable for the in-casted value of
&frame->sigreturn_code to actually make this readable.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
