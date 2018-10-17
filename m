Return-Path: <SRS0=aUtB=M5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8B2ECDE32
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Oct 2018 15:58:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CE962150D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Oct 2018 15:58:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MeGQ0Ip6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CE962150D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QE2bOPhSJ2WoSbapD4oJvehLIhgljWAXIbF2nSFHAKA=; b=MeGQ0Ip6FEPRvD
	Fv2yHzdYNXFbZ/29OGnTA54Y3OKV5tHUG22xuNvRnilw1wjG56Oj4u5fjjI7WLedqoiXV3csVcQ38
	XthcZAaKRYLFnJ8JWptzgP7hH4vILTvTEU1vVIAmnx/qkjFnll1LctreJ8YvAljFtAuHfd594qxpC
	j9dyvLnu/tbvl1Ke+kMob8piI6YwdTkdZBf2EWltQSqOimfWiGBekQnbYxEgbyGhW+1DjCHIDvaSG
	GUYrzf+KpbWwTtgbVHJgTJWquehjYopiRLoYwi/n4qBuBEFTSZ+njkxmoSKxBoj/4QwyPJvlfrnbx
	wA9PdRkS0ssETRf3yXEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCoDU-0002YQ-9r; Wed, 17 Oct 2018 15:58:36 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCoDQ-0002Xl-70
 for linux-riscv@lists.infradead.org; Wed, 17 Oct 2018 15:58:33 +0000
Received: by mail-ot1-f67.google.com with SMTP id o14so26719052oth.4
 for <linux-riscv@lists.infradead.org>; Wed, 17 Oct 2018 08:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7nO0b9iqyVRK5WcWVuF3k46ZWvZc8rfyYito9tNHgKY=;
 b=XkGoDzmWAO4UZBFXDRNa7LVdrit9fq8JkZA9ZBbi6dlV12i753gPXYNiJ+K0/zUmsc
 YaeKZTVOrsE25s9aH+5EI79ehrztlQdhHtPuZQelVNQnQFkE17wLsm5KUIl0j9A0f+qO
 o/iZ2gMKl6mNysuAaQ1eRLqANpQqco3ksxubPAJCVIZPhwKHHnekZs4dUI73flAzykw3
 rftUsC3qVGCvyGFqxdQlQR2FheeUR0EiMEegP6s6M1tWf3pkNQtvNDqDNaGVTPlC9zg0
 D2VwhsyR8Q8lHP6QC8JRdJXFc6u0OQZ1v1QEqcHi67pnBVeSY+MnY1Hf/IqeV2eMdQgP
 kDfQ==
X-Gm-Message-State: ABuFfoiPfp6N9A4o6KPjt3+0WC6lwwjlu1yGvTrUYhwAKOmnNCbCVP33
 DWDKmX+avSm9Hz2o6aW3VA==
X-Google-Smtp-Source: ACcGV62NZhcWCe48+CMXvV73nvYwEJuriF4LNIHnnph2Rt5It6rbNoYbWZkmDhEZKm47nwrdNNsFAA==
X-Received: by 2002:a9d:2132:: with SMTP id i47mr16688280otb.104.1539791900466; 
 Wed, 17 Oct 2018 08:58:20 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e9sm5286486oth.7.2018.10.17.08.58.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 17 Oct 2018 08:58:19 -0700 (PDT)
Date: Wed, 17 Oct 2018 10:58:18 -0500
From: Rob Herring <robh@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
Message-ID: <20181017155818.GA21971@bogus>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
 <20181010134926.GD21134@ulmo>
 <25758ab9-eb36-741b-6264-42412b3ddd8e@wdc.com>
 <20181016110142.GC8852@ulmo>
 <6e108e3c-15c1-b13b-ac3e-60c5eb209c7b@sifive.com>
 <20181016220437.GB31973@mithrandir>
 <7fc1168d-a840-032a-c0a9-2a610127c484@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7fc1168d-a840-032a-c0a9-2a610127c484@wdc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181017_085832_257948_1520D8AE 
X-CRM114-Status: GOOD (  25.79  )
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
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Wesley Terpstra <wesley@sifive.com>, linus.walleij@linaro.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-gpio@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181017155818.H99JsiSm5LvHLlKVxA-b8cHl2M52wTtzEwlhBSh7-rM@z>

On Tue, Oct 16, 2018 at 03:20:34PM -0700, Atish Patra wrote:
> On 10/16/18 3:04 PM, Thierry Reding wrote:
> > On Tue, Oct 16, 2018 at 10:31:42AM -0700, Paul Walmsley wrote:
> > > 
> > > On 10/16/18 4:01 AM, Thierry Reding wrote:
> > > > On Mon, Oct 15, 2018 at 03:57:35PM -0700, Atish Patra wrote:
> > > > > On 10/10/18 6:49 AM, Thierry Reding wrote:
> > > > > > On Tue, Oct 09, 2018 at 11:51:22AM -0700, Atish Patra wrote:
> > > > > > > +Required properties:
> > > > > > > +- compatible: should be one of
> > > > > > > +	"sifive,fu540-c000-pwm0","sifive,pwm0".
> > > > > > What's the '0' in here? A version number?
> > > > > > 
> > > > > I think yes. Since fu540 is the first Linux capable RISC-V core, SiFive Guys
> > > > > decided mark it as version 0.
> > > > > 
> > > > > @Wesly: Please correct me if I am wrong.
> > > > It seems fairly superfluous to me to have a version number in additon to
> > > > the fu540-c000, which already seems to be the core plus some sort of
> > > > part number. Do you really expect there to be any changes in the SoC
> > > > that would require a different compatible string at this point? If the
> > > > SoC has taped out, how will you ever get a different version of the PWM
> > > > IP in it?
> > > > 
> > > > I would expect any improvements or changes to the PWM IP to show up in a
> > > > different SoC generation, at which point it would be something like
> > > > "sifive,fu640-c000" maybe, or perhaps "sifive,fu540-d000", or whatever
> > > > the numbering is.
> > > 
> > > 
> > > The "0" suffix refers to a revision number for the underlying PWM IP block.
> > > 
> > > It's certainly important to keep that version number on the "sifive,pwm0"
> > > compatible string that doesn't have the chip name associated with it.
> > 
> > Isn't the hardware identified by "sifive,pwm0" and "sifive,fu540-c000"
> > effectively identical?
> 
> Yes.
> 
> Is there a need to have two compatible strings
> > that refer to the exact same hardware?
> > 
> 
> The DT in the hardware has only sifive,pwm0. I have added
> "sifive,fu540-c000" as that was concluded as the correct compatible string
> from platform level interrupt controller patch(PLIC) discussion.
> 
> (http://lists.infradead.org/pipermail/linux-riscv/2018-August/001135.html)
> 
> "sifive,pwm0" is required to until all the Unleashed SoC gets an updated
> firmware with correct compatible string "sifive,fu540-c000". I agree this is
> a mess. But we have to carry it until all every DT(corresponding to each
> driver) is finalized. I guess SiFive will release a firmware update that
> contains all the updated DT once that is done. We can get rid of all the
> redundant compatible strings at that time.

I don't want to repeat compatible string discussions on each and every 
IP block. I already have to do this with some vendors.

The RiscV vendors' needs and design flow are a bit different from 
traditional SoC vendors AIUI for the last discussion. If you need to do 
something that doesn't follow normal conventions, that's fine. Just 
please document a convention that works for you. This should explain 
where the '0' above comes from for example. And I'm not a fan of s/w 
folks making up version numbers.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
