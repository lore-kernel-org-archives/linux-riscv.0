Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1311C5478C
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Mar 2024 15:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZsUMHh4D13hFdwu5tDewEWWQH4UmOyZFrARNSxK0j3Q=; b=obkFjjZcmk4N5f
	v0yH4XN6gdjpulq7afqPIs5Btlko7YuWk6JF2L25mmjSoJBBNaXTL5EFYZgUZRUPSy7C2sn/FPFfC
	Vyna+5jR6FYNYREWjoc3vOanzSEGyIMkUsWXx47YpynMP9E8ykZ+WEMzBVfAMK44J3Uz8kTp9kRsx
	qDcCTf1dtDnEHf+CY90ihTM8gSR8ZdxXQauzhi78PMLAgdqSCCfWzNf/T38Uv9TNLUOWVXtkuRE2B
	gJxUk12ypF8Nnl1xMpnH+N668vDSFceU1ntt5WlX3tr8IGmxs9wp/5ou9ah69pFxZGOdAY8d0cofQ
	eL/QjyY0Tb8Bv3emZkJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgQtY-00000003nM3-1QnO;
	Sat, 02 Mar 2024 15:03:24 +0000
Received: from port70.net ([81.7.13.123])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgQtT-00000003nHr-2L2j;
	Sat, 02 Mar 2024 15:03:21 +0000
Received: by port70.net (Postfix, from userid 1002)
	id 691CEABEC0C7; Sat,  2 Mar 2024 15:57:02 +0100 (CET)
Date: Sat, 2 Mar 2024 15:57:02 +0100
From: Szabolcs Nagy <nsz@port70.net>
To: Mark Brown <broonie@kernel.org>
Cc: "dalias@libc.org" <dalias@libc.org>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
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
Message-ID: <20240302145702.GD1884416@port70.net>
Mail-Followup-To: Mark Brown <broonie@kernel.org>,
	"dalias@libc.org" <dalias@libc.org>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
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
References: <22a53b78-10d7-4a5a-a01e-b2f3a8c22e94@app.fastmail.com>
 <4c7bdf8fde9cc45174f10b9221fa58ffb450b755.camel@intel.com>
 <20240220185714.GO4163@brightrain.aerifal.cx>
 <9fc9c45ff6e14df80ad023e66ff7a978bd4ec91c.camel@intel.com>
 <20240220235415.GP4163@brightrain.aerifal.cx>
 <a57d6c7eada4b9a7c35addbc8556f5b53a0c3e6f.camel@intel.com>
 <20240221012736.GQ4163@brightrain.aerifal.cx>
 <d18f060d-37ac-48b1-9f67-a5c5db79b34e@sirena.org.uk>
 <20240221145800.GR4163@brightrain.aerifal.cx>
 <4a3809e8-61b2-4341-a868-292ba6e64e8a@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a3809e8-61b2-4341-a868-292ba6e64e8a@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240302_070319_783299_B2373C76 
X-CRM114-Status: GOOD (  26.16  )
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

* Mark Brown <broonie@kernel.org> [2024-02-21 17:36:12 +0000]:

> On Wed, Feb 21, 2024 at 09:58:01AM -0500, dalias@libc.org wrote:
> > On Wed, Feb 21, 2024 at 01:53:10PM +0000, Mark Brown wrote:
> > > On Tue, Feb 20, 2024 at 08:27:37PM -0500, dalias@libc.org wrote:
> > > > On Wed, Feb 21, 2024 at 12:35:48AM +0000, Edgecombe, Rick P wrote:
> 
> > > > > (INCSSP, RSTORSSP, etc). These are a collection of instructions that
> > > > > allow limited control of the SSP. When shadow stack gets disabled,
> > > > > these suddenly turn into #UD generating instructions. So any other
> > > > > threads executing those instructions when shadow stack got disabled
> > > > > would be in for a nasty surprise.
> 
> > > > This is the kernel's problem if that's happening. It should be
> > > > trapping these and returning immediately like a NOP if shadow stack
> > > > has been disabled, not generating SIGILL.
> 
> > > I'm not sure that's going to work out well, all it takes is some code
> > > that's looking at the shadow stack and expecting something to happen as
> > > a result of the instructions it's executing and we run into trouble.  A
> 
> > I said NOP but there's no reason it strictly needs to be a NOP. It
> > could instead do something reasonable to convey the state of racing
> > with shadow stack being disabled.
> 
> This feels like it's getting complicated and I fear it may be an uphill
> struggle to get such code merged, at least for arm64.  My instinct is

the aarch64 behaviour is already nop
for gcs instructions when gcs is disabled.
the isa was designed so async disable is
possible.

only x86 linux would have to emulate this.

> that it's going to be much more robust and generally tractable to let
> things run to some suitable synchronisation point and then disable
> there, but if we're going to do that then userspace can hopefully
> arrange to do the disabling itself through the standard disable
> interface anyway.  Presumably it'll want to notice things being disabled
> at some point anyway?  TBH that's been how all the prior proposals for
> process wide disable I've seen were done.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
