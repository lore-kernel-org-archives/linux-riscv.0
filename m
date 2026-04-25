Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D29BFF885C
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Apr 2026 17:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Xajdo5dQH3IIXyiHThOJxAAt/oPWypB46OtATRExw0M=; b=ciTEl1CIlHSDuU+HaVkzJjqTBm
	cRDx4g9jOoGxH76XHWekuegqxVVwFHfg3Aa9TWMwaN6Dw/PPUJRyaA3X8x2PMQVyR+Yl07XTgg+Pv
	4DD22mnDWyYbk3x6zIGGjtCK95QuIT+B879wElw5jH5sHXpDUXKT0FAJpwF9z2mwUqjQzm5HdFYTg
	HYS8qcvR0WvyhpmBhdxjdgDNVYreMKEJHV32eMyoOBjjCBVVQapGqBb1H0aUDqmQbRijnS8q2s1Ka
	eFzadT4mxqbn86Vr+PG3lGUxpSL6Tk6Rk5cD8A+lVtfBKIK84S6g8/IlbT92nRlRaRdi0pww9/k8K
	i8x/knbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh20-0000000Ebx4-1lie;
	Sat, 25 Apr 2026 17:43:04 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh1y-0000000Ebwj-04qs
	for linux-riscv@lists.infradead.org;
	Sat, 25 Apr 2026 17:43:03 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso11171800a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 25 Apr 2026 10:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777138979; cv=none;
        d=google.com; s=arc-20240605;
        b=NZxRmdnQupS7P3vcxZd0jxOzddLPTpWNdECX44W8D/UznNCHthXomIUQxFYKZvU+fK
         bUYlim+aF0zJzAYCumPNNBOeOBX+8CXco8FfsmIl8lx2G6jiL564Fx78FY1HGxznUDJo
         139RjUyciYBFxQh1Q5/lv7zgq+TNs8n7qgTCFFJrOsQii80vtL9MIVuxm1m4197w0FDq
         FX43aLuP1BhZ6Xol2jSvVUGP7lQ8jmODDMI0DITqz6+eApFSbytY43PF/7D7mXhfXoz9
         hNLYiXOIScVqQC6SF+i4M6GsOZsm5I8RfzG7Xd9FoJu2nIDPEaF2d7zYkv1eDYDKc3kw
         Id+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=xUnf6oBXpPDr/AME5JCO3vy/O3p//7sMhG4iQNub98Q=;
        fh=MtSxy/evDdeoqND2pOFOFLytnoKtLTYktHPuO6HkzLU=;
        b=IQkZfSEyuMTsYz1XuYfO9j6NZeoxs2V3/d1eWwSAN8d89FTbVas0t7eCmYU36FdXlt
         gRKRRoEybSYT1SpmLF1roOFUzqfAC0Ajb3aPCuoj/LJwqS+5EXnUn4NJ6HpDxwAY9nsm
         4Vi3TLW+zxAIoLQUcD2JxeAr1QxyPa5drHxxjObhEJlFeuJ+CmqK5NwASYsHcu/mwkoQ
         4jhPVn7//GBPCbwDGuuBZOTifoL162T0OH3nMn5aZb9vnIiIH1JHOwVFJD2JZIQSzI2Q
         qoUglLAJcUmis8BEQRbxWuI3Q0ITKNUlAbtQXIHc5m3rPrUntW+hYCPYkQuU0qaz6Ng+
         vzdg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777138979; x=1777743779; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xUnf6oBXpPDr/AME5JCO3vy/O3p//7sMhG4iQNub98Q=;
        b=C94nKpJztz802LwfF72vKiFgADJWdbLO7krD1hYT2BQQyCP3SxBfS7CkRvEqxA6NZi
         0qbI92/0NnPXQXsDEcBZoSUO7IrD2S5bAYRwevqwAkS6SE5U2Nob5X/07rZLHnsKzIrI
         bRhNK5bD1R9nfPaH426YU447lFP1hjTEvGWHbzDzldHxIZXfOrPskEH+S9lj2XjHH2g7
         8jEqJgJsOAnQfM5QFxXwON6mRlnQqJjYwoTxW+t09G0pmIfprtTKa9XpQrLeXnBHZeN0
         U1PoSFT0gEAFmUs/SZ8n6sWmWYHm+FYeA1Brb8NMldSpWiKoe2uyeO7SFcyewgUV+g0Y
         R1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777138979; x=1777743779;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUnf6oBXpPDr/AME5JCO3vy/O3p//7sMhG4iQNub98Q=;
        b=XYXZejbwlDWkiRuLGVmpQ/UvXRxg1Xr5xc5q2FOfTmaJhHRz0JTCsAqpgAW2rdUiQ8
         JHcCwY8VIQDOsfw5KltHntcnr5mhLY4urDlYgkXBORgMro35Rixf96lHB4M7YPJJhCbk
         9oe8PTBbhBxXT9yNdmlOxRj4jpdlIOboPDKJjajJPqNl+mBW1jJdHkyQDMdwBmoDTNze
         1DvzobeGTy+c24QdLVX1lGjuCRBzJYUegELVBwwSd/jA59WmJ9VTmMJN5jbJEm1aKgCE
         qJ8lKN5P7MZu0ZBgcJQwDoHsyAQ1+qDeZTP2WqEzz7aoHOD6MOUxNkDXG37X6yRsRdn6
         Iyeg==
