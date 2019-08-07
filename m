Return-Path: <SRS0=DSzU=WD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B9FC433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2019 02:09:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21F93217F5
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2019 02:09:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HHZS7kWG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="m07tf3Qd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21F93217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+WWjDh16fEyvHXS1gomwrEOsuTL/RRTiodQLwT8z8o=; b=HHZS7kWGbxZQnG
	f4txkjWj4S7xeaiq4Uq8/agEKLKHTFRGkXUUtkTSQ9WGayncGXub+iudOuolHhnFDwYpUch/8X2bb
	T74XQDVwgkyQjaRyIogeOYe3d2gOhxpCnzZYRtNAR9320Yi1ICi5KGw4qBywlhJM3fY1YVLS+/uYl
	opa5KVY7pr++dskXpEwpa7xJkCGI4ZnkWAql9E835PUGKlEQk3/uD3dRQc3/3R8D9BO8irbCz2AjL
	XV6ygSAt5AmnopUEdDkpJNc/uB0JGpeh+O0gn02r9LQDQPmDtJX7qByNjH5vE7BobY+8LB8Y6d0Gm
	30/k/eXkXii/FXcm7ILA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvBO3-0001fk-0h; Wed, 07 Aug 2019 02:09:11 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvBNz-0001fQ-AJ
 for linux-riscv@lists.infradead.org; Wed, 07 Aug 2019 02:09:08 +0000
Received: by mail-ot1-x344.google.com with SMTP id n5so98207994otk.1
 for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2019 19:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=oJEOijs45wJ+WLhDN2EJbWxcQsKR3K12V2raA9hh00I=;
 b=m07tf3Qdylsg2AodW+zS4QHRncYEJ3ZTApvZlmoK3bNuzsZuBY+NniO4YxKUQJsuC5
 gfyqOZ/75j0bMFk9ijvmOLhIMDcX82yyGYjuzP+rEFnQaX7t10y0NZSvpdyDuk+TVYOs
 RWxAeQLesRzdzJ0ni0HxAL4BpT+Ln++cWBjsDFFc1i0qrWtzcB45FOdLZTXVGF06ebuF
 hKPnSgJ/oEw3nmcJ/ddP31oVH2q4Yt5POjUdaqBb7GqHi94QqzJP3C+UvopC5qdNW1yj
 Q2aVVl8xKSfBDvIOwyZwD4ktSuOFUvyGguJP5hiUPqho4OY0/dJqLCodp05d/CUZKt5B
 yiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=oJEOijs45wJ+WLhDN2EJbWxcQsKR3K12V2raA9hh00I=;
 b=J62XWEjZqLyirSIcHSWhF3SXXeZe0iFfhmuQJ5/bTmbdRI+ZGwiI+n0W23tETYQGyT
 QYxZzN+NSVT65piOgrAbju7bztQC+ne2VYMu5Ppzd1e/xNG0OxsPIydAMDGHdAqwVkA8
 wgMG6FpNL30R7/i+tiVtHbKhdVMxL2vPZFoWNTmCCv7l1Sm2CnYUREnWBzHVL3JbJUqH
 YY7tizZ7ziy0Uvp1yBwaKNvTEJWRPs5v4t3KeI43ES2r7CdOviSu6qzz7ZO9jPQ+ki+Q
 X/HpBS0rzUmqh0XiRoapYoGHZgBwnnPZ5IsNYsPjcPyzuOBNvx/ddNlUV629u66msFTc
 BBfw==
X-Gm-Message-State: APjAAAUuoQfGplDdYmPgXK+eDL39GmgGmIfIJcgcCHxyNwVKwfMhbSaa
 m4EDDZalSBdXbXMhh6jEMgTFKACByyQ=
X-Google-Smtp-Source: APXvYqw8nri93IKBFrfnn21MqXtJlZeRgX7ik2/U8ofdf7vaJmw1b8mkNo9vzVJop2yoWPP3AiR1HA==
X-Received: by 2002:a02:2245:: with SMTP id o66mr7806496jao.53.1565143746638; 
 Tue, 06 Aug 2019 19:09:06 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 s4sm113480133iop.25.2019.08.06.19.09.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 19:09:06 -0700 (PDT)
Date: Tue, 6 Aug 2019 19:09:05 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Palmer Dabbelt <palmer@sifive.com>, Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH] RISC-V: Remove udivdi3
In-Reply-To: <alpine.DEB.2.21.9999.1908061738130.13971@viisi.sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1908061907340.25231@viisi.sifive.com>
References: <20190807000508.9477-1-palmer@sifive.com>
 <20190807001846.GA21655@andestech.com>
 <alpine.DEB.2.21.9999.1908061738130.13971@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_190907_423135_24700E17 
X-CRM114-Status: GOOD (  12.00  )
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
Cc: linux-riscv@lists.infradead.org, Alan Kao <alankao@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 6 Aug 2019, Paul Walmsley wrote:

> On Wed, 7 Aug 2019, Alan Kao wrote:
> 
> > On Tue, Aug 06, 2019 at 05:05:08PM -0700, Palmer Dabbelt wrote:
> > > This should never have landed in the first place: it was added as part
> > > of 64-bit divide support for 32-bit systems, but the kernel doesn't
> > > allow this sort of division.  I must have forgotten to remove it.
> > > 
> > > This patch removes the support.  Since this routine only worked on
> > > 64-bit platforms but was only built on 32-bit platforms, it's
> > > essentially just nonsense anyway.
> > > 
> > 
> > It would be more complete if we add
> > "Reported-by: Eric Lin <tesheng@andestech.com>" here.
> > 
> > > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > > Acked-by: Nicolas Pitre <nico@fluxnic.net>
> 
> Thanks, queued for v5.3-rc with Eric's Reported-by.

This patch breaks the rv32_defconfig build, since udelay() still relies on 
__udivdi3().  I'll queue "riscv: delay: use do_div() instead of 
__udivdi3()" along with it: 

https://lore.kernel.org/linux-riscv/alpine.DEB.2.21.9999.1908061906240.25231@viisi.sifive.com/T/#u


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
