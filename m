Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2711C48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 14:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uzowuhbf8dHSw6t+j6fA8KuQqPFz/lNEvuu2bkXHgf8=; b=Fu4RqDpVay9xDX
	SNhoJZOB7fjy/yysacbzYLac/m0mbxngfybGpElGX6mYmlWQzYTCxzinsA7Q39HwZLvhgbDRCipYv
	4Z8+L4MFpc8Hq0ruCs8pKSoFi42mZbgPcQKvbTDmH8Hkbp+EK1QAm5yAF+1voc8HIs8vPeUSonvDt
	BmNSW+MS7aM/9MtfeDnO2ALEnaOe8NFIRwzcXdU8hGkBs0VsPPNVrBpaQqwZED7BVZwtHRh02/1Hw
	IRFERdXs6xCkwz6+YEWmOIqcll3npHQBHDJA/rGsv+pAGQAgvNjhZn3C5c6IDU035+VV04Gphwor+
	rbXAaIz/TccaTBFcum7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rco2g-00000001Nau-3cRP;
	Wed, 21 Feb 2024 14:57:50 +0000
Received: from brightrain.aerifal.cx ([2001:19f0:5:42::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rco2d-00000001NZY-2qHn
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 14:57:49 +0000
Date: Wed, 21 Feb 2024 09:58:01 -0500
From: "dalias@libc.org" <dalias@libc.org>
To: Mark Brown <broonie@kernel.org>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"musl@lists.openwall.com" <musl@lists.openwall.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>, "maz@kernel.org" <maz@kernel.org>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"will@kernel.org" <will@kernel.org>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"thiago.bauermann@linaro.org" <thiago.bauermann@linaro.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"sorear@fastmail.com" <sorear@fastmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [musl] Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS
 in userspace
Message-ID: <20240221145800.GR4163@brightrain.aerifal.cx>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <22a53b78-10d7-4a5a-a01e-b2f3a8c22e94@app.fastmail.com>
 <4c7bdf8fde9cc45174f10b9221fa58ffb450b755.camel@intel.com>
 <20240220185714.GO4163@brightrain.aerifal.cx>
 <9fc9c45ff6e14df80ad023e66ff7a978bd4ec91c.camel@intel.com>
 <20240220235415.GP4163@brightrain.aerifal.cx>
 <a57d6c7eada4b9a7c35addbc8556f5b53a0c3e6f.camel@intel.com>
 <20240221012736.GQ4163@brightrain.aerifal.cx>
 <d18f060d-37ac-48b1-9f67-a5c5db79b34e@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d18f060d-37ac-48b1-9f67-a5c5db79b34e@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_065747_999985_B62DF81B 
X-CRM114-Status: GOOD (  34.03  )
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

On Wed, Feb 21, 2024 at 01:53:10PM +0000, Mark Brown wrote:
> On Tue, Feb 20, 2024 at 08:27:37PM -0500, dalias@libc.org wrote:
> > On Wed, Feb 21, 2024 at 12:35:48AM +0000, Edgecombe, Rick P wrote:
> 
> > > (INCSSP, RSTORSSP, etc). These are a collection of instructions that
> > > allow limited control of the SSP. When shadow stack gets disabled,
> > > these suddenly turn into #UD generating instructions. So any other
> > > threads executing those instructions when shadow stack got disabled
> > > would be in for a nasty surprise.
> 
> > This is the kernel's problem if that's happening. It should be
> > trapping these and returning immediately like a NOP if shadow stack
> > has been disabled, not generating SIGILL.
> 
> I'm not sure that's going to work out well, all it takes is some code
> that's looking at the shadow stack and expecting something to happen as
> a result of the instructions it's executing and we run into trouble.  A
> lot of things won't notice and will just happily carry on but I expect
> there are going to be things that care.  We also end up with an
> additional state for threads that have had shadow stacks transparently
> disabled, that's managable but still.

I said NOP but there's no reason it strictly needs to be a NOP. It
could instead do something reasonable to convey the state of racing
with shadow stack being disabled.

> 
> > > > The place where it's really needed to be able to allocate the shadow
> > > > stack synchronously under userspace control, in order to harden
> > > > normal
> > > > applications that aren't doing funny things, is in pthread_create
> > > > without a caller-provided stack.
> 
> > > Yea most apps don't do anything too tricky. Mostly shadow stack "just
> > > works". But it's no excuse to just crash for the others.
> 
> > One thing to note here is that, to enable this, we're going to need
> > some way to detect "new enough kernel that shadow stack semantics are
> > all right". If there are kernels that have shadow stack support but
> > with problems that make it unsafe to use (this sounds like the case),
> > we can't turn it on without a way to avoid trying to use it on those.
> 
> If we have this automatic conversion of pages to shadow stack then we
> should have an API for enabling it, userspace should be able to use the
> presence of that API to determine if the feature is there.

Yes, or if a new prctl is needed to make disabling safe (see above)
that could probably be used.

Rich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
