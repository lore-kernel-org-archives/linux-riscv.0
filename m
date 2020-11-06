Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6104CC2D0A3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 07:38:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCD9B2071A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 07:38:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y6i9fKVL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="RTsENuCe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCD9B2071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YhVc/qpFHQm7WIM7zIzdy0eztFKc8xh8J1M8tH8Zdd4=; b=Y6i9fKVLFSIj7gDvHOsma7+Tp
	mhGr7yRWh0oMQoa+dG85i4e6y/XUu/20CUG8yOPjCjuo65MP0fvW5jbX2f1s3TWQAPpo/VryyuIKF
	u2DhD3YJFd6FMjOBmLCGaokJCk9Nm9ZKGU+3NbqaFsfK5A6u9xWh6XiXW6SURzZ4nRuW5ypHXoVv/
	mRAk6s3adzMDOXecx7kZQ364qFGi3e4ROqa1U2RPDuY4XI0o9wRaarTI0l4esUU0N70NL3OfMrVZr
	ju9bgPQ9NvQImLOxegXWv2sDks1bhisbjMOTUja3Xw+nI2HNnODQ4OhFQpazT51vS5uz2j+WmYJ1k
	st7TRxOZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kawJv-0005Qh-9p; Fri, 06 Nov 2020 07:38:03 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kawJt-0005Px-79
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 07:38:02 +0000
Received: by mail-il1-x142.google.com with SMTP id k1so272418ilc.10
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 23:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aQB4ocSHoyHmpaIbRxFj/zt6XeUHDR7wBHeEyE4bZfQ=;
 b=RTsENuCeCOpH73nAqLoeSA8PnD2zhQpcop4R++RTXBfDDPYpcj5zxao2ls+it7Jbbc
 LpSMJBNT9K/5TF5LylVK2+P26EjNPL4ZjGOH4ngNffiea15xSmo/RgBDj1zwhxQehnE7
 bAeKKD0dDcHV0XQg0465baqRrt8CeFC9dpK3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aQB4ocSHoyHmpaIbRxFj/zt6XeUHDR7wBHeEyE4bZfQ=;
 b=D//IgjZMCjc4zrqFVPRtwIor934i5J0A+66VaidtLIUp7PtdC+QZ74fl6KGOVsQsCv
 QknYkRJOKurfATuK/M10F28OJEUVjB1eij3r7X/aqbgf7rILqIt2akg1NsGg27/7M1e0
 HQCqs/3rrsQxBvRLVhbXVdxUkBeAjfSd3e5cIqpmNf3gOcSi5x6Ffy6Ck3/E3Vtjh3Fb
 MDpXFUJL9dh+82Bs0wQM+Mhbl+I6cc6w94jcHIezosSSIHbQrJASMdsABMoURyiyGNDw
 alez50wbKQgETvsbZ+5bZDE3YJbSTCFEzwMCu1vaGJDcxWFFMTeX0kstkoLUjUFbELh5
 /56g==
X-Gm-Message-State: AOAM531SmR1Yc0UCotEN5xsTHpkv8JzlctkWckcj6o6a2EMEtHZ0KpUO
 491IOtcVh7+CS3j3hLXgA+AN0bi4IMAz/WMnVt5O
X-Google-Smtp-Source: ABdhPJzim1SBWXT2HkwUxRQYC66JPOOSOS7b965ESES+ZyL8w7EM2XoU657RReCH3oyTptlRc3S7dz8Y3knO6Kjv4LA=
X-Received: by 2002:a92:6410:: with SMTP id y16mr510995ilb.126.1604648278164; 
 Thu, 05 Nov 2020 23:37:58 -0800 (PST)
MIME-Version: 1.0
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <mhng-3a4619db-fe42-4ae0-a521-4032f23591ee@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-3a4619db-fe42-4ae0-a521-4032f23591ee@palmerdabbelt-glaptop1>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 5 Nov 2020 23:37:45 -0800
Message-ID: <CAOnJCUJUmzVon3BWH6Du08mpgLu_rHJEhdOkCXUK4N+ZftkCRw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Add Microchip PolarFire Soc Support
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_023801_277344_33DF4540 
X-CRM114-Status: GOOD (  30.61  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Padmarao Begari <padmarao.begari@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 5, 2020 at 11:14 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 28 Oct 2020 16:27:56 PDT (-0700), Atish Patra wrote:
> > This series adds minimal support for Microchip Polar Fire Soc Icicle kit.
> > It is rebased on v5.10-rc1 and depends on clock support.
> > Only MMC and ethernet drivers are enabled via this series.
> > The idea here is to add the foundational patches so that other drivers
> > can be added to on top of this.
> >
> > This series has been tested on Qemu and Polar Fire Soc Icicle kit.
> > The following qemu series is necessary to test it on Qemu.
> >
> > The series can also be found at the following github repo.
> >
> > I noticed the latest version of mmc driver[2] hangs on the board with
> > the latest clock driver. That's why, I have tested with the old clock
> > driver available in the above github repo.
>
> OK, I guess that's why it's an RFC?
>

Yes. The latest clock/pcie driver did not work for me. I might have
missed something in DT.
The idea for RFC is so that anybody who wants to try the latest kernel
on a polarfire board
has a meaningful way to test it.

> > [1] https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg08582.html
> > [2] https://www.spinics.net/lists/devicetree/msg383626.html
>
> Looks like this one hasn't been merged yet.  IDK if something is broken with my
> mail client but I'm not seeing any github repos.  If this depends on
> not-yet-merged drivers then it's certainly RFC material, but aside from the DT
> stuff (which should be straight-forward) it seems fine to me.
>

I think it makes sense to take this series once the clock driver is
merged at least.

> Since you posted this an an RFC I'm going to assume you're going to re-spin it.
>

Yes. There are some feedbacks on DT which I will fix in v2.

> Thanks!
>
> >
> > Atish Patra (3):
> > RISC-V: Add Microchip PolarFire SoC kconfig option
> > RISC-V: Initial DTS for Microchip ICICLE board
> > RISC-V: Enable Microchip PolarFire ICICLE SoC
> >
> > arch/riscv/Kconfig.socs                       |   7 +
> > arch/riscv/boot/dts/Makefile                  |   1 +
> > arch/riscv/boot/dts/microchip/Makefile        |   2 +
> > .../microchip/microchip-icicle-kit-a000.dts   | 313 ++++++++++++++++++
> > arch/riscv/configs/defconfig                  |   4 +
> > 5 files changed, 327 insertions(+)
> > create mode 100644 arch/riscv/boot/dts/microchip/Makefile
> > create mode 100644 arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts
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
