Return-Path: <SRS0=qC9n=SG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1B6C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2019 01:17:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE4A820820
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2019 01:17:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QGqcnH9Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMMvpBcd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE4A820820
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTvKmAGpQyMnJb9ZF51GwzrjWB9jZUH36YAkiu/+yDA=; b=QGqcnH9ZMtbLD9
	lfsK9yMZbZcTVymca9vyu6+EW8C7bSfrm3ap7hVXnTgSO7fEaZ5xRdkCzcPDaJE1IztLYRKP1z3AD
	ID+PzwdY5WIVoWQWgMH7jdt4ZpgA9bt629VYTfHaf4hDwJ7z68LbWd5mWtaGXrw9pq2e2tMBNO6mk
	ggNehAg+tRE8bpVOc3FkYosr0PoWUtpQXJqa87FnSxJCp9F5uHbTC5OiF5pyzL0FuJ/BPUAwEb1Zl
	PuHFMLDPMOJbbJEZOrFJmTh2Bj5dAHBf7Gaf3bND8LPcRt9CSrIpPRj+m20v5U10HtYoJOlL+HrCV
	MvcbNZkGN+tIt19oIarw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBr0t-0005j3-NU; Thu, 04 Apr 2019 01:17:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBr0r-0005ij-5L
 for linux-riscv@lists.infradead.org; Thu, 04 Apr 2019 01:17:54 +0000
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0461E20820
 for <linux-riscv@lists.infradead.org>; Thu,  4 Apr 2019 01:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554340672;
 bh=yymA39LA7eJhd4jifzcnBTuqwG6z3k/nJ6Y3aNW27CM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KMMvpBcd+8+8mUzQDL3mu0fy9Ee8SOWNXRlPtHcV6miPg/IvZfqIilysmFFcuR6Du
 sS+KJesDNdCTAYJzf5v7T5uoscT2ZiEkME95L5BGrtVtCWGJJ7Gch53w/VQ6ZMmSZg
 2wuA+4Svz5cUxrkl+6aVTmvsFpsnH0HqyPmYrHOI=
Received: by mail-qk1-f180.google.com with SMTP id c20so635499qkc.10
 for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2019 18:17:51 -0700 (PDT)
X-Gm-Message-State: APjAAAWLMvzwcQElLiJ9poNN06dgj7HCX1yvWWhco4cnEEiHSYwBTyWV
 SmzPUpyHLc5S6aRqjwemVy/wZc+YVIeC2e6pgg==
X-Google-Smtp-Source: APXvYqwKIU4/yzVU4Q4LwBsOvfW/bsQjbS96OYjtGaJX057xOqCvfP0RUE3l13IxpMkg1qhSYBZ6Y/oNt1wLpqGqwrw=
X-Received: by 2002:ae9:e313:: with SMTP id v19mr2647385qkf.153.1554340671248; 
 Wed, 03 Apr 2019 18:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-2-git-send-email-yash.shah@sifive.com>
 <20190328131657.GA9056@bogus>
 <be7246a0-2426-995d-0a24-f104c173d752@arm.com>
 <CAL_Jsq+s77J=Bwiyow2d7Q=e+z+5d64i_cL6xaYn0xdvJDb4Vg@mail.gmail.com>
 <8e574cfa-29d9-0f0a-d670-c4869bd262c4@arm.com>
In-Reply-To: <8e574cfa-29d9-0f0a-d670-c4869bd262c4@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Apr 2019 20:17:40 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK4drKZy1OOv_5T6KQBkoo=J+rJ2DDAVtqLY73ZVGG-jA@mail.gmail.com>
Message-ID: <CAL_JsqK4drKZy1OOv_5T6KQBkoo=J+rJ2DDAVtqLY73ZVGG-jA@mail.gmail.com>
Subject: Re: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive L2
 cache Controller
To: James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_181753_239948_D3552149 
X-CRM114-Status: GOOD (  27.56  )
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
 Yash Shah <yash.shah@sifive.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Apr 1, 2019 at 11:36 AM James Morse <james.morse@arm.com> wrote:
>
> Hi Rob,
>
> On 29/03/2019 14:11, Rob Herring wrote:
> > On Thu, Mar 28, 2019 at 1:47 PM James Morse <james.morse@arm.com> wrote:
> >> On 28/03/2019 13:16, Rob Herring wrote:
> >>> On Tue, Mar 12, 2019 at 02:51:00PM +0530, Yash Shah wrote:
> >>>> DT documentation for L2 cache controller added.
>
> >>>> diff --git a/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
> >>>> new file mode 100644
> >>>> index 0000000..abce09f
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
> >>>> @@ -0,0 +1,31 @@
> >>>> +SiFive L2 Cache EDAC driver device tree bindings
> >>>> +-------------------------------------------------
> >>>> +This driver uses the EDAC framework to report L2 cache controller ECC errors.
> >>>
> >>> Bindings are for h/w blocks, not drivers. (And Boris may want a single
> >>> driver, but bindings should reflect the h/w, not what Linux (currently)
> >>> wants.
> >>
> >> For h/w block compatibles and edac, I think all we need now is to ensure the DT contains
> >> the three compatible strings: platform (if there is one), soc and ip-name (if its a
> >> re-usable thing).
> >> This is so that linux can pick the biggest of the three (usually platform) to probe the
> >> driver from, as this lets us capture platform properties we only find out about later.
> >
> > DT is not the only what to instantiate drivers. If the OS really wants
> > to have a single driver for multiple h/w blocks, then it needs to
> > instantiate a driver itself (based on the top-level compatible
> > probably) and then that driver can find the DT nodes it needs itself.
>
> I think this is where we are heading. (but I need to get my head round this top-level thing).
>
> Can the OS do both, depending on the platform?
> e.g. on a system with one component the driver runs 'standalone', whereas on a bigger
> system with multiple components the same driver is used as a library by something else.
>
> I don't see how this would work if the common component's DT entry looks the same on both
> platforms. Wouldn't this depend on the order stuff is done in, or 'but not this one'
> checks in the driver?

Yeah, it could get a bit messy. I think we'd have to always do things
as described above for anything using that set of components. If you
truly have some set of multiple blocks and any combination of them can
appear, then we shouldn't be trying to have a single driver and EDAC
needs to change to support that IMO. However, I'd guess things are not
that stable to have many different combinations of components. SoCs
have new DDR controllers practically every generation for example.

> > In any case, it's all irrelevant to the DT binding. We don't design
> > bindings around what some particular OS wants.
>
> I agree.
>
> What we want to do is spot the problems on the horizon so we either have the right
> information in the DT today, or at least know what it looks like so we don't cause a
> regression when a new platform makes previous behaviour generic/a-library.

If we follow what the current OS wants, then what is right will change.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
