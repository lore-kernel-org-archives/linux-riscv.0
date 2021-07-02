Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE5CC11F68
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 14:45:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 905216140C
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 14:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 905216140C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDYPIrh/tPKX09xB+dkqPP6XRxv1YZ1EO6wdPN6VZZE=; b=lyFG+a+xVg3iHl
	0rGqNfCh8bldVphS8zm4Vx59yWHxbQLdPAHFu1usxG1EGrrmPo/0kjO/UeRb98fjv6K2Uvo5Dxghm
	MyelVoQKomjgXxIxb9MEgSBx5rZ+GuE7TgU7Gux/xQyhbuhS+lFR4q8hAI/RohJ4ZXvNcbm/VojoJ
	1NDUyAU9+CjJtIrKgvkjNb9ivi0OeEgcasUdl+k/bd2a5OURr546q0fK6sOSwAm76Q9TMswOmSQrq
	Nj82FuehHRQ3MnAJO3T4YM2uMTWk/ueLbSX9JaXPYyaKSJRIqeFQoTYAPONcdAudT1gHFHUTEdnmI
	dTBrSVYLUUMyMQVKnprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzKPn-003IjP-Qn; Fri, 02 Jul 2021 14:45:11 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzKPX-003Ibn-I6
 for linux-riscv@lists.infradead.org; Fri, 02 Jul 2021 14:44:57 +0000
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by linux.microsoft.com (Postfix) with ESMTPSA id C117C20B83FA
 for <linux-riscv@lists.infradead.org>; Fri,  2 Jul 2021 07:44:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C117C20B83FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1625237092;
 bh=COfBRLi+BJ3qGAqOVgLUX0fhQNuQxKTydWlChw0BlLI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tRGwEHasZTX06Egu9Ww7uR8RabiaJLr5vR4tlDPOfGgBdAE0IHk7ehSVCVKdwfsTX
 nDL34TDk/hAMHQ9GJhkVTEsbQH2mo7XE3c2M1Me7rIrRLOXwxwAPWBfJvYSqg0z0Re
 dE3HS528+HtMzM0UXqVixjAMR5aSPvt46WJVMjwM=
Received: by mail-pl1-f171.google.com with SMTP id a14so5481773pls.4
 for <linux-riscv@lists.infradead.org>; Fri, 02 Jul 2021 07:44:52 -0700 (PDT)
X-Gm-Message-State: AOAM5334W3l2PAcg0AHwq+5kFFQ7o87AsOs2TfN0p3h8+SsRF5xM4VWq
 NfvR6+s5MOZGDFHznhD0MvOHaG0Pm5Cqurmy7hY=
X-Google-Smtp-Source: ABdhPJzWnpiLuYZjxkaOt2GXQN8Y0htWvRKauf64n9pu1ITllRnRm87jqyOrrR0TIYSKM6zsEhBaReTnfjD2r+YVp+g=
X-Received: by 2002:a17:902:70c4:b029:129:45cd:aa90 with SMTP id
 l4-20020a17090270c4b029012945cdaa90mr123959plt.43.1625237092188; Fri, 02 Jul
 2021 07:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210702123153.14093-1-mcroce@linux.microsoft.com>
 <20210702123153.14093-2-mcroce@linux.microsoft.com>
 <0e0fa030-8995-b930-5e22-954349a0b82e@codethink.co.uk>
In-Reply-To: <0e0fa030-8995-b930-5e22-954349a0b82e@codethink.co.uk>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Fri, 2 Jul 2021 16:44:16 +0200
X-Gmail-Original-Message-ID: <CAFnufp1H4fzOHcinAgS0nnStSqLcALKAtk0QYkrnkQvwAx=BNA@mail.gmail.com>
Message-ID: <CAFnufp1H4fzOHcinAgS0nnStSqLcALKAtk0QYkrnkQvwAx=BNA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] lib/string: optimized memcpy
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>, 
 Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@infradead.org>, 
 David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, Drew Fustini <drew@beagleboard.org>, 
 linux-arch <linux-arch@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_074455_691704_CC581C3C 
X-CRM114-Status: GOOD (  20.18  )
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

On Fri, Jul 2, 2021 at 4:37 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 02/07/2021 13:31, Matteo Croce wrote:
> > From: Matteo Croce <mcroce@microsoft.com>
> >
> > Rewrite the generic memcpy() to copy a word at time, without generating
> > unaligned accesses.
> >
> > The procedure is made of three steps:
> > First copy data one byte at time until the destination buffer is aligned
> > to a long boundary.
> > Then copy the data one long at time shifting the current and the next long
> > to compose a long at every cycle.
> > Finally, copy the remainder one byte at time.
> >
> > This is the improvement on RISC-V:
> >
> > original aligned:      75 Mb/s
> > original unaligned:    75 Mb/s
> > new aligned:          114 Mb/s
> > new unaligned:                107 Mb/s
> >
> > and this the binary size increase according to bloat-o-meter:
> >
> > Function     old     new   delta
> > memcpy        36     324    +288
> >
> >
> > Signed-off-by: Matteo Croce <mcroce@microsoft.com>
> > ---
> >   lib/string.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++++++--
> >   1 file changed, 77 insertions(+), 3 deletions(-)
>
> Doesn't arch/riscv/lib/memcpy.S also exist for an architecture
> optimised version? I would have thought the lib/string.c version
> was not being used?
>
>

Yes, but this series started as C replacement for the assembly one,
which generates unaligned accesses.
Unfortunately the existing RISC-V processors can't handle unaligned
accesses, so they are emulated with a terrible slowdown.
Then, since there wasn't any riscv specific code, it was proposed as
generic code:

Discussion: https://lore.kernel.org/linux-riscv/20210617152754.17960-1-mcroce@linux.microsoft.com/

-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
