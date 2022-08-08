Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60634C00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 14:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sW3eCEQKpCxqD/+5nFFHNwK3iFNvnGc1UoGd2gzCBvs=; b=zcn9lr0VRFt/II
	cWaUKhwVWqzC5LsPrSAa0SCgK9pZy1gh5UjQ+UmiA6vLYe5g5dUUMW1Q1X44v5HYG61qBOu6hmbvp
	+fFtVIIV5A8TaKen+pHtEaAcRJ3hLPS451PvdYaG9+4+Yn2eauaEBNqpTHAoEYwOLwJPzB3e17USF
	aCIDnAUtz/fPF5kGtiHOLESZXSltu74nbntsnBtL7mCvXgM1sMZ50g5pjDrpEYzED/NpE6qf2yhcA
	kOdzaHJacrm+eOMSXoqRFE/hi5z1UaWLFO2PdjIKxnk13zemeINYl1qPQ6cc3lZe51ce2wNiwX4uz
	8yDkTVD4vqs/AqQgGkwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL3rY-00ERhZ-WD; Mon, 08 Aug 2022 14:36:13 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL3rW-00ERfq-20
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 14:36:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5B1F8B80EB7;
	Mon,  8 Aug 2022 14:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67211C433C1;
	Mon,  8 Aug 2022 14:36:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ATFrCsLj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1659969364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KwXotlNfJolIheziW9hCV8MLTEPJKC869xycZMSy26A=;
	b=ATFrCsLjeIxwzBVATi/e9pHZkWoB1Tg6nZsY9YIwf5/QVM8JyKPrtS8vUmFY1Vt5fFfpp3
	2UNjkRkYAIFzi9IA7nLtOD8lwybXpEbR33TJU8R55xd+zpCcQbxbmcvsmD++1hhjK3ZGWS
	31XqT27Di8ZEJrUVQMyta7QscX49DO0=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6aa68a4a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 8 Aug 2022 14:36:03 +0000 (UTC)
Date: Mon, 8 Aug 2022 16:36:00 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V Patches for the 5.20 Merge Window, Part 1
Message-ID: <YvEfUKp5MWt+nS3+@zx2c4.com>
References: <mhng-1cbba637-6dd2-456a-859b-9d3f8be6bab7@palmer-mbp2014>
 <YvEeQrzuPIKiEh8m@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YvEeQrzuPIKiEh8m@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_073610_266572_2F2ACE2F 
X-CRM114-Status: GOOD (  13.32  )
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

Hi Palmer,

On Mon, Aug 08, 2022 at 04:31:30PM +0200, Jason A. Donenfeld wrote:
> Hi Palmer,
> 
> On Fri, Aug 05, 2022 at 04:36:38PM -0700, Palmer Dabbelt wrote:
> > The following changes since commit 924cbb8cbe3460ea192e6243017ceb0ceb255b1b:
> > 
> >   riscv: Improve description for RISCV_ISA_SVPBMT Kconfig symbol (2022-06-16 15:47:39 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.20-mw0
> 
> Just FYI, the WireGuard test suite over on build.wireguard.com no longer
> boots for riscv32 after this merge. Investigating...

Ahh, looks like it's caused by 44c1e84a38a0 ("RISC-V: Add
CONFIG_{NON,}PORTABLE"). I pushed a patch for it to
https://git.zx2c4.com/wireguard-linux/commit/?id=99a1a96f1f80b68b0fb5156ff6bd3f0973cd1f4d
to kick the CI, which should be green again shortly.

If you want, feel free to take that into your risc-v pull part 2,
whenever you make that. Otherwise I'll eventually send it the long way
through net.git.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
