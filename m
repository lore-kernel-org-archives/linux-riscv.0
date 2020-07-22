Return-Path: <SRS0=J8tV=BB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270B0C433E5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 21:06:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E73522086A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 21:06:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1Qu4d6mb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="DtMjrfPK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E73522086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NzbOjfsP6YIez5kzR1i4w8zm5pPzTdU5xCmO5vOVL90=; b=1Qu4d6mbv3L357pHhaPKlbyjm
	6ypsBlYvQes6FBAQQSA4Yj4rqLKdI/sf09Mg6pvCyN0tBqnP/RXL24E8SQx+fWk+mlc3T5VXLRkcl
	PhGgg6LGQhen3utU1n/zAZSsw6WkDaqgNkYQol290LCvyVSL1pgFGt61XC5udJbp3yYU8xNYtbeL+
	e5jHeEqXjBVep/FkzjOY7TwcqxLmkqu3480vXiTuS0QH0Jk+mzWe2HtcEyz4cf4JWh2EiP4wVJRAu
	bX2ItBp+BhVfplo8t5ycZ1LMQ04xlVjjpLzBeG7wMU0h8kVHqyxZHB6lCwDkRs7KRPRk6NJEuwd2r
	Y6qxYakzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyLwL-0000nx-Hp; Wed, 22 Jul 2020 21:06:13 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyLwI-0000nW-Cg
 for linux-riscv@lists.infradead.org; Wed, 22 Jul 2020 21:06:11 +0000
Received: by mail-wm1-x341.google.com with SMTP id w3so3276735wmi.4
 for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2020 14:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pUykGa+mtQ5qLEJzpM6lTm4DyeH44yHQyhTxXONta+M=;
 b=DtMjrfPK33UpsHV7ieVtBoXhLIYg/jlJtL/BwT+t06XPoZuxolm3MZwCr//MnlAhv7
 olpqshFL30eLQy1W2/XqwGp6TQ4RerXlU6stdyUroQWPo3+FNPAxh8fnNdtX7F+nvEDT
 VJ2MTsTfnTkK/RixP0LCc4xF2mzNoGq5Ig8To=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pUykGa+mtQ5qLEJzpM6lTm4DyeH44yHQyhTxXONta+M=;
 b=dqRvHkWcEUwzc40+RP7RYbbyQ8cqfQYTT79i3+y0eRhk+hbFHJTIuXUfJmLCVyuox1
 nZfwhLFQmMIvnW9oCyZ1TJxsNVckXEEdKC1BHh3AbxaPUtZQIh+WdrsPLIlbOCL1MD6C
 e4DZv9wek89O/gFFY9mYf/F3/U2077OujDawnE+zySiFdOmx2EuWL2j752QEqX3PCMqH
 XFkPKjXZb4SzfCR5gJPhr+fN8ZjQU3ak4QCs3GbYHaB97U8x1vugpRu99FDSERjblLLo
 /BYShPi4dTquQ7XOxrq+kAEOxgPw+18GFGRm3FNsltIFyMQXXwVkpPeoDl8CVKYcYG2d
 BVZw==
X-Gm-Message-State: AOAM530CIdCISG245bJaGodNoK8RyoQukYLmnUcS5e7J/mclbXnuGqAY
 iF7+GjDAFCxpMfLt6jh5gZBrFvfrQdrKgtwMOR4f
X-Google-Smtp-Source: ABdhPJwhNpZUdU/OnWtik2XTzTS4UMH8jcwWO9Hxmgqgvl3smhQmAYatCRp4hQfaVCyVsPrlT6KIYfciVm1lrAWgeu4=
X-Received: by 2002:a1c:dc02:: with SMTP id t2mr1223465wmg.55.1595451967050;
 Wed, 22 Jul 2020 14:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a34sT2bQbkZUjaxaShzCkn+s35pXxS0UNhqGFu+t2hZYw@mail.gmail.com>
 <mhng-820ebe55-b4a3-4ab3-b848-6d3551b43091@palmerdabbelt-glaptop1>
 <CAK8P3a2VHXDLK6iba=NxSQ-t=9P7LSwzwx3XrK=N=M+qoX_oeQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2VHXDLK6iba=NxSQ-t=9P7LSwzwx3XrK=N=M+qoX_oeQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 22 Jul 2020 14:05:55 -0700
Message-ID: <CAOnJCULmX+vUcpEmBd5w7xjtZSFk=Ju2V=wBJCOXHQ8m9yG9-Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_170610_545836_F1822EB0 
X-CRM114-Status: GOOD (  21.60  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Linux-MM <linux-mm@kvack.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 22, 2020 at 1:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Jul 22, 2020 at 9:52 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > On Wed, 22 Jul 2020 02:43:50 PDT (-0700), Arnd Bergmann wrote:
> > > On Tue, Jul 21, 2020 at 9:06 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > > The eventual goal is to have a split of 3840MB for either user or linear map
> > > plus and 256MB for vmalloc, including the kernel. Switching between linear
> > > and user has a noticeable runtime overhead, but it relaxes both the limits
> > > for user memory and lowmem, and it provides a somewhat stronger
> > > address space isolation.
> >
> > Ya, I think we decided not to do that, at least for now.  I guess the right
> > answer there will depend on what 32-bit systems look like, and since we don't
> > have any I'm inclined to just stick to the fast option.
>
> Makes sense. Actually on 32-bit Arm we see fewer large-memory
> configurations in new machines than we had in the past before 64-bit
> machines were widely available at low cost, so I expect not to see a
> lot new hardware with more than 1GB of DDR3 (two 256Mbit x16 chips)
> for cost reasons, and rv32 is likely going to be similar, so you may never
> really see a need for highmem or the above hack to increase the
> size of the linear mapping.
>
> I just noticed that rv32 allows 2GB of lowmem rather than just the usual
> 768MB or 1GB, at the expense of addressable user memory. This seems
> like an unusual choice, but I also don't see any reason to change this
> or make it more flexible unless actual users appear.
>

I am a bit confused here. As per my understanding, RV32 supports 1GB
of lowmem only
as the page offset is set to 0xC0000000. The config option
MAXPHYSMEM_2GB is misleading
as RV32 actually allows 1GB of physical memory only. Any memory blocks beyond
DRAM + 1GB are removed in setup_bootmem. IMHO, The current config
should clarify that.

Moreover, we should add 2G split under a separate configuration if we
want to support that.

>        Arnd
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
