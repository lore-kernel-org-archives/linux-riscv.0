Return-Path: <SRS0=gGBx=QO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC48C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 07:20:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD3CF2075C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 07:20:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rZzl3V0Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="KlfLI9w8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD3CF2075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EiC76ytAFNPetRMpqfYq7rjscg6MLlU+fXpIt7+2h4s=; b=rZzl3V0Y9bT2lk
	X56TX47PeICUXPM9hfPEr6DDEfyEfy3AqA24ah8bOBCLpMhJRGw6GxgeZmTnl5C+urV6AQ6cXuYae
	rPJYTwGIrh26cUFRsVRiatmzXVxv+yarvyf4pruJ2IWHoISI2U71fGfZwzzLb2Fv/QgWHtEPhnFpg
	ypddAFQ2r4UILmKLtckZfIXBcGe4emNYkhlYdm9eKYDrRSo59URdwUyqbJOP+8ZwX4WhYzjbKLyR5
	Ooy4N1hS1Q6Oiu/98SbzPlAcA4FzOpsEbHICWleP+Ej8jWRriqt3Ja9iBk2SLl4tcyTV6UqdZg+yO
	0oIbhZuD7cqUUmctuPIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grdyo-0002e0-GX; Thu, 07 Feb 2019 07:20:14 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grdyl-0002dZ-8N
 for linux-riscv@lists.infradead.org; Thu, 07 Feb 2019 07:20:12 +0000
Received: by mail-wm1-x342.google.com with SMTP id q21so5468281wmc.5
 for <linux-riscv@lists.infradead.org>; Wed, 06 Feb 2019 23:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ok9arV0erwFU9gErTtk4U6AtJqFT5CXDqIZiChxlPHA=;
 b=KlfLI9w8PvIz6mEfoiAlgY44PAxzyx0tv9H1T+QyQ0TD2xm3BrG5lMoV5dV2m/T4AB
 x/uudoG/5wvTjPHGibqouDV9NN/KBbWuaHLENhzmDnpKP/hS5xZUAL1Bn++Vcr+2Rb9R
 KYepmZQYPLmgms76NrEY2MK92rHHw9+6iPTkLw5cnHNjwp0Un1VAnXgXgBEPwZmuzN9h
 4KhxaOEXPTHXeYDIAQj1K5w4JurjqAbUDtRLf1SdaDLz6Y2uIqSLjrilKPpeqE+kS+il
 iBNRsrbiVEUUXyyd3FQmKhJQ36pehCSlWs9NP8MlOMzBnKR3ibCwWhzHweaB0KY96BnC
 RMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ok9arV0erwFU9gErTtk4U6AtJqFT5CXDqIZiChxlPHA=;
 b=AicGg+ItKaKUBseL7kvf22Rnb+vYUtbUe+oAk07S3R+OuLDtTDmstHCcCRGnZLpDWa
 ioddOFNZeRR55qUYVuC+DGhHv5Euhqiij1e5e/yy1LsCQ/HB/ebDTyjVNVn3w3a0BCen
 px0lg2CspK4noNx29Kkop5d3aG9Nq/czmX05WlOYuLOlXeLSMq08m+Z8YzNsao32loFN
 2LPDyuGdLj/CGueF5QGHpUjRaorOrakyJPHqo6tXw57S+khZgAr8G5MR9Xjn6VZQEygc
 luVUYKEWdghPZ28jdktUEv+xv5o6zibaGPn6Hmn98wb0HQ18Pl+ev98rMHsqgT5anQ+i
 Lgxg==
X-Gm-Message-State: AHQUAubBRu2P/FLrgfgA5SmgdHBiZSsaNO59ZoU1chHgDcYQ1kpLm14g
 VMnpQ1Ver4ggJ/xtPpZDjkBzeakKPQzDY7b3RBeG9Q==
