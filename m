Return-Path: <SRS0=rW/4=OB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A7EC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Nov 2018 01:43:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5201E206B2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Nov 2018 01:43:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fEDzgvIX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLNyMMWu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5201E206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xEfErjzTKRRBiQTXQPPUjDyWKHBCKRtavOkg7FZuFM4=; b=fEDzgvIXZ0ncOP
	gqnUlgajJgoQS25vZVSkWtw8pWMI+n5aQul9bAp+Owq/BRhBuGG+uuGaOoTik6nZ4DD8HwCIIa6x6
	cAbPkaBnhD/SLy3i71wAREAdb1ImiJPyxX/DBax3KKflcpVkzLtiJh8ZKTmodgOkVmwjnnd+WRNlF
	9XbSYy6rinLsPXaQ5mGfKtpkEWrKX7ON1OPxikUkwGHMauJ2/f7PMvQKNgJsll2m9SMk5zzU1V5zv
	wpaNtUzXCsjnwj16QvgAe7F71aTiU/7/b5ycSRGtpbqqn5eOOShtPhrFbKnyxcQYHo8yt/TVsmk2c
	ld0tqGwgRvbV5eXmH4QQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPe1q-000193-RZ; Thu, 22 Nov 2018 01:43:38 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPe1n-000186-Vw
 for linux-riscv@lists.infradead.org; Thu, 22 Nov 2018 01:43:37 +0000
Received: by mail-ed1-x543.google.com with SMTP id y56so6376498edd.11
 for <linux-riscv@lists.infradead.org>; Wed, 21 Nov 2018 17:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P363Lg+jXnBBHKFhYj0vs1K5DJ4vndbvmT+bFNVwpkI=;
 b=jLNyMMWu0wB2KD1+OWMd1NlsmOFZT6wqCRpxMJSY2lsVQzeeDrJLt12PlzDX1e1Tuz
 oAW85ufjPQxu+c2EEDNHx/fTrMgzXvvqB8yG1rXcnf2nDn4q6rUQHkSQmz3s0riaXYCH
 Gn3xaSWvnXzdepqjfskXgYymawBRQ4a8SgtmNCRmH+RCmHsGwE/PcdtchTBTmVq0j1eG
 BB+JltSQHejt2DM2bMYdxOQbZYLhDtf4FUbdTFosxhuKXzErtWnE7kODdsKgeeJvq2tz
 TpxhnhOCNGYG3YvY1o93REAvswGaDKmRR++vHBssNGZJj8CqGmcjjqz3BtAE7BOlVcpT
 Accg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P363Lg+jXnBBHKFhYj0vs1K5DJ4vndbvmT+bFNVwpkI=;
 b=e0ZNVtOcNaHBHzveaeb1OxaFcSaSNTiJ1x41zL9Jww1zYHHLHWDDLTW8latX/FgadG
 9+76s5eT9Fl7GXX2790+5+sXvgQZcaR22gDPs5NMwDWFlWuycDfNFasw/XEcONKQPRYT
 Mlgbp3rbDCl9mjzh3txbpjYvQxhVdeForL/rv+0lxCFi4qajXYZKYxJf525ahtYzGXo/
 k8i6cM7rp3KIi5LWxDDahJYVHM7JCZiddNQKxpJWMrm4jBgns3GYDj0QBZukfrATbGiU
 UXrBoPTXWu0TZ0K1UPFFBEP9tJ8suEsRFGUlCCue+fNMZNgiIgukEACOfM4JZXZbtMtQ
 TCMQ==
X-Gm-Message-State: AA+aEWYHWZ7r1ch6KlKgqVAvZH6eT2jkpWrOIz94NmEHeUJT30+wftYZ
 QnBfGmbSzp5wV1TvNSn40fZYZGQTW7C5NXtgcE4=
