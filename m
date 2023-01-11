Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B28EC5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 14:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XZouIEPS2AcPGHYHsmVFXzTLmv+N1ZdQ3YFVUV/nx1Y=; b=WqHSZOwX8lm+bd
	9BSOi1jPt9oBhe8oiaxbhpsWM2ZUkkvY2d/uxypTGuyyMcAJgaZYRtGEvQCLWu+njgwIXMPWpXInK
	dEruEVrC+hJP4nCNHTPyMCJ4fLOs18/c9r/x1YCyqlBoN+ZL6CuJuoa4vH8THJ3Ivoa9aShRfNb1K
	umK/1fU2a9bw2AaL70OPUn4bMq9DB78XUwUX8rkfccNxACZTpyFIDk7ah/kXxQIAXdYlDomrNqOuC
	ldmhIxkQaA6x5MKlzIL3oQejGkV0qdNX8O4MrdQUXGJkZ7HZxOZ2OIxHLp5RWsmRg4DOClR35gu/M
	eIRuwn9WPgrtDoc1LHtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFcVM-00Bst5-LK; Wed, 11 Jan 2023 14:55:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFcVJ-00Bsqy-Nq
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 14:55:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D6386B81C0B;
	Wed, 11 Jan 2023 14:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21784C433D2;
	Wed, 11 Jan 2023 14:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673448898;
	bh=WKcf7Q8THb2pOBnk3aTIM0xJac16gQSegBo2cpJcCms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hr4rx7M8h+YT3tkOYxaalgdPZ6ub1ilupFsRcRBamyUbqsFxB281ZqrY74Nad8QSM
	 srSYoAisAtprIMmLgQi4BJGJCRX2rxNUm7/h2fHq7q2nH6L8OeZMOQM5DcmJWBmZNr
	 uK/pCLcALh+YuB2y0hiPT6DnFQCtvVuXhYNwXwxGt558RKKIId4QyrcIIlt4nDYKOd
	 gc2hWBK9oN93LZnIoa+QLq1eqgfjioQEEzcYK2CE+kMJ1jNYD4hpC1QtzGkFi8C+TZ
	 pXts5ZtJemzYZ5ZsUKhJqO0j+rNDflpXDmPok4dSo02a/gdfoLJ+hLIpDEfxW5180C
	 FJuVgSPSFO5nQ==
Date: Wed, 11 Jan 2023 22:44:38 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 3/5] RISC-V: fix jal addresses in patched alternatives
Message-ID: <Y77LVtFE5o/Ji19m@xhacker>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-4-heiko@sntech.de>
 <Y763FrvFkrNGkIDN@xhacker>
 <20230111141519.rv674omn3jllhzhe@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230111141519.rv674omn3jllhzhe@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_065501_978156_A985BDEA 
X-CRM114-Status: GOOD (  16.12  )
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

On Wed, Jan 11, 2023 at 03:15:19PM +0100, Andrew Jones wrote:
> On Wed, Jan 11, 2023 at 09:18:14PM +0800, Jisheng Zhang wrote:
> > On Mon, Jan 09, 2023 at 07:17:53PM +0100, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > 
> > > Alternatives live in a different section, so addresses used by jal
> > > instructions will point to wrong locations after the patch got applied.
> > > 
> > > Similar to arm64, adjust the location to consider that offset.
> > 
> > I already submitted this in a month ago.
> > https://lore.kernel.org/linux-riscv/20221204174632.3677-2-jszhang@kernel.org/
> >
> 
> Hi Jisheng,
> 
> It'd be great to see a v3 of your series on the list, since I'd like to
> base zicboz work on it.

Hi Andrew,

Sorry for being late. I'm cooking the patches, will send out today.

Best Regards

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
