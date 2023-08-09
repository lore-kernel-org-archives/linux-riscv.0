Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8303AC0015E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 22:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EcQxCXd8H/1ni5MPKljajuq1q0eJyDBrHfow49EswEA=; b=StaqOqdSa4cu2w
	015HTYCRI+4dFZyrLPHwXR4Hepxx2AIhioTyyIjTDauUYVJWA5lmrUQ09r6YNYVSTnsDndOHJVZBL
	lrnTGlVKDJx5z5rhYEwJKpIaPWvTmU3tePo6UR3goDvKOuZgmi1tuP7xaVm7WxxJ0uKuj/rElfIld
	+QBX7C9jlChzAhgQiYqhhjQ5nFWeuReBhdpnoklt+7J9SQmzqWgYp9czGNqQuij8CexmpXkBfMAb6
	qUDO8M3I9UI11JP7ms6/HwiPOY8PNS/wWYrOOmwRsFo29dvD/UWbqTB/9mqgVlUW3QmOf1HvJMwoN
	EsHHxbum/aCh/gxgtYxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTrvv-0060xd-0m;
	Wed, 09 Aug 2023 22:45:39 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTrvt-0060wZ-0f
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 22:45:38 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6b9e478e122so280362a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 15:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691621134; x=1692225934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IYXl3RrdquB9Ho5EWgj4Trb8iaNi5AAc7V62J8/U+2U=;
        b=g9IRPR3fNObWkuKpLaklAg2KwEj1yjDutI0rhuDEpK8jY96HuF2psgETqe/XrmnPhD
         jva8ORxrZEcvXDzSK6ywrvMf/BOF5kgQJoeYleP5Uh4JpvzThQzWGsA6RUWhsNeJXNhb
         dte2auuNnDHSjHOLS9xgL5q/yWasM5K/0kAfqoTJRPYa0PDluh7q9HLvDdOKTlJJfHto
         5PDPiHv5gn02yEggqEHSGPT4NdPuFZSBwP61bEbRpbLZtthJfw1UYCJiH1bc5vmQi21o
         9S9lL0wqEs5RXiEqUFrEpZt5+wDoWrrGF0fXP006pmFQX7ibAWrur8lTWaj0rGrkUXhM
         Z9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691621134; x=1692225934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYXl3RrdquB9Ho5EWgj4Trb8iaNi5AAc7V62J8/U+2U=;
        b=TU+pt/D93CxPVbuW13xVhMgECUTwL02iDzn1xYb/hOxLusF2IKaPXmubraHz+IyUwt
         zpi4I6xir2eVg+OZxSMevQf5A/DeF6nsFgdZRuBsKthJoi46/6MgijkxGo+thBg3h1xf
         5g3FW0eKPPcnh2DVWpIeAyKqscjJmmB/RU4RuE24e+lxwxQIwkJbctYrelil2SR1n7FK
         qQ1qaJDPh3nRdyLQs2EW9Ko00PWVO1N5v8l2S/J4br2BvXwhoQ203aDtauwsan6c/WIF
         2DftB7/E6RGOqwpnDzY3SZyn0uz89x5viihqBRfUtEBBK5aFaJU8rX1BkRXjQYXsr4LV
         /T3g==
X-Gm-Message-State: AOJu0Yxe1UtAlP2Ahp8V37zCzi4KIM4NKYOg0jVa3dDKDR9jlyAg/X+b
	RxO8ZnXf3ZAwSB6prwQ/hr7vTQ==
X-Google-Smtp-Source: AGHT+IH+4koeF0K3irmsPyfqmp0CgHhX+m/BeL70iUcm3M72Bf4Rf+ltNoovX0/mGJoR9LCbEeV95Q==
X-Received: by 2002:a9d:7306:0:b0:6bc:8a9a:35a6 with SMTP id e6-20020a9d7306000000b006bc8a9a35a6mr486662otk.9.1691621134736;
        Wed, 09 Aug 2023 15:45:34 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id x9-20020a656aa9000000b00563df2ba23bsm108226pgu.50.2023.08.09.15.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 15:45:34 -0700 (PDT)
Date: Wed, 9 Aug 2023 15:45:31 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	conor@kernel.org, paul.walmsley@sifive.com, palmer@rivosinc.com,
	aou@eecs.berkeley.edu, anup@brainfault.org,
	konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	mick@ics.forth.gr, jrtc27@jrtc27.com, rdunlap@infradead.org,
	alexghiti@rivosinc.com
Subject: Re: [PATCH v9 0/4] RISC-V: mm: Make SV48 the default address space
Message-ID: <ZNQXC+UQ+a0s69Bs@ghost>
References: <20230809015110.3290774-1-charlie@rivosinc.com>
 <20230809-bobbing-unleaded-c3d5e1c57d96@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230809-bobbing-unleaded-c3d5e1c57d96@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_154537_245004_31B445CC 
X-CRM114-Status: GOOD (  14.69  )
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

On Wed, Aug 09, 2023 at 08:42:58AM +0100, Conor Dooley wrote:
> On Tue, Aug 08, 2023 at 06:51:06PM -0700, Charlie Jenkins wrote:
> > Make sv48 the default address space for mmap as some applications
> > currently depend on this assumption. Users can now select a
> > desired address space using a non-zero hint address to mmap. Previously,
> > requesting the default address space from mmap by passing zero as the hint
> > address would result in using the largest address space possible. Some
> > applications depend on empty bits in the virtual address space, like Go and
> > Java, so this patch provides more flexibility for application developers.
> 
> This still does not build:
> ../fs/binfmt_flat.c:900:30: error: call to undeclared function 'is_compat_task'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> 
> Reproduceable with allmodconfig.
> 
There is some weird interaction with compat.h. Moving the definitions
in pgtable.h into the #ifndef __ASSEMBLY__ guarded section resolves 
the compile error. I will send out another version with this change.

-Charlie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
