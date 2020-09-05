Return-Path: <SRS0=D0Wr=CO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89545C433E2
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2020 12:18:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C821F20757
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2020 12:18:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SB73OFCa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Fd3GDeGu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C821F20757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=clJG/Ilm44TRONwtuIOwe2Yv5Ea3qRUhU1nro49czdg=; b=SB73OFCaEdROpvCysfkBGGkWI
	E3OVR39GPzbWr1I9WypF5flsqRiq1r2KAtgo+kYShAdkymaoQzVCHM6AnVA/ZLsdWv6LwxvsMRGKW
	ck6PLa2hhSr63tjhLM0B0K8HEIQQ6VyTyPQ78aHepqaA0TuO6Zqap91awSdFo4qBO6jLl0tqqTM6Q
	EP4z3k4u/s+HJrcHa1LxZIURYdSYFXCQrjqwxixlo0pc9MJBIUyf1N6NxE1tftj/uH6O/O5zPRRdS
	kGLuqLSWoI0Nh4SD2RV5qq7127xhO+b8/wUZHUDNUGR/V/Inne3zldVDLSwALknq7Gd+YUz2izPNi
	HdcnAD+TA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEX8g-00011p-5s; Sat, 05 Sep 2020 12:17:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEX8d-00011Z-R9
 for linux-riscv@merlin.infradead.org; Sat, 05 Sep 2020 12:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=SPOdbzsjS2PsxDTNkEtc1QC//PjNMIc77tr4/iunVe4=; b=Fd3GDeGuA+WxLL8kxjbRivhIyg
 WEtr6zrhztSaq2s2hM7jtt8eG+nrqog6pj036+OS4dX10iS1ofGyU8kvNdBKPthYjm+GdGTAiiaSP
 E2BtFewFaLmFCES4WJF4ZgsfSEPKnnpA9k6scVZvCZ2ETUi0SR6tywO4TKFMxoRD52oagFXds7HVB
 GotWBIC95xP0L0kubHc7mup0Os3VQkrzVtTXneG9VT2vtQcBCeVEouLRm+JPlJmlwpmfUhziuZSSJ
 5KTbrgZwar2rj46Ri9Bef4vjKPI3XD25ZHhX84545KAWRCTL1TYNJtFnfqaFdvT4Lj/SV3PmfI+Kg
 DWPVIPLQ==;
Received: from mout.kundenserver.de ([212.227.126.131])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEX8Z-0001Cw-P3
 for linux-riscv@lists.infradead.org; Sat, 05 Sep 2020 12:17:46 +0000
