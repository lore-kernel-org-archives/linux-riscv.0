Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B913EC4708C
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 11:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXBeIkP05PiB/IEN0XLiKihF9NzEJtovqjslkbWS060=; b=CvCqIXOV9GuGi2
	ps6DXC6pI1uZ17wSDYRA5rp452XkdJrkEbujeXgOk9vhLDFDjlj/GDdZ3RwiJMmiysEDvcC20AHwr
	f6mdwR8yZr2Oub7FwbGvQ0g9T1iZZEh1vRzWH346DhU7PB9AatidIIB6YUgwWnEHoXVP3/vz6GcPo
	8xTOMIH83Ou+eOoTsoZ0e3KvE7jCgLmY4AhE0GP+I+J0JNcqolxjYOY22wLaJ5bKcGtEoYHlHFneR
	y4hVQzMSHeIqLL8s6XN0H3sD0OdLIcyJeqqVxI5KTBgAl2HVjL3eZOZNzW6U+o1vE6nH05mPtcRNX
	GMhvau7jkRgd3/w8+u0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0htf-0076U7-CK; Thu, 01 Dec 2022 11:38:31 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0htc-0076Sz-KC
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 11:38:30 +0000
Received: by mail-ej1-x632.google.com with SMTP id bj12so3462147ejb.13
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 03:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RmSe80HfKK7FckDSEcPQpoVUBo07goAUQO5ufP8u+m8=;
        b=gto4jEQ8rmQKpmOUaItlz1cLcGWBm97vuDDJShfFQGtq6ux/d2J517vmppUvppK1Hd
         qvD18tM9yHEh/h1ZhFLK6Hfi8r+63OeBX3sow55Iqwy7WBBNrel9LaXpIXMbAxYiGQXj
         fLGvSq7YHKE0xhVwtfXZZAN0oREYSqDD7SgKt7k5Hu3EtzTdr6KdWwO6YhPc3hNSp8Bv
         BXByjyqfZOc2CnjvFEZfcTTknnXZNt9MdxG4YdLNwwy24fCTMGmBnMiW9Ewe/fLq/KMa
         AcPP4jMk7ZklXk+7taX/4TfxhkP3gLEYAE1dt5P6pophujeaDdKEI6w1LEE7Fo2Z1PKu
         3Qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RmSe80HfKK7FckDSEcPQpoVUBo07goAUQO5ufP8u+m8=;
        b=q3yjIOk9NiQzFJoOjsHRTX+OyHVFiY5j9D7BXcBqUEjzOtCnL5nXF18nFeDlyodgL4
         NgLh0mNJ6v23gZcDXVBbqkVQv/EgbIVoo4yZ6JZmd1cipgaor9nxrUcGzNWFveT7eYie
         wHNbGFe2DSC9OmzfgmzTfckPDqUpJgXjW/TpDpxNKRCeE2obW9QxzcJjs0+qNikivrwY
         jmyn9cMssShUwfxQTiHokF2lXL8+rGmHV61kjnAih2RZ6qQpEB0BKp+Sm28Xs2kFIH3a
         07YnRMtQDqE9Nnv/NT/r99Q7XWRgCefccsLM9tsAxMtlRUVzCZTH3AoZ+fAnTLGwAKSr
         lbDw==
X-Gm-Message-State: ANoB5pm4aZGB3j6SwaN7/T62rWMuqxa+4meUkHiRn/+bSRE9nJupQ9Yr
	ewm7lX6kzrE7R20MVT/Ksf9daljb1pDLBA==
X-Google-Smtp-Source: AA0mqf7txX1rh2Brl7EAEXMEplhAfLo8/oa9Ruzkyri1NSVBhprWiTA/sHJhLhSoiGiC8woxCpicMQ==
X-Received: by 2002:a17:906:3109:b0:7a0:b505:cae5 with SMTP id 9-20020a170906310900b007a0b505cae5mr56576723ejx.648.1669894705512;
        Thu, 01 Dec 2022 03:38:25 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o3-20020a170906768300b007b27fc3a1ffsm1670182ejm.121.2022.12.01.03.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 03:38:25 -0800 (PST)
Date: Thu, 1 Dec 2022 12:38:24 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu,
	corbet@lwn.net, guoren@kernel.org, paul.walmsley@sifive.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 2/3] RISC-V: resort all extensions in consistent orders
Message-ID: <20221201113824.hcjijn3z45g2vohv@kamzik>
References: <20221130234125.2722364-1-conor@kernel.org>
 <20221130234125.2722364-3-conor@kernel.org>
 <20221201090041.525op4sateq5wq4y@kamzik>
 <46873028.fMDQidcC6G@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46873028.fMDQidcC6G@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_033828_698971_FE61DA49 
