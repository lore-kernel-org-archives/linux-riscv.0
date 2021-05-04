Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79EDC433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 13:25:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B423611AE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 13:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B423611AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5UsUde8LFkiQEU3FIn3nehEm3WWW6RWsEJA3O4jGqJM=; b=Tvf0qc70A76tRDqRxfCS3msqA
	8Fxt05yQxboJA9rFARr4zqkpxrkD6Arl2WWOzEin6r9AMxmkWBKOienbPoKD1jqob7kfujVqvtNU2
	Hgw3JSrGNrK/PM6onjYhvvSMB6y/AxssZOFMIP+r9f8We8o69Ws8WfdFIhvw8Yc93KxGWx+8XM56v
	3X4t+1tVlSrZznR7+XVL4gzPZ3vOVc2a3MwzobsQNHQWHacv2dsTawSQSD2O5j8KhRCje2iIVu2U6
	/MPYIaspNrjw8/OWfTcInFrHM5eeQS4i9gSZjNL7B8fL5Xl7T8HyxLlORLs1HzWRCpnR621YeTk+t
	v9dHEH93Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldv3K-00GGTd-Ix; Tue, 04 May 2021 13:25:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldv3J-00GGTL-Aw; Tue, 04 May 2021 13:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6Usua23eG7jeiBMRqPk961Vu0oHy/tcPvUmAPfGsd3M=; b=dsgIrV21ytgEMZ8uGWaagkMTv7
 Zdg29n3xoW/LlMywHQpOq7fHO3mJVz4m3A5kjC0IhBI/YT5FNOrY9GjbQKFByw7xy54oGP1h3p3Ve
 OBWSdXbX8DfyTioyhBD7vo5AT8Rv0o7bOKklKSJGJd1zR4yIbbmKhSzOewLXKNm2liJMOnW7UXQhd
 K4JZXkHXwsMZl50KXKxCeUEp7yIHqiqLycM5VCNWgJQzR0PG89L54B/mBrHG7qDgJUq+qhqMl860N
 XZlTPKhn3xpaS3DX6Qa+hokXhcxr1LQJEpd5ej43c8OnZCU6IILscZJ/LrorzvGaQOxuoqPAP2Ys/
 NoQO9mnQ==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldv3G-003zq5-Km; Tue, 04 May 2021 13:25:28 +0000
Received: by mail-pg1-x534.google.com with SMTP id c21so2664449pgg.3;
 Tue, 04 May 2021 06:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Usua23eG7jeiBMRqPk961Vu0oHy/tcPvUmAPfGsd3M=;
 b=sTsLRdnna2sWw8Z9FaRNxSMft/pBwo/y8kKHX5A/bs3GC09QaDMsRY3ukXdyuzno5K
 TTskFLmfiBewHvymg8gVK4V/TVKfQ23eP/Tu218+y4OC9ZktHTTfkJaMdWa7vEwWHVHf
 VxYQ8k02YYjFMfqJEehpLYDZNE6BW1NlQEESuSmZ810jAvl03Y3YtDZxi0VRPLFBXUYJ
 uFkEjyscASDsMyBzUlSN2YID8zDZop12wU5y2YkeCcPz8pkVx3zQ8M+7EstrM8ejVLtl
 +UOwsKs2q6eecp6bytsFx6j4sQe81qn14UFJkgvj+14FZVfWqRencBKKh1p/ACnYmBNR
 rY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Usua23eG7jeiBMRqPk961Vu0oHy/tcPvUmAPfGsd3M=;
 b=LMY1ATm0eCZLWmW9pmMwYyuoSnAdnTG1Frl2XcXB+nJCPUR3ySIDt9KWnd80i5sivB
 1rDxB/EEAM+TjSycAnmWS7cpHpvg/yk/HuVgBG0FQYHBrdboTYkcy0ZRAQV66KufXDAv
 gAQwv4Ca1ecqvLvjd0z47LkPBLwSiif+X79xKsz+HkPuPuUkAjePJN9Sj9MqYUvJRWzN
 gxnZdbGkB6TmYqeHp3+IcAJBEK2ph2LsaLJyzbJBw1JyG1PRdgB0tZPdtg5neaJaC83P
 kX2KPGFbtsgtaGXbgGxsrso2QU5gUNmG8MAFV+d1fB1OFFOLBX1j11Ib/PtX0wFOxF48
 Ap0A==
X-Gm-Message-State: AOAM530KtRgGnzzPajG+k1olIrXo4WoP5a6mIoPQzmeu7mL7j1fFnG34
 Wu7SD6FiPbp68M9OoQa1vvZBzShC2+60677GpS0=
X-Google-Smtp-Source: ABdhPJzvGspK5lFxakG5qrtBG+U2cTV9ewqHbVPwR6w2Q0rRyLr2DmXQST3reCaT/EdEu09iSl/HelPXit3utm0fpRE=
X-Received: by 2002:a17:90a:d90c:: with SMTP id
 c12mr5218252pjv.129.1620134725780; 
 Tue, 04 May 2021 06:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org>
 <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
 <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
In-Reply-To: <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 4 May 2021 16:25:09 +0300
Message-ID: <CAHp75VdE9h9=CpzX094iJ52HR6Sz+f-qGfCt6YHfSPpG2Lb4-w@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Arnd Bergmann <arnd@arndb.de>
Cc: Matthew Wilcox <willy@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Segher Boessenkool <segher@kernel.crashing.org>, Joe Perches <joe@perches.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_062526_707700_6D75FBE0 
X-CRM114-Status: GOOD (  29.73  )
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

On Mon, May 3, 2021 at 12:29 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, May 3, 2021 at 9:35 AM Alexander Dahl <ada@thorsis.com> wrote:
> >
> > Desktops and servers are all nice, however I just want to make you
> > aware, there are embedded users forced to stick to older cross
> > toolchains for different reasons as well, e.g. in industrial
> > environment. :-)
> >
> > This is no show stopper for us, I just wanted to let you be aware.
>
> Can you be more specific about what scenarios you are thinking of,
> what the motivations are for using an old compiler with a new kernel
> on embedded systems, and what you think a realistic maximum
> time would be between compiler updates?
>
> One scenario that I've seen previously is where user space and
> kernel are built together as a source based distribution (OE, buildroot,
> openwrt, ...), and the compiler is picked to match the original sources
> of the user space because that is best tested, but the same compiler
> then gets used to build the kernel as well because that is the default
> in the build environment.
>
> There are two problems I see with this logic:
>
> - Running the latest kernel to avoid security problems is of course
>   a good idea, but if one runs that with ten year old user space that
>   is never updated, the system is likely to end up just as insecure.
>   Not all bugs are in the kernel.
>
> - The same logic that applies to ancient user space staying with
>   an ancient compiler (it's better tested in this combination) also
>   applies to the kernel: running the latest kernel on an old compiler
>   is something that few people test, and tends to run into more bugs
>   than using the compiler that other developers used to test that
>   kernel.

I understand that you are talking about embedded, but it you stuck
with a distro (esp. LTS one, like CentOS 7.x), you have gcc 4.8.5
there for everything, but they have got security updates. Seems if you
are with a distro you have to stick with its kernel with all pros and
cons of such an approach.


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
