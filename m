Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30452C4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 12:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ah0kKcmr1Ga8l1FV3/cWCxWYycvc4KbelP1zkHEHN68=; b=n1Trt/R4A8XXEV
	cUGv7P8p1LiqV0s6TeJiIofqpvE3m5hR7NjL+2nYGYLbAGT041ovQeuBa5bzeDrxO2oL56BPxh+9w
	Xx+Ne35CvquzTZjh2onBpbp1aZ8AyAWOd3/CTBwNtEu/FiZ5fA66Z34Dnq/kEdn6EaHOMaaICjOSR
	ye/cx1I2kW2TbQGmP7EpfjA1F6K4FGMe6KFhBn5aUSExFtojtKzjW1u7978dQgUUrO2vtspZ+B7Yg
	V3eszY3vglycuqRneblsccoBIgEMacj6kVaDiI6NlZLm1sJXGDHZqwgChs82M7YFcrKePuD9UE0Ah
	KBSMjWBRcrM6LGyylWnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ELe-00B7pm-2l;
	Sun, 26 Nov 2023 12:34:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ELb-00B7lS-0D
	for linux-riscv@lists.infradead.org;
	Sun, 26 Nov 2023 12:34:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 22B33CE0E07;
	Sun, 26 Nov 2023 12:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B280C433C8;
	Sun, 26 Nov 2023 12:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701002082;
	bh=M5JWFk6PhkRfznjeZqDoIn4AkQrs7NTEUWLaLy4lG2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ovWSeHXBh0A2MZJQ/EfKKAo8vihoDaRc/mmDRXRdZQ1cymyR0CZgi2+igVHtCrM2T
	 zqqSG8YZAp82QWv2sbNPyhWyFUsKHKpYsHcDv/yL1TwhHNn80ikMyGbRxW/AsJ3/d5
	 Vm6XKs9LhdGkTTqWQJnmEsmkJumf6kcCT2bhDu1akObRN0JiM0Ceexv5U37GwnqANA
	 Dpr5xqPzxoq4wDmqbalgFplpTcuwjlLc39CQ06Tn6GYOZBUu3KNL+K+8FmVBN1Ku59
	 sVaVZoylBh8Q0y0qCxpzCZWRTkPcPKHQs483GcS1P5Q80sSQGesUi/xPMhvNqxbSFN
	 PzW9WCdyeh7rg==
Date: Sun, 26 Nov 2023 07:34:30 -0500
From: Guo Ren <guoren@kernel.org>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Christoph Muellner <christoph.muellner@vrull.eu>,
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Will Deacon <will@kernel.org>, Daniel Lustig <dlustig@nvidia.com>
Subject: Re: [RFC PATCH 0/5] RISC-V: Add dynamic TSO support
Message-ID: <ZWM7VvHNkW2iIRCg@gmail.com>
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
 <20231124101519.GP3818@noisy.programming.kicks-ass.net>
 <59da3e41-abb3-405a-8f98-c74bdf26935b@huaweicloud.com>
 <20231124115430.GS3818@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231124115430.GS3818@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_043451_578548_3D28E402 
X-CRM114-Status: GOOD (  28.58  )
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

On Fri, Nov 24, 2023 at 12:54:30PM +0100, Peter Zijlstra wrote:
> On Fri, Nov 24, 2023 at 12:04:09PM +0100, Jonas Oberhauser wrote:
> 
> > > I think ARM64 approached this problem by adding the
> > > load-acquire/store-release instructions and for TSO based code,
> > > translate into those (eg. x86 -> arm64 transpilers).
> > 
> > 
> > Although those instructions have a bit more ordering constraints.
> > 
> > I have heard rumors that the apple chips also have a register that can be
> > set at runtime.
I could understand the rumor, smart design! Thx for sharing.

> 
> Oh, I thought they made do with the load-acquire/store-release thingies.
> But to be fair, I haven't been paying *that* much attention to the apple
> stuff.
> 
> I did read about how they fudged some of the x86 flags thing.
> 
> > And there are some IBM machines that have a setting, but not sure how it is
> > controlled.
> 
> Cute, I'm assuming this is the Power series (s390 already being TSO)? I
> wasn't aware they had this.
> 
> > > IIRC Risc-V actually has such instructions as well, so *why* are you
> > > doing this?!?!
> > 
> > 
> > Unfortunately, at least last time I checked RISC-V still hadn't gotten such
> > instructions.
> > What they have is the *semantics* of the instructions, but no actual opcodes
> > to encode them.
> 
> Well, that sucks..
> 
> > I argued for them in the RISC-V memory group, but it was considered to be
> > outside the scope of that group.
> > 
> > Transpiling with sufficient DMB ISH to get the desired ordering is really
> > bad for performance.
> 
> Ha!, quite dreadful I would imagine.
> 
> > That is not to say that linux should support this. Perhaps linux should
> > pressure RISC-V into supporting implicit barriers instead.
> 
> I'm not sure I count for much in this regard, but yeah, that sounds like
> a plan :-)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
