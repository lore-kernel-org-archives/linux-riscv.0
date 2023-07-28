Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248C1C41513
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 07:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NODC6P9T/R/OXT+3k8ppZCmimphPLRabeR7+Ug8kkkM=; b=X/CbYK+rpw+M4q
	OnEFxsotkJtUodKTLIWKa6pI/RBooi+SfQc/3OQSn+Lo6cLQqDWJIE6oDI9pLNBwWmEyC1HjWJtdL
	+tfaFqgH2zCU2+evyXjzxO5ymNamNcsVQ5tOfY2oDjqcGuEZzmCv9FFRKZt90oLVdBxyKyLRC8vba
	1bmvFFiQ6Tg2gLswx6ux+pluvCyDyqQK/6Lvt58iTKp7IlCggCk+HJN3hUJjcf79DVmAMs1VCTBcQ
	y0O3I/WZgGG3kGHNWIUdMla+ETRtaiTAGWGj+uJ4VFWv4fM3d0Rrej00LTaf3ii1KFxXSYlZaDtyg
	9lwr+4BMsE1RhDYflvwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPHWx-0022kp-2n;
	Fri, 28 Jul 2023 07:04:55 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPHWt-0022iu-14
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 07:04:53 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-686be28e1a8so1263336b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 00:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690527889; x=1691132689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wrwpb7rVTyYgrDu2LzfWhd5QBSrpJqCmxUGFCtGyRxE=;
        b=HnNBF9FNxGUGcdq72feS4vzTAgz0S2xFrpjfptHFXDmIUUMf0+rsfFDBqC2ScjUbKz
         umiiQMv2yfwN/+2EI2WvRogXyZJdWr6bLFFsUu3iSptlbMQawDUr7bHclNJPap/lp0kD
         kGz6QmaoOBFvXiNpicfwfM93W5ym8He5JnV+XRbLknn+OJltHWHesQIhVqS7KUQ44fxC
         up4WV6A7BcSSto/oqS+D1YE1nZ6jPVDvDx4cocNpgn0bAztE0SaLeo/DCjamR0zH4GvK
         2zNMASq10UNnA4vVGokkrN8MvD2HG17cKKJphE9dD7L+MFm09drbK7kMQfIMVZiJPeop
         X3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690527889; x=1691132689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wrwpb7rVTyYgrDu2LzfWhd5QBSrpJqCmxUGFCtGyRxE=;
        b=K/JaysaiBCycAxPDm+m7vAp0HX/CRjoPe8tJb9OyIg3AT0d7xsxiQe6w7Dgv0Jxuhu
         XpuO6OIwqpClG5f8Rrryi9gPXzl9ir1/7BMEAGwxbdwlcRvzqDZgkYQ0fDX2Ig1cjmtM
         z7AZXc8GtfEyrygOpEmai+3VkgAfycsRRjEniZDd1iAYYihcHga+/TqPmrs8bHYIXiTb
         qcadCol/LpwfjA29ZUGkdaHvhlaCmjBM1jxQUmakFTOp4RmoiL7B7wRCkzai2OLeIDmW
         3EzCubSy0nKRvmoQe5kjOxcekxQ2Z6+itDDT+Q0dvVBaF4y7DbiPNMajfcT4C2wV9b0E
         AkWw==
X-Gm-Message-State: ABy/qLYlRagZpv8EuCvkYLEWQd5F8/NKe5GDsNhR0mU7DZwKPnHPKfY6
	et7wVZB6U2kut3DCYmcMQ5ChpA==
X-Google-Smtp-Source: APBJJlE+60gGNtiTwkvVvvyxDJd0BPxR2w6cPhZ0ordld8aOmQaaiK95ErAlh1vP12HcALZGJ8odjQ==
X-Received: by 2002:a05:6a20:968d:b0:12f:a373:ba95 with SMTP id hp13-20020a056a20968d00b0012fa373ba95mr611563pzc.19.1690527888967;
        Fri, 28 Jul 2023 00:04:48 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:dacb:3a1a:fcaf:c0fc])
        by smtp.gmail.com with ESMTPSA id o14-20020a170902d4ce00b001bb750189desm2778063plg.255.2023.07.28.00.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 00:04:48 -0700 (PDT)