X-Google-Smtp-Source: AFSGD/X88L9Kxp/o7S1/GY4bnX+y6u2KAOXfVUnoNy8fn5sajQdGDPqFT+4JUY00erTGEaFkBaQ1ZhHrR7iGE4D3Ydo=
X-Received: by 2002:a05:6402:1347:: with SMTP id
 y7mr7611683edw.114.1542851004266; 
 Wed, 21 Nov 2018 17:43:24 -0800 (PST)
MIME-Version: 1.0
References: <CAEUhbmWskEtQR-kAuAYx=SHOJ4-MrCRUchSQ68WwZ62hxsTQyQ@mail.gmail.com>
 <mhng-7be4f47d-bc3a-4073-a6db-dc5588304d2d@palmer-si-x1c4>
In-Reply-To: <mhng-7be4f47d-bc3a-4073-a6db-dc5588304d2d@palmer-si-x1c4>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 22 Nov 2018 09:43:12 +0800
Message-ID:
 <CAEUhbmW08WfTQRVSAaC6SRWhZmrUTAm9b8wefuMMbg8dGeKZVA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Build flat and compressed kernel images
To: palmer@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181121_174336_027072_06ADA48F 
X-CRM114-Status: GOOD (  16.10  )
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
Cc: aou@eecs.berkeley.edu, Anup Patel <anup@brainfault.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, hch@infradead.org,
 atish.patra@wdc.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181122014312.MTM1i0iMYk1hsD58Uy_NzlzCr2TgsjEgSBAOaZOMN7w@z>

Hi Palmer,

On Thu, Nov 22, 2018 at 12:28 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Tue, 20 Nov 2018 21:06:18 PST (-0800), bmeng.cn@gmail.com wrote:
> > On Mon, Nov 12, 2018 at 1:55 PM Anup Patel <anup@brainfault.org> wrote:
> >>
> >> This patch extends Linux RISC-V build system to build and install:
> >> Image - Flat uncompressed kernel image
> >> Image.gz - Flat and GZip compressed kernel image
> >>
> >> Quiet a few bootloaders (such as Uboot, UEFI, etc) are capable of
> >
> > nits: U-Boot
> >
> >> booting flat and compressed kernel images. In case of Uboot, booting
> >
> > nits: U-Boot
>
> Thanks for the review.  The PR has already been tagged, but it's not scheduled
> to be sent out until later today.  I generally try to avoid rewriting the tags
> unless there's something major that's wrong, so unless you feel very strongly
> about this then I think I'll let it stand.
>
> Let me know if this is a big deal for you, I can rewrite things.
>
> >> Image or Image.gz is achieved using bootm command.
> >>
> >> The flat and uncompressed kernel image (i.e. Image) is very useful
> >> in pre-silicon developent and testing because we can create back-door
> >> HEX files for RAM on FPGAs from Image.
> >>
> >> Signed-off-by: Anup Patel <anup@brainfault.org>
> >> ---
> >>  arch/riscv/Makefile             | 15 ++++++++-
> >>  arch/riscv/boot/.gitignore      |  2 ++
> >>  arch/riscv/boot/Makefile        | 33 ++++++++++++++++++
> >>  arch/riscv/boot/install.sh      | 60 +++++++++++++++++++++++++++++++++
> >>  arch/riscv/kernel/head.S        | 10 ++++++
> >>  arch/riscv/kernel/vmlinux.lds.S |  2 +-
> >>  6 files changed, 120 insertions(+), 2 deletions(-)
> >>  create mode 100644 arch/riscv/boot/.gitignore
> >>  create mode 100644 arch/riscv/boot/Makefile
> >>  create mode 100644 arch/riscv/boot/install.sh
> >>
> >
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> >
> > Tested with U-Boot s-mode on QEMU virt, using bootm to boot the kernel
> > Tested-by: Bin Meng <bmeng.cn@gmail.com>
>
> I also won't include the tags unless I rewrite the tags.
>
> Thanks for the review!

Thanks. Let's go with this as it's a minor nits.

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
