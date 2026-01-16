Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD87D4A5E2
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 01:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3+lK1mER45gnJhhMistVrmwnMd/Jv/wqMzpM2Ke+Tsg=; b=UqYLNIOeKPCxpr
	Z/mBY/rGIBTheF4wuALm9y8QOfzPy3wRvy++koOyWZeHw0ZnoQqPBh9zVT8ojIeo43jfrMgdGvkzx
	sU1cwDjPE37FKkS/kaSS8Fnrtg5mn+WFOZuJiBjTZbjDm9cFxbnV3QCWvo6TIzXCFH/wteemyCboD
	h7Wy0bLTWFpzHUWqoFBnqK7FmxxHesAR5Ekm8OqVsEwImZAeMOD658fGH3mRIDTFFM+b3lJvSxbjR
	gS/NlH509kbGKcqY4kOnkeLfdKvrja7J4e2NXEVx2B1779iQOkUV2pKF9NSea9GXGwrTTeH3llTYU
	x3r+iPNUtzszTqMKXOrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYyx-0000000DR7h-0Aen;
	Fri, 16 Jan 2026 01:50:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYyv-0000000DR7b-3h04
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 01:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D18D460193;
	Fri, 16 Jan 2026 01:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E6BC116D0;
	Fri, 16 Jan 2026 01:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768528232;
	bh=wTJkF1ObFmb6vTCmdOsPYMsKK6ryfl9IIoIdiRKDHew=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Aof5HGd7eeeGhg0d9X58wUsnwOofyQFyqnZdvr/0ivyMJMdnv3LHyIFsrtfleUmtz
	 P8WwY0qLKaSHYY3tzqWiWiwSB3FiJdhcN8BrJ9LEVp6UgAmxU1gRShrQotEoPOfVZP
	 uc3aH2/wlzmkAHksHMtNs1OIdoczMvfxs4EQVBUwMu/xzHAXGfXTjSCMDBmxI7tkQB
	 fG+hPd5ULmNSo9eLQJ0QRkRh/2wF0faW53xbTNUMUMqfTrx6REgCpPcIHWM172Te6B
	 uuuVHvuSxIF51r9HfI3yPEsursM7aL53XSo0FC/Ob+KequEJCZ6smxzJ0CkPc/xcD9
	 N8cuum6Ls+fjQ==
Date: Thu, 15 Jan 2026 18:50:30 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
cc: Conor Dooley <conor.dooley@microchip.com>, 
    Geert Uytterhoeven <geert+renesas@glider.be>, 
    Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Paul Gazzillo <paul@pgazz.com>, 
    Necip Fazil Yildiran <fazilyildiran@gmail.com>, 
    linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linuxarm@huawei.com, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] riscv: ERRATA_STARFIVE_JH7100: Fix missing dependency
 on new CONFIG_CACHEMAINT_FOR_DMA
In-Reply-To: <20251210160047.201379-2-Jonathan.Cameron@huawei.com>
Message-ID: <7b2ce9e7-7261-690c-c5db-f4c70389bd22@kernel.org>
References: <20251210160047.201379-1-Jonathan.Cameron@huawei.com> <20251210160047.201379-2-Jonathan.Cameron@huawei.com>
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

On Wed, 10 Dec 2025, Jonathan Cameron wrote:

> The Kconfig menu entry was converted to a menuconfig to allow it to be
> hidden for !CONFIG_RISCV. The drivers under this new option were selected
> by some other Kconfig symbols and so an extra select CACHEMAINT_FOR_DMA is
> needed.
> 
> Fixes: 4d1608d0ab33 ("cache: Make top level Kconfig menu a boolean dependent on RISCV")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512100509.g6llkMMr-lkp@intel.com/
> Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks, queued for v6.19-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