Received: from mail-qt1-f171.google.com ([209.85.160.171]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mwwhv-1kT45T3kkN-00ySlu for <linux-riscv@lists.infradead.org>; Sat, 05
 Sep 2020 14:17:37 +0200
Received: by mail-qt1-f171.google.com with SMTP id e5so6775302qth.5
 for <linux-riscv@lists.infradead.org>; Sat, 05 Sep 2020 05:17:33 -0700 (PDT)
X-Gm-Message-State: AOAM5329AcacBafSfqze4fA5JHWkPAYXurKgfXvueZtjjUs+mhqfRbVe
 UdzemWaBOPRYFSiwqsAdzjTqiF404jPKc24t36o=
X-Google-Smtp-Source: ABdhPJztDqES+QOFNh8+jrK8cS2H3Wi+J6JBSp+Ig7JDd7R2GNL+D5UroPOmdx4gswuUtuIWyBP2UGRMtOCxTAirt/s=
X-Received: by 2002:ac8:5144:: with SMTP id h4mr1539656qtn.18.1599308252303;
 Sat, 05 Sep 2020 05:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200904165216.1799796-1-hch@lst.de>
 <CAK8P3a3t8a0gD2HsoPsMi7whtNb7BdzPN6-oo6ABnqkbQJoBfA@mail.gmail.com>
 <20200905071735.GB13228@lst.de>
In-Reply-To: <20200905071735.GB13228@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 5 Sep 2020 14:17:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a13Xs7-oknJJ0D7HU1+g3fOcaNDr0YgrN-cdv78G5fqiA@mail.gmail.com>
Message-ID: <CAK8P3a13Xs7-oknJJ0D7HU1+g3fOcaNDr0YgrN-cdv78G5fqiA@mail.gmail.com>
Subject: Re: remove set_fs for riscv
To: Christoph Hellwig <hch@lst.de>
X-Provags-ID: V03:K1:fTdHRrII2QJh8LPYZAiQjyUG6Zuil1522+KGSuGTQenROxhII7q
 ROgm1Cv7G2x8zMoAfXNJnc4dG5eeKUscNFpMga6j+WBvLw+CcA38vnLJV3VJvx1mj3GntlZ
 CbkImXnlqJNghmiG1Ac2nVUtHyQOTWoEneOerFXnXnRPVGz/AQrlvqs3atiIxsaV6xi6yZS
 jQElgp3JH1LFh8q/EmRZw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:j/7FTa4NJWE=:Hhdt3d0/ql5o2lsiUz6evd
 Skge+QMG6sGKy9oFw+USjLcOdRhylNRy1NmKZAhQt4QwoMNdTDFe8NG+LS1pYHjsweaTEqXdm
 lHSkfZ2xF3TkTUjczqLENoD/4VnIyh8ZuwXO4/PHq0XiPDRrfNfT0emUR2ztnRjQxpR20ZQyv
 mIdUCWXg8qN7uIuTfMNKWUXgrp399VfFO8leZlNETl9gKRzAuM8QDnrAzxcWctyupDWTiWXCQ
 orONp3YTn5lMizvs+TmGtWkIQVBA7nnKdT9+RFUi/J8u8kgE5In3UdbNv+NDY8FLREXR9/PJU
 O27+63US2mgU1WsaP3i0/lAp2ZoEhp2bc3BM2p44DyTUT47sfgxJnabreoGdTHK2vyb4CtOBz
 J6fg45lqMLmLyv0Jz0AynYVtfiw8Mdxn0Uo2p0nKiZGv9hkXi4YEnyCOB7+XM90fNsX/8s1kl
 U4jYK2UNevau7z17eGqm9KRMCq3nSSDiHHNRxmeQeNx1fbufG9VRRScNcTE72JIdZeDhn2PgQ
 RIAsafjYT9zZZ8RQJYKNe4HmxEZEO4cG6UvFE+pbTiMIltukzSd3Jnu7Vrc47cceJbSaI4YZs
 Vac9CMYDNkWOJZIHcQLFQ8CxYHV/Hw3lp4wNWHtEqoR9juFfYBVvlfR+HEs1X6TkciBtxXX+t
 pMyUy96WYig8foaebz8ZL8MvorabE3pNIZdy/d9O1VgIBQMAVT1f34WV0x89Q4k3Nq0uoR72x
 gDniyid+RbwDUvPO7fOXbWCvgMQZ9JoC6ZY8uw5Rjcmxe7VHWPGRW67sH5HGV0p4spH9Qkn66
 AFtWur4Pu/hqqpiV1BCevjcaDymBSx6Vdz8rckHtAXttBA7gwRfl2cZ3UVSC4T5nNZfXZGf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_131743_982311_0E75C2FE 
X-CRM114-Status: GOOD (  18.62  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Sep 5, 2020 at 9:17 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Sep 04, 2020 at 08:15:03PM +0200, Arnd Bergmann wrote:
> > Is there a bigger plan for the rest? I can probably have a look at the Arm
> > OABI code if nobody else working on that yet.
>
> m68knommu seems mostly trivial and not interact much with m68k/mmu,
> so that woud be my next target.  All the other seems to share more
> code for the mmu and nommu case, so they'd have to be done per arch.

Ok.

> arm would be my first target because it is used widespread, and its
> current set_fs implemenetation is very strange.  But given thar you
> help maintaining arm SOCs and probably know the arch code much better
> than I do I'd be more than happy to leave that to you.

I would start with the syscall wrapper code that just needs a simple
set of changes to pass the arguments on as kernel pointers instead
of fake user pointers.

I'm also not too familiar with the domain handling on older Arm cores,
which I think is the main difference to other architectures. On modern
Armv6+, the set_fs() call is just an assignment to current_thread_info()->
addr_limit like on other architectures, whereas Armv5 and older
rely on special load/store instructions to perform get_user/put_user
as an unprivileged access. Removing set_fs() should allow to clean
that up nicely, but I'd worry about introducing regressions in the
process, and will probably stop short of that cleanup.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
