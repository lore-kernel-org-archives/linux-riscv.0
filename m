Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59A5C0219B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 09:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f3fElc1UmLtaapAWT4WJJd69FCCQNLZbgN3Ijvtk+GQ=; b=r5SW5UP1MbzHC1TmpgP9cUWPVw
	SG74pXGsrsg+kKPCRi6QiuOtiSvdpJCeQ3giSwa/lViejCemi/hN1V1eP0gdJnW+ggnqxtWKAQmmj
	QrAElzQ3VvRhfem7VXhRMJ+Wk4J9NSxlaXmsqeR7pmFfcKeLucBxa3reVNAcoglHgyCh2BlfeX9n5
	au1yOWkJyekrZ7WfGZ//QWOmMk2yEFJGbTRb+8nKBIbsO//NtkGbrUrase3qWI4mTEiwCf6vq/ivE
	4vv4TlaK9Y3aLdF4aOHFLpO40I1XuDpy+wUBXXWYdPHKVBucLs3ebkI5I7n3IwMMsLNKm4fjR3ak1
	GOOSqjZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmS3-0000000390E-0vIV;
	Tue, 11 Feb 2025 09:21:07 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmS0-000000038zi-26GH
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 09:21:06 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9933C4013E
	for <linux-riscv@lists.infradead.org>; Tue, 11 Feb 2025 09:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739265659;
	bh=U64CfSm4srCsWUzG3+CxHvNhRpvC2/rUcpu6NW74+lE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=I+0lO+ExNG7HUQShYsbzzp+yfdwvSIl0DrR+fIFuVoLilvsziruTqkLt+7q+3NpoL
	 FdWfQ0WEXJHPhmwh24yXpmTSlYxxawt1rV0gXqVQwJYjhelkbRO6C5V8bwMm/YaKmh
	 9PhwLl9vzBHKeCiNQqr1kqExkRhKTgCCoDLIR5skKc2XEYSTdH+sooeJYWKmSOjFXU
	 xMI/KTUf1Ei1ZiKloUEXhvz3HMFkKnSpA6Je2nqL7kbvAvF+wZwlbYiuz03+v+liY6
	 jYcb5L6k9Afin/A6lwysWr+wLdas1MUTgyv9WWKVXLaWZtW8Z8QkeDgbw6b5SI3spm
	 FvBSrnlwPzK/A==
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5440e90eea9so2458275e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Feb 2025 01:20:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739265659; x=1739870459;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U64CfSm4srCsWUzG3+CxHvNhRpvC2/rUcpu6NW74+lE=;
        b=H9IqIwoj0wwIsjAoLzzbB2xvJJ1jm5Holtn/tUAH6OtMZBXUgDJYrW0ZfGUqyxKMQW
         +KwadVdbivb+TXLFXjFXfgp93Ke5oOuUMbw1Ozf+CEolZLtZd0QOgRg/fCRHF4U8skX0
         XTsviz7xu5sL+/wfZZIU5cvqRDZ7ciPfqo6RCi3TYOGb7fPLXphHD7b15uZg48qbL3wj
         qIW5QDcoPd71opwZIaWb1wizyEXTGjRDkpIHx6TTmYr5m5nP8uX6jBhjnqO+oGPDZEu0
         dh3lKKlTKrGsaoN8sYsZG/Cg5qDyEnu8owIclQV5dplebabSUoNZRB+Kdw4wglAuuhI2
         0gtA==
X-Forwarded-Encrypted: i=1; AJvYcCWuvQ51lv+oU6P2ehk06j8ixDQRwRafleJcshCn5Qyiog6GeWiMXvl9K12I+ngBxbomCi/sDAor4E5Xeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBdhYDEMHkODBvUW8iRmU+qVciOzPl+oq6rQO7f4TI+i+Yz9Wh
	le9WCEj9aqh+8vwvDhwdpNGIYrqhT5Na1FLrjVKNV+msIys7OHjGqo+LlR0kydRH1G5caVSiU+C
	4L7ChRgYoMZBILPpaR4AECK20l/E6mVv3xcyQd1CCPJqpbtU7/r793FmP21TPgUghAt5XZ6fdiv
	ewStlslBCWr+kqYL4AoXFjj6ORj1O0pggRcicgfWpJURqoK6t5/6qBLlnU
