Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913E8C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 20:34:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4E5D61985
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 20:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4E5D61985
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JfJwgGWMAJZWqL98y0AX74BIqc13U69i0iMCSfdnO6w=; b=mZNszMOMN4I5gFknAYMpeobWQ
	V97udvE08oumou4dPGFrAPHm54RoTh7llzBZV3UgUiPEeh1zMeiG+8BPUpC8aR9ZMwvDXn1kfybaF
	LHwMoDmHEhYUjOcE6/dhxGsw/fY6cjT65eLgEyOutoOcjcAbVPdyTEZLZsnUyhDFQ68Iw2SCZZjlF
	YeczmnHdWoxNAr5brVEXe/Jbzjrf+t06aqJSFDes7/3i2nZu6skcAU6ANa/asaoPNSemQPT6gdUc9
	UXt4S/jkzcCRK7qZz5fvH3tKoNpgNhcyDlXgvEw2CdP7Gxd0hp9K7vTZJcTgNI3dsPtMxbKWv//Tz
	JS5rlYA6A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRL3C-004nsO-OJ; Tue, 30 Mar 2021 20:33:26 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::4])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lRL1h-004noy-O6
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 20:32:41 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id A8E7992009C; Tue, 30 Mar 2021 22:31:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id A2CFF92009B;
 Tue, 30 Mar 2021 22:31:45 +0200 (CEST)
Date: Tue, 30 Mar 2021 22:31:45 +0200 (CEST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Palmer Dabbelt <palmer@dabbelt.com>
cc: alex@ghiti.fr, Paul Walmsley <paul.walmsley@sifive.com>, 
 dvyukov@google.com, linux-api@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Bump COMMAND_LINE_SIZE value to 1024
In-Reply-To: <mhng-885e3a79-49cf-42fc-8561-a52c7b7e1ac6@palmerdabbelt-glaptop>
Message-ID: <alpine.DEB.2.21.2103302221590.18977@angie.orcam.me.uk>
References: <mhng-885e3a79-49cf-42fc-8561-a52c7b7e1ac6@palmerdabbelt-glaptop>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_213239_204928_87580F82 
X-CRM114-Status: GOOD (  13.76  )
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

On Mon, 29 Mar 2021, Palmer Dabbelt wrote:

> > --- /dev/null
> > +++ b/arch/riscv/include/uapi/asm/setup.h
> > @@ -0,0 +1,8 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> > +
> > +#ifndef _UAPI_ASM_RISCV_SETUP_H
> > +#define _UAPI_ASM_RISCV_SETUP_H
> > +
> > +#define COMMAND_LINE_SIZE	1024
> > +
> > +#endif /* _UAPI_ASM_RISCV_SETUP_H */
> 
> I put this on fixes, but it seemes like this should really be a Kconfig
> enttry.  Either way, ours was quite a bit smaller than most architectures and
> it's great that syzbot has started to find bugs, so I'd rather get this in
> sooner.

 This macro is exported as a part of the user API so it must not depend on 
Kconfig.  Also changing it (rather than say adding COMMAND_LINE_SIZE_V2 or 
switching to an entirely new data object that has its dimension set in a 
different way) requires careful evaluation as external binaries have and 
will have the value it expands to compiled in, so it's a part of the ABI 
too.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
