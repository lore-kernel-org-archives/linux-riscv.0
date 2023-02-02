Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772C8C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 15:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DzA6WN+e1pr1Va5pz0uWd8FINHHzyc8Ojn7Y+clBkig=; b=M2PygPs2bpdTs1
	cTK6Eiedp/6nJgkwgSHf0QvURLYv0xOJSxdWZ3fJD/+vOIqUPvryxQCeutdyhPlV3kRXP+lu+2Qls
	hykt41o8tTgKu3L40l64KeyYcevhbKpngnj0Uf43zz/szEXEKjeUXIPSb6ac2upaN4r9ffZJUD1tj
	pvJFoWJpCtYXy5j0/kcGa5d/V/aD9ESm5F/Ao3Nk8gAVaM2meTyBNSd4M8rSPUUIMM52mquaUL2gJ
	ZbA4/GyyRdy+7FxGw5HsQg8E85aVc0MsjYo3rGiCRB/XbLKqYwaed8t0raMkzxaNAWvVDkQfuKCqg
	kly2GDEs7qlXxx4YCqkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNbHd-00GI3c-2t; Thu, 02 Feb 2023 15:13:53 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNbHa-00GI27-9R
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 15:13:51 +0000
Received: by mail-wm1-x333.google.com with SMTP id o36so1666634wms.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 07:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A/2NI3lAioM2OTclBfdU2ZsaZSzkr/eN0mg0uuV+D60=;
        b=nsupH4Fi24wLtGHU5Dbw4Jh3WG9CfW4pqq9a1sHGB+javoh5dxGAuWRLXXNzMGzwqT
         FkCjcYVdn7SurKbB3MyukDy4UPGxC7UCLFNO20dWx6WpT77dqvpad0DF0YE886ADJHGz
         Mie3V4w/bfN7uj5pBVwGzyC/csxHJW08xkX1/r/QAEuU7bhkgd0c5RpuRslddtxDh2tw
         PNu4UqbA8M74OCpLBBLPq3SB3pVpExbt//65NUw2WBMsx5/lbO8FS2DBFsI0mtY5iZvN
         A2dmCG/Fzma51At3XYpS4wvWj8m8IKh6YEWilwPcyqx2jYqKawgnsgIz4d7oxvrt0moS
         bRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/2NI3lAioM2OTclBfdU2ZsaZSzkr/eN0mg0uuV+D60=;
        b=wbNX6DHZhlzWz1RzvxerUClU+OrA+VlB7Xs0JaXMKCcficcXAFmcxuY0FPDTEQr6oT
         U6I6Ou6kWuv9VhLt3a76z9zahbySFXfvTs7HRLd8Nn1vjwfhsmacJKmgzcuk60EAW8Lc
         1rOiIVOB6kUaaw+EtWwg0RsrmI4cf0ppbSLifwgmyGk3Q5JXywZjmOCErVjcbHPA2Nku
         VArc1ulmMDsRJpK043FC9WSuFXFKiak75r8yT5p9Uf3aZSK4Q//t04F19mnwgUuqECC/
         O0uq7b7q878zYQCoYkacFaSYC/0YK/4QqHxGqf+8SftEo3miWlT5HjWtePK9qUtSGn2v
         HmtA==
X-Gm-Message-State: AO0yUKV1gszxr0PsHAIeR6kf0uqd1qXimbml97BPycTQ6mRFieFQR1Bw
	F91e893Sj2lxzx9C8hw2AuZvyHrR7SleTcjUdJ9lYQ==
X-Google-Smtp-Source: AK7set+MR2UlC0HbNr/VBNUEc7Jc4dECbiMtMqU/kkRfKYcOE9yxeXWjbrfQfbAwZ/2UVZX6EZPD0mSApe0wXb9kOQk=
X-Received: by 2002:a05:600c:3c90:b0:3dd:1b76:2f8c with SMTP id
 bg16-20020a05600c3c9000b003dd1b762f8cmr205549wmb.5.1675350826411; Thu, 02 Feb
 2023 07:13:46 -0800 (PST)
MIME-Version: 1.0
References: <20230131151115.1972740-1-alexghiti@rivosinc.com>
 <Y9lrB+RUBk1Njhaq@spud> <CAHVXubh+DgdgXZ-hHk5rxmQkXSBdk1AvTr3dvT80L5YXQZF=sw@mail.gmail.com>
In-Reply-To: <CAHVXubh+DgdgXZ-hHk5rxmQkXSBdk1AvTr3dvT80L5YXQZF=sw@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 2 Feb 2023 16:13:35 +0100
Message-ID: <CAHVXubjeSMvfTPnvrnYRupOGx6+vUvUGfRS3piTeo=TH2cHKNg@mail.gmail.com>
Subject: Re: [PATCH v4 0/1] riscv: Allow to downgrade paging mode from the
 command line
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_071350_350204_588F0274 
X-CRM114-Status: GOOD (  27.31  )
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

On Thu, Feb 2, 2023 at 4:07 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> Hi Conor,
>
> On Tue, Jan 31, 2023 at 8:25 PM Conor Dooley <conor@kernel.org> wrote:
> >
> > Hey Alex,
> >
> > On Tue, Jan 31, 2023 at 04:11:14PM +0100, Alexandre Ghiti wrote:
> > > This new version gets rid of the limitation that prevented KASAN kernels
> > > to use the newly introduced parameters.
> >
> > What's the base commit for this version?

And to answer your question: this patch applies nicely on top of
v6.2-rc6 + my KASAN patchset
(https://patchwork.kernel.org/project/linux-riscv/list/?series=715388)

> > Fails to apply for me on top of for-next, fixes, rc1, and linux-next :/
> > I also tried it on top of your KASAN series, but no luck there either!
>
> Really sorry about that, that's the second time it happens, I'll
> improve my workflow: I'll include the base-commit sha1/tag + a link to
> all needed-but-not-yet-upstreamed patches.
>
> Thanks for your time,
>
> Alex
>
> >
> > Thanks,
> > Conor.
> >
> > > While looking into KASLR, I fell onto commit aacd149b6238 ("arm64: head:
> > > avoid relocating the kernel twice for KASLR"): it allows to use the fdt
> > > functions very early in the boot process with KASAN enabled by simply
> > > compiling a new version of those functions without instrumentation.
> > >
> > > I had to change the handling of the command line parsing to make the
> > > code self-contained in kernel/pi/cmd_early.c to avoid calling too many
> > > __pi prefixed functions from outside this file.
> > >
> > > I'll use this approach like arm64 to handle the extraction of the random
> > > seedi from the device tree for KASLR.
> > >
> > > @Ard: I copied the "pi" name but I have to admit I don't know what it
> > > means.
> > >
> > > Alexandre Ghiti (1):
> > >   riscv: Allow to downgrade paging mode from the command line
> > >
> > >  .../admin-guide/kernel-parameters.txt         |  5 +-
> > >  arch/riscv/kernel/Makefile                    |  2 +
> > >  arch/riscv/kernel/pi/Makefile                 | 34 ++++++++++++
> > >  arch/riscv/kernel/pi/cmdline_early.c          | 52 +++++++++++++++++++
> > >  arch/riscv/lib/memcpy.S                       |  2 +
> > >  arch/riscv/lib/memmove.S                      |  2 +
> > >  arch/riscv/mm/init.c                          | 36 ++++++++++---
> > >  7 files changed, 126 insertions(+), 7 deletions(-)
> > >  create mode 100644 arch/riscv/kernel/pi/Makefile
> > >  create mode 100644 arch/riscv/kernel/pi/cmdline_early.c
> > >
> > > --
> > > 2.37.2
> > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
