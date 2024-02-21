Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516A1C5478A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 19:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XcP0TWirwigb0p1pBTpaLtnEiTHNyV7mSXKogdRn3tc=; b=LPF2ixHakwcgIb
	cYIbOxy9UXdh9SZxKPZz/UpCBSOGVcYp/r0k1R47g6wRN4Ngxkku4DeCUQepGLj6FJbk1jH4zg81T
	N1/017bNiUL0KIUYuP8BXjW04zuKA+nyqtAlqHZCBgKGeRs3SDctEuercOKgn/uqQFv9cKKfz/1ue
	fIvPDM3mdN6sltLv2h+e4qb9FJ8SiORxyOL/oDyHHEf3aTH6iJQa1MuxWlJ3VgMcIFwwSObgD7B5r
	cV7mBoGKlV5ad54fJ3UDP7MJdkV5dahhIFyFHmm2F/xuzj+44tR7V96lsZ0yrnRWANkPyAdhwqFr2
	MedZE9WFxbQTUvCHt8aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcrva-00000002DSz-2v8B;
	Wed, 21 Feb 2024 19:06:47 +0000
Received: from brightrain.aerifal.cx ([2001:19f0:5:42::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcrvN-00000002DOY-0zrO
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 19:06:36 +0000
Date: Wed, 21 Feb 2024 14:06:39 -0500
From: "dalias@libc.org" <dalias@libc.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"musl@lists.openwall.com" <musl@lists.openwall.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
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
Message-ID: <20240221190639.GU4163@brightrain.aerifal.cx>
References: <20240220235415.GP4163@brightrain.aerifal.cx>
 <a57d6c7eada4b9a7c35addbc8556f5b53a0c3e6f.camel@intel.com>
 <20240221012736.GQ4163@brightrain.aerifal.cx>
 <d18f060d-37ac-48b1-9f67-a5c5db79b34e@sirena.org.uk>
 <20240221145800.GR4163@brightrain.aerifal.cx>
 <4a3809e8-61b2-4341-a868-292ba6e64e8a@sirena.org.uk>
 <20240221175717.GS4163@brightrain.aerifal.cx>
 <f4a54297767eb098d903404cbe8860d655d79bed.camel@intel.com>
 <20240221183055.GT4163@brightrain.aerifal.cx>
 <c3085fbe10193dfe59b25bc7da776e60779b0e8c.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c3085fbe10193dfe59b25bc7da776e60779b0e8c.camel@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_110633_702431_1004D45E 
X-CRM114-Status: GOOD (  30.06  )
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

On Wed, Feb 21, 2024 at 06:53:44PM +0000, Edgecombe, Rick P wrote:
> On Wed, 2024-02-21 at 13:30 -0500, dalias@libc.org wrote:
> > > 3 is the cleanest and safest I think, and it was thought it might
> > > not
> > > need kernel help, due to a scheme Florian had to direct signals to
> > > specific threads. It's my preference at this point.
> > 
> > The operations where the shadow stack has to be processed need to be
> > executable from async-signal context, so this imposes a requirement
> > to
> > block all signals around the lock. This makes all longjmps a heavy,
> > multi-syscall operation rather than O(1) userspace operation. I do
> > not
> > think this is an acceptable implementation, especially when there are
> > clearly superior alternatives without that cost or invasiveness.
> 
> That is a good point. Could the per-thread locks be nestable to address
> this? We just need to know if a thread *might* be using shadow stacks.
> So we really just need a per-thread count.

Due to arbitrarily nestable signal frames, no, this does not suffice.
An interrupted operation using the lock could be arbitrarily delayed,
even never execute again, making any call to dlopen deadlock.

> > > 1 and 2 are POCed here, if you are interested:
> > > https://github.com/rpedgeco/linux/commits/shstk_suppress_rfc/
> > 
> > I'm not clear why 2 (suppression of #CP) is desirable at all. If
> > shadow stack is being disabled, it should just be disabled, with
> > minimal fault handling to paper over any racing operations at the
> > moment it's disabled. Leaving it on with extreme slowness to make it
> > not actually do anything does not seem useful.
> 
> The benefit is that code that is using shadow stack instructions won't
> crash if it relies on them working. For example RDSSP turns into a NOP
> if shadow stack is disabled, and the intrinsic is written such that a
> NULL pointer is returned if shadow stack is disabled. The shadow stack
> is normally readable, and this happens in glibc sometimes. So if there
> was code like:
> 
>    long foo = *(long *)_get_ssp();
> 
> ...then it could suddenly read a NULL pointer if shadow stack got
> disabled. (notice, it's not even a "shadow stack access" fault-wise. So
> it was looked at as somewhat more robust. But neither 1 or 2 are
> perfect for apps that are manually using shadow stack instructions.

It's fine to turn RDSSP into an actual emulated read of the SSP, or at
least an emulated load of zero so that uninitialized data is not left
in the target register. If doing the latter, code working with the
shadow stack just needs to be prepared for the possibility that it
could be async-disabled, and check the return value.

I have not looked at all the instructions that become #UD but I
suspect they all have reasonable trivial ways to implement a
"disabled" version of them that userspace can act upon reasonably.

Rich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
