Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA023C7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 13:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I0UWYoC4Wc6Se7Igsmc9Zh+ivdgZZOi9vqN6pGs8+VY=; b=14KHBu5VayaMx3
	nQYSHxPoW+ojRqGJYV1YSRe2PXFgufXDRJhAPaQTIfQyYYBgVxbuyLUP28rF0i4XK70NHjgtIORqA
	fDF0Uh2j65VQI6LWkz89NcvdXDSRssbUS5TB6Wsdd45kFxH8yAmHvkGJGJvU4e9jb8cp51V/FDgeM
	lCYHg5JqqZC70CnFGzWJ+3jbBpdsBLqDcPol50TuEQmXeieoAInfJ7gQQnmV5Wg6Nfp8gcl526T+A
	I0E4Gzz6gLTMzh92v0niGGdaLXBkBJYvdJZ/Wu8jfzovxuEQbzQs5PN8fboHvy6KnocInTb7zV9uN
	EPQtNkUeLSOErAuCUKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prfbs-0048RU-1F;
	Wed, 26 Apr 2023 13:55:04 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prfbp-0048Pp-14
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 13:55:02 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-94f910ea993so1100704366b.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 06:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682517296; x=1685109296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CvgupacSGkTj8dyYD1iL1po7E5I467+Q3tw00fnEn8M=;
        b=hhDox3FDhW9eJcAPh71ZvM/zKjboiM1gT8Rk1qV74oljMJrV2UDwRi/NVY7aKBo1/p
         UCs+k5nZ/v530471MYfFQ+aMvX9FGU8W63+tqODKdW/ad0BNiKB8HdhhrHYsHylZ0yHW
         xV4Usn1UG1eUrbc5RggriHlhAV9fDvs020nCsJqhjpaEgvK1Dat9i3YlnYXEBDGvxHG+
         mNXabX3LBZ9KigqNuNdX/VyTT+e1NLn+0MUFXY4Pq2AV/vGxAAfuNsf/dVwsYKvOrcc1
         ImY4kV4MTxP1ErMa7AJDC4t7nbhWXde0AVSokezFZi7BCW9NvQJiuS3ULoSLpc+LUup6
         hbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682517296; x=1685109296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvgupacSGkTj8dyYD1iL1po7E5I467+Q3tw00fnEn8M=;
        b=E12Cwlw+9WPMeJld022GvypaMBsRVQhfKw42VnMpH0iPbbgRGcjMU4gkn3xc0IKZbJ
         D5emf+0yMMFRUy+gZNHAZwz8LVubfSDQ8IC+Qr1tEnU73NyRB2wUKLiJZ9KbigWu3zsP
         ZqSYHz26RAtMwiCw3d0JlTcMng9a6k3++kV+PZVfwyH8kSfc/q3zquHPVLXSxGXXec/p
         KOvL9y07ROqQEJAiWw+eyqC3pfRuiQMTVWOmqYFAaPSuX9+DhezPxWMDMZY/OG6Qkleh
         i7dfqQuOh0UCIb1s8k9zjc7G6kBaOLShY6q/L45jYLG6L8G/2frCtATEzqBS2eQE/8i4
         cHkQ==
X-Gm-Message-State: AAQBX9dmmzmIPhvMePiuXDMNP3dzvP9Ws2zt9CFJ9sZ8rRch+QpJOEwb
	TQnhHOmyHB4Ffyw/KRTp5Crytg==
X-Google-Smtp-Source: AKy350Zx234OH5Wo1bCVMpMrPT2ip1YbO644BpDV87otlDgxcaU4yv082LJKJhr5gCuNhB8SSt3MIQ==
X-Received: by 2002:a17:906:2ad2:b0:878:711d:9310 with SMTP id m18-20020a1709062ad200b00878711d9310mr16838286eje.1.1682517296534;
        Wed, 26 Apr 2023 06:54:56 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id tk5-20020a170907c28500b0095004c87676sm8141186ejc.199.2023.04.26.06.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 06:54:56 -0700 (PDT)
Date: Wed, 26 Apr 2023 15:54:55 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: palmer@dabbelt.com, conor@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Wende Tan <twd2.me@gmail.com>, Soha Jin <soha@lohu.info>, 
	Hongren Zheng <i@zenithal.me>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/2] RISC-V: skip parsing multi-letter extensions
 starting with caps
