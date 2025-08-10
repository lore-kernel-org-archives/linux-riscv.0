Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CF4C87FCB
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Aug 2025 01:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9XTzRM97AdvtHX5aYWmtZbbncufhK/hAk1p4PVEEZE=; b=fAjIPZl+S15QW+
	/RpxLz9h+0668/EtVjUc6N1ZFCfs3CijIleVaTNxAj7WoDXSB1R3IF+4IVpRpKAf3asajCFUO1R53
	VYt3XvfBIVBJTcsXeliReljJrKcFnm6g66CC0mFhV40fDdLIVcJ0vZID9Fe43NO09vs+4ouV0pQiS
	VQJl4QmNyJHXRah2hMs6FP7PJoxs2/69CpirRUiLa+ycQ9gK8kv4RGDewbOp5ZdL49aYfXbQPSIeZ
	KdBmGlOIWvSFoZZRD8E8Ov0mwE/k1sdWP4/j1zgnuS5VlV2OccmSqODEVk7ThaGCJipi8lamQF+ND
	gI3rCVPjIsJe4lcDfx1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukutA-0000000578A-2D17;
	Sun, 10 Aug 2025 01:30:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uktro-0000000558W-0p6a
	for linux-riscv@lists.infradead.org;
	Sun, 10 Aug 2025 00:24:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 017EE600AC;
	Sun, 10 Aug 2025 00:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC53FC4CEE7;
	Sun, 10 Aug 2025 00:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754785489;
	bh=+MYyrWF1r3HnrTCnEF6LLafDGHfYpJXCAD2vrMbxPI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nr/I2LrCiwDb7fyWlOHGguMAQznvJg6Z+RWIAdSuzijsI27B9WJAcgByQ16XpJoBv
	 0vxJAVAqyB4nwj0i/po6ICSYOgi0YdToj6v07Gio7CytCd3ddueTxcaZB4nYhGBoDs
	 mbg3nTtKZd0SYxTid/RItEMokgxH4m1Eg4dtt/8hp7J8owXZB6Qy5hmQnL6lOphk0P
	 uNVXffdM09RPT+ks9tFPVS3vgfM5O0Sqe9pjMfHRwaDlnxVjsUJ5qJ2QU+hIRRv0YT
	 Di8HofxzUY3ZVyJGUuRatJrxh4F95PQ++zM3K3xmfW26NrykOCXcPgyZ0hl3ki+v+f
	 kcsN52c1BgF1Q==
Date: Sat, 9 Aug 2025 17:24:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: Only allow LTO with CMODEL_MEDANY
Message-ID: <20250810002445.GB1726533@ax162>
References: <20250710-riscv-restrict-lto-to-medany-v1-1-b1dac9871ecf@kernel.org>
 <20250808215303.GA3695089@ax162>
 <b0fdcb23-4d68-4d0f-a8ac-2b389a0ce856@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0fdcb23-4d68-4d0f-a8ac-2b389a0ce856@ghiti.fr>
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

On Sat, Aug 09, 2025 at 12:45:59PM +0200, Alexandre Ghiti wrote:
> Hi Nathan,
> 
> On 8/8/25 23:53, Nathan Chancellor wrote:
> > Ping? This is still getting hit.
> 
> 
> This is the second time your patches do not reach the linux-riscv mailing
> list [1] [2], not even my personal mailbox.
> 
> [1] https://lore.kernel.org/linux-riscv/?q=riscv%3A+Only+allow+LTO+with+CMODEL_MEDANY
> 
> [2] https://lore.kernel.org/linux-riscv/?q=riscv%3A+uaccess%3A+Fix+-Wuninitialized+and+-Wshadow+in+__put_user_nocheck
> 
> I don't know what's going on, do you have any idea?

Huh, not sure :/ I only use my kernel.org address and nothing about my
configuration or usage has changed plus it seems to have made it to
every other mailing list I sent it to?

https://lore.kernel.org/lkml/20250710-riscv-restrict-lto-to-medany-v1-1-b1dac9871ecf@kernel.org/
https://lore.kernel.org/llvm/20250710-riscv-restrict-lto-to-medany-v1-1-b1dac9871ecf@kernel.org/
https://lore.kernel.org/stable/20250710-riscv-restrict-lto-to-medany-v1-1-b1dac9871ecf@kernel.org/

Next time I have to send a RISC-V patch, I'll look at the archives to
see if it made it there and follow up if not.

> I'll pick this up in my fixes branch.

Great, thanks a lot!

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
