Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F080CCAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 10:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIzhuDFMh2QIsQbgERHA3eANRrX77MfV6vpaM0HZ3Bg=; b=OCa1LKhLcjD8Rh
	dpJg4+/B2yP1YDL5FdctYscHW7D3d9ffOJWBXCewm9hZk76YNb3iWJ+mg/GNucygmG0bvEBVm/pFv
	fecFOlPQSwAKPmyo/t7VwEMr3c6asjvpgwJYLw3PN8vJqldsneGskM4rYMZUJMlpAC0M0wetppKFk
	p9/M7NFlm3smIy7kRGXTrCCXcmG7p5phI6q6If+oQLsbrUj29CJR8FCN4lSXrJviPwFLgsWQICwkt
	gngL6dfOOGcRMY2DsgHna5YgBoT8ED6ijI+3wkOA5tTnHJoPhcs5OB5FlVVXdDEaI9NwB+JUHPtPM
	pObu7g7iTPNVgE0fIcuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6RHc-00000003ct5-4B56;
	Wed, 08 Oct 2025 10:20:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6RHa-00000003csk-1q58
	for linux-riscv@lists.infradead.org;
	Wed, 08 Oct 2025 10:20:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B8F64380A;
	Wed,  8 Oct 2025 10:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C3FC4CEFF;
	Wed,  8 Oct 2025 10:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759918829;
	bh=3kn/Um2ENzowfrEYzak/NVYIYTDSIVj6NG/MWnQy38U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H1rftDEcgUF8m7aygkU8vIwno0Y/fpUPdoR01ezAOOpsWY3E3N25NhlRwWtddKFzb
	 RBPMQqY9tm3eminboS1AIpQ4wUfR8spgb+zOd6UJNUtEdq0Sbq1ejcenowXYph1F6Y
	 uw/A3q1F3sC2DRvmSMf/lOZrXInr0MULTz78pqSQ=
Date: Wed, 8 Oct 2025 12:20:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: Re: [PATCH 6.6.y 0/2] riscv: mm: Backport of mmap hint address fixes
Message-ID: <2025100812-raven-goes-4fd8@gregkh>
References: <20251008-riscv-mmap-addr-space-6-6-v1-0-9f47574a520f@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251008-riscv-mmap-addr-space-6-6-v1-0-9f47574a520f@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_032030_521570_351C75B8 
X-CRM114-Status: UNSURE (   6.26  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Inochi Amaoto <inochiama@gmail.com>, Han Gao <rabenda.cn@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 08, 2025 at 03:50:15PM +0800, Vivian Wang wrote:
> Backport of the two riscv mmap patches from master. In effect, these two
> patches removes arch_get_mmap_{base,end} for riscv.

Why is this needed?  What bug does this fix?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
