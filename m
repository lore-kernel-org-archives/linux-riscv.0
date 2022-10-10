Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE2EC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 13:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MvEx3Qwq4jVwwCQzZ2V7NjMI8ZnGphe1eFXJKiTn6h8=; b=0tIKKifnhJe/yX
	DbhHmmOgVFkkqR5umP5D2HiO+Jv67z7YQR4psR0poSiTnsaLONtTEte7rAzN2aoPnOdFaJlAJGv2c
	2i2aH9z+jKNxnspdxs+NYcTYKoHs48h6P2vodf07gjU72LRv4rU6dfGI8Ei1b/+WTBM/WZJMcEm/H
	8N96VSlsTCnjo9rA25jjJf62GnEXAvtnECqYEShkYwETatZPoDtpBQ3kqCbgifeQUQHH5HeEUrPWM
	WKaOTGrVUX/v864RjsSE19SS1BPbYcKXnstKLNEUK01jLro7q8KMs6Nh9USCAMdZeuyB7mjvjatZn
	MME1bEF0xYPC3ueP/6vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohsc9-000yuu-48; Mon, 10 Oct 2022 13:14:37 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohsc6-000ytz-9X
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 13:14:35 +0000
Received: by mail-lj1-x22f.google.com with SMTP id c20so738602ljj.7
        for <linux-riscv@lists.infradead.org>; Mon, 10 Oct 2022 06:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OXyeQu4pjY7czfJQbaMj9AK6RvZC9JV1U7ovRNzbT44=;
        b=l9pgHcG7BnSrXinqIZNGqO0oKd9QBp0Um2ZQROjA/OyzUDVDP4li5WZ1BwmrBo0NMd
         yeY/6aLFJfGf6ows5gAcvBuvMaAgrbT+Uc6ManoK50aqeI58XE1SlQ2hq1C7e/GcLVWQ
         5f1C4G9NyCMbtYLRREA0L7JpryofEtUdoV1abCBScZo0k6kmBrJFqz1gLTpTu51CTlvg
         lIpFYnNZwy0Mu7vUjdO/1tvgsYPej1hTosyVj8pobYJ0nAuTVQ1QOK7SX8qQhvooNC7C
         uxemMAAr75TkOvI/1IEvR/yo1pkrzMwCZvxsv6BUhsxTNMLlW9QBATERWyXoN+/ZBtaZ
         sx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXyeQu4pjY7czfJQbaMj9AK6RvZC9JV1U7ovRNzbT44=;
        b=6kCEHIsMC6VhwS045Pj/lBxt0uG+aobQBIPkTlD0F3r6Vwl6TyUz0jaAo5uH+Qxg84
         6w/roR0wP1fySWFgCTGn5AvnLwbtSViItaFrUiK+9EFa8aAiY3DBO0nqR59wZhhdpvYs
         XasJdlm3EiuSgqGRCf0v1u0Iqi0ZeCRn3hz+iA50efuVlVWKoJ2GEBoeUMwCt7u12MMZ
         FCZkSCRrFA4rYUh4+edYNqvbVKOfmlAwA91OnMVBkdI0np27BgJcO3Od6YyTHeokauZW
         QmkuLPR+U46PVE28eEcngzvsetCkKjTk+Na0AyCmLAc/RiytwPyMbiqpxGo9H+XSGMvA
         gB1g==
X-Gm-Message-State: ACrzQf1zFbzXyvQIKRL/56O+LzLr6wlfeDqhga7C3Er1fHADIx8ZY09m
	gqm9GbRlSCanDcf5jjX0yB5+s7f0/4qgXalbwjlV5i/8DZM9ug==
X-Google-Smtp-Source: AMsMyM5H8QBrSwBPLDlELP6PNp2YVhFqVvYnLuqWAR8hsw1aEyZU5jG+G437Ohm7dRrP5lHUu0kVHgyAVU/wVS3Iz6I=
X-Received: by 2002:a2e:3017:0:b0:26e:1730:9064 with SMTP id
 w23-20020a2e3017000000b0026e17309064mr6908363ljw.34.1665407672213; Mon, 10
 Oct 2022 06:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221010122726.2405153-1-heiko@sntech.de> <20221010122726.2405153-2-heiko@sntech.de>
 <CAK9=C2VHPBgL208ZHb78Nab1dQjfF6tZuKTRRT5V=vnvfODEGw@mail.gmail.com> <7864901.lvqk35OSZv@phil>
