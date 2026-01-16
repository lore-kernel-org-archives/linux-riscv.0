Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB565D4A5E2
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 01:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LvAk0+qYnZV8/j9XJLNIEb3URn6ppBW3TIhl/1oI/MM=; b=V/NlkJq0vnqzfa
	YVg1p0tMWAHZym1KwhiT/5E7ZcO04WI2JPechaMPa49Evs20/28/dcKzyvZQdwwa0gnWqOVdLfkKk
	tscsp2A622Td37Vn2wPkNmjqxVJRv5h1YkC2Ci7rVfgrupP4uqjzTe9/TDjrFwOT2M85HQQxiHRNW
	d/c1ZXifKiyk3AB3AT4XyYxv/2MaaCYZsTf36tAgEbWbvdFEzv43cyvV4P+J1sVMeHIRCH2Fexn3/
	sjQ5gDTjAeTG3ZOjvJ877sjXC8WUVBvhM1P9vEb+0k7xpopOttSDOdX9Ft+V860wgiegvhL0lsvxt
	VrULMHa3sAY1HKwo0nWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYz8-0000000DR8U-1PSU;
	Fri, 16 Jan 2026 01:50:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYz7-0000000DR8J-1Uwe
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 01:50:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EF22601AF;
	Fri, 16 Jan 2026 01:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6D1C116D0;
	Fri, 16 Jan 2026 01:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768528244;
	bh=dDnw5mOhk7/iI/4fF28OGLUQnKTw2aqseKu2VwtAmf4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tejgTdChU+gn6ddXoU+/haWRLI/yeA4IEJyMrjXzqE16xCSrOr1bzYpn8gd1AJQ9z
	 0wEUKU9WpzRHzj36LRI5Wvmo9q1pw882B9iNwa5/rSjTefZheDivVBFDiFzhsCdcUX
	 dfwVDJwJI0cnwY2/i2gySVgr0kLlS6ITNPGNbH+6H/E+x1DOjJVTBsQrkyiX6ei7GM
	 fGSyciDd/Qbj++eXS4paEjA2NxrXDTcLkND4MPIuhwup1+CIVyl+cxOf2jVAVAy/xg
	 jnuB1epdRDcpSgQSnn/6KhG1iXtV9bq1nCDqOjajvJNE5pEzjuHpP+m5T12GSk40zD
	 JG8WRAnkXMU6Q==
Date: Thu, 15 Jan 2026 18:50:42 -0700 (MST)
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
Subject: Re: [PATCH 2/2] soc: renesas: Fix missing dependency on new
 CONFIG_CACHEMAINT_FOR_DMA
In-Reply-To: <20251210160047.201379-3-Jonathan.Cameron@huawei.com>
Message-ID: <a5df4517-40af-2406-8a18-cd8da18aafdd@kernel.org>
References: <20251210160047.201379-1-Jonathan.Cameron@huawei.com> <20251210160047.201379-3-Jonathan.Cameron@huawei.com>
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
> Closes: https://lore.kernel.org/oe-kbuild-all/202512100411.WxJU2No9-lkp@intel.com/
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thanks, queued for v6.19-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
