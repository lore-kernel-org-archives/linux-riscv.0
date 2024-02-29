Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C073FC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 23:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=i571gimOCPP1dLeF286X85tokKGPG7QrC+BVffhst7g=; b=fm2ZyfwNWIfRzopjAPYipFs/kS
	PzVvfRYGhcAcz3x4IVxP9c8Viv/tX9Mhgh0S5s7IpObSj0tXNB3CgdfNRETfXtUoz9HUyo6i9Vaut
	Z3uSGySptvzZV8tKCEwCX+g3GIQttOxI9Q3zzqKJFLJqFY+Jr72Bkxe4EYhnu/8mriaGFefc01hX8
	+ZeAcyaH3o16+CZqk4igyviDesICPL8LgzHy30wIq4ncahZW+EiQL0WdT86N5NKXjvzrQqSheGPcp
	BI2ZXBcYG5/v11+ll4CLlDFHLU0RqSE8n1g/Frxy7+waUDVxirSM8qEubCNg0qZq+Vi6yIzxnRBMa
	kW7UX+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfq15-0000000Fepf-18PS;
	Thu, 29 Feb 2024 23:40:43 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfq12-0000000Feow-08ZS
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 23:40:41 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6e56da425b5so1194653b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 15:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1709250039; x=1709854839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lx8BWhywoDIgpgt+e03ZrIqlEHq0YVesZbrDMn3IG9M=;
        b=vsiz1eaVh908NNfvtqLCvw5axRCUr+Q9hBv/EmtPwNXqEBxGOTtlJYmCZnDWeWrLmx
         PNRoReESUBziFhAOWKHjaqzBAJ+cCkBrg0E3OakFdlBkglDJ1smggdLGH/OQuGOYc8CR
         pZTzNm63KzSEmy4vEn6bid/oJj+4Tm3OyMnpekCZkOtC5ZAedptYRLrw1nlbsYGTsn+M
         6MZ0X2Wp+WMEOcbdD52ClIT3cmIq5s4Rcc4q2dF2YaUn0PBh523sKObiyVkg6JasKGJL
         ACSbQj/FVkc671y4rDw0WwnYZjAALWxhOqMRxHk27Sh9vRmYbLELxoOJPLFmIgPV0B1c
         VuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709250039; x=1709854839;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lx8BWhywoDIgpgt+e03ZrIqlEHq0YVesZbrDMn3IG9M=;
        b=Da2C9drayn9stbsn3beRO6XfZN5JvY7S6H6NknjDG3Fq3PzkviJKcy7Q+ULAK9coz4
         qdn/XmUZ828pF+0CKL25RNnDBl2yBjiFScXT5s6DvuGC4ueDpAbFH/k3S3y9siaQAaG3
         pOQTQzqJAjB0mC/xgWglM1TNyiSgMwInfZNSw3k6jys37/DF/z8gV+244y69qFGavkYe
         XmJUH09kz9QxnvwyYRD6KGiQyMNlkIadN9EdxpQoI7V4TWnPv9ynDnrCoB7Xbc8myGkw
         kwwsg3Oo3fA5ZaOIZB5HE4upQ5PMu8lYtmNi21gSqNopWRo+CjiW8EXmH596lDsuQ8v0
         xh4g==
X-Forwarded-Encrypted: i=1; AJvYcCUWpM+YfgzYFOkpi9Z1rr6qiKTrLnprrsa+I5ttMbWxdj/InbDZXIQPZg433iVPXQjZcotkgc47UjKuWrLrPWBAWrtFOuYoVYmeSj0cgou2
X-Gm-Message-State: AOJu0YxNOGiFq9yoFEStZ15gfc2w7/vIhNOmOCgCnSf9vJamgE0cCN3O
	22kmiUsU8wUa+ZYBisHMkxM7vgXYgmfO6f+vzgFYCrRlBZNKlBrpuyUPrHuyKeL1pTLyjDhjlv1
	b
