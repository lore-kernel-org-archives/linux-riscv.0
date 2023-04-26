Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58E5C7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 13:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DXwi6xsAZss6V30whchdbIY5hHU3RbJ+0mrqGJU8y+Y=; b=wWEluioOHOSEqn
	idM24UguMg+Rl1Th7F6hphbaRWUsIgJY9gAgMdXw2QQqx4Dhud++ZObtXoSd/t08JijCyelv2tw5t
	lVT30n51rK1SEXh5+MNAIzlVaC5T3cxBTVq0+/RxadfwdWgnHnujr6QVaHRy4jknac3X8/wUQmLPM
	EuMSe04zbx0jloGCajRWD+K+kc8w5HpoEgGEWzJp/lvcuqByU/MgGD9ZQ+0Av/L1Pu8zVeiBIMYpK
	uG21QLD1blJtpG3Sy5V2OA/12lyPZev9Kaoe9BYhNxufhlEDL1IjlVvDlJVkrO9RCL2T+ctph++ZR
	K3yjZJS5xWjQcScV3Jxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1presr-0041qb-11;
	Wed, 26 Apr 2023 13:08:33 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1preso-0041pQ-0y
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 13:08:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-2f4214b430aso4424668f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 06:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682514507; x=1685106507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zO6vH5+SYnZM9P+Lcm+T/ozX1ikCX4RYJyCLp2R57Gw=;
        b=S8a9Eak+/j4SiDodR1mckDjlKMQIdzVkADH6s9svxEpQ0em5eX5r+1ASg0ObPtw88x
         Yx0BbsU7+QfjgcR0lSKEHdwrUzV/XGV6NhEkXllApzBiCxk8HcmrdVL/svkDy9/TfO4H
         brychuIrom+kHeFkEqL0oebA+qrXMKvCukRgms7KhO+uAHTlSppIRs+ZKDMNC32puXYc
         seUJKopJ8AKeD6n7ZKrHdKNU1OqtPQuu17GLcsx4PVc72PqCtReqRhwabnvK30GNBR6X
         FGiGsBS5ZyKgxA6KZxI18fhCykBD1ZUlL6eMQRG6kGH3GYqNwfBOvwptwzEP9LFHLbhL
         kptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682514507; x=1685106507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zO6vH5+SYnZM9P+Lcm+T/ozX1ikCX4RYJyCLp2R57Gw=;
        b=XOr1nGjwgIDGF6igQk09wMXJcgRKg5eIANdPBnJzQdbH0hrA3xj4RseuoV06pRNBWO
         aEBJcAYTFSK60Rd8ckSNjJDbMLiENBXSUzqU56x7pL179NaSzPe3Bb43/DFOdDjUSnNS
         bsKu6/YNsfikPl9ZDhhJHf+nw8PoO0kR1FSnGYLYf+ja6yqEijbZcaDFTcN9izxjNh2S
         L7smjwrooQ/rdt8lWnkh9hrRCRRY28prpyIVrRWJPgehBlxSs9QX9Ra3lrjmSJFkrEky
         IM4R8Ng6ZO7EK0dULSiwo/ayHE7MC0u387C6ZisAPNWIIkeXbtHL00EmQbXs8CiW67jY
         fcFQ==
X-Gm-Message-State: AAQBX9c0uHdSv/U9mm2b+WvqT3HSBdEhVtRbH3KwmFs8FxIe0JBIk8/I
	JQOzy6bgBRnjbXD+bGGTk3oXNA==
X-Google-Smtp-Source: AKy350arj0rP8zd1btzjhE01skkkXlhZxAeMfyE14sPnW9XXYx/SllF1bvXA5+sR/y9L/6ZXOaRBKw==
X-Received: by 2002:a05:6000:1c9:b0:2ff:a878:2de9 with SMTP id t9-20020a05600001c900b002ffa8782de9mr13277607wrx.21.1682514507434;
        Wed, 26 Apr 2023 06:08:27 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id n17-20020a5d4c51000000b002d6f285c0a2sm15849622wrt.42.2023.04.26.06.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 06:08:26 -0700 (PDT)
Date: Wed, 26 Apr 2023 15:08:25 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: palmer@dabbelt.com, conor@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Wende Tan <twd2.me@gmail.com>, Soha Jin <soha@lohu.info>, 
	Hongren Zheng <i@zenithal.me>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/2] RISC-V: skip parsing multi-letter extensions
 starting with caps
Message-ID: <d7t6nxmblmyqriogs4bxakpse3qc7pc6cczjnhmkpk4kjwvgcb@3aihh3erdn6p>
References: <20230426-satin-avenging-086d4e79a8dd@wendy>
 <20230426-devalue-enlarging-afb4fa1bb247@wendy>
 <zzxnphgq34d7pbbvjaoxal4i3mtn57x7avujr2brb3ddxorzno@3fsb57layf7m>
 <20230426-slinky-preface-0f40f3fefb0f@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230426-slinky-preface-0f40f3fefb0f@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_060830_338987_32C8C96E 
X-CRM114-Status: GOOD (  34.15  )
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

On Wed, Apr 26, 2023 at 01:47:39PM +0100, Conor Dooley wrote:
> On Wed, Apr 26, 2023 at 02:18:52PM +0200, Andrew Jones wrote:
> > On Wed, Apr 26, 2023 at 11:43:24AM +0100, Conor Dooley wrote:
> > > Yangyu Chen reported that if an multi-letter extension begins with a
> > > capital letter the parser will treat the remainder of that multi-letter
> > > extension as single-letter extensions.
> > 
> > I think the problem is that the parser doesn't completely abort when
> > it sees something it doesn't understand. Continuing is risky since
> > it may be possible to compose an invalid string that gets the parser
> > to run off the rails.
> 
> Usually I am of the opinion that we should not seek the validate the dt
> in the kernel, since there are tools for doing so *cough* dt-validate
> *cough*. This one seemed like low hanging fruit though, since the parser
> handles having capital letters in any of the other places after the
> rv##, but falls over pretty badly for this particular issue.
> 
> In general, I don't think we need to be concerned about anything that
> fails dt-validate though, you kinda need to trust that that is correct.
> I'd argue that we might even do too much validation in the parser at
> present.
> Is there some attack vector, or ACPI related consideration, that I am
> unaware of that makes this risky?

C language + string processing == potential attack vector

> 
> > How about completely aborting, noisily, when the string doesn't match
> > expectations, falling back to a default string such as rv64ima instead.
> > That also ought to get faster corrections of device trees.
> 
> I did this first actually, but I was afraid that it would cause
> regressions?
> 
> If you have riscv,isa = "rv64imafdc_Zifencei_zicbom", yes that is
> invalid and dt-validate would have told you so, but at present that
> would be parsed as "rv64imafdc_zicbom" which is a perfect description of
> the hardware in question (since the meaning of i was set before RVI made
> a hames of things).
> 
> So that's why I opted to not do some sort of pr_err/BUG()/WARN() and
> try to keep processing the string. I'm happy to abort entirely on
> reaching a capital if people feel there's unlikely to be a fallout from
> that.

There might be fallout, but the kernel needs to defend itself. IMO, if
the kernel doesn't know how to parse something, then it should stop
trying to immediately, either with a BUG(), refusing to accept any
part of it, by fallbacking back to a default, or by only accepting what
it believes it parsed correctly.

The third option is probably a reasonable choice in this case.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
