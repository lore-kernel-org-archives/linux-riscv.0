Return-Path: <SRS0=+Lbj=JF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0347C433ED
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Apr 2021 19:04:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42693610F9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Apr 2021 19:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42693610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5n12V4QTfz/RH/mMk2B4YwOgsnrRrRGBnEmkxEN5eRQ=; b=cFiHbeUhspbvp3YyeQsqvuMxo
	rDtEeEgLyjE505vg0rl/ippiEaoZvOt+zPQjOo4IVTinOeZl0KRyPoSF4hyFJ4/gccUyIBm+4nEzO
	TCZGIriChB7hqjr0PrGpzv2JGpCWb0HHsQT+OFBumRFaK7xSynErIMtUrEd4J60l3Fv7xlsgyVXgL
	OOsQ/IX6gOQjBHFJgX9Yc7ZRtlxS2LMvPreyBfx4bNiWrHohJjbPjVLSjgMw6NlrYh5etNTtGAlzw
	yVV7hhqUcddgH/hckVsF5mlXMxJX8Mz7TwErN304BylCldfqEAEEHQcIE2OTfspztygFblD5UIMy9
	Y/auddRQQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUZx6-0093Vg-Iu; Thu, 08 Apr 2021 19:04:28 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUZwp-0093RP-J8; Thu, 08 Apr 2021 19:04:13 +0000
Received: by mail-oi1-f171.google.com with SMTP id c16so3288890oib.3;
 Thu, 08 Apr 2021 12:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DUrGxOBRGKnSQEqHR05dYQldYxqAXJweo2+bFsG+WpA=;
 b=GdZf9oVyihx6YlJlAUVuzMSVWfpx7cVmtc4HKCFOYxebfFygAgCsOe51zgFdUcnvPg
 K2xWvW7J79JlbyXH+DJI91HxSMiWVoGJqnQGavOXy2smrH0ls1iv7+K9auSyhkGqKNAS
 i9EqUnfDf8NPKesHeVF4rA0c2FVuTP89pcfYmXDO8N2LrFv1plwOaHDxaXyaR7haUISe
 hvRpJ8uz61kP1jLl7fnvvJh3Qw54Fn34nGwjqkyUT64A2+UihWh4U8ZUSFZt3G5UDwfS
 2rcNv6at4NqtKDwCrdkYtrW7BkOUmbZFEnGnPrKpWYHz03pFVjnLxnrgQcCeWs6IcIRl
 J7TQ==
X-Gm-Message-State: AOAM533gev1KYMFmVvXGOks7vwSQphk7YykzCS47DSKmfpjd0OH58yHr
 czc3dYY0aGh6j0m9wys57w==
X-Google-Smtp-Source: ABdhPJzc/ezUgVYn/c2gVo9JEsyTGvBA4ZkkApktnBVPpB6CFT0oT9dS88OzEW8tCbInDt8Gjv+2IA==
X-Received: by 2002:a05:6808:138a:: with SMTP id
 c10mr7276133oiw.117.1617908650345; 
 Thu, 08 Apr 2021 12:04:10 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g9sm56746otk.6.2021.04.08.12.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 12:04:09 -0700 (PDT)
Received: (nullmailer pid 1795497 invoked by uid 1000);
 Thu, 08 Apr 2021 19:04:08 -0000
Date: Thu, 8 Apr 2021 14:04:08 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Walker <danielwa@cisco.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, will@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org, linux-arch@vger.kernel.org,
 devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 microblaze <monstr@monstr.eu>, linux-mips@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 19/20] mips: Convert to GENERIC_CMDLINE
Message-ID: <20210408190408.GA1724284@robh.at.kernel.org>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
 <a01b6cdbae01fff77e26f7a5c40ee5260e1952b5.1617375802.git.christophe.leroy@csgroup.eu>
 <20210406173836.GW2469518@zorba>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210406173836.GW2469518@zorba>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_200411_765297_232A66F5 
X-CRM114-Status: GOOD (  19.11  )
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

On Tue, Apr 06, 2021 at 10:38:36AM -0700, Daniel Walker wrote:
> On Fri, Apr 02, 2021 at 03:18:21PM +0000, Christophe Leroy wrote:
> > -config CMDLINE_BOOL
> > -	bool "Built-in kernel command line"
> > -	help
> > -	  For most systems, it is firmware or second stage bootloader that
> > -	  by default specifies the kernel command line options.  However,
> > -	  it might be necessary or advantageous to either override the
> > -	  default kernel command line or add a few extra options to it.
> > -	  For such cases, this option allows you to hardcode your own
> > -	  command line options directly into the kernel.  For that, you
> > -	  should choose 'Y' here, and fill in the extra boot arguments
> > -	  in CONFIG_CMDLINE.
> > -
> > -	  The built-in options will be concatenated to the default command
> > -	  line if CMDLINE_OVERRIDE is set to 'N'. Otherwise, the default
> > -	  command line will be ignored and replaced by the built-in string.
> > -
> > -	  Most MIPS systems will normally expect 'N' here and rely upon
> > -	  the command line from the firmware or the second-stage bootloader.
> > -
> 
> 
> See how you complained that I have CMDLINE_BOOL in my changed, and you think it
> shouldn't exist.
> 
> Yet here mips has it, and you just deleted it with no feature parity in your
> changes for this.

AFAICT, CMDLINE_BOOL equates to a non-empty or empty CONFIG_CMDLINE. You 
seem to need it just because you have CMDLINE_PREPEND and 
CMDLINE_APPEND. If that's not it, what feature is missing? CMDLINE_BOOL 
is not a feature, but an implementation detail.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
