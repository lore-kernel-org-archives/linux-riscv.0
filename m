Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0A5ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 03:27:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B9862081B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 03:27:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fFrcpzFB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="rd/DSHzg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B9862081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBfea2SdDcNtFhaTjvhxQl/K/Qhck04hPE5GQMhkei4=; b=fFrcpzFB4uG4sA
	6n5svq7KJwA3s+joapqH89Gpnv0RVcf8AxaBF+CrNjd8TxOgK+Qrn28Ny2/ZYv7CxRW4SNoHlvLQ+
	PkuuJafYQTvxuhrae6/6H/b+EJedQkqzCcOFVDk5/bsqcktKIwvzW4iHqRuR4PONj/qgLJjHlo7c5
	ZRHA9QvtFfet1JlTpKcMgEhyMxIVs5xVY5nZ6PhOmPSy5GOtbX+Sn9iXA1WgaP0jrI5FhvfOitk94
	gpQ+ylX8kOuYWvkrLnFU1G/yElWvWaJA5RkZtp2N/z/DrjoShc00yUJtaJHPbeWxJOkfF78IJttgP
	nem+iZ6TaqVbLVFaDTkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIQ7U-0006UA-L5; Fri, 02 Nov 2018 03:27:36 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIQ7R-0006Sj-GL
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 03:27:34 +0000
Received: by mail-wm1-x342.google.com with SMTP id w7-v6so754753wmc.1
 for <linux-riscv@lists.infradead.org>; Thu, 01 Nov 2018 20:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sRagGAMPkzbphqW0Yk/5Gz4OPtSwJdcOQWJx8ZN3oZE=;
 b=rd/DSHzgpmcBjtCbW0L22AcbUBg4qNf+pIez80KjBYcXQx78eoC0ngG8TF/2tamFA3
 fxLLztVNVAtUjJaMh8i3kFU0PEFkgOxLXeIklrw9+lpiWeeci23cosYIHTChwYFI0YIu
 BPIMIyG0h/oCz+UuumPlO1GkY+oXlCl8ilTa3pez7/Xm6CZIZcGIoMsf1d8I2bzsM4WU
 6+3kCw69N6xiMU4bDc/8tgY1PDMYe054PC6hM8GZL7axS4B8y2d5KgxQ/2AS4DPHq1J2
 AlzYk8UKoi2FF9IHcxEOg+NruI59KSujOXnSd8bMCmk/D5yP2DgUVANjGKwhZ24pc8N1
 j3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sRagGAMPkzbphqW0Yk/5Gz4OPtSwJdcOQWJx8ZN3oZE=;
 b=cq+5ygQACBz5iXRSjHz8XsXZ6iE51OeVVX7Ejq6EzBbyW1JXJxrwPNEZauktrORPM3
 tNGbHuZW/Lukf3FJzefxf6eT26JgX+31K5MmHiJCnaKgJxX26aLQiWID2NL0BU8GzBWn
 T4/BFAf4rQY7KJ4vNqkScVdG2Q7HggkdNA3VLpD+QO1ZkD7Ecmayo+z1dEghzDcZZXIY
 o8m6vPfnRHKBsyOCr3vftH31vrl4vet7BGG/FM0tEwU1Rnw0OfSBi45jLOj5/hNtPgSb
 L3+AcgoEPWnD+gXrsZzbpMQvPuETfwGM957rS0289GI7pR/ZuODh1s1xg/alUT6Ay8Fs
 O/Fg==
X-Gm-Message-State: AGRZ1gLznVJpRb77rZEkXs1CmtnFXB3HiOxCkAYf3auOqiOYsHoab8CE
 XIYW01onIH+TKw+oKPwaMx8uAN2DcGkM/IgELt4GSA==
X-Google-Smtp-Source: AJdET5cULPLhJELIwCd8VnLkmVEPqFdu+pPPtBKYtF4hvYPFSNUvejffraG56d7VgjFLJiErIXoxXW9UxqzgVXp391o=
X-Received: by 2002:a1c:3584:: with SMTP id
 c126-v6mr7594415wma.120.1541129239251; 
 Thu, 01 Nov 2018 20:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20181101164205.l2bra3a6kihjpuib@excalibur.cnev.de>
 <mhng-dd74f93c-74b1-4701-a73c-339d81aa0bd0@palmer-si-x1c4>
In-Reply-To: <mhng-dd74f93c-74b1-4701-a73c-339d81aa0bd0@palmer-si-x1c4>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Nov 2018 08:57:08 +0530
Message-ID:
 <CAAhSdy3ZX=BqMS-MYnTHNZ9hxkJbt8i5nf5rOTf41FJ6rUpWpA@mail.gmail.com>
Subject: Re: SBI extension proposal
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_202733_608467_299B488C 
X-CRM114-Status: GOOD (  19.69  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Zong Li <zong@andestech.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>, Andrew Waterman <andrew@sifive.com>,
 alankao@andestech.com, philipp@hug.cx, vincentc@andestech.com,
 rjones@redhat.com, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, Michael Clark <mjc@sifive.com>,
 Arnd Bergmann <arnd@arndb.de>, paul.walmsley@sifive.com, merker@debian.org,
 linux-riscv@lists.infradead.org, abner.chang@hpe.com,
 David.Abdurachmanov@cern.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102032708.311L91KKlFu4IDTHOWjotomp2jzt_CB4aOR4LmnFImQ@z>

On Fri, Nov 2, 2018 at 8:19 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Thu, 01 Nov 2018 09:42:05 PDT (-0700), merker@debian.org wrote:
> > On Thu, Nov 01, 2018 at 09:46:09AM +0000, Richard W.M. Jones wrote:
> >> On Thu, Nov 01, 2018 at 03:05:51PM +0530, Anup Patel wrote:
> > [...]
> >> > > How about putting the version information into device tree
> >> > > and use the compatible string?  This seems more reliable
> >> > > than probing.
> >> > > e.g.
> >> > > firmware {
> >> > >         sbi {
> >> > >                 compatible = "riscv,sbi-r0p1", "riscv,sbi-r0p2";
> >> > >         };
> >> > > };
> >> >
> >> > If it was just DT then I think having this information in DT makes
> >> > sense. In future,
> >> > we might definitely see some ACPI support in RISC-V too (just like ARM64 world).
> >>
> >> I agree.  Please try not to make things that depend on DT, as it's a
> >> Linux-only description which isn't suitable for other OSes and has a
> >> poorly defined ABI.
> >
> > the notion that DT is a "Linux-only" description and not suitable
> > for other operating systems isn't correct.  Besides being used by
> > Linux, device-tree is also used by at least U-Boot, FreeBSD and
> > NetBSD.  Based on issues in the early days of DT one can surely
> > discuss about device-tree ABI stability, but since then a lot of
> > effort has been put into making DT ABI-stable, and in my
> > experience this effort has been successful.  On the other hand I
> > have experienced way more ACPI issues on x86-64 hardware than I
> > would like to remember, so I tend to assume that in the ACPI
> > world also not everything is nice and shining.
>
> I'm treating device tree as a stable interface, at least once it's written down
> as a spec (like all our other interfaces).  At SiFive we're treating it as the
> standard interface for static device discovery, so interface breaks will be a
> huge pain.

DT is a great HW description style (my opinion) but then there are
ACPI fans too.

I think SBI spec should be independent of DT or ACPI or any other HW
description style. In fact, a simple bare-metal programs (without DT or
ACPI support) should also be able to make complete use of SBI. This will
allow us to develop baremetal test suit for SBI calls.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