Date: Fri, 28 Jul 2023 00:04:46 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Xi Ruoyao <xry111@linuxfromscratch.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
Message-ID: <ZMNojqwLxcG8FcHN@x1>
References: <20230617161529.2092-1-jszhang@kernel.org>
 <c9a44f534071a6d67f1e21bafdb713793c559124.camel@linuxfromscratch.org>
 <20230725-unheard-dingy-42f0fafe7216@wendy>
 <ZL/jMYL3akl78ZZN@xhacker>
 <3e0994dab495920ac590dc28d6b9d9765abe0c7e.camel@linuxfromscratch.org>
 <ZME1J4mpVf5yth32@xhacker>
 <866eab3e30a18c50742a75d62aee223fdc7e3cee.camel@linuxfromscratch.org>
 <4986b92f1a5aa303a529c6004aaedd2184c3ccf7.camel@linuxfromscratch.org>
 <ZMKXQpreSr47MFj6@xhacker>
 <290101d386866f639a7c482527d7a78c5108d49b.camel@linuxfromscratch.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <290101d386866f639a7c482527d7a78c5108d49b.camel@linuxfromscratch.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_000451_560934_DCB9A4B4 
X-CRM114-Status: GOOD (  21.81  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 28, 2023 at 12:29:44AM +0800, Xi Ruoyao wrote:
> On Fri, 2023-07-28 at 00:11 +0800, Jisheng Zhang wrote:
> > On Thu, Jul 27, 2023 at 08:54:59AM +0800, Xi Ruoyao wrote:
> > > On Thu, 2023-07-27 at 08:14 +0800, Xi Ruoyao wrote:
> > > > On Wed, 2023-07-26 at 23:00 +0800, Jisheng Zhang wrote:
> > > > > which dts r u using? see below.
> > > > > =

> > > > > > =

> > > > > > Or maybe my toolchain (GCC 13.1.0, Binutils-2.40, with no
> > > > > > patches) can
> > > > > > miscompile the kernel?
> > > > =

> > > > /* snip */
> > > > =

> > > > > > Boot HART ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 : 0
> > > > > > Boot HART Domain=A0=A0=A0=A0=A0=A0=A0=A0=A0 : root
> > > > > > Boot HART Priv Version=A0=A0=A0 : v1.11
> > > > > > Boot HART Base ISA=A0=A0=A0=A0=A0=A0=A0 : rv64imafdcvx
> > > > > =

> > > > > what? I don't think the mainline dts provide v and x. =

> > > > =

> > > > I copied the compiled arch/riscv/boot/dts/thead/th1520-lichee-pi-
> > > > 4a.dtb
> > > > into /boot and loaded it with u-boot "load" command onto
> > > > 0x46000000, and
> > > > passed this address to the booti command.
> > > > =

> > > > But maybe I've copied the wrong file or made some other mistake...
> > > > I'll
> > > > recheck.
> > > =

> > > Hmm, and if I read OpenSBI code correctly, this line reflects the
> > > content of the misa CSR, not the DT riscv,isa value.
> > > =

> > =

> > Aha indeed the "vx" isa extensions are not from the DT riscv,isa
> > property. I will try your opensbi/linux/uboot combinations on my
> > lpi4a board tomorrow.
> =

> My kernel config attached.  Maybe you can find some stupid mistake in
> it, I'm not familiar with RISC-V, nor DT-based systems :(.

It seems like your kernel config is the problem. I used it and I saw
the same result of a panic in riscv_intc_irq:
https://gist.github.com/pdp7/1a26ebe20017a3b90c4e9c005f8178e1

This is the config I have been using successfully:
https://gist.github.com/pdp7/ecb34ba1e93fc6cfc4dce66d71e14f82

Could you try that config?

Linux 6.5-rc3 boots okay when built with it:
https://gist.github.com/pdp7/580b072f9a5bf9be87cf88b5f81e50e3

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
