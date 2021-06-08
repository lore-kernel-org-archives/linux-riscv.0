Return-Path: <SRS0=YeFR=LC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC29C47082
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 05:45:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C0B56127A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 05:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C0B56127A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7OTIND1OycgKUuUYIQ0HdlvW2iE//Xvf/GoY68hc5g=; b=sG5UGYpZgNfzAW
	6FLQyuBDSk6u0ct5Vl/aHMcuwqpzr8Q41r9HOkDjHEi+TH4PDGs77qSPfr99LEwF9nm11+NfcqSo7
	ppQcpiJU25FfZMzyuC5ihDRLHEnnFR1Tbddd2dFzZOI64BjmxIQXdYtegi5Ej2tzPwNg3Y6/VE3sL
	hqaAks7ZHLv+f6yIMXftHCuK0pv5nB1HcX5rJcppIKUjwGxE77onghyvo5vnlrfQFl+VPdr273hH0
	K3mEavOUa1OIsx/DlPsFaHQZHuzxpc9bHrDud1Sc+Vd1dbkQvLECCXCd6zqN1wNt/OciGZFNO85dW
	GPoRLYHyci4/hoQ/0BJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqUYS-006ZxY-0a; Tue, 08 Jun 2021 05:45:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqUYC-006ZtI-Jn; Tue, 08 Jun 2021 05:45:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5D8361029;
 Tue,  8 Jun 2021 05:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623131119;
 bh=49fVzdt4MSY+UspP64EgJQ791zimRP1gxTciSlJZXt4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G0Rtshf8pvTrv3vEhpsoWQuj5JjeNYokUzfYJ5STkCXI/OnFwZ+jzE319giZq9upk
 Ip6wZYmg/mXX1RsKoBHJISuKRrHfu3i7LKK8o6lrdj3F/wsMYKU4KSiTq0yf0Te/9Y
 EXkEDnDuymhI/7Es9g0unojNazWzSj6FWZpsSVsuRv7SkD+TKqrUPOkH42sn/s2o3k
 YyeAtmie679nER7vSNNhYu+t0T8vpaLE8THVLmZUT2dI3k363OIVX5xgUfeXV7EiTs
 ihyAaoDmjCZhWOCiJEmXQBaJ0yMnS1SK6yRX7SpN+JL1ZvqVGV5DXW68K81QTP/SNc
 ubRqN6fNQU7pg==
Date: Tue, 8 Jun 2021 08:45:07 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Jonathan Corbet <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
 Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
 alpha <linux-alpha@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 sparclinux <sparclinux@vger.kernel.org>
Subject: Re: [PATCH v2 8/9] mm: replace CONFIG_NEED_MULTIPLE_NODES with
 CONFIG_NUMA
Message-ID: <YL8D47Ty8iXZJsK3@kernel.org>
References: <20210604064916.26580-1-rppt@kernel.org>
 <20210604064916.26580-9-rppt@kernel.org>
 <CAMuHMdVa29gUQAdHjKh-qDNpOJaoGwXtUkBM2qnOTi1DWV70xA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVa29gUQAdHjKh-qDNpOJaoGwXtUkBM2qnOTi1DWV70xA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_224520_707166_61E5C795 
X-CRM114-Status: GOOD (  24.67  )
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

Hi,

On Mon, Jun 07, 2021 at 10:53:08AM +0200, Geert Uytterhoeven wrote:
> Hi Mike,
> 
> On Fri, Jun 4, 2021 at 8:50 AM Mike Rapoport <rppt@kernel.org> wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> >
> > After removal of DISCINTIGMEM the NEED_MULTIPLE_NODES and NUMA
> > configuration options are equivalent.
> >
> > Drop CONFIG_NEED_MULTIPLE_NODES and use CONFIG_NUMA instead.
> >
> > Done with
> >
> >         $ sed -i 's/CONFIG_NEED_MULTIPLE_NODES/CONFIG_NUMA/' \
> >                 $(git grep -wl CONFIG_NEED_MULTIPLE_NODES)
> >         $ sed -i 's/NEED_MULTIPLE_NODES/NUMA/' \
> >                 $(git grep -wl NEED_MULTIPLE_NODES)
> >
> > with manual tweaks afterwards.
> >
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> 
> Thanks for your patch!
> 
> As you dropped the following hunk from v2 of PATCH 5/9, there's now
> one reference left of CONFIG_NEED_MULTIPLE_NODES
> (plus the discontigmem comment):

Aargh, indeed. Thanks for catching this.

And I wondered why you suggested to fix spelling in cover letter for v3 :)
 
> -diff --git a/mm/memory.c b/mm/memory.c
> -index f3ffab9b9e39157b..fd0ebb63be3304f5 100644
> ---- a/mm/memory.c
> -+++ b/mm/memory.c
> -@@ -90,8 +90,7 @@
> - #warning Unfortunate NUMA and NUMA Balancing config, growing
> page-frame for last_cpupid.
> - #endif
> -
> --#ifndef CONFIG_NEED_MULTIPLE_NODES
> --/* use the per-pgdat data instead for discontigmem - mbligh */
> -+#ifdef CONFIG_FLATMEM
> - unsigned long max_mapnr;
> - EXPORT_SYMBOL(max_mapnr);
> -
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
