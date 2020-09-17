Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB5F3C433E2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 15:25:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 400BF206BE
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 15:25:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UTxX7A1D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wBhVIgTg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 400BF206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FDgFEzfgXx5UVACbDay+ETWQFYumecma20TCbTcIS4I=; b=UTxX7A1D7JrmKAfWEjtAGXkuD
	eiyQE62DGBDh8O5Uh+9f0wXNw9eZVA6lcNKCylI47q/c1WcCwW93J55nDoJ1XawPtq9H4PCARxV/I
	ZqCSBLC7ekl5fD39yTONTrOsRT9U/0qFMUrGUz1xFGuvt2DNH8bEltYdXdiYRbDu5JyRMziCFTRk2
	VhWZvc2k8uaG8PKxDqETpa5p71JfRnkktKhU4huEbbHol5MArsISa34iz6JuEki9e1FIdu4+0Zgr0
	0esBe6bfcqcV4w4m+Fg9k61v7pvqrqAObKZh/IJ7fDbAzyW/oH39fgSk6qnhSKwkvyTfhWBrP6dQU
	CnN0uB4Pg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIvmn-0004b2-Fv; Thu, 17 Sep 2020 15:25:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIvmm-0004al-FE
 for linux-riscv@merlin.infradead.org; Thu, 17 Sep 2020 15:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0E1nBfTCTThpxoXia4dttriCoGxK8LXuWWVjqYQOOus=; b=wBhVIgTg/IPNFaqOfy71TTH/wK
 jOiMEWMkCZyyEB4flL/P/uVlfcV2/SmaJagZtVHFn/0qsQkL5sX1ov1UQKb3m774i6ACb/yYqt8oX
 +UHYrVIChiGqVfdXP3UAoPkiMS2Qgf7Jd+hDXSSqdbepEk3LT5PAIz0r+yiawj7QZ0DNjNbYmGv3y
 qSkyjnHyd79/21ict28OSCcJ6hSFabDFG80IhzEhE1GnfPiTqs6D7+5hE6c9NEFbuhtrR6+I682PM
 dMD14z/lhfo4YbJqE3/KM5SKXiP6xTvOhypfnfHGoBH7VxyQvBjlU4AvjuyA5FqPtC5FvqfMKHXBP
 bdd7sCxw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kIvmg-0002V9-VH; Thu, 17 Sep 2020 15:25:19 +0000
Date: Thu, 17 Sep 2020 16:25:18 +0100
From: Christoph Hellwig <hch@infradead.org>
To: liush <liush@allwinnertech.com>
Subject: Re: [PATCH] riscv: fix pfn_to_virt err in do_page_fault().
Message-ID: <20200917152518.GA8930@infradead.org>
References: <1600327549-3995-1-git-send-email-liush@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600327549-3995-1-git-send-email-liush@allwinnertech.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, peterx@redhat.com,
 daniel.m.jordan@oracle.com, palmer@dabbelt.com, rppt@kernel.org,
 paul.walmsley@sifive.com, akpm@linux-foundation.org, walken@google.com,
 linux-riscv@lists.infradead.org, vbabka@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2020 at 03:25:49PM +0800, liush wrote:
> The argument to pfn_to_virt() should be pfn not the value of CSR_SATP.
> 
> Signed-off-by: liush <liush@allwinnertech.com>
> ---
>  arch/riscv/mm/fault.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 716d64e..9b4e088 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -212,7 +212,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>  		 * of a task switch.
>  		 */
>  		index = pgd_index(addr);
> -		pgd = (pgd_t *)pfn_to_virt(csr_read(CSR_SATP)) + index;
> +		pgd = (pgd_t *)pfn_to_virt(csr_read(CSR_SATP) & SATP_PPN) + index;

This adds a crazy long line.  One nice way to clean this up would be to
add a local pfn variable, as it would also make the code more readable.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