X-Forwarded-Encrypted: i=1; AFNElJ/b6xiSwRKn+XR7+D4NrLGL+bDExaTmTAds3ZQymQf1cFuHfKsUyPio5tdD+ciKAjQTs7XIJF3pglxpSA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1j47RqtPplBkgT4yVrLsvbg0aCAM09GstN3NAnRmWKal2JVLY
	LCyM9hVnY6EqzwPaUGFuUZR3/fVdqzhtjKEFh7Lo0EOaoVx8NpzoHrF+/q2enqnCebewFxK5ES1
	TZIwpAL3daS+ER1EtL2CqLIPmD2FDhdI=
X-Gm-Gg: AeBDiesqcllErz7i4ggq1Ika90xrbEwvwGVudRpuulJdI0CTRaHBDJl6yQukX1L/nJI
	L8v80EDKuaP1FyE9N21eL91+NhHkD5i16+JxPO77K/fH7GHeW6jFJkZ1yzI9njcDsnXEgYsTrPm
	DrhpZJ+qy1EW4kQcJHoTxBarb9J2vaRdAfDN5EeCuP1W12HiQot6YHaJ8v2PgvQlbRkzazngfec
	MZqg8HzkiqlVr2A9ZYXe9rDFLHU6cRcUClD3pxbeRiQ3KuqW/OfJUDHw3N6QlJjMjtKqPVnzCvc
	OyBQIy3bWgQUWKjIq6fTNHLNGg==
X-Received: by 2002:a17:906:c102:b0:bac:bef1:ba7f with SMTP id
 a640c23a62f3a-bacbef1bad6mr551230466b.15.1777138979164; Sat, 25 Apr 2026
 10:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev>
 <f9079774-1d16-4b84-bf85-bc8444e93446@iscas.ac.cn> <DH40Z14EHV40.1I443BTRU720F@linux.dev>
 <c1f466f8-4e76-43a2-a7a2-126415fd1f56@sifive.com> <aeqF0EiP4b2Ycj2G@aurel32.net>
In-Reply-To: <aeqF0EiP4b2Ycj2G@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 25 Apr 2026 23:12:42 +0530
X-Gm-Features: AQROBzBPmeIcW1xL_TqQUGWkzBoEhk5c1YsiuySgCnNJppebDIf71sz4IQec4SI
Message-ID: <CANAwSgR-rJ0O9SJc92z05NVez6ZSfn9Gx8fJr3Be3QfCpR_XBA@mail.gmail.com>
Subject: Re: [PATCH RFC] riscv: disable local interrupts and stop other CPUs
 before restart
To: Samuel Holland <samuel.holland@sifive.com>, Troy Mitchell <troy.mitchell@linux.dev>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_104302_086449_4F402D8F 
X-CRM114-Status: GOOD (  26.71  )
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

Hi All,

On Fri, 24 Apr 2026 at 02:21, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi,
>
> On 2026-03-16 08:19, Samuel Holland wrote:
> > Hi Troy,
> >
> > On 2026-03-16 2:23 AM, Troy Mitchell wrote:
> > >> I think the reason we ended up with the "unsafe" implementations of the
> > >> reboot/shutdown functions is that on the backend it is usually SBI SRST
> > >> calls, which can protect itself from other CPUs and interrupts. Since on
> > >> K1 we're going to be poking I2C directly, we run into the problem
> > >> described above. So all of these should disable interrupts and stop
> > >> other CPUs before calling the handlers, and can't assume the handlers
> > >> are all SBI SRST.
> > > Yes, we cannot assume that all platforms rely on this.
> >
> > Why isn't K1 using the SBI SRST extension? Resetting the platform from S-mode
> > directly causes problems if you ever want to run another supervisor domain (for
> > example a TEE or EFI runtime services), which may need to clean up before a
> > system reset.
> >
> > As you mention, other platforms use the standard SBI SRST interface, event if
> > they need to poke a PMIC to perform a system reset. Is there something
> > preventing K1 from following this path?
>
> I went this path and submitted a patchset to OpenSBI mailing list doing
> that:
> https://lore.kernel.org/opensbi/20260419150857.2705843-1-aurelien@aurel32.net/T/#t
>
I just wanted to check if we can use the latest OpenSBI image with
vendor u-boot ?
If so, can you share the details of flash the u-boot and OpenSBI binaries? .

I was working on the watchdog driver, and the system hangs at reboot
So, what changes do we need to make in OpenSBI to handle this issue?

> Regards
> Aurelien
>
Thanks
-Anand
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
