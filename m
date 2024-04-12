Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CFAC04FF0
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 01:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kpfuuZ59oOZExKKYY/KZPp2uMSMVZBmCs8aY6jtYbwg=; b=182vQzHI5DR+PO
	npUG3B4jPl88GKDRV3BEJJQFrQw96qUbcm34Kj7N2fAzEXJ2tM4Kd8u+4sr+Qji2swbYQ5p3a10l6
	nUa3SJ4TiATyEwEaMImgLFQnXSol8jF6F3AiKXKM/YWGljpWhUzupLGaCO5BWNbLrlUe+Yad8z1sl
	UHZ26XGiyE2Yv2aZAVgyobiU9k6hF8c+U0151yeZg2RNl8PDkOFdkZ+kcqhjceCuB6yAkIe+V+lu+
	jKxs4YCzLkxwLwM+ktpKvvo8MH8m+YpcdPNVTT+TUlZchES13kNFV92YaoU/1P7XIAVSJ8Fa8WJ5n
	SZ294aXW2pbXbjyBiB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv67o-0000000Ep6y-0Kmj;
	Fri, 12 Apr 2024 01:54:44 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv67j-0000000Ep5q-2ov6;
	Fri, 12 Apr 2024 01:54:41 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-346b94fa7ecso371111f8f.3;
        Thu, 11 Apr 2024 18:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712886876; x=1713491676; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y4vlt8TB9yDjErxa7aoPppj34TQs7XIg9OjF7nGdMbk=;
        b=abrPmGmvwiFXdCT7LZrjo/eORtEM+wJT15IpOVCrZvJw2cTKr9roMRufr0HLxbfBMd
         xs37RtvbmbtEeVEhauqIA3slcD+TFHE+GMcL462YnOBFeCWjxBEcC1jdKDTu4Y6Id5yQ
         2dX5ois2/bWZvShhmq/UwW14eTSzk0fgXAkd5XzBIqBJdLOpJ9UcA2chbicYDLUICwjb
         Bi49vwbhXGwDdPTDBJAfwV6qCunNtOXJJ3vi32bHOxmDvqNlFk/EwJUg3WTZlnIfcFue
         bfWpDePao4JTn/7eWnsMkN0PYekSGhowE7xRRoLWPMwjhp4CPkACXlbgc+R331Plm/uP
         ChOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712886876; x=1713491676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4vlt8TB9yDjErxa7aoPppj34TQs7XIg9OjF7nGdMbk=;
        b=SbSVZ46j1NexLy6S2UximCudzyvMqWGxpqZA0d2ni3uz6M1Ee25/NY974DN8bEwmmk
         mWRaQ5U7pZ3+Y0q4eM8al1D0yu4sAHUVEdbiqhSpg9TNARd067T7OiTCMWl0WNk7vQTY
         oFIB7qsHyZIB/9UxwSnnXNOBvUOENp7qa70l+WFjDwpKT0JyF6p5BHDmhpECWxNoPsqw
         ROCqFUDrfVc2NLMPH4b7Ei0mTzFrkB+CjC36td9X9eXdSugA5x4ttoEAlQpjJGszFB1R
         Y4Lwonl6Bqr0UI/cAWuUzm+3wHN7Wuf0hfV9YmmS7VaQEY23JCVDvbmdaeIf5bHfL20/
         GA9A==
X-Forwarded-Encrypted: i=1; AJvYcCVwFn4s1IXE/K6psDNuCjFghq8EeGVgJfZIUFbqzF8lo6oBTF1CZg2ZPVyEUPwqKNs5qryFtklEKGxZzKweRi+Z2qcODw+Nejy9q8zEZwj8p1G183k3c1ucYZP3F60iwp1xjq+pcEhD75yYkt5BYoCqrU60ozk=
X-Gm-Message-State: AOJu0Yz2glqX8mPtrcfvTZotIC1/xpWYzQ/fr7SFPjlK2qscmy+fB+Pn
	MTAgv+i7xbaZwzX1vL6DN4V0CVXalgPzUOW6Zsg1tPBecAokIkw5OcegIFrn8a3NigC/bRBhkic
	unRUjypAcoWWeAAlr4e5eemMiQtU=