X-Google-Smtp-Source: AGHT+IEP0KUN5vieOSkjcb6f/9wrtZCWTiS6hFvutEkB79kR+hMPoz0zBj3WKb8OwHFOckN1Bdptdw==
X-Received: by 2002:a05:6a00:188b:b0:6e5:9698:7cb9 with SMTP id x11-20020a056a00188b00b006e596987cb9mr278229pfh.4.1709250038519;
        Thu, 29 Feb 2024 15:40:38 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id k16-20020aa79990000000b006e59615812fsm1693015pfh.213.2024.02.29.15.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:40:37 -0800 (PST)
Date: Thu, 29 Feb 2024 15:40:37 -0800 (PST)
X-Google-Original-Date: Thu, 29 Feb 2024 15:40:31 PST (-0800)
Subject: Re: [PATCH -fixes v4 2/3] riscv: Add a custom ISA extension for the [ms]envcfg CSR
In-Reply-To: <20240229-establish-itinerary-5d08f6c3ee43@spud>
CC: samuel.holland@sifive.com, ajones@ventanamicro.com, linux-kernel@vger.kernel.org,
  alex@ghiti.fr, linux-riscv@lists.infradead.org, sorear@fastmail.com, stable@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-0128d165-88ba-4952-b875-c35b06ce9224@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_154040_320784_4536434E 
X-CRM114-Status: GOOD (  35.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 29 Feb 2024 10:30:10 PST (-0800), Conor Dooley wrote:
> On Thu, Feb 29, 2024 at 10:23:39AM -0800, Palmer Dabbelt wrote:
>> On Wed, 28 Feb 2024 02:12:14 PST (-0800), Conor Dooley wrote:
>> > On Tue, Feb 27, 2024 at 10:55:34PM -0800, Samuel Holland wrote:
>> > > The [ms]envcfg CSR was added in version 1.12 of the RISC-V privileged
>> > > ISA (aka S[ms]1p12). However, bits in this CSR are defined by several
>> > > other extensions which may be implemented separately from any particular
>> > > version of the privileged ISA (for example, some unrelated errata may
>> > > prevent an implementation from claiming conformance with Ss1p12). As a
>> > > result, Linux cannot simply use the privileged ISA version to determine
>> > > if the CSR is present. It must also check if any of these other
>> > > extensions are implemented. It also cannot probe the existence of the
>> > > CSR at runtime, because Linux does not require Sstrict, so (in the
>> > > absence of additional information) it cannot know if a CSR at that
>> > > address is [ms]envcfg or part of some non-conforming vendor extension.
>> > > 
>> > > Since there are several standard extensions that imply the existence of
>> > > the [ms]envcfg CSR, it becomes unwieldy to check for all of them
>> > > wherever the CSR is accessed. Instead, define a custom Xlinuxenvcfg ISA
>> > > extension bit that is implied by the other extensions and denotes that
>> > > the CSR exists as defined in the privileged ISA, containing at least one
>> > > of the fields common between menvcfg and senvcfg.
>> > 
>> > > This extension does not need to be parsed from the devicetree or ISA
>> > > string because it can only be implemented as a subset of some other
>> > > standard extension.
>> > 
>> > NGL, every time I look at the superset stuff I question whether or not
>> > it is a good implementation, but it is nice to see that it at least
>> > makes the creation of quasi-extension flags like this straightforward.
>> 
>> We can always add it to the DT list as a proper extension, but I think for
>> this sort of stuff it's good enough for now
>
> Perhaps good enough forever. I was not advocating for adding it as a
> permitted DT property - I was just saying that I didn't the complexity
> that you mention below, but I was pleasantly surprised that the stuff
> ?Evan? and I came up with allows for this kind of inferred "extension"
> without any changes.

Ya, I'm in the same boat.  I think we can get away without putting these 
into DT until we end up with something odd going on, like some other 
flavor of *envcf from some vendor being weird.

>> -- we've already got a bunch of
>> complexity for the proper ISA-defined extension dependencies, so it's not
>> like we could really get away from it entirely.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