Message-ID: <2pqjxrn7cj6lvlw5ulzgewvnswwocibufkzrh43jftsrboeuxp@efiwrvukn33v>
References: <20230426-satin-avenging-086d4e79a8dd@wendy>
 <20230426-devalue-enlarging-afb4fa1bb247@wendy>
 <zzxnphgq34d7pbbvjaoxal4i3mtn57x7avujr2brb3ddxorzno@3fsb57layf7m>
 <20230426-slinky-preface-0f40f3fefb0f@wendy>
 <d7t6nxmblmyqriogs4bxakpse3qc7pc6cczjnhmkpk4kjwvgcb@3aihh3erdn6p>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d7t6nxmblmyqriogs4bxakpse3qc7pc6cczjnhmkpk4kjwvgcb@3aihh3erdn6p>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_065501_371467_E90BBE60 
X-CRM114-Status: GOOD (  40.78  )
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

On Wed, Apr 26, 2023 at 03:08:25PM +0200, Andrew Jones wrote:
> On Wed, Apr 26, 2023 at 01:47:39PM +0100, Conor Dooley wrote:
> > On Wed, Apr 26, 2023 at 02:18:52PM +0200, Andrew Jones wrote:
> > > On Wed, Apr 26, 2023 at 11:43:24AM +0100, Conor Dooley wrote:
> > > > Yangyu Chen reported that if an multi-letter extension begins with a
> > > > capital letter the parser will treat the remainder of that multi-letter
> > > > extension as single-letter extensions.
> > > 
> > > I think the problem is that the parser doesn't completely abort when
> > > it sees something it doesn't understand. Continuing is risky since
> > > it may be possible to compose an invalid string that gets the parser
> > > to run off the rails.
> > 
> > Usually I am of the opinion that we should not seek the validate the dt
> > in the kernel, since there are tools for doing so *cough* dt-validate
> > *cough*. This one seemed like low hanging fruit though, since the parser
> > handles having capital letters in any of the other places after the
> > rv##, but falls over pretty badly for this particular issue.
> > 
> > In general, I don't think we need to be concerned about anything that
> > fails dt-validate though, you kinda need to trust that that is correct.
> > I'd argue that we might even do too much validation in the parser at
> > present.
> > Is there some attack vector, or ACPI related consideration, that I am
> > unaware of that makes this risky?

A bit unrelated to this, but your mention of ACPI made me go look at the
approved ECR[1] again for the ISA string. It says "Null-terminated ASCII
Instruction Set Architecture (ISA) string for this hart. The format of the
ISA string is defined in the RISC-V unprivileged specification." I suppose
we can still add additional requirements to an ACPI ISA string which the
Linux kernel will parse, but it'll be odd to point people at the DT
binding to do that. Maybe we should consider making the parser more
complete, possibly by importing it from some reference implementation or
something.

[1] https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view

Thanks,
drew

> 
> C language + string processing == potential attack vector
> 
> > 
> > > How about completely aborting, noisily, when the string doesn't match
> > > expectations, falling back to a default string such as rv64ima instead.
> > > That also ought to get faster corrections of device trees.
> > 
> > I did this first actually, but I was afraid that it would cause
> > regressions?
> > 
> > If you have riscv,isa = "rv64imafdc_Zifencei_zicbom", yes that is
> > invalid and dt-validate would have told you so, but at present that
> > would be parsed as "rv64imafdc_zicbom" which is a perfect description of
> > the hardware in question (since the meaning of i was set before RVI made
> > a hames of things).
> > 
> > So that's why I opted to not do some sort of pr_err/BUG()/WARN() and
> > try to keep processing the string. I'm happy to abort entirely on
> > reaching a capital if people feel there's unlikely to be a fallout from
> > that.
> 
> There might be fallout, but the kernel needs to defend itself. IMO, if
> the kernel doesn't know how to parse something, then it should stop
> trying to immediately, either with a BUG(), refusing to accept any
> part of it, by fallbacking back to a default, or by only accepting what
> it believes it parsed correctly.
> 
> The third option is probably a reasonable choice in this case.
> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
