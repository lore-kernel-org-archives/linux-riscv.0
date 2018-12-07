Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831EBC64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 00:46:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41AC520882
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 00:46:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KQy0AahS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QsBqi82V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41AC520882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0dylqFSz60Psy85efVc5Lowbb/YDQEZ3bcPETHw8ZM=; b=KQy0AahSDQFgRw
	xS6dlcmKlh6VoYsJwc11frOU2q42F2EoKqf2T7lTf3EEC0CU74NFj0UJ1mnsJP6XKZEL1whQIUXSR
	OXdyTcKMPKqUGQe41jEpCsrhS/870LnLYP0/WzeFGRE7JxiAzQzLzDmLrT0DgsRztkUwkEbX43TmY
	wAe3hSu8i6o9njkIlcmBmjA187nw9GT2D6WqbnkA7UJfd54OWTiP4HVHES2rqmuRZk/KB8mPbPVHJ
	y+9rKsUttQAQEbk7PJXchS9RHJ4RyWfxx5ttAdR0c8M7V+zRey5CfM0icc4Ldv6xs0/HyOXtq6e+r
	yh1Oq8PoXoGXsS8/UdFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gV4Ha-0002lC-FS; Fri, 07 Dec 2018 00:46:18 +0000
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gV4HU-0002kH-4l
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 00:46:17 +0000
Received: by mail-yb1-xb41.google.com with SMTP id s8so1639918ybe.9
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 16:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=3nYnynqdM6fFp9CLNu4v+AtKiJm1e4BaJApiy2a/58A=;
 b=QsBqi82V0/wM9T6LsCnwwrlY2/LTXGiCvxNzqJY0oSXNxXWzYh3EOYDj5L/hJ/L6vK
 Hdx8DFv6s5FzpM0q/zjjBR6jOjXU5fAbnizZAkSZ5SLVFzwvDpVugIIhwhDQRFO5zIwy
 tm4GCBLgDaSKvlSkxduIpmVJxvjDrTnDUy76LI0nujM8pEaqGksa1pGa+uh3Hh4ghdKH
 3MG5du2AXj7wboCMSGSJmvdRVXK7oMrE1c7GF4Wb8iz2I6uApIwkbc8I0N3IX5QYctLh
 yZ7QjBionWJcifArY5hvDMByP+2QQvPrEEgw6c77Nkp3vJp7mrbDh6+JyUQZZ6xj7Li8
 ltjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=3nYnynqdM6fFp9CLNu4v+AtKiJm1e4BaJApiy2a/58A=;
 b=aZjMWJJ8TEIt5hD5hONmsP9NLhUapjvR81o7PhI8eJylyd1HtITG2aV7rUhrJ9119K
 6YozUEkADGu82elcG4hrsGYiD31fw4s89Mzg9e+weg5C0j3BCrfzc/IUpcmFIU/gCjuG
 q2Q5Au4DLsO4Q+Klv/gLdVwDYKlEpNhyDDXRap9AeuBZqgt8iClr5A7HM7DChQa0W8xl
 uURClsFPzf0gG6rkpE065Wbg1EHg7t8GHfpL/2XSHH8KSw/OY4DINCy7MRBho5n0w9yi
 PocaEFF1yKCz8W4blw+H1kyuImJLyXlDepKJk0D4Scnl5GI/r5ZnSgyBP2NPl+YL3zQp
 A69g==
X-Gm-Message-State: AA+aEWYpW6PvGKMTTm2nH+zG2nzBxhBRnF3dGJcbPr9v60nPMe2EA2zx
 Nn0QBTvJz3OTtXHY9uzbSCoEZTTIksA=
X-Google-Smtp-Source: AFSGD/Vsm9/8kdM8pQW4zxN2L8z6duU71OVqBqIft/2rT4ZpQBG+r0ad8Ek1R5UY1DM4Jy3qks4YiQ==
X-Received: by 2002:a25:7208:: with SMTP id n8-v6mr170525ybc.144.1544143561084; 
 Thu, 06 Dec 2018 16:46:01 -0800 (PST)
Received: from localhost ([208.115.86.73])
 by smtp.gmail.com with ESMTPSA id x4sm1828238ywj.80.2018.12.06.16.46.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Dec 2018 16:46:00 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Thu, 6 Dec 2018 16:45:58 -0800 (PST)
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: sifive: describe sifive-blocks versioning
In-Reply-To: <20181207000104.GA10814@bogus>
Message-ID: <alpine.DEB.2.21.9999.1812061645070.29609@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
 <20181207000104.GA10814@bogus>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_164612_185073_2CD22C52 
X-CRM114-Status: GOOD (  15.39  )
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
 paul@pwsan.com, Wesley Terpstra <wesley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Megan Wachs <megan@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On Thu, 6 Dec 2018, Rob Herring wrote:

> On Wed, Nov 21, 2018 at 05:06:56PM -0800, Paul Walmsley wrote:
> > 
> > For IP blocks that are generated from the public, open-source
> > sifive-blocks repository, describe the version numbering policy
> > that its maintainers intend to use, upon request from Rob
> > Herring <robh@kernel.org>.
> > 
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Palmer Dabbelt <palmer@sifive.com>
> > Cc: Megan Wachs <megan@sifive.com>
> > Cc: Wesley Terpstra <wesley@sifive.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-riscv@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > Signed-off-by: Paul Walmsley <paul@pwsan.com>
> > ---
> > 
> > Hi Rob, please let me know if this document works with your
> > requirements, or if some changes are needed.  - Paul
> 
> Looks pretty good to me.
> 
> >  .../sifive/sifive-blocks-ip-versioning.txt    | 38 +++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> 
> Use the path that was suggested.

Could you remind me which one that is?

> > +
> > +An example is "sifive,uart0" from:
> > +
> > +https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/uart/UART.scala#L43
> 
> That's nice, but will be out of date as soon as someone adds or removes 
> a line above it. Can you point to a tagged version?

Will do

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
