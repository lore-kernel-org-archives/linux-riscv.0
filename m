Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C984DC4321E
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 17:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmpnLRw13KW39YlIKATeX+FHje+pDUsrR6qTyFXZy08=; b=xXPKlOXPzFCJy1
	2JBsd6c+dgGYjCOCKX06MmZUwXH3C8OB4txXGcmwMNagltmI7qeguKMHmdONDhF5JMe68BF/hsltr
	aSUGcM4JTj3ZhZu4KLO2xUteL46nyKlsMWaSWMBWxOqyA1uJdTlO6uJ/rW/ADU77eXXLlUBNfL5QE
	QOXJulUYcb0fxtXFc4QWE8voJlMksL4wjnimOmmoQHyjnFBXV3kB5jiZN2WDO4E1i4DLCKPqGkUAs
	SaYQUpUmRVwTHvasJymT/PUD30jiQU76WAn1WsN7xH4t/3t/jctw3JsUNkC8RC8Z9nP+bwyP9yIAm
	3aKQgbmk2caki/MCmSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyykN-007PUI-Td; Sat, 26 Nov 2022 17:13:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyykL-007PTh-St
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 17:13:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E66660AAD;
	Sat, 26 Nov 2022 17:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E14C433D6;
	Sat, 26 Nov 2022 17:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669482824;
	bh=VUdmLOhNDEISHc4O0GbxdMl5EABmGhp3Ow8j8iIP7hQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JRydicXB/eqBBRf0xFweADTV6roFlOgFCeOKeXP1Ayy7ZFdeamcv9Q3hJSaLNdaOD
	 9NcgVeW5298NZ+XL619ywok6I4KcH9M4QDVHTZMTeXIRPu7WJve5kCdtZ8/3LlAFyz
	 O8qWUIFHbaXll73iPr2XfCxUL0MLrxt0qmOahxT0kQSmWEe91ebgKNSHUaJY6zr7ku
	 oEJGdoICsWKuVAhoUjXuGqIBeNV22mbYAqrvklbmM686OfqlZyAvKlkC3SaJxX9rk8
	 Zr7jb46Ih+EPftXVMZJFJMYAaVFlajBwmD+Crij7lIB+OOKlQBhg1ShQQpLT0qSmDH
	 PG4LESYKnWvnQ==
Date: Sat, 26 Nov 2022 17:13:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	prabhakar.csengg@gmail.com
Subject: Re: [PATCH 0/4] riscv: alternative-macros.h cleanups
Message-ID: <Y4JJRHtiSzN6rb+f@spud>
References: <20221125113959.35328-1-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221125113959.35328-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_091345_995304_8007009D 
X-CRM114-Status: GOOD (  12.93  )
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

On Fri, Nov 25, 2022 at 12:39:55PM +0100, Andrew Jones wrote:
> This series is a collection of cleanups for alternative-macros.h with
> the main motivation being that adding new ALTERNATIVE_3, ALTERNATIVE_4,
> ... will be possible without lots of bloat. For example, adding
> ALTERNATIVE_3 should look something like the diff below and
> ALTERNATIVE_4 the same. This has really only been compile tested, as
> not all alternatives are used when quickly booting over QEMU, which
> I also did.

I gave it a go on my D1 (with the macro args fixed) and it seems to work
as expected. I'm not comfortable enough with this stuff to actually give
you a tag though, sorry :/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
