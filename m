Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E054EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vehq6/uF+0RldItmNhlTaN8wO3EwV8fhEGM4lKxVz6M=; b=hVcNfeiP5YfHsD
	bhTDtyO3FVHhkHucyTYgiLgJdAnkGpaF35F5uE1+u2/MNZ8iX6qy9lj/zK9cTiUFAzZC91B2WgbL1
	EGtI/We3qGE510IhFDIXALAmVvSASxlQHe1SdPzVOV/JzHfqMsxjwwDYi4dOQtXFkamUzhTv/w/dQ
	d7m1GWHwNyatAMDgzm7a4rZ1T9k4xTx0AvXuPLHmPDEuEnEyNO0uVRIJgKY0WzyrijuTnpbNngPOE
	Qz1pXUJSPdZP4jggxk6WjEmOALonhVpHetiJluextf2RxqXu6JryeuXI80knKY2h8YtKf4RYNVjl2
	u/VhBQUiPD50FRZDVidA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGXU-00A4P0-0n;
	Mon, 03 Jul 2023 10:12:12 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGXR-00A4L0-1s
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 10:12:10 +0000
Date: Mon, 3 Jul 2023 12:11:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1688379110; bh=JaQoe8ZfDwifbQM153siZCvI+TDzLOP02eBD2RQK1NA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sBDpJhgjTVhhWVzcennscDyTI4F6KXTA+3SID8ccsEI7fBqVLT0j+EFiRgGlpMteR
	 dc1qrQ1p4Yw5N3lhTor9LB5hr3ZuMjHDPGHt4lROhnoRz6fPoHSaPfJZIsbTRT4aky
	 DBGFNlobetNOHs0+g7q8GY1YyuOi8T2URyZvJTiI=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, w@1wt.eu
Subject: Re: [PATCH v1 03/11] tools/nolibc: include crt.h before arch.h
Message-ID: <8efbbfe5-1c3f-46df-9bc3-2ba62015f17e@t-8ch.de>
References: <e1cf8fd3-f8cd-4c3c-9f8c-24bbc0a7cde3@t-8ch.de>
 <20230703095832.493137-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230703095832.493137-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_031209_772607_C7024E4E 
X-CRM114-Status: GOOD (  16.35  )
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

On 2023-07-03 17:58:32+0800, Zhangjin Wu wrote:
> Hi, Thomas
> 
> > 
> > On 2023-06-29 02:54:35+0800, Zhangjin Wu wrote:
> > > The crt.h provides a new _start_c() function, which is required by the
> > > new assembly _start entry of arch-<ARCH>.h (included by arch.h), let's
> > > include crt.h before arch.h.
> > > 
> > > This '#include "crt.h"' doesn't let the new _start_c() work immediately,
> > > but it is a base of the coming patches to move most of the assembly
> > > _start operations to the _start_c() function for every supported
> > > architecture.
> > 
> > Why don't the arch-*.h files include this new header?
> > They are the users of the new symbol.
> >
> 
> I have tried so, but since crt.h itself is not architecture specific, add it
> before arch.h will avoid every new arch porting add the same thing again and
> again, currently, we only need to add once. I have even planned to move
> compiler.h out of arch-*.h, but not yet ;-)

While this saves a few lines of code in my opinion it hurts clarity to
rely on implicitly pre-included things.

> every new arch porting

That doesn't seem like a very frequent occurrence :-)

> And also, crt.h may require more features in the future, like init/fini
> support, it may be not only used by arch-*.h files.

Do you have a mechanism in mind that supports init/fini without needing
an ELF parser at runtime? I guess an ELF parser would make it a complete
no-go.

Also the value added by init/fini seems fairly limited for a statically
linked (tiny) application.

> [..]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
