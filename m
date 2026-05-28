Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A048DCD5BD0
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 01:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHSn8Lb2b1EZJQq8MXKYXBTyTVS+kYAYt50q0iLzOwk=; b=vsXCHrZ2GUndoKpA4RJOsWYG7k
	ilg2/2YbZZ7sbeYhHDj+gUHT+2jROUlHymid0wM9Bg5W7oLGfJ3xqbKF10wN2x9Y+w0jzrf2/qfOU
	JzT3ifGTG7pfTQFaJVXCEgmmc3hN6Qx6ImchsDpY6YUrC5BFq4bKIMlIFPtinsW3P/VCyzJi9TVAJ
	CyTvipJEEy6KlLP1OZZL4Yj6jG8tdUSPWiHvmDLzaw3TMJxhwPcIs5JVrv+l3uyIqYWRfKE8/LiwZ
	noxs57I/UaQP5Q8/U3Qj70mmTMFzjM2CxdaqrUNJL/ITqj7tZVft6y3VqdEUSTrh8yXvTw95Mb0TT
	Be9mmTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSP7k-00000004vFv-2SGI;
	Thu, 28 May 2026 01:01:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSP7j-00000004vEw-0U6C
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 01:01:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F9B260572;
	Thu, 28 May 2026 01:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950B41F000E9;
	Thu, 28 May 2026 01:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779930081;
	bh=YH83iQyDpBtRJ7bFt3JrD5dC4uBBtq6U9iEcWdvtN70=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Pqjg3drRTJJ09KHbUlj28R3m536nA1zFBPbJelT5w6ptR7hgpkna8GIKErjdE834v
	 YzUMlXIh+4r4S6J7OnbSQ2WIOhDGksP8teYv5DLdyeWbBp+6d9/fUkvA7vqpx2yfi7
	 VNDbLpy+zc+lB+T8EkKXok9zlsAb4zvI9NrEhOuiGxKbdTLPyZ/a1uLWpDRh86eV21
	 bvPcLcwXsBfzLUj4LcnohesTjcadxIwSXnOxvMpmJ2pX7AgS+oHoHQWwUgwSkzrah1
	 qXfgcqzt87HRWDLNurNwVVnQ4qpAxGKXKk3VlYfGQkCCP5b5EUAeReCE1QvBcjklT1
	 qMhGoRq8g+XXA==
Date: Wed, 27 May 2026 19:01:19 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
cc: Paul Walmsley <pjw@kernel.org>, Han Gao <gaohan@iscas.ac.cn>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, Vivian Wang <wangruikang@iscas.ac.cn>
Subject: Re: [PATCH] riscv: unconditionally select ARCH_KEEP_MEMBLOCK
In-Reply-To: <CAAT7Ki-WDPpfdvB6MHdJW9Uas_jKVGeNjaOPvvpsPkO2wG-9oQ@mail.gmail.com>
Message-ID: <774098ca-165a-f739-6331-affb0c8af1e1@kernel.org>
References: <20260519165546.123105-1-gaohan@iscas.ac.cn> <b06ac7de-6c91-4536-1f06-56fb782150d4@kernel.org> <CAAT7Ki-WDPpfdvB6MHdJW9Uas_jKVGeNjaOPvvpsPkO2wG-9oQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1904663008-1779929769=:198859"
Content-ID: <587d9d0a-e62e-d1b7-c42f-d534a3c9abe3@kernel.org>
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

--8323329-1904663008-1779929769=:198859
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <6176f9bc-6d33-1f9f-e21a-ab6c0b8c4c64@kernel.org>

On Mon, 25 May 2026, Han Gao wrote:

> On Fri, May 22, 2026 at 6:04 AM Paul Walmsley <pjw@kernel.org> wrote:
> >
> > On Wed, 20 May 2026, Han Gao wrote:
> >
> > > Select ARCH_KEEP_MEMBLOCK unconditionally. kexec requires memblock
> > > to be kept after boot to initialize the secondary kernel. Device
> > > Tree platforms also need this for kexec support.
> > >
> > > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> >
> > Thanks for the patch.  If this patch is just about kexec, shouldn't
> > ARCH_SELECTS_KEXEC just be changed to select ARCH_KEEP_MEMBLOCK?
> It's currently aligned with the arm64 architecture. If so, should we
> modify it accordingly?

If the motivation for adding it this way is to match arm64, then the patch 
description would need to be updated accordingly; it doesn't say anything 
about that.  I'm not sure that's a sufficient rationale, on its own.

On the other hand, if the rationale for this change is that it fixes an 
issue when kexec is used, then I guess I don't understand why we wouldn't 
make it dependent on ARCH_SELECTS_KEXEC?  It can always be patched again 
if more use cases are discovered, right?


- Paul
--8323329-1904663008-1779929769=:198859
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1904663008-1779929769=:198859--

