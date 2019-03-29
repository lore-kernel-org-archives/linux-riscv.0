Return-Path: <SRS0=QLKY=SA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9CDC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 19:41:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 236CB218A5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 19:41:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lj3FnfNo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojKTR1VR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 236CB218A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TWCW6nCiIt6FZwh28/Y4Y5YklxmIZbpY+pA4JaVQxSA=; b=lj3FnfNoGtIzpS
	2FSH01v8yP3ecAq2Stq1zaMWS6P1Tstv6agBUsp3r+9YeANdFlG5lmO6tx1hNfr5MaV6uvr9bGudg
	ZJstyD5LZcXhnAOTVyxYuEJg8sfM/Ax5xSn8HJWdReZ9taAdYsUx73hJ5zmLfWbyJYrNJEyBig8fm
	fFQa3IkUdDcmE5ABR06qzVNevwXD5I+dSmpgFHWidpE/tRgbwfIpluIo4YbwksU+NUYBDcBl9QQUW
	XzW5FkBFgXQXuIL9fckYEIRZJ0PwXjklAoysUnpGJMkI9nWmrPzhRQiwU9O7qU8aATHM/9ZGdj8aS
	nJnRmjfaUTLPLwZN0o7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9xNS-0005J0-Of; Fri, 29 Mar 2019 19:41:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9xNP-0005Ib-La
 for linux-riscv@lists.infradead.org; Fri, 29 Mar 2019 19:41:20 +0000
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B576C218A6
 for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2019 19:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1553888478;
 bh=IhnzjRCSQBK+vXxVogaJZrgUaYfASlIvpdvWT5VAAww=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ojKTR1VRIuqgu0FFeOFovaM7I6vyNnlomZnRF7RFkyIFQKbfxkAJyhgei3Gag4dw6
 83Sc0gkcj7LVEGRqrqDnB0cAcfZCya9B5xnip0U1fY3N5rXjXfeobs5NcYDdfZpsUT
 zyAC8m8CGrbj+PPSSTMVQwd/8lXmdGTcWNdfmzD8=
Received: by mail-qt1-f181.google.com with SMTP id x12so3968258qts.7
 for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2019 12:41:18 -0700 (PDT)
X-Gm-Message-State: APjAAAXfbcRP1mRHyFlEJG0nIZqvgV9XhPgAzJ3olHGWrFQ+D3VEBbR8
 2dzVlcrksUnG93teDz1oP4NHVzh1Qsn+r4ekRw==
X-Google-Smtp-Source: APXvYqzCUtNKCf26jdI194VOtmDfMhUt/+PKKdd3Jz7SKJUXM5LxDsOFFwhhEE1DizGlUh19fY+S62qZWDC9YyFbAQo=
X-Received: by 2002:ac8:30bc:: with SMTP id v57mr42228073qta.26.1553888477975; 
 Fri, 29 Mar 2019 12:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-2-git-send-email-yash.shah@sifive.com>
 <20190328131657.GA9056@bogus>
 <be7246a0-2426-995d-0a24-f104c173d752@arm.com>
 <CAL_Jsq+s77J=Bwiyow2d7Q=e+z+5d64i_cL6xaYn0xdvJDb4Vg@mail.gmail.com>
 <20190329142739.GG21152@zn.tnic>
In-Reply-To: <20190329142739.GG21152@zn.tnic>
From: Rob Herring <robh@kernel.org>
Date: Fri, 29 Mar 2019 14:41:05 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLQ1XvQq7L=xA5Z8Y0Xa4Bmp0t2pgxn+hLF+tD=_L7Mvg@mail.gmail.com>
Message-ID: <CAL_JsqLQ1XvQq7L=xA5Z8Y0Xa4Bmp0t2pgxn+hLF+tD=_L7Mvg@mail.gmail.com>
Subject: Re: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive L2
 cache Controller
To: Borislav Petkov <bp@alien8.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_124119_739197_E9BA13FA 
X-CRM114-Status: GOOD (  17.17  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yash Shah <yash.shah@sifive.com>, James Morse <james.morse@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 29, 2019 at 9:27 AM Borislav Petkov <bp@alien8.de> wrote:
>
> On Fri, Mar 29, 2019 at 09:11:24AM -0500, Rob Herring wrote:
> > I honestly don't understand the issue with EDAC is here.
>
> The EDAC core supports only one driver and if you need to load more, you
> need to dance around that.
>
> Also, if those drivers need to talk amongst each other, then they need
> to build something ad-hoc so that they can.
>
> And the other architectures can very well do one driver per platform -
> only ARM wants to do this special thing because DT said so. Or whatever.
>
> > Highbank is separate drivers for L2 ECC (PL310) and DDR. Both are used
> > on highbank.
>
> That's because your L2 driver does allocate an edac_device
> (edac_device_alloc_ctl_info()) and the DDR one an edac_mc
> (edac_mc_add_mc_with_groups).
>
> For example, altera_edac does edac_device_alloc_ctl_info() for each IP
> block just fine. So a single driver *can* work.
>
> > Only the DDR driver is used midway. (I think we never got around to
> > how to report A15 L2 ECC errors within Linux.)
> >
> > In any case, it's all irrelevant to the DT binding. We don't design
> > bindings around what some particular OS wants.
>
> And just because DT dictates one driver per IP block, I'm not going to
> redesign EDAC to fit that scheme. You or someone else who feels strongly
> about it, is more than welcome to do so, of course. And then maintain it
> too.

DT dictates aligning with what the h/w looks like which has little to
do with OS driver design. I never said you should change EDAC and I
outlined how things should be handled if it is one driver. DT and OS
subsystems are independent things. I can't tell you how to design the
subsystem and you can't dictate DT design (based on EDAC design).

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
