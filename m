Return-Path: <SRS0=JdoE=7A=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C882C433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 May 2020 13:05:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A7CF20709
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 May 2020 13:05:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F2/nPKfk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqZBNW7M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A7CF20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CLOE0ueFweRS4vBpVKvC0D50ISWQH2aEyUabY4M66gc=; b=F2/nPKfkNo4gEIV3bxKwQxKzD
	a3ZmYiE4hN0bOoG3zRFVab1OL3I3nTDCGsYKHp/8dWWvEGzrPh9WVQVHymPs30Els+Gts4bVCLcYk
	BmZW/fwKoDva9KjCftEw/cOjjItE0y1mQPrrz5zX8jpjcs+4S/SnPyoQZcxDJm5/fObPxslACSWBw
	cJ9HPbMd99Qu4Xj2wxAo2dz+SpHo9C6FDR4ftVfQ6iuFU3IqMH/D/2FA7Gh/hzzkvUu7H9jsNmJJI
	NHTgqjtPRqcquhBBMI1auCUC3xx4aQKTaxdKqYwtsMpBYe3ZKrZwe4+f5m7rBeNLIuO5uaTarg7GO
	JE2ZdtiRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jafSR-0005so-M5; Mon, 18 May 2020 13:05:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jafRt-0002z0-0s; Mon, 18 May 2020 13:04:58 +0000
Received: from linux-8ccs.fritz.box (p57a239f2.dip0.t-ipconnect.de
 [87.162.57.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD592207D3;
 Mon, 18 May 2020 13:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589807091;
 bh=bQOel0Owh5Jsy7D7It/KRrP7k71oDOZIFpOrOzQ9AhA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YqZBNW7MWDqiTSCxmly8oMsUsg4WN7C2JY9aDcakJBGzWq/UP00eyjCdLpfBridZ5
 yEWjvi7dzrZTtKaXjd/2d6IuYc59csAsUVZSfRs5jq7Rr7rdKAsQZJF1Mc/s+At7dk
 CA/eN9nd7O70bEOB0H0VqgRfIrUmH9kT0XamFLi8=
Date: Mon, 18 May 2020 15:04:44 +0200
From: Jessica Yu <jeyu@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 29/29] module: move the set_fs hack for
 flush_icache_range to m68k
Message-ID: <20200518130444.GA21096@linux-8ccs.fritz.box>
References: <20200515143646.3857579-1-hch@lst.de>
 <20200515143646.3857579-30-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200515143646.3857579-30-hch@lst.de>
X-OS: Linux linux-8ccs 4.12.14-lp150.12.61-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_060453_129489_00B8F7D0 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Roman Zippel <zippel@linux-m68k.org>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

+++ Christoph Hellwig [15/05/20 16:36 +0200]:
>flush_icache_range generally operates on kernel addresses, but for some
>reason m68k needed a set_fs override.  Move that into the m68k code
>insted of keeping it in the module loader.
>
>Signed-off-by: Christoph Hellwig <hch@lst.de>
>Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>---
> arch/m68k/mm/cache.c | 4 ++++
> kernel/module.c      | 8 --------
> 2 files changed, 4 insertions(+), 8 deletions(-)

Thanks for cleaning this up. For module.c:

Acked-by: Jessica Yu <jeyu@kernel.org>


