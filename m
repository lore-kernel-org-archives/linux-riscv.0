Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AF9C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lu5RpuxmcUu76QLPsjOv2xFEaYriT5G8h+koTTieOV8=; b=2fSqa+TAYzN5Zo
	31IYRdMre9KsnopR6zFGgN0itvbE5EIjq26b5YeRltx4cpyFynePbRlJPqOZoD+jQ1Tjl3wT2ag94
	Yox78nTtQCxr4y90ZcwXaEDSjk0Ar2rOoJHs6Cd5QiJjyzfiHHedOzckL8Rx5GbZA+HehHTucSFIm
	kfnxlaLCa8v3J/D4S2hq/inlKjNfmteYPKhBUHvfi75HFO8lK5fCczBORGN5HpxuY3O+QX+HJwuhY
	z/UnbwkM2JFSY3fagdH4N9uJjltpZw24dLtdt6BV2ibIdREa+vWGiMZf+LS7F0mle91H0HUCR5M6A
	jDm1hWUcgFV8VCtqk2vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyacx-00HVcY-7j; Fri, 25 Nov 2022 15:28:31 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyacu-00HVZv-AF
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 15:28:29 +0000
Received: by mail-ed1-x533.google.com with SMTP id e13so6832294edj.7
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 07:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XnOtugZQ8sKit8rBpEH1KbjcSR2I2daq7GWfdhsj27Y=;
        b=YCqzl8mGWfFd7KbML5P3dw9zhNfCCRbqYANdti0+Ojkzn5TPdlAr8kFc/7z/7YYNXT
         wJ7dRSUzkiCrS5PM4udLun3QAbEyFW/z4A69e9CsC+B9u8/KLw2KGF2g/UL0P3/sSQ1p
         ekCHr7ROW0l5ssPuhsBooe5OcOjuhkXWsnUwMLldqS1zqewPmdeVFHgdnFm5itF7yZcS
         8HcMrXm0v8mPkhW9p+dQoRUO5dwwgx+uSXhPcan0w6XRKxTpKRo8oyeY8I1xgZ+E3D+h
         8pnVzfwiGENkTNBJBjkgE4eyKUs7LSAyzkJshiinMclQPBpjS8LO/dFLxv1h0fJHDqTj
         aLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XnOtugZQ8sKit8rBpEH1KbjcSR2I2daq7GWfdhsj27Y=;
        b=nZqTl0247aZYLGHW2A0KEi7/YtL3als5bXE9j+TNRAwCG4tlZekJ9c4OC3xdQpKF+V
         /+RC1olox80mkraDaE2cKbosmoZJR2y9CAgbnLPim7KFQUo/qpFhAxaG9A11UVIWRW5j
         29X0Zyw6I2k2LwkiAhzsfDPUdpUDjcGQZUldUYckDhxBFVgN00E7M7gVOt1MKj1Bk7Rz
         8r/oLYX/VVSdMowesVWblXqpdGZeYt9O0x/Csy6j01L/Eg8u1DqoYW5tbyQ+tn4z7fC6
         aBVMM5kV+BNkAERXitFASg+e3OwHEdIWM06QeTfhAzRFSsJtrxQskoYnoDPK7vPI2RMX
         o7Sg==
X-Gm-Message-State: ANoB5plK31yibhfNvaiC06mEwuIMWDwt20kmIyln6slL9C7a1KbGOysP
	mDUi4lfYcnV59p+Mj4W66/HmFg==
X-Google-Smtp-Source: AA0mqf50p/O/4ckfy6IZYFc4H0X95hd5XhampZ0Np+gmJ9wPxr/ekM2ubsPhRBq5ez9EC3SbNEyTWQ==
X-Received: by 2002:a05:6402:2987:b0:45c:a9d3:d535 with SMTP id eq7-20020a056402298700b0045ca9d3d535mr35155965edb.0.1669390103572;
        Fri, 25 Nov 2022 07:28:23 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id r20-20020a170906365400b0078d9b967962sm1668623ejb.65.2022.11.25.07.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 07:28:23 -0800 (PST)
