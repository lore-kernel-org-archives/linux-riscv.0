Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6448AC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Feb 2022 13:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tygM/pPSTKlu762mBvH3pari+F+LA6sax8oeUNvMps=; b=qE/q56kTb8Ak8L
	+6OYNtJD258t/c7gniWPQaqxpD009QfcFxes6jEEK4QV1Wfirr4cX7yf198+ZKcC/23bg4UNHyl0N
	hPa5n4CvgPAy75LaLdijnILoPyAgyX04lo/oojbpw4JbN1FMR3rqpYCsDCRD8l6oL6GSarrLHOQ7u
	Of1hNNKKdPnw1XwOp/fpYpE5mfanTwaegakQxANAtj0RSQkPPbE+3+3dYDBfkGIdIvPuTB3her6vG
	EM/hu2ns3fiJ1eMQLluLq69jvkWNuSEhsbf4ETBGvNHQBTQUrr7Jp/K7OqELHlbbnLxMuIeQ+Og6j
	afYsvxu8q43RlkolGhVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFcbf-001V8N-Dc; Thu, 03 Feb 2022 13:57:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFcbc-001V71-G5
 for linux-riscv@lists.infradead.org; Thu, 03 Feb 2022 13:57:01 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nFcbM-0002C8-Tr; Thu, 03 Feb 2022 14:56:44 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Tsukasa OI <research_trasio@irq.a4lg.com>, linux-riscv@lists.infradead.org
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v1 0/2] Provide a fraemework for RISC-V ISA extensions
Date: Thu, 03 Feb 2022 14:56:43 +0100
Message-ID: <1859467.Zi3Bu27KEa@diego>
In-Reply-To: <CAOnJCULirV30g6ti7QvY40=p_W9+-XG+nAbxiZ4qDZLo28RJ6A@mail.gmail.com>
References: <20211224211632.1698523-1-atishp@rivosinc.com>
 <mhng-791652b4-53f0-48e4-a640-f4c418c9926b@palmer-ri-x1c9>
 <CAOnJCULirV30g6ti7QvY40=p_W9+-XG+nAbxiZ4qDZLo28RJ6A@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_055700_543471_72D13CA4 
X-CRM114-Status: GOOD (  29.79  )
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

Hi Atish,

Am Samstag, 8. Januar 2022, 03:24:12 CET schrieb Atish Patra:
> On Fri, Jan 7, 2022 at 1:58 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >
> > On Fri, 24 Dec 2021 13:16:30 PST (-0800), atishp@atishpatra.org wrote:
> > > This series implements a generic framework to parse multi-letter ISA
> > > extensions. It introduces a new DT node that can be under /cpus or
> > > individual cpu depends on the platforms with homogeneous or heterogeneous
> > > harts. This version of the series only allows adds support for homogeneous
> > > harts as there are no platforms with heterogeneous harts yet. However,
> > > the DT binding allows both.
> > >
> > > The patch also indicates the user space about the available ISA extensions
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
> >
> > IMO this is the wrong way to go.  I get that the ISA string is very
> > complicated to parse, but we've tried to come up with other
> > representations of this we've ended up having that interface break when
> > the ISA string rules eventually change.  We should just stick to the ISA
> > string for these interfaces, as that's at least something everyone can
> > agree on because they're defined by the spec.
> >
> 
> Fair enough.
> 
> > That said, we should add the spec versions into this interface.  At
> > least the user spec version is relevant here, but given that we're
> > passing through some other priv-level details we might as well pass that
> > though too.
> >
> 
> Tsukasa already has a version that extends the isa string parsing for
> multi-letter extensions
> and versions parsing. We just need to add the ISA bitmap support on top of it.
> 
> I will coordinate with Tsukasa to have a complete framework based on
> string parsing.
> It would be good to have this series asap as all other series  (perf,
> svpbmt) will rely on it.

out of curiosity, did this go anywhere yet in terms of the coordinated
approach you wrote about?

Thanks
Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
