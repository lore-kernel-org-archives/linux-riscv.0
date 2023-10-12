Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B12BCDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=05kdRoPulh1odkT3bivftzb03kdfJd2mUAb6wl03Fb8=; b=uBWrUn+NCkXAVg
	ZQ/qBUsAPzxyLOC5E9V6Zf5tkOIKzskCV5/4roJrBHzQHZquIbAHAFf0RQwuCYqkvP2+TxhSjw0pG
	iQ3lAfa6DEGLciU0gIdHpOfaysdMZyM3NMEaIb8woWrWSkpTUhhtLRK5LAmCRFQOsBW1WQOSlmAWg
	qxomT2rIE/8y0ykYF1Pw6kNa8sN3QoEWqS+X3HS1KxuyBH+tMupzyNeM9ZZoj400Seqy9beVMFx7Q
	NF3kmalgbzY5TjxqBy1nWkYxe2Pz2yAl3D/Cw3WU/wUqeijfOWBC5XFLctGz/iDY1jW2s8fpP+dMP
	gnWfg2qZV0HzwS6HN52A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqx3j-001DxG-1U;
	Thu, 12 Oct 2023 14:53:07 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqx3c-001Dw4-1V
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 14:53:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 57748CE2913;
	Thu, 12 Oct 2023 14:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC7CC433C7;
	Thu, 12 Oct 2023 14:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697122375;
	bh=IYDm8ofYKOZAFbxQa32MHYpNBNA79HhiV1G9gyxN4IQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JVnBLfyrM0aoLkeHm29EX0fPCHIKaXsix+jYVpXjcHwoD7xcD0ZAM4ePIeH3yU/nD
	 7yTfYPhRsbMS1Z3U2ReHBjOxva0twYJOmkJ/Tl6SjS3UbEmLX0VZznvXCE1E7FYoce
	 L5F/CHl8HjKMXjx0V/xYH23HX3iR6Xg4RN928MsGT6hzzWnszfyJ1Qqv4RdtP8/A6Z
	 r4KKIp/Ouw7+MS75BHr8TGm6NhdiW96up4OgOQhbZ84qzAsGjaLLs4VJZQQ4TU6EEW
	 B+4CVRtgTCiBDpgvzM7Abf8cjcNXUQRF+0x+NkdYmUAa+IrcfkiBPg7GahJs80WXmp
	 hTjR0Ulm1rJ1A==
Date: Thu, 12 Oct 2023 22:40:46 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] riscv: errata: thead: use riscv_nonstd_cache_ops
 for CMO
Message-ID: <ZSgFbuD203L0XL4J@xhacker>
References: <20231012141456.4078-1-jszhang@kernel.org>
 <ZSgA1BtMv/YDHzQX@xhacker>
 <20231012-remindful-coke-f9cfe950425f@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012-remindful-coke-f9cfe950425f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_075301_008695_AA36DEB5 
X-CRM114-Status: GOOD (  23.58  )
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

On Thu, Oct 12, 2023 at 03:36:28PM +0100, Conor Dooley wrote:
> On Thu, Oct 12, 2023 at 10:21:08PM +0800, Jisheng Zhang wrote:
> > On Thu, Oct 12, 2023 at 10:14:54PM +0800, Jisheng Zhang wrote:
> > > Previously, we use alternative mechanism to dynamically patch
> > > the CMO operations for THEAD C906/C910 during boot for performance
> > > reason. But as pointed out by Arnd, "there is already a significant
> > > cost in accessing the invalidated cache lines afterwards, which is
> > > likely going to be much higher than the cost of an indirect branch".
> > > And indeed, there's no performance difference with GMAC and EMMC per
> > > my test on Sipeed Lichee Pi 4A board.
> > > 
> > > Use riscv_nonstd_cache_ops for THEAD C906/C910 CMO to simplify
> > > the alternative code, and to acchieve Arnd's goal -- "I think
> > > moving the THEAD ops at the same level as all nonstandard operations
> > > makes sense, but I'd still leave CMO as an explicit fast path that
> > > avoids the indirect branch. This seems like the right thing to do both
> > > for readability and for platforms on which the indirect branch has a
> > > noticeable overhead."
> > > 
> > > To make bisect easy, I use two patches here: patch1 does the conversion
> > > which just mimics current CMO behavior via. riscv_nonstd_cache_ops, I
> > > assume no functionalities changes. patch2 uses T-HEAD PA based CMO
> > > instructions so that we don't need to covert PA to VA.
> > > 
> > > Hi Guo,
> > > 
> > > I didn't use wback_inv for wback as you suggested during v1 reviewing,
> > > this can be left as future optimizations.
> > > 
> > > Thanks
> > > 
> > > since v2:
> > >   - collect Reviewed-by tag
> > 
> > Oh, I missed the tag collection, but I know maintainers are using b4 which can
> > collect and apply tags automatically ;). let me know if want a new
> > version.
> 
> It doesn't collect tags (AFAIU) from earlier revisions though.

oops I didn't know this before, just sent out v4 with real tag collection to
make the merging progress smooth.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
