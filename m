Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52726C44501
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRdNRVHooIshsLkIv2q/B5JwgrNhoAl+jG8ENbzPx6w=; b=nXephnY3XUyQtxWL3Hq5F9JOQt
	Pc0JPKqg4Ixk7gYh5e/kEWhpNb8DKzVhxCcdiEJ0rf4mrInByqHoTb5pdZMIvRT3IX/lr2CD0GTVN
	6aSbhyCN7TtszxxcuOWRBpLURBLyETVxPPninXBOCGytstuvNx4b8vyqIHsAka9gTf0SmWQyW7cZO
	bHG1hN+J95XvujgdeoxQc1iZe/DTevZEl9fRYFQZiwNp7x14FB8nkncf64CJS3v3aq4E+AfJa7Z3z
	v41ERXMPgA2yGhAwPrN/j2x2ZJzaks/96XdCOPx35uz2bgR83YwQ2yAuGkLCqyqJi2qOhfiJAVqXa
	vvpr/erg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjLBQ-0000000ABkx-1yI4;
	Mon, 13 Jul 2026 18:15:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjLBP-0000000ABkg-0rjb
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 18:15:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E7A7D41905;
	Mon, 13 Jul 2026 18:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5771F000E9;
	Mon, 13 Jul 2026 18:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783966510;
	bh=FtIK6d8KhW9gvIH3mwN6+s7WsPS3oKZXi1x7D0y+Ro8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=AYChUWzmEkMEtgz8Fu4qda2UQL5TGk5kpKmh3rtaL5E6aLXLqkyeSbCGsae4MKJJa
	 96HjAXwgOgtTrxgb+PadHDgciKTnOok/Jq+hkdpa3p5UXMDIvEa1xAlmRBXQkhilaB
	 hfAoBRx1wfuuqsmU4S2M0j/bCJcbDXc2A3lnQ89CwsQzXaYJlo6prdmatst7e3bvSf
	 Jn25o5EDDH5j0TeRR3HthHmvuhxfm5qKVSh4p0roV+wkT5G6Kx/HldlaXUpHAaz39m
	 wf4opje9Ug6/nyQ3rcLYyJ4k+69z4SMaJYuXvy6cpNkPTR3PRjBjApGEgI4jRbYdNj
	 HxP32/JED3V0Q==
Date: Mon, 13 Jul 2026 12:15:09 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Nathan Chancellor <nathan@kernel.org>, 
    Conor Dooley <conor.dooley@microchip.com>, Wende Tan <twd2.me@gmail.com>, 
    Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 2/2] riscv: vdso: Simplify cflags remove logic
In-Reply-To: <20260701-riscv-vdso-lto-v1-2-89db0cd82077@linutronix.de>
Message-ID: <568f24a9-0190-30fa-6009-f39056390bb1@kernel.org>
References: <20260701-riscv-vdso-lto-v1-0-89db0cd82077@linutronix.de> <20260701-riscv-vdso-lto-v1-2-89db0cd82077@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-832212244-1783966510=:1536112"
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-832212244-1783966510=:1536112
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Wed, 1 Jul 2026, Thomas Weißschuh wrote:

> Listing all flags for each object file is tedious and error-prone.
> 
> Replace it with a simpler solution.
> 
> Link: https://lore.kernel.org/all/20260630135316-f26f0e0f-c08c-4d4d-9963-10f9985a7689@linutronix.de/
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Thanks, queued for v7.3.


- Paul
--8323329-832212244-1783966510=:1536112
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-832212244-1783966510=:1536112--