Date: Fri, 25 Nov 2022 16:28:21 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Christoph =?utf-8?Q?M=C3=BCllner?= <christoph.muellner@vrull.eu>
Cc: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com
Subject: Re: [PATCH 7/7] RISC-V: add zbb support to string functions
Message-ID: <20221125152821.ytipefad7oxv733t@kamzik>
References: <20221110164924.529386-1-heiko@sntech.de>
 <14728581.RDIVbhacDa@diego>
 <Y3/xGhkbf6qEr+5r@spud>
 <3259590.VLH7GnMWUR@phil>
 <20221125074933.2xuyaeuk5kmi5miw@kamzik>
 <CAEg0e7h9skbWPVDsz9CdB8dATN5XM9eT-uPY0A7xRZmX=qTU6A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEg0e7h9skbWPVDsz9CdB8dATN5XM9eT-uPY0A7xRZmX=qTU6A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_072828_408507_42FDE8EF 
X-CRM114-Status: GOOD (  33.41  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 25, 2022 at 12:26:42PM +0100, Christoph M=FCllner wrote:
> On Fri, Nov 25, 2022 at 8:49 AM Andrew Jones <ajones@ventanamicro.com>
> wrote:
> =

> > On Fri, Nov 25, 2022 at 12:51:54AM +0100, Heiko Stuebner wrote:
> > > Am Donnerstag, 24. November 2022, 23:32:58 CET schrieb Conor Dooley:
> > > > On Thu, Nov 24, 2022 at 11:23:08PM +0100, Heiko St=FCbner wrote:
> > ...
> > > > > > > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > > > > > > index bf9dd6764bad..66ff36a57e20 100644
> > > > > > > --- a/arch/riscv/kernel/cpu.c
> > > > > > > +++ b/arch/riscv/kernel/cpu.c
> > > > > > > @@ -166,6 +166,7 @@ static struct riscv_isa_ext_data
> > isa_ext_arr[] =3D {
> > > > > > >       __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> > > > > > >       __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> > > > > > >       __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> > > > > > > +     __RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> > > > > > >       __RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> > > > > > >       __RISCV_ISA_EXT_DATA(zihintpause,
> > RISCV_ISA_EXT_ZIHINTPAUSE),
> > > > > > >       __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> > > > > >
> > > > > > This one I do know that Palmer wants canonically ordered.
> > > >
> > > > btw, idk if you noticed but I appear to have picked canonical order=
ing
> > > > as today's thing to get confused about a lot.
> > > >
> > > > You put zbb after the S extentions - does that meant it is *not* an
> > > > "Additional Standard Extension" but rather a regular Z one?
> > >
> > > This confuses me completely now :-) .
> > >
> >
> > Can we instead post a patch to the spec that changes the order to
> > alphabetical? The only other option I see is to develop a tool which so=
rts
> > extensions and every RISC-V developer keeps it in their back pocket. A
> > kernel specific tool to check each list we want to keep sorted would be
> > nice too.
> >
> > My preference would be to change the spec to alphabetical order, though,
> > because the spec isn't explicit[*] enough to write a tool that can hand=
le
> > all cases. We'll end up needing to have conversations like this one to
> > write the tool and eventually the tool will be what everyone looks to,
> > rather than the spec...
> >
> > [*] The spec uses words like 'can', 'should', and 'conventional'.
> >
> =

> The unpriv spec is clear about the canonical order (table "Standard ISA
> extension names"):

The caption under table 27.1 does indeed declare the table defines the
canonical order and that it *must* be used for the name string, but
almost everywhere else in chapter 27 the word "should" is used to suggest
how extensions be ordered (only X-extensions say where they must be).

> 1) Base ISA
> 2) Standard Unpriv Extension (non alphabetical)

The 'non alphabetical' part makes this a PITA.

And section 27.6 says the first letter "conventionally indicates...". I
suppose we can assume it "must indicate"?

> 3) Standard Supervisor-Level Extensions

Are the conventions for the first character of S-extensions defined? I've
seen 'Ss' for "Privileged arch and Supervisor-level extensions", e.g.
Sscofpmf. 'Sv' for virtual memory (I guess) related extensions, e.g.
Svinval, and we appear to be using alphabetical order for them.

> 4) Standard Machine-Level Extensions
> 5) Non-Standard (Vendor) Extensions

Anyway, for the relatively easier problem of this kernel list and this
patch, we could do something with defines like below in order to try and
keep the order right.

/*
 * Each sub-list is sorted alphabetically.
 */
#define S_EXTENSIONS                                                    \
        __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),         \
        __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),                 \
        __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),           \
        __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),

#define Zi_EXTENSIONS                                                   \
        __RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),             \
        __RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),

#define Zb_EXTENSIONS                                                   \
        __RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZICBOM),                \

static struct riscv_isa_ext_data isa_ext_arr[] =3D {
        Zi_EXTENSIONS
        Zb_EXTENSIONS
        S_EXTENSIONS
        __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
};

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