X-Google-Smtp-Source: AGHT+IH+PR4h3oVtQ8Ez0cRs6zyDvlUxECTYXxWqfVRSac34W79R5yeA3Zq4bIaDyQbovOeeCgfyqRUJHwPOnRqGQX0=
X-Received: by 2002:a5d:474f:0:b0:33e:ca28:bb59 with SMTP id
 o15-20020a5d474f000000b0033eca28bb59mr856430wrs.57.1712886876424; Thu, 11 Apr
 2024 18:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com> <87wmp4oo3y.fsf@linaro.org>
 <75a37a4b-f516-40a3-b6b5-4aa1636f9b60@sifive.com> <87wmp4ogoe.fsf@linaro.org>
 <4c8e63d6-ba33-47fe-8150-59eba8babf2d@sifive.com> <CAMj1kXGW5XQxXrYaPhT6sCjH7s0EwqzNjWies3b8UWnUBW5Ngw@mail.gmail.com>
 <c0e170f7-5498-40ed-ba35-2ac392c2dd2a@app.fastmail.com>
In-Reply-To: <c0e170f7-5498-40ed-ba35-2ac392c2dd2a@app.fastmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 12 Apr 2024 11:54:25 +1000
Message-ID: <CAPM=9ty_9yKEk+cS6oJ8gD_UiB_K4X3P4mLv2RmKixLaq-1RfQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ard Biesheuvel <ardb@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev, amd-gfx@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_185439_735969_F62D4E3D 
X-CRM114-Status: GOOD (  32.61  )
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

On Thu, 11 Apr 2024 at 17:32, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Apr 11, 2024, at 09:15, Ard Biesheuvel wrote:
> > On Thu, 11 Apr 2024 at 03:11, Samuel Holland <samuel.holland@sifive.com> wrote:
> >> On 2024-04-10 8:02 PM, Thiago Jung Bauermann wrote:
> >> > Samuel Holland <samuel.holland@sifive.com> writes:
> >>
> >> >> The short-term fix would be to drop the `select ARCH_HAS_KERNEL_FPU_SUPPORT` for
> >> >> 32-bit arm until we can provide these runtime library functions.
> >> >
> >> > Does this mean that patch 2 in this series:
> >> >
> >> > [PATCH v4 02/15] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
> >> >
> >> > will be dropped?
> >>
> >> No, because later patches in the series (3, 6) depend on the definition of
> >> CC_FLAGS_FPU from that patch. I will need to send a fixup patch unless I can
> >> find a GPL-2 compatible implementation of the runtime library functions.
> >>
> >
> > Is there really a point to doing that? Do 32-bit ARM systems even have
> > enough address space to the map the BARs of the AMD GPUs that need
> > this support?
> >
> > Given that this was not enabled before, I don't think the upshot of
> > this series should be that we enable support for something on 32-bit
> > ARM that may cause headaches down the road without any benefit.
> >
> > So I'd prefer a fixup patch that opts ARM out of this over adding
> > support code for 64-bit conversions.
>
> I have not found any dts file for a 32-bit platform with support
> for a 64-bit prefetchable BAR, and there are very few that even
> have a pcie slot (as opposed on on-board devices) you could
> plug a card into.
>
> That said, I also don't think we should encourage the use of
> floating-point code in random device drivers. There is really
> no excuse for the amdgpu driver to use floating point math
> here, and we should get AMD to fix their driver instead.

That would be nice, but it won't happen, there are many reasons for
that code to exist like it does, unless someone can write an automated
converter to fixed point and validate it produces the same results for
a long series of input values, it isn't really something that will get
"fixed".

AMD's hardware team produces the calculations, and will only look into
hardware problems in that area if the driver is using the calculations
they produce and validate.

If you've looked at the calculation complexity you'd understand this
isn't a trivial use of float-point for no reason.

Dave.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
