Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4428CC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 09:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rR4WYqoH/K9GVtN6Pz395YNHfWy8jzmaAg09AqdvtCc=; b=mYmc6lg79+dmyF
	kK+j2Vhoi39T3DEWm13NtMxo5ZD3xLJJAvFOG/DnUX6qFbCPv8jVz1EKOPQgr9QwYQgBlz0Z/YdG3
	otwVeLPPYJ3Q0Y2vCdgG0AAF2TLzbr80J2hDEiaRGq4c2TduqSqtemKIjJhNywkvYxq+l4yjZILWs
	TISmYxHyeTKteXSWUkzzFCr4MpV9Rx7/5ngSBNMbZeamsJxY/TBuK4efCH5YecM9kPin54aRdBNkR
	JW03Bls0zE8xhU7QUTDEfawnR+rPlStfcvMBQc6oYTJTNgpZxczC/BcH4xoJ9ghFtL2mDzx+EjdLG
	sW92c99IBdOXMuSoIHWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZrUs-001a19-IV; Thu, 31 Mar 2022 09:53:42 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZrUq-001a0X-5O
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 09:53:41 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4390E68B05; Thu, 31 Mar 2022 11:53:37 +0200 (CEST)
Date: Thu, 31 Mar 2022 11:53:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org,
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org,
 hch@lst.de, arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com,
 behrensj@mit.edu, xinhaoqu@huawei.com, mick@ics.forth.gr,
 allen.baum@esperantotech.com, jscheid@ventanamicro.com,
 rtrauben@gmail.com, samuel@sholland.org, cmuellner@linux.com,
 philipp.tomsich@vrull.eu
Subject: Re: [PATCH v8 02/14] riscv: integrate alternatives better into the
 main architecture
Message-ID: <20220331095336.GB23422@lst.de>
References: <20220324000710.575331-1-heiko@sntech.de>
 <20220324000710.575331-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220324000710.575331-3-heiko@sntech.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_025340_379513_D5B161FF 
X-CRM114-Status: GOOD (  14.11  )
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

On Thu, Mar 24, 2022 at 01:06:58AM +0100, Heiko Stuebner wrote:
> Right now the alternatives need to be explicitly enabled and
> erratas are limited to SiFive ones.
> 
> Over time with more SoCs and additional RiscV extensions, many more
> erratas or other patch-worthy features will emerge, so it doesn't
> really make sense to have the core alternatives able to get
> deactivated.
> 
> So make it part of the core RiscV kernel and drop the main
> RISCV_ERRATA_ALTERNATIVES config symbol.
> 
> This mimics how other architectures like for example arm64 handle
> their alternatives implementation.

For minimal kernels like the k210 it would be really good to be
able to avoid any not strictly neeed code.  So I'd much rather
have the alternatives mechanism only built when it actually is needed,
not (semi-)unconditional.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
