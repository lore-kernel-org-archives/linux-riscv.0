Return-Path: <SRS0=TFiT=G7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0578C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 18:09:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD5A664E1D
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 18:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD5A664E1D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eZJ4jaR9u8cnFND6EDDeZEBZxjZblZ7IVSR7bNlwD7c=; b=aryh2x6jHX4sQ/aMzP5P4sMvK
	kwr+7MzuAayPf0WaV2DdBPEWZI8jAAXorRvlcQzDwWRjNmFeQ/T9uOYDyfXVcc+FkrDkK2Tcj3xk/
	7tYqKu4ouJ5sEx/WaQdXAQDE7VEOInDXS3fHjJUCP0v94zaEV1qYJ3R5BWzOSE5ChJZ3l0DZphc6K
	3z7oZQkHnDP445M+HqRdBQpX75IlGAR8I/u1smkYr76cezb1c3KSWEPQQB/6ChmOTUTEqwf2kTQXh
	iwL9vhKdT+9gUMm7MkWXsNnu6T/aaYFCuIsTnyfAkm3vAzgAcGFt3jvTa/pUhzk89PAG5rmBS9Fdh
	P7hr0CzCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5BjL-0007nG-KX; Thu, 28 Jan 2021 18:09:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5BjG-0007mN-JL; Thu, 28 Jan 2021 18:09:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A10D64E1C;
 Thu, 28 Jan 2021 18:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611857352;
 bh=I9b2CY9oG+7j/Q9+LnonZv0tg8jELW8RgIxY4SKAgPQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h6cdOo6dNdavRRc1d40577CbEq9Qqz9G09q2/4hlPc8DLukSHRWlv4Dc2CYTCxJOl
 nfv0op4q3Fe+JORysXvTXKyvEAHLwIW/VgwlkFyT3iPkTW2Gi1rz3mYx3jZU0PTWXj
 iWXCKW1qDk+ivaxS7i2LPmqMipiuMriqVOSSvbjULFZBoA4ROstn0q0wMAN/VY/z1u
 Dgda/l5Z5A2faJ7etE2Z3GbEHJGsud7dU2XAY8XC+ph61sn+BaE044NsVvsjsRaPXM
 ju0yR9cDjUPL2/zkhveVojdpEBV/mbkHWbGphlUVoNXg7+puEx7LqGfaZqK7ZciRhn
 ez5F8XCG5tqgg==
Date: Thu, 28 Jan 2021 18:09:07 +0000
From: Will Deacon <will@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [next] mm/nommu.c:1671:6: error: conflicting types for
 'filemap_map_pages'
Message-ID: <20210128180906.GA2678@willie-the-truck>
References: <CA+G9fYta_uOLktmMnZHUTK9Uqx-rjtmQSSvHFCsvQsVdZDdm8A@mail.gmail.com>
 <CAMuHMdUzCFuuUcgMwh+numoCnr_p0tfTucybytymUceyPV0TBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUzCFuuUcgMwh+numoCnr_p0tfTucybytymUceyPV0TBQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_130914_726733_B49B8C45 
X-CRM114-Status: GOOD (  13.13  )
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-mm <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 28, 2021 at 04:26:09PM +0100, Geert Uytterhoeven wrote:
> Hi Naresh,
> 
> On Thu, Jan 28, 2021 at 3:25 PM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> > arm, sh and riscv architecture build failed on today's Linux next tag 20210128.
> >
> > FYI,
> > # CONFIG_MMU is not set on these failed configs.
> > config file attached to this email.
> >
> > make --silent --keep-going --jobs=8 O=/home/tux  -
> > build/.cache/tuxmake/builds/1/tmp ARCH=arm
> > CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
> > arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc'
> > mm/nommu.c:1671:6: error: conflicting types for 'filemap_map_pages'
> >  1671 | void filemap_map_pages(struct vm_fault *vmf,
> >       |      ^~~~~~~~~~~~~~~~~
> > In file included from mm/nommu.c:20:
> > include/linux/mm.h:2578:19: note: previous declaration of
> > 'filemap_map_pages' was here
> >  2578 | extern vm_fault_t filemap_map_pages(struct vm_fault *vmf,
> >       |                   ^~~~~~~~~~~~~~~~~
> 
> Care to give "[PATCH -next] mm/nommu: Fix return type of
> filemap_map_pages()" a try?
> https://lore.kernel.org/lkml/20210128100626.2257638-1-geert@linux-m68k.org/

I'll go queue that now, cheers,

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
