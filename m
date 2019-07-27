Return-Path: <SRS0=7SDv=VY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C16C7618B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2019 07:53:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E658F20840
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2019 07:53:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MXAj8KaG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="hWpTrlNe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E658F20840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hV9kViFIlGGeO6DvOh81pCFjVKjm97znk680PPJ0AQ8=; b=MXAj8KaGiad7Sr
	QvaLLppL6T0un8oXo+xgkoATRh2qYbP/YhpBoXIqMQpPEWfKmPdycKUijT9I5XKIaZh5fRA6cFPRs
	X/9WjGHpuaCivrnOxrW0i5u0mbM5l1q5dZyZ+8TILeyjfJQVJwEqhD1ugJqdX5xpOeL2faIwOzvmV
	5dZHOr5f0W8QkjvWMb2fms/yoOT8sTtFvZu3GpIYV6mKsIaUHpF6vr83HFI7iTcdQhbenR6LWxgbe
	IpkTUU+aQ2yu02tadSBt70dOwiUEGJvdFzrn9/RkbB8oBgb/897WABTJV1mIvVfbcwmAPi8f2TCB6
	ICpB/piGk13hK6vqg16g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrHVp-0007W6-5Q; Sat, 27 Jul 2019 07:53:05 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrHVm-0007Vi-H7
 for linux-riscv@lists.infradead.org; Sat, 27 Jul 2019 07:53:04 +0000
Received: by mail-io1-xd41.google.com with SMTP id z3so109628212iog.0
 for <linux-riscv@lists.infradead.org>; Sat, 27 Jul 2019 00:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=xLd5dKN/1Vn4JBfs1gVZiFPuMvq838eaVl4bcxKPEMM=;
 b=hWpTrlNe88UUNfwg3GUnDUeJrzMoOUSuY+SoquSWaF4JqjQXBAmy/X7Re4tWTWf1Y4
 283W/2UUYE/DYYbtfvDgEgEsGSuBBHLLFy9NWCmlThgb82sUCajc4XA+gyry0jBR/c1q
 wsYlP2Az33kWJoZH0snuazvGY8eNKZYCpkKJUl31kLUDWc9mj8MK+nBq2jUNV/9ApL1u
 J4Yugd3PZ1vzPaOoKAXrGfis7dEoDq/j/fLi5aS/+OO8RTvhEJ01Vi4Ur0GulZiBV7Wq
 XPr9SfoDTvGbyB4S+yxTUVvGFwJRSH4UekhuvFTRnzC0wApKD7DvMWFyKcdfDxqIIQjB
 gH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=xLd5dKN/1Vn4JBfs1gVZiFPuMvq838eaVl4bcxKPEMM=;
 b=supcHYvcwbq5bLFtysBdrucxObspA/pq78JdheyZshYmo4LMarBqdqlIw/49hzd3jH
 +V0qdi26X7PxKMoeA1kLJu8ICxm5ovrttpR6J3wSRkrZxHe+OnTAHQuAQC2YLCjmV0vv
 TCJwT3yrakRG7bzgzvJV1N2ZDmjN/X8k7A9IlaA21ELqxPrVECb5F+2EFOB7we1FnKTo
 BJrP5y9KeeCKq8K4SSSiffEvMBC6j8tErDQjG2JbovfwOI0HiJh/rFlfr4cBWUMc9B+F
 HoAQsKTdXJZeZfnrO9axh4hrUGs3QiE9nF7JaX1q9HtZHIBNW2qTMbZLmpTPMgSIKCLS
 eo5g==
X-Gm-Message-State: APjAAAVoKnK+Ogd0LR8QkbmIXXN2cKjJqZYYNVRsDZVjePyomRhvB/3Q
 MKJDaU8iM+PXMXU11PTOTAum9g==
X-Google-Smtp-Source: APXvYqzEOwrzMD2xH/L1gj0DzO0QBuJ/XdHgi7C1YpXKU+KcRjY8a3+ZkDPTZ+RvOv6tc2fEwOLYSQ==
X-Received: by 2002:a02:a595:: with SMTP id b21mr7904643jam.28.1564213981562; 
 Sat, 27 Jul 2019 00:53:01 -0700 (PDT)
Received: from localhost ([65.152.59.42])
 by smtp.gmail.com with ESMTPSA id z26sm54391272ioi.85.2019.07.27.00.53.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 27 Jul 2019 00:53:00 -0700 (PDT)
Date: Sat, 27 Jul 2019 00:52:59 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Anup Patel <Anup.Patel@wdc.com>
Subject: RE: [PATCH 3/4] RISC-V: Support case insensitive ISA string parsing.
In-Reply-To: <MN2PR04MB6061790AFE4E0AAA838678028DC30@MN2PR04MB6061.namprd04.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.9999.1907270043190.26998@viisi.sifive.com>
References: <20190726194638.8068-1-atish.patra@wdc.com>
 <20190726194638.8068-3-atish.patra@wdc.com>
 <alpine.DEB.2.21.9999.1907261346560.26670@viisi.sifive.com>
 <a8a6be2c-2dcb-fe58-2c32-e3baa357819c@wdc.com>
 <alpine.DEB.2.21.9999.1907261625220.26670@viisi.sifive.com>
 <MN2PR04MB6061790AFE4E0AAA838678028DC30@MN2PR04MB6061.namprd04.prod.outlook.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190727_005302_572647_9F698202 
X-CRM114-Status: GOOD (  15.42  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Johan Hovold <johan@kernel.org>, Atish Patra <Atish.Patra@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 27 Jul 2019, Anup Patel wrote:

> > -----Original Message-----
> > From: Paul Walmsley <paul.walmsley@sifive.com>
> > Sent: Saturday, July 27, 2019 5:00 AM
> > 
> > On Fri, 26 Jul 2019, Atish Patra wrote:
> > 
> > > On 7/26/19 1:47 PM, Paul Walmsley wrote:
> > > > On Fri, 26 Jul 2019, Atish Patra wrote:
> > > >
> > > > > As per riscv specification, ISA naming strings are case
> > > > > insensitive. However, currently only lower case strings are parsed
> > > > > during cpu procfs.
> > > > >
> > > > > Support parsing of upper case letters as well.
> > > > >
> > > > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > >
> > > > Is there a use case that's driving this, or
> > >
> > > Currently, we use all lower case isa string in kvmtool. But somebody
> > > can have uppercase letters in future as spec allows it.
> > >
> > >
> > > can we just say, "use
> > > > lowercase letters" and leave it at that?
> > > >
> > >
> > > In that case, it will not comply with RISC-V spec. Is that okay ?
> > 
> > I think that section of the specification is mostly concerned with someone
> > trying to define "f" as a different extension than "F", or something like that.
> > I'm not sure that it imposes any constraint that software must accept both
> > upper and lower case ISA strings.
> > 
> > What gives me pause here is that this winds up impacting DT schema
> > validation:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Docu
> > mentation/devicetree/bindings/riscv/cpus.yaml#n41
> 
> If 'f' and 'F' mean same extension as-per RISC-V spec then software should also
> interpret it that way hence this patch.

The list of valid RISC-V ISA strings is already constrained by the DT 
schema to be all lowercase.  Anything else would violate the schema.

I'd take a patch that would pr_warn() or a BUG() if any uppercase letters 
were found in the riscv,isa DT property, though, in case the developer 
skipped the DT schema validator.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
