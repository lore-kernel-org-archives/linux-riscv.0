Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10407C30658
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 09:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSeR11a4SH6OfNS7QYzX8eWbODEMHoQB+pzsVylx9U8=; b=21XZ2v2EuXQG08
	S5EO7GfV/vGNnvPUyIT55etAmyE2EOFtTUzifegE22qmjmELdJL4S2rTHgVuG14X0YRvsDOX2CyeI
	kl6Ep1OTscc8EBCPDEd9B4jA2Hg5TjC8U7GTJE//c4J71w8oAKGwrfXm0gSNHnakA4pk9Z2ar6VXK
	kIACoV6bZy8CrTtdUBEXpOyNBSZxpG4SZjvp4ASkhdphIQY7+i6XNT7CLbfu5WBthAobmbTGgoJVE
	3uyRRG9LpwSsfJWP4qFquxor6+zPVltdilh9yhIFYGgJOr5FYq+QkBbsnsQmKVi8PnY57iVHbRzCh
	GlXzj7zZIp9Vaa0edMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPeyV-0000000FPMM-0KWw;
	Fri, 05 Jul 2024 09:11:27 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPeyR-0000000FPLb-0wch
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 09:11:24 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-58c2e5e8649so3690488a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jul 2024 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720170681; x=1720775481; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tFVTuWApmF08b6diV6/k3QYObKt2iVbPWZ1EGAddbk4=;
        b=JVT7DFlm2qQcIVNfex6GVJse76FBjRoorlmK/BbYv2LLbIpkpaVh9oWhX/HTzdaDYR
         jCfM6kcIRXwQwRRxu5uSddc4tO9Ma3Q0EVjUxYs4ZOx3WitwIAEfgNw8i2V9NJ3nRe3X
         sXCHDdzETUXDy8d+OivA3plhvk+3CA4r22wTCPoI9DcCyVn20YVoi6g082FlvYMsfQEV
         TdSmFY6p2lXi+3rry0tVEEi8o3UIhMPCseHsj5sL6whz6ZxhzJskuK9kxzj3250vGGe0
         U+wBscgc+fraSEwMJkEZIs8d/6uOD38El/GP/9a61jdWbHWsb2BwsJFZOP5W+cdsVl1Q
         vSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720170681; x=1720775481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFVTuWApmF08b6diV6/k3QYObKt2iVbPWZ1EGAddbk4=;
        b=dFdcCv2KfZwte6zzLim9mLN6G4vcYyU4rk6nHYmoi6YlWVCjIfZHj6/hz9O+WBax3W
         utXHlMGr7jLpUMVwr3JirTSb1oZPKkS2KQ/BeNvz4F0CDqJUVDWtO0DTZuBoc//OGRfu
         0I4FYp+QPHa4eQAaRqGcYjpoDQrbmroB/T4feWC4o29gY75xV7TvZepL9JdNXA9OePcE
         LvUnRYkgNZIScT0xJjrypn5ajxZUq9zxp1mNQ1Y07+BM0SBX5T02qKmdHRfkPCvI3RcI
         7jOn8WVepU/ri2zqyk3zzWNa/ZP2jeLK8W3C2k7eoTjaXWB/VUyYlhUH5ErRXcLvS1u5
         AuKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCObGld8cCsOtozgVK0kAbfeKJ6Hs39WlpVepKRwc70nJTYl6eW5po98yehLcmOwXuDuRnXKMVvy06WiAmDGj07jXT8BLeCtp9JhKchS7G
X-Gm-Message-State: AOJu0YxB4uEUQRLqe9kAu3DyjWTZCHqzsoWDbZHXPEPxuA2+3zTDO8Fw
	Wds+cyX+vCqZFT075exaKye+kooiOGWCrW8YdoGxVQJJYwEf3fSbpHMq9C1ruTsMggbhAz8G+zk
	SngCn7+oGDYiuKXziGcEx0iDzDBDf/A==
X-Google-Smtp-Source: AGHT+IES48Ua4k077GMXI81WDVe5sTbjVgDZ5/aHC4u0ds3E3f/Es91e9OxI3B0qRmmnO+D/15fo0gyY/p1G3e8/rwo=
X-Received: by 2002:a05:6402:2710:b0:57d:4692:ba54 with SMTP id
 4fb4d7f45d1cf-58e7ad25580mr3260066a12.6.1720170680522; Fri, 05 Jul 2024
 02:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240701121355.262259-2-kanakshilledar@gmail.com>
 <20240701121355.262259-5-kanakshilledar@gmail.com> <20240703-juice-refreeze-62c468a56ea5@spud>
 <ZobU6K/R3pfHrK9c@x1> <Zobhkf5qr13rKcWH@x1>
In-Reply-To: <Zobhkf5qr13rKcWH@x1>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Fri, 5 Jul 2024 14:41:08 +0530
Message-ID: <CAGLn_=siEF=srN1NLgi1i_EocnQH1HRpCPyTpv+bivQ123iq-w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: thead: add basic spi node
To: Drew Fustini <drew@pdp7.com>
Cc: Drew Fustini <pdp7pdp7@gmail.com>, Conor Dooley <conor@kernel.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_021123_286779_46D8375D 
X-CRM114-Status: GOOD (  22.84  )
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

> > > > --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > > +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > > @@ -17,6 +17,7 @@ aliases {
> > > >           gpio1 = &gpio1;
> > > >           gpio2 = &gpio2;
> > > >           gpio3 = &gpio3;
> > > > +         spi0 = &spi0;
> > >
> > > "spi" would sort after "serial".
> > >
> > > >           serial0 = &uart0;
> > > >           serial1 = &uart1;
> > > >           serial2 = &uart2;

> > > I'm pretty sceptical about adding more of these fixed clocks, rather
> > > than waiting for the clock driver. Drew, what do you think? Should we
> > > just add one more to your fixup list or would you rather delay? Guess it
> > > depends on how long more you think that clock driver is likely to take.
> >
> > I think the clk driver [1] is in good shape but it has not been reviewed
> > by the clk maintainer yet. Thus it is hard to predict any timeline for
> > it getting merged.
> >
> > SPI support doesn't require any driver changes so I'd be inclined to
> > allow the fixed clock in this case. It will be simple to change it over
> > to a real clock once the clk driver is upstream.
> >
> > Acked-by: Drew Fustini <drew@pdp7.com>

Alright! I do the suggested edits and send a new patch.

> > Thanks,
> > Drew
>
> Sorry, I meant to include the link to the most recent clk series:
> https://lore.kernel.org/linux-riscv/20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com/
>
> -Drew

Thanks and Regards,
Kanak Shilledar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
