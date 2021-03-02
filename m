Return-Path: <SRS0=b61k=IA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B3EC433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Mar 2021 08:20:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AEB964DE5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Mar 2021 08:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AEB964DE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WUG9Q/efNiyhWW6Yq0JFaXWfL/NkT1zdmKoEm8bvlXw=; b=PxR7gzOr+xiTWByZ6ra5fokxC
	eKzEECE/cHSbjYOEUyaRjuQIDtMoXbIVuO5ZbGc8oq0b7YmZ22u9+AZInZu7O/OoLSSQHiPMUzqRv
	aZnICrY7r3bzNazf5D+p2AMw8348NSdAdY2QYMYwCCz6Xq7bu3KruPw7VYgcCCfJHpB3duj5koSpN
	/akTsURYqIdvj862ps5IrhxOayWOm7lbtq0+uNgo3u7AkaQ6fdPnJvNXNEYYI4MEfXK8rt4QHt2YS
	B9MgMd15zbavyqycIixKiJr2TOtvYEowflJC1ueARoYG57KD9A14pZ8mPI/2Vvv5bjqCmzFZm1+pN
	GddcikQ8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lH0GZ-0001dJ-Vn; Tue, 02 Mar 2021 08:20:28 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lH0GX-0001ca-FG
 for linux-riscv@lists.infradead.org; Tue, 02 Mar 2021 08:20:26 +0000
Received: by mail-io1-xd2a.google.com with SMTP id a7so20780069iok.12
 for <linux-riscv@lists.infradead.org>; Tue, 02 Mar 2021 00:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sDuDnsFMqV9+X0Jh1lVYmTLzTGbGc2E8CItu/iD22aM=;
 b=UmOKbW0MuoTT1MQU4B9OwehFVPMZxAeTU+KHFRl2tygI6MchE/YxSLsC1m4AxqgzPq
 biv8aKgN54ojUsmK9tU2TBdY4WVFprgz8/s+LhTTcecJZde6CvnIFMhk16RFpzo54c1h
 cRGbJmyb4AHG04Si4xoTNP7ee82WH5SwqWtcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sDuDnsFMqV9+X0Jh1lVYmTLzTGbGc2E8CItu/iD22aM=;
 b=NWlJfYL0XcTZwfSMIdp2OCqK4EVSl1NTm4k7c/yBg6s6kike+JLTBqTJunMQSBPEWs
 UbV3iTsf6n8ob3+SAYI8qc6Cx0XpZTHMgmQxQdWvPFCWIJP5YsvQJHCN4junwoTkgcsP
 5LbtyyOhKwysZr1ojPUCw+/bXJ95cSzDbdHyfN87JGvKHHfc1TQ1+q9ChLiCVAzpuBZQ
 zZlU7RGWYZd28Jru7+C+ISaRwJeKkxC3RP27qdrfNWC48963mLkIQXZFqfaYC46Hz16R
 Ju3YvPBPmKKQVIzHC5s1mSK98EqPqLVo3eVVNrC1Fdy6RyZ5xxI3AEIHWmiuYtc2O46m
 uLdA==
X-Gm-Message-State: AOAM532iJGBJ8m6hS0bnVrSnYjqxVJVtWioYeKlFIhpTrk2CV2o8CYdH
 VcsoXdIsjtgPpTtQpMBQqM4x1vVErDv7F6z6JCoX
X-Google-Smtp-Source: ABdhPJyhieS4GgZoXIF8uYedg6POZWDvPfwF5BddAlbTPNOHuXnXFl25QoUF16QeVxrbXLSxG/dSzwv7wGlu8XEdX7o=
X-Received: by 2002:a05:6602:2d0d:: with SMTP id
 c13mr17266978iow.51.1614673223374; 
 Tue, 02 Mar 2021 00:20:23 -0800 (PST)
MIME-Version: 1.0
References: <350c7458-c77b-56de-de5e-8c96ce9c16ae@huawei.com>
 <CAOnJCU+v=O1u1yK0UD7JYJAhzGmFmCLQk4yP8aZuJX-QoT5UWg@mail.gmail.com>
 <89b97904-e069-35cd-0a42-217cafe17e15@huawei.com>
 <CAOnJCU+HWA2znErbiiqEVWMkKtEfsyhXEwGEy_x2PqDzff4PXg@mail.gmail.com>
 <6bf9e8b6-55bf-f480-c316-d69fe6018ca0@huawei.com>
 <CAMj1kXGi3=pDA_WTXRuBifrxku728p_A55wsQ+MTAJDe2sZQNA@mail.gmail.com>
In-Reply-To: <CAMj1kXGi3=pDA_WTXRuBifrxku728p_A55wsQ+MTAJDe2sZQNA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 2 Mar 2021 00:20:12 -0800
Message-ID: <CAOnJCULm4gGxikjN4eArY2n-7i2T30q=08uODP_sFXjzUkRz2Q@mail.gmail.com>
Subject: Re: question about RISCV EFI stub support
To: Ard Biesheuvel <ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_032025_550175_5DDA8652 
X-CRM114-Status: GOOD (  23.70  )
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
Cc: Atish Patra <atish.patra@wdc.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 1, 2021 at 10:16 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Mon, 1 Mar 2021 at 15:43, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> >
> > + Palmer, sorry forget add to cc list...
> >
> > On 2021/2/25 10:00, Atish Patra wrote:
> > > On Wed, Feb 24, 2021 at 5:29 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> > >>
> > >> On 2021/2/25 7:35, Atish Patra wrote:
> > >>> On Wed, Feb 24, 2021 at 3:14 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> > >>>> Hi Atish and Ard,
> > >>>>
> > >>>> The commit "cb7d2dd5612a RISC-V: Add PE/COFF header for EFI stub" use
> > >>>> c.li to
> > >>>>
> > >>>> add Magic "MZ" signature for PE/COFF header, which select RISCV_ISA_C,
> > >>>> but "C"
> > >>>>
> > >>>> to the ISA is optional,  and if "C" is not support ,  EFI boot is not
> > >>>> supported.
> > >>>>
> > >>>> Could we use ".word MZ_MAGIC" like x86 code or some other way to support
> > >>>> "MZ" signature?
> > >>>>
> > >>> .word won't work but .short will. With .word, you end up 0000 in the 2
> > >>> bytes which can be interpreted as illegal instruction.
> > >> Yes, should use ".short" in RV.
> > >>> I guess your larger objective is to make the C extension optional and
> > >>> not enabled by default for the Linux kernel.
> > >> "C" extension is optional, and the upstream kernel has the RISCV_ISA_C which
> > >>
> > >> could be configurable.  and I think the EFI_STUB should not depend or
> > >> select it,
> > >>
> > >> and maybe we only want to support RV64G in some cases,  what's your option?
> > >>
> > > I think RISCV_ISA_C was enabled by default just to generate a smaller
> > > binary size.
> > > @palmer : was there any other reason ?
> >
> > Any comment about the too issue,
> >
> > 1)  directly use .shout MZ_MAGIC to decouple EFI_STUB and RISCV_ISA_C.
> >
> > 2)  don't set RISCV_ISA_C  to default y
> >
>
> But doesn't that break non-EFI boot with the same image? The opcode
> still needs to be executable, and have close-to-NOP semantics.

Correct. It will break non-EFI boot for the hardware if the platform
doesn't support C extension.
Theoretically, we can decouple EFI_STUB & RISCV_ISA_C. But that's
useless as the hardware has to support C anyways.
Apologies for not seeing this through.

If a platform doesn't have a C extension, they can not use the EFI
booting method.
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