X-Gm-Gg: ASbGncv6n2iCzOPtE28nyVReb1U/gGDdnOlx6Ho4XD74h7WWz32XcUU0ZO00DNaoYep
	ESqREhjOnlUCqc+ppuvNb6+b2e9iWTukg/O+X9GPGweeYM0FcEWtSUAcClsBuoA==
X-Received: by 2002:a05:6512:3581:b0:545:8cb:2183 with SMTP id 2adb3069b0e04-54508cb22cfmr2090715e87.29.1739265658885;
        Tue, 11 Feb 2025 01:20:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuJMSQ/TqRY+ByJfSTG7hk8lOXnBPzeFqbVF3O5Rk8LKphBVZBFUQ/+lvWBZ+XFIrTHvdv/73i4M6xhpprmoM=
X-Received: by 2002:a05:6512:3581:b0:545:8cb:2183 with SMTP id
 2adb3069b0e04-54508cb22cfmr2090695e87.29.1739265658468; Tue, 11 Feb 2025
 01:20:58 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Feb 2025 01:20:54 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Feb 2025 01:20:54 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <6ae4838b-f7b5-419d-8659-7b8779a74adb@ghiti.fr>
References: <20250205143903.413959-1-emil.renner.berthing@canonical.com> <6ae4838b-f7b5-419d-8659-7b8779a74adb@ghiti.fr>
Mime-Version: 1.0
Date: Tue, 11 Feb 2025 01:20:54 -0800
X-Gm-Features: AWEUYZlZSryfeuoyf0ZVN0odSbkSu51s5prPv-mgznTC7yy0Fa37Rsfs98SEMSw
Message-ID: <CAJM55Z_X4A_FO1OrA=3jC9+uYhs-Pe0zFSxavFJv3orOka9CdA@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: Use of_property_present() to test for
 non-boolean properties
To: Alexandre Ghiti <alex@ghiti.fr>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-riscv@lists.infradead.org
Cc: Steffen Persvold <spersvold@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	=?UTF-8?B?TWlxdWVsIFNhYmF0w6kgU29sw6A=?= <mikisabate@gmail.com>, 
	Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_012104_926334_F3B2F8B6 
X-CRM114-Status: GOOD (  18.80  )
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

Alexandre Ghiti wrote:
> Hi Emil,
>
> On 05/02/2025 15:39, Emil Renner Berthing wrote:
> > The use of of_property_read_bool() for non-boolean properties is
> > deprecated and since
> >
> > commit c141ecc3cecd ("of: Warn when of_property_read_bool() is used on non-boolean properties")
> >
> > a warning is displayed when used incorrectly. Fix it by switching to
> > of_property_present() as recommended in the same commit.
> >
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > ---
> >   arch/riscv/kernel/cacheinfo.c | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> > index 2d40736fc37c..26b085dbdd07 100644
> > --- a/arch/riscv/kernel/cacheinfo.c
> > +++ b/arch/riscv/kernel/cacheinfo.c
> > @@ -108,11 +108,11 @@ int populate_cache_leaves(unsigned int cpu)
> >   	if (!np)
> >   		return -ENOENT;
> >
> > -	if (of_property_read_bool(np, "cache-size"))
> > +	if (of_property_present(np, "cache-size"))
> >   		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> > -	if (of_property_read_bool(np, "i-cache-size"))
> > +	if (of_property_present(np, "i-cache-size"))
> >   		ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> > -	if (of_property_read_bool(np, "d-cache-size"))
> > +	if (of_property_present(np, "d-cache-size"))
> >   		ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
> >
> >   	prev = np;
> > @@ -125,11 +125,11 @@ int populate_cache_leaves(unsigned int cpu)
> >   			break;
> >   		if (level <= levels)
> >   			break;
> > -		if (of_property_read_bool(np, "cache-size"))
> > +		if (of_property_present(np, "cache-size"))
> >   			ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> > -		if (of_property_read_bool(np, "i-cache-size"))
> > +		if (of_property_present(np, "i-cache-size"))
> >   			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> > -		if (of_property_read_bool(np, "d-cache-size"))
> > +		if (of_property_present(np, "d-cache-size"))
> >   			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
> >   		levels = level;
> >   	}
>
>
> The same patch has been on the ML since last november:
>
> https://lore.kernel.org/linux-riscv/20241104190314.270095-1-robh@kernel.org/
>
> And was already re-sent once end of december...

Yeah I saw that later, but it would still be great to have this applied in 6.14
so we don't get all those warnings at boot.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