In-Reply-To: <7864901.lvqk35OSZv@phil>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 10 Oct 2022 18:44:21 +0530
Message-ID: <CAK9=C2W4doWTnqgmj9XcJtMz_eiGZ-=wA1cC=-xKd3v+2=RO6g@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] RISC-V: Cache SBI vendor values
To: Heiko Stuebner <heiko@sntech.de>
Cc: atishp@atishpatra.org, anup@brainfault.org, will@kernel.org, 
	mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com, 
	ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_061434_353493_FF925787 
X-CRM114-Status: GOOD (  25.52  )
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

On Mon, Oct 10, 2022 at 6:25 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Am Montag, 10. Oktober 2022, 14:45:45 CEST schrieb Anup Patel:
> > On Mon, Oct 10, 2022 at 5:57 PM Heiko Stuebner <heiko@sntech.de> wrote:
> > >
> > > sbi_get_mvendorid(), sbi_get_marchid() and sbi_get_mimpid() might get
> > > called multiple times, though the values of these CSRs should not change
> > > during the runtime of a specific machine.
> > >
> > > So cache the values in the functions and prevent multiple ecalls
> > > to read these values.
> > >
> > > As Andrew Jones noted, at least marchid and mimpid may be negative
> > > values when viewed as a long, so we use a separate static bool to
> > > indiciate the cached status.
> > >
> > > Suggested-by: Atish Patra <atishp@atishpatra.org>
> > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > ---
> > >  arch/riscv/kernel/sbi.c | 30 +++++++++++++++++++++++++++---
> > >  1 file changed, 27 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> > > index 775d3322b422..cc618aaa9d11 100644
> > > --- a/arch/riscv/kernel/sbi.c
> > > +++ b/arch/riscv/kernel/sbi.c
> > > @@ -625,17 +625,41 @@ static inline long sbi_get_firmware_version(void)
> > >
> > >  long sbi_get_mvendorid(void)
> > >  {
> > > -       return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
> > > +       static long id;
> > > +       static bool cached;
> > > +
> > > +       if (!cached) {
> > > +               id = __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
> > > +               cached = true;
> > > +       }
> > > +
> > > +       return id;
> > >  }
> > >
> > >  long sbi_get_marchid(void)
> > >  {
> > > -       return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
> > > +       static long id;
> > > +       static bool cached;
> >
> > This breaks for heterogeneous SMP systems (similar to big.LITTLE)
> > where HARTs will have different marchid even though they belong to
> > same CPU Vendor.
> >
> > Due to the above rationale, the patch adding marchid, mvendorid, and
> > mimpid in /proc/cpuinfo caches these values on a per-CPU basis.
>
> For people reading along, I think you mean
> https://lore.kernel.org/r/20220727043829.151794-1-apatel@ventanamicro.com

Yes, this is the patch I am referring.

>
> For my understanding, was there a reason in the past for doing the caching
> only for cpuinfo and not for every invocation of the ecalls?

The caching was done only for /proc/cpuinfo because at that point
time only "cat /proc/cpuinfo" would need these value at runtime.

Now that we have more uses of marchid, mvendorid, and mimpid,
at runtime, we should definitely have the cached values available
to other parts of kernel.

My suggestion is to keep sbi_get_xyz() functions unmodified and
instead add new functions in arch/riscv/kernel/cpu.c (on-top-of
/proc/cpuinfo patch) which allows users to read cached values of
any CPU.

For example, we could export following functions from
arch/riscv/kernel/cpu.c:
unsigned long riscv_cached_mvendorid(unsigned int cpu);
unsigned long riscv_cached_marchid(unsigned int cpu);
unsigned long riscv_cached_mimpid(unsigned int cpu);

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