X-CRM114-Status: GOOD (  31.32  )
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

On Thu, Dec 01, 2022 at 11:47:04AM +0100, Heiko St=FCbner wrote:
> Am Donnerstag, 1. Dezember 2022, 10:00:41 CET schrieb Andrew Jones:
> > On Wed, Nov 30, 2022 at 11:41:25PM +0000, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > > =

> > > Ordering between each and every list of extensions is wildly
> > > inconsistent. Per discussion on the lists pick the following policy:
> > > =

> > > - The array defining order in /proc/cpuinfo follows a narrow
> > >   interpretation of the ISA specifications, described in a comment
> > >   immediately presiding it.
> > > =

> > > - All other lists of extensions are sorted alphabetically.
> > > =

> > > This will hopefully allow for easier review & future additions, and
> > > reduce conflicts between patchsets as the number of extensions grows.
> > > =

> > > Link: https://lore.kernel.org/all/20221129144742.2935581-2-conor.dool=
ey@microchip.com/
> > > Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > > I could not decide between adding an alphabetical comment to each
> > > alphabetical site or not. I did it anyway. Scream if you hate it!
> > > =

> > > I also moved a static branch thingy in this version, but that should =
not
> > > matter, right? riightt?
> > =

> > riiighttt. And it goes away with [1] anyway.
> > =

> > [1] https://lore.kernel.org/all/20221006070818.3616-1-jszhang@kernel.or=
g/
> =

> I'm not sure what became of that series since mid october, though noting
> that tightly coupling the patching to extensions alone might cause issues=
 [2]
> which some of the "features" like fast-unaligned access, that are not dir=
ectly
> bound to a isa-extension but to an implementation detail
> =

> [2] https://lore.kernel.org/all/1991071.yIU609i1g2@phil/

Jisheng said he'd send a refresh soon. Hopefully your comments will be
taken into consideration. It seems like we need both the concepts of
cpufeatures and extensions. Where many times a cpufeature directly maps
to an extension, but not always. Or, we could shoehorn the non-extension
cpufeatures into the extension framework by calling them "derived
extensions" or something.

> =

> =

> > =

> > > ---
> > >  arch/riscv/include/asm/hwcap.h | 12 +++++++-----
> > >  arch/riscv/kernel/cpu.c        |  4 ++--
> > >  arch/riscv/kernel/cpufeature.c |  6 ++++--
> > >  3 files changed, 13 insertions(+), 9 deletions(-)
> > > =

> > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/=
hwcap.h
> > > index b22525290073..ce522aad641a 100644
> > > --- a/arch/riscv/include/asm/hwcap.h
> > > +++ b/arch/riscv/include/asm/hwcap.h
> > > @@ -51,14 +51,15 @@ extern unsigned long elf_hwcap;
> > >   * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
> > >   * extensions while all the multi-letter extensions should define th=
e next
> > >   * available logical extension id.
> > > + * Entries are sorted alphabetically.
> > >   */
> > >  enum riscv_isa_ext_id {
> > >  	RISCV_ISA_EXT_SSCOFPMF =3D RISCV_ISA_EXT_BASE,
> > > +	RISCV_ISA_EXT_SSTC,
> > > +	RISCV_ISA_EXT_SVINVAL,
> > >  	RISCV_ISA_EXT_SVPBMT,
> > >  	RISCV_ISA_EXT_ZICBOM,
> > >  	RISCV_ISA_EXT_ZIHINTPAUSE,
> > > -	RISCV_ISA_EXT_SSTC,
> > > -	RISCV_ISA_EXT_SVINVAL,
> > >  	RISCV_ISA_EXT_ID_MAX =3D RISCV_ISA_EXT_MAX,
> > >  };
> > =

> > Unrelated to this patch, but every time I look at this enum I want to p=
ost
> > the diff below, but I haven't bothered, because this enum also goes away
> > with [1].
> > =

> > @@ -59,8 +59,9 @@ enum riscv_isa_ext_id {
> >         RISCV_ISA_EXT_ZIHINTPAUSE,
> >         RISCV_ISA_EXT_SSTC,
> >         RISCV_ISA_EXT_SVINVAL,
> > -       RISCV_ISA_EXT_ID_MAX =3D RISCV_ISA_EXT_MAX,
> > +       RISCV_ISA_EXT_ID_MAX
> >  };
> > +static_assert(RISCV_ISA_EXT_ID_MAX <=3D RISCV_ISA_EXT_MAX);
> =

> that sounds like a very reasonable idea ... what's keeping you? :-)

Posted :-)

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
