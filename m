Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FECC678DB
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 19:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+8Dm1CXTGLw7f6RXtQ8R8qcy0CrIT/XO9/aNVWxC4ho=; b=KJ5ryt6pM+b7P2OEaosRTMk0G+
	M6xU3frZH79pNoCo7KXVGSBI0dF9xo++EQSS2awdZQj4sLxMh1WnTeyDFWB4DqktSODvYrwODBLfG
	+1NrK8qmtH/6fD7BSI98FuOk4viiOJ3qC3Xpkp+LPuIk1mR1IzUQyAWklr+ZP0EwRXEQ0UrwGFV9C
	vZ6BAc+nTv74jjG/RjciOxP4pPRYSN31U0u/lIEohkMfH6/dTKW8Q3uLTHm5bfGISXWLJQkIECDSq
	KBXpgQFvG4ZREgkiLRat+s2Q7Fk8OKmH3B4BHssrD4J6VD8Twomrpfup27+Oc8WLgdj92LOv+NA1V
	/Ry2BE5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcvG-002EMs-W3; Tue, 07 Mar 2023 19:24:31 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcvE-002EL3-0G
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 19:24:30 +0000
Received: by mail-pj1-x102d.google.com with SMTP id cp7-20020a17090afb8700b0023756229427so17599221pjb.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 11:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678217066;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjkGAq2gRiWui6dr3Gs/IFvjJr2kIkf2c1GBI4go40E=;
        b=7AcrK+WKMdHFDafgZTUb0vue+2HrCb3Jduqyrw0Sz3Db9Q1wZoFUbbfoJ8w0ZFh8Tz
         WMnFrGfAjyV5C1xJumiNGZ2S7oYQ34EbG6VdcBNzMTd0pdR6MJKOvmtiPldZbXoPXC1s
         YQLNKK4/XletmvPzKcdgOQnowSk1MyUs8wkGOPNQX1CXBNi0GmO4O4GolA6Zq8r8u8K9
         ez3YKG72ShX6/CStptcmwPwcH8E4+NoqzZJ1Yc/VNCPsCg8ltow5QxFBCfq2/c+C2AlI
         EA47dX0F9J4oE5AGbeo+Pb7O1AtiWGt28XU0wN8I9Md8pvLf6IjUpaPR9nITxqqtrqq0
         aQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678217066;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjkGAq2gRiWui6dr3Gs/IFvjJr2kIkf2c1GBI4go40E=;
        b=zzRhLPq7v9kJpyDo/6O1T/xqukpxduyWrJ1txqBEzVz6jCoUijr42SC4Q6R8K2/ddj
         DkRNUnzrt33qXtfKQEVQCMLDOMracPFasTGMEH7g/w7dn/4BeGuGGA1bvQck4WPeJzAx
         XgFGBIW+vNywEi/BmAIecD2iEjeSBYSIwiS3LChegezLGI2uQJz7bm1y2zNdms3NZyp9
         pldrx/wnZLJlPnEyRcM3o3VppCA6u3yATaOaec6RZa/Q44VqEpp2hHd2W4Xqco05dmrJ
         R46htrjCycuY6X0KX4FPGpiqpoOaAFFjueQOhLihT7roKp0pd2iMBkdT8pVw/4+g7akk
         HMAg==
X-Gm-Message-State: AO0yUKUv7zJ+MaZr4cYCDVM6zVElH/bgrAfrn02napqhoqEj8Xz4Pg4t
	V6aJHkLwlRNJ/ngMeRjGRKc4l5SPMPdyR/wc2VQ=
X-Google-Smtp-Source: AK7set/Is4PWWXGm8vKaFd+N4Q60tAKAVCaHjO5vRpQw3R+IDYvTFr9LMpcKxvKnrQZivs1nw/nKRA==
X-Received: by 2002:a05:6a20:1613:b0:c7:60d1:81a1 with SMTP id l19-20020a056a20161300b000c760d181a1mr18519572pzj.28.1678217065845;
        Tue, 07 Mar 2023 11:24:25 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d23-20020aa78697000000b005afda149679sm8406390pfo.179.2023.03.07.11.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 11:24:25 -0800 (PST)
Date: Tue, 07 Mar 2023 11:24:25 -0800 (PST)
X-Google-Original-Date: Tue, 07 Mar 2023 11:23:37 PST (-0800)
Subject: Re: [PATCH v1 1/2] RISC-V: move zicsr/zifencei spec version check to Kconfig
In-Reply-To: <299f2b9c-d72b-4b2c-9f42-f5b71a9d05e6@spud>
CC: nathan@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
  naresh.kamboju@linaro.org, linux-riscv@lists.infradead.org, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-2a3f3a1d-d4ee-4227-ac5b-cc37c494372b@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_112428_289598_697CA3A7 
X-CRM114-Status: GOOD (  31.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 07 Mar 2023 11:14:54 PST (-0800), Conor Dooley wrote:
> On Mon, Mar 06, 2023 at 03:52:27PM -0800, Palmer Dabbelt wrote:
>> On Fri, 24 Feb 2023 09:00:09 PST (-0800), Conor Dooley wrote:
>> > On Fri, Feb 24, 2023 at 09:37:28AM -0700, Nathan Chancellor wrote:
>> > > On Thu, Feb 23, 2023 at 10:05:45PM +0000, Conor Dooley wrote:
>> > 
>> > > > ---
>> > > >  arch/riscv/Kconfig  | 10 ++++++++++
>> > > >  arch/riscv/Makefile |  5 +----
>> > > >  2 files changed, 11 insertions(+), 4 deletions(-)
>> > > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > > > index cebf0c5f8824..4eb0ef8314b3 100644
>> > > > --- a/arch/riscv/Kconfig
>> > > > +++ b/arch/riscv/Kconfig
>> > > > @@ -288,6 +288,16 @@ config ARCH_RV64I
>> > > >  >  endchoice
>> > > >  > +config TOOLCHAIN_NEEDS_SPEC_20191213
>> > > 
>> > > This symbol's name is a little confusing to me, how does the toolchain
>> > > need spec version 20191213. Maybe 'SPEC_20191213' should be something
>> > > like 'EXPLICIT_ZICSR_ZIFENCEI'? Otherwise, maybe it should be something
>> > > like 'TOOLCHAIN_HAS_DEFAULT_SPEC_20191213'? Sorry for the bikeshed but I
>> > > think most Kconfig symbols should be self describing.
>> > 
>> > Yah I can do that. I actually had this as the DEFAULT_SPEC variant
>> > before and changed it - I'll switch it to the EXPLICIT one.
>> > Thanks for taking a look Nathan :)
>> 
>> Another option here would be to use the `-misa-spec` argument for GCC, to
>> make it match LLVM's spec version.
>
> I'm not entirely sure what you're getting at.
> You're the toolchain guy, but my understanding was that gas and gcc have
> that option, but not ld, which rules out my initial interpretation. 
> Are you suggesting that we always pass -misa-spec=<pre-zicsr_zifencei> to
> gcc so that we are using the same misa-spec for both gnu and llvm
> toolchain bits?

Pretty much, I think just $(cc-option -misa-spec=2.2) should do it.  
That should also cover older GCC versions, as we added the argument long 
before we changed the default.

> My instinctive thought was that that is kinda fragile to things
> misaligning between gcc/llvm, but given I seem to end up looking at this
> every month, we're really fragile to changes in either camp anyway...

Pretty much, but in this case we're essentially just disabling a form of 
change by sticking to an ISA spec version.

> I can go spin an alternative v2 of this up if I have understood you
> correctly.

Thanks

>
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
