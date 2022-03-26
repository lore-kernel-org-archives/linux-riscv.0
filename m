Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07B6C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Mar 2022 07:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3aHTTSOxjSpVMg+i7BQNmm5FeXF0rWrRHfUamu3/tY0=; b=x8G6FhORXcvbXS
	MlfqdGn7aDv3QRPcb6a9yY/OxWEhXQnYe4JzFj39+1UUCCyGobURRn2+p2UEZ4z6r6LZPwpLGthiQ
	4ScUBbJba5OqqEyeh4H3Pgna5jmOYrvSwzNoZBEI26N52BVZYugizEuiq6TMAEQwfflZOx7zS478d
	EzEq9KYn2ArraDP4i8QNDvrQnEjL82bBIh3WltnkMGjtzTTJ9gIIei6AByLmMeSKG4SUA5ouo/tQh
	+5PFwsXsWFUTRZ2xOfQdgqDnxbawkKDi+bUxctd1XQDoqWd96mKpD5YX61QLiy9V5y9nL99QjndZb
	HWNAl07AKI6BOCFIbCww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nY0p1-003uLW-TD; Sat, 26 Mar 2022 07:26:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nY0oy-003uKU-PH
 for linux-riscv@lists.infradead.org; Sat, 26 Mar 2022 07:26:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B008160C22;
 Sat, 26 Mar 2022 07:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60363C340ED;
 Sat, 26 Mar 2022 07:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648279607;
 bh=xirFoJbRJSlOuSaLCipr97c50u9T+OQDwkkYd9o/BbY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RWUI0Z7zSaQzKUsR5q66Gy6XhKBH1SLdTrTJlAyKfnYD3ZBheK47uqVTFrjbl3aZ0
 lmZkVYEgXUJFuDKm6s7TaFEmvCDkJ0iksda7/Ybt3ogQ6E/nG77EwpO1mbyqzTftkS
 0f4l6mHvS9XR/kF7NKJzjmM/nc3M1GhDTnrSZZt7x2UizatXUCECv/3Fp8q5V4fP9W
 stdd2L3Y6Y3/4uNeTYI8pgXp9apWfAPBg6v4w476hpD/j96mnowK9KsR+8eN/4kTJ2
 vjWbN8fNDAsJVnFZVSYvkezZDI2EPw1uJtdYsvu627+umEivNWSzeB/oE8K1vzWerQ
 1mqb2oQnmBLnw==
Date: Sat, 26 Mar 2022 15:18:25 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 0/6] Provide a fraemework for RISC-V ISA extensions
Message-ID: <Yj6+QZUgrzA9UK/J@xhacker>
References: <20220215090211.911366-1-atishp@rivosinc.com>
 <YgvNSeUekqEVS1yE@xhacker>
 <CAHBxVyF65jC_wvxcD6bueqpCY8-Kbahu1yxsSoBmO1s15dGkSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHBxVyF65jC_wvxcD6bueqpCY8-Kbahu1yxsSoBmO1s15dGkSQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220326_002648_944390_C37A5640 
X-CRM114-Status: GOOD (  40.39  )
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

On Tue, Feb 15, 2022 at 11:06:24AM -0800, Atish Kumar Patra wrote:
> On Tue, Feb 15, 2022 at 8:04 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > On Tue, Feb 15, 2022 at 01:02:05AM -0800, Atish Patra wrote:
> > > This series implements a generic framework to parse multi-letter ISA
> > > extensions. This series is based on Tsukasa's v3 isa extension improvement
> > > series[1]. I have fixed few bugs and improved comments from that series
> > > (PATCH1-3). I have not used PATCH 4 from that series as we are not using
> > > ISA extension versioning as of now. We can add that later if required.
> > >
> > > PATCH 4 allows the probing of multi-letter extensions via a macro.
> > > It continues to use the common isa extensions between all the harts.
> > > Thus hetergenous hart systems will only see the common ISA extensions.
> > >
> > > PATCH 6 improves the /proc/cpuinfo interface for the available ISA extensions
> > > via /proc/cpuinfo.
> > >
> > > Here is the example output of /proc/cpuinfo:
> > > (with debug patches in Qemu and Linux kernel)
> > >
> > > / # cat /proc/cpuinfo
> > > processor     : 0
> > > hart          : 0
> > > isa           : rv64imafdcsu
> > > isa-ext               : sstc,sscofpmf
> > > mmu           : sv48
> > >
> > > processor     : 1
> > > hart          : 1
> > > isa           : rv64imafdcsu
> > > isa-ext               : sstc,sscofpmf
> > > mmu           : sv48
> > >
> > > processor     : 2
> > > hart          : 2
> > > isa           : rv64imafdcsu
> > > isa-ext               : sstc,sscofpmf
> > > mmu           : sv48
> > >
> > > processor     : 3
> > > hart          : 3
> > > isa           : rv64imafdcsu
> > > isa-ext               : sstc,sscofpmf
> > > mmu           : sv48
> > >
> > > Anybody adding support for any new multi-letter extensions should add an
> > > entry to the riscv_isa_ext_id and the isa extension array.
> > > E.g. The patch[2] adds the support for various ISA extensions.
> >
> > Hi Atish,
> >
> > Thanks for this series. I'm thinking cpu features VS ISA extenstions.
> > I'm converting the sv48 to static key:
> > https://lore.kernel.org/linux-riscv/20220125165036.987-1-jszhang@kernel.org/
> >
> > Previously, I thought the SV48 as a cpu feature, and there will be
> > more and more cpu features, so I implemented an unified static key
> > mechanism for CPU features. But after reading this series, I think
> > I may need to rebase(even reimplement) the above patch to your series.
> > But I'm a bit confused by CPU features VS ISA extenstions now:
> >
> > 1. Is cpu feature  == ISA extension?
> >
> > 2. Is SV48 considered as ISA extension?
> > If yes, now SV48 or not is determined during runtime, but current ISA
> > extensions seem parsed from DT. So how to support those ISA extensions
> > which can be determined during runtime?
> >
> > Could you please share your thought?
> >
> 
> Here are my two cents:
> 
> I think the cpu feature is a superset of the ISA extension.
> cpu feature != ISA extension.
> 
> While all ISA extensions are cpu features, all CPU features may not be
> an ISA extension.
> e.g. sv48 is not a ISA extension but F/D are (used to set the
> cpu_hwcap_fpu static key)
> 
> Moreover, not all cpu feature/ISA extension requires a static key.
> e.g SSTC extension will require a static key because the check has to
> happen in the hot path.
> However, sscofpmf extension don't need a static key as the check
> happens only one time during boot.
> 
> We should keep these two separate but a common static framework would
> be very useful.
> 
> Here is the flow that I have in my mind.
> 1. All ISA extensions will be parsed through riscv,isa DT property
> 2. Any supported/enabled extension will be set in riscv_isa bitmap
> 3. Any extension requiring a static key will invoke the cpus_set_cap.
> 
> cpus_set_cap will be invoked from a different code path that uses a
> static key for a specific ISA
> extension or a CPU feature.
> 
> The only problem I see here is that we have to set a bit in both
> cpu_hwcaps & riscv_isa bitmap.
> We also have to define the value of that bit for any extension
> requiring a static key twice as well.
> 
> I think that should be okay. But I would like to hear what everybody
> else thinks as well.
> 

Thank Atish's input. I notice that SV57 support is merged, I'll
send a new version to apply static mechanism to both SV48 and SV57
once rc1 is released.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