X-Google-Smtp-Source: AHgI3Ib2DwMpCA4rhY+pNzakfP/8tUBNOG6/2kB6vuDP9suV6XFRdgSI0eIiDL9Mg+nEG2aXiPf1q7qKfMzx2BVdCCk=
X-Received: by 2002:a1c:d082:: with SMTP id h124mr5710102wmg.21.1549524009069; 
 Wed, 06 Feb 2019 23:20:09 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
 <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
 <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
 <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
 <033872b8-49d5-2731-118f-967488f4763f@suse.de>
 <CAP6exYJRhw=nnhdrNQc7wOBUTYk0-LNaRQrhin7fqxeXMrEhkQ@mail.gmail.com>
 <22450f8b5b18421e486985725b1a58167662fd2d.camel@kernel.crashing.org>
 <CAPhv3nqQRC=jsLuheFPa1=qj7_rZ4D9q8nTr_yK7qeotobPbnA@mail.gmail.com>
 <CAP6exYJNWRuW6P3BXu6XfcZOKiCECjsv3SJQ14uMxQY0Ypg1pQ@mail.gmail.com>
 <alpine.DEB.2.21.9999.1902061914480.6518@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1902061914480.6518@viisi.sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 7 Feb 2019 12:49:57 +0530
Message-ID: <CAAhSdy2EfSDbiqWD0izNcifdyj4ErsDF_EK_5=_yHHoTMj9SeA@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_232011_345707_A4EFEBAD 
X-CRM114-Status: GOOD (  18.50  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Christoph Hellwig <hch@infradead.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>, Atish Patra <atish.patra@wdc.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 "zong@andestech.com" <zong@andestech.com>, ron minnich <rminnich@gmail.com>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 =?UTF-8?Q?Lu=C3=ADs_Marques?= <luismarques@lowrisc.org>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

(Sorry for spamming, my previous reply got rejected by googlegroups).

On Thu, Feb 7, 2019 at 9:26 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> On Tue, 5 Feb 2019, ron minnich wrote:
>
> > While I respect the tremendous amount of work the OpenSBI authors have
> > done, I agree with Benjamin and Luis.
>
> There are a few key points that seem to be getting lost in this
> discussion:
>
> 1. OpenSBI is a sample implementation of the SBI interface, and is not the
> SBI standard itself
>
> 2. It is optional to implement the SBI, and it's likely that only certain
> types of platforms will do so
>
> 3. OpenSBI, from my point of view, consists of two distinct components:
>         a. libraries that can be used as reference implementations by
>            other early boot firmware; and
>         b. sample early boot firmware that replaces riscv-pk

I would like to clarify that reference firmwares provided by OpenSBI
only provide RUNTIME services (i.e. handle SBI calls and M-mode traps)
so they are not early boot firmware.

The OpenSBI reference firmwares are not suitable to be used as ROM
firmware (e.g. ZSBL) or LOADER (e.g. FSBL) firmware. They are only
RUNTIME firmwares designed to replace BBL.

Further, it is not mandatory to use OpenSBI reference firmwares as-is
and HW vendors can simply create their own RUNTIME firmware (
probably link it o OpenSBI library).

>
> As far as I can tell, as long as the platform specification standards are
> written correctly, there's no conflict between SBI-based platforms and
> SBI-less platforms.
>
> > There is a further issue that occurred to me doing their excellent
> > FOSDEM talk, which is that nowhere in this has any kind of verified
> > boot scenario been discussed, and if you don't get that thinking in
> > from the start it is very hard to wedge it in later.
>
> Verified boot seems almost completely orthogonal to OpenSBI's library
> implementation (3a, above).  U-boot, or Grub, or Coreboot, could reuse the
> OpenSBI libraries, but not the OpenSBI early boot firmware.  Then those
> other bootloaders can implement whatever verified/trusted/secure boot
> approach that they wish.
>
> As 3b mentions above, the OpenSBI repository also contains sample early
> boot firmware.  That part of OpenSBI would clearly need to be modified to
> support some sort of verified boot.  However, no one to my knowledge is
> proposing to make the OpenSBI sample early boot firmware a RISC-V
> standard.  That part of OpenSBL is just a sample first-stage bootloader
> implementation - the same way that U-boot SPL or Coreboot romstage are
> sample first-stage bootloader implementations.
>
> ...
>
> I personally am excited to finally be able to use U-boot's rich
> commandline interface and device drivers without needing to have riscv-pk
> (aka BBL) involved.  Those who are not doing active RISC-V Linux
> development may not be aware that the use of riscv-pk made it very
> difficult to use upstream-focused Linux DT data.  Even though I might have
> slightly different preferences for the current boot flow, their work
> removes a major obstacle from RISC-V Linux upstream development, and is a
> big step forward.
>
>
> - Paul

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
