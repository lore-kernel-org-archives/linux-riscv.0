Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80528C00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 14:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B5zmSsW6B0F/ocrY/zXwA8Wl53G1bmXYKi7RfxCL5ZU=; b=d2qRH7Qjmg9yJ1
	kuUTK/8j2vrGvqhQ1IXWZyenfXj412w1O2SnlNWL8JhX3L3NH2/P5bCA5S4Lq+9dH0D9TeJhF0QbJ
	niJRGCzIkU9C7IMj6qtpQP09XyP6lRVVe/KHAA8tCtTq82UZaL2+Y570qFRktgD5fvs1f/QSdKiFL
	9a1TJ11dyN4RK9XAYmx/F9J68q6j2yXh3IEw8HMCRmvokknUkR3zB5BHJyVwo+cOWESI3KjDH6U/n
	0/lnGpaq5oV8zeThMQZIGv1LslL8NKnM5//aPoSFVrklHXxMlKpvAzF/572BqIqR/NobB0TA+1aUV
	5D9kilpugkqEF2D3i+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL3nD-00EPJw-Qk; Mon, 08 Aug 2022 14:31:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL3nA-00EPH3-Hg
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 14:31:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 86D3160C92;
	Mon,  8 Aug 2022 14:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61530C433C1;
	Mon,  8 Aug 2022 14:31:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="VcD2K99q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1659969095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ef7IfqRG3PSUpglontqBYdjluCQQmLxuCBr8SM/TE4A=;
	b=VcD2K99qyCFmSRRQeFFMcLJum44QPCF1zVXXjoefTdKnLxZZ+ZQdG8kl9Yyz8h+AoTgc65
	KkRPlHMt83g/ETmtlIcbSUlePKz4Hy0bg+xXu6gURwd7sHVndjaoTyHGCYVkoI51hTjqsg
	8h/U0TurjRlKeVUBMvLmrwWSoUEwQsM=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 83fae7db (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 8 Aug 2022 14:31:34 +0000 (UTC)
Date: Mon, 8 Aug 2022 16:31:30 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V Patches for the 5.20 Merge Window, Part 1
Message-ID: <YvEeQrzuPIKiEh8m@zx2c4.com>
References: <mhng-1cbba637-6dd2-456a-859b-9d3f8be6bab7@palmer-mbp2014>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-1cbba637-6dd2-456a-859b-9d3f8be6bab7@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_073140_898579_347477C5 
X-CRM114-Status: UNSURE (   9.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

On Fri, Aug 05, 2022 at 04:36:38PM -0700, Palmer Dabbelt wrote:
> The following changes since commit 924cbb8cbe3460ea192e6243017ceb0ceb255b1b:
> 
>   riscv: Improve description for RISCV_ISA_SVPBMT Kconfig symbol (2022-06-16 15:47:39 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.20-mw0

Just FYI, the WireGuard test suite over on build.wireguard.com no longer
boots for riscv32 after this merge. Investigating...

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
