Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B951EC5478A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 20:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYf0s0P/kDhb+5gniAcOk7pQ3RQGqh8As1wgRjN8SYs=; b=AQPTXewNmQ7meD
	FfEKOqL4lOQeqdlpAiJ37MirkP4H5lwDeSiHBhP8R5dxyaNQJ4gNWYD8/iCu8nKtFbvSjK1jFlBT8
	0a0pzwQ9RLoDrMyYRZbQoa4UVhVQbdyDXJzoGaVQfafWPShALTbQaUJZnh+Et9cYNoEa3GyngsF3K
	1Ce18q7BN1tLzusmLhYbaeawmVrlq8lemhfObupfhPqTELYI5GyqPlxgBu+PgZQB5NIyg2AcbZ7rP
	Ut6dBs2E5FjB1UjudWLU/tpMvLZBtE9eB0etrRUyBbFXmlfA++aXuqy6RIiZchzCseEkXgp6wg1LX
	XK0lSmZN+IiXz6hGtzSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rct2x-00000002SNe-3BQy;
	Wed, 21 Feb 2024 20:18:27 +0000
Received: from brightrain.aerifal.cx ([2001:19f0:5:42::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rct2t-00000002SL4-29PN
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 20:18:25 +0000
Date: Wed, 21 Feb 2024 15:18:37 -0500
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
Message-ID: <20240221201837.GW4163@brightrain.aerifal.cx>
References: <20240221012736.GQ4163@brightrain.aerifal.cx>
 <d18f060d-37ac-48b1-9f67-a5c5db79b34e@sirena.org.uk>
 <20240221145800.GR4163@brightrain.aerifal.cx>
 <4a3809e8-61b2-4341-a868-292ba6e64e8a@sirena.org.uk>
 <20240221175717.GS4163@brightrain.aerifal.cx>
 <f4a54297767eb098d903404cbe8860d655d79bed.camel@intel.com>
 <20240221183055.GT4163@brightrain.aerifal.cx>
 <c3085fbe10193dfe59b25bc7da776e60779b0e8c.camel@intel.com>
 <20240221190639.GU4163@brightrain.aerifal.cx>
 <e3a432c0fa9f5fe837e9d2fc7b36304709a34428.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3a432c0fa9f5fe837e9d2fc7b36304709a34428.camel@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_121823_771533_5E0C2F0F 
X-CRM114-Status: GOOD (  37.58  )
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

On Wed, Feb 21, 2024 at 07:22:21PM +0000, Edgecombe, Rick P wrote:
> On Wed, 2024-02-21 at 14:06 -0500, dalias@libc.org wrote:
> > Due to arbitrarily nestable signal frames, no, this does not suffice.
> > An interrupted operation using the lock could be arbitrarily delayed,
> > even never execute again, making any call to dlopen deadlock.
> 
> Doh! Yep, it is not robust to this. The only thing that could be done
> would be a timeout in dlopen(). Which would make the whole thing just
> better than nothing.
> 
> > 
> > > 
> > 
> > It's fine to turn RDSSP into an actual emulated read of the SSP, or
> > at
> > least an emulated load of zero so that uninitialized data is not left
> > in the target register.
> 
> We can't intercept RDSSP, but it becomes a NOP by default. (disclaimer
> x86-only knowledge).

OK, then I think the contract just has to be that userspace, in a
process that might dynamically disable shadow stack, needs to do
something like xor %reg,%reg before rdssp so that the outcome is
deterministic in disabled case.

> >  If doing the latter, code working with the
> > shadow stack just needs to be prepared for the possibility that it
> > could be async-disabled, and check the return value.
> > 
> > I have not looked at all the instructions that become #UD but I
> > suspect they all have reasonable trivial ways to implement a
> > "disabled" version of them that userspace can act upon reasonably.
> 
> This would have to be thought through functionally and performance
> wise. I'm not opposed if can come up with a fully fleshed out plan. How
> serious are you in pursuing musl support, if we had something like
> this?

Up til this thread, my position was pretty much "nope" because it
looked like it could not be done in a way compatible with existing
interface requirements.

However, what's been discussed here, contingent on a dynamic-disable
(ideally allowing choice of per-thread or global, to minimize loss of
hardening properties),

Personally, I believe shadow stack has very low hardening value
relative to cost/complexity, and my leaning would be just to ignore
it. However, I also know it becomes marketing pressure, including
pressure on distros that use musl -- "Why doesn't [distro] do shadow
stack?? I thought you were security oriented!!!" -- and if it can be
done in a non-breaking and non-invasive way, I think it's reasonable
to pursue and make something work.

> HJ, any thoughts on whether glibc would use this as well?
> 
> It is probably worth mentioning that from the security side (as Mark
> mentioned there is always tension in the tradeoffs on these features),
> permissive mode is seen by some as something that weakens security too
> much. Apps could call dlopen() on a known unsupported DSO before doing
> ROP. I don't know if you have any musl users with specific shadow stack
> use cases to ask about this.

Yes, this is potentially an argument for something like the option 2,
if there's a way to leave SS enabled but then trap when something goes
wrong, detect if it went wrong via SS-incompatible library code, and
lazily disable SS, otherwise terminate.

But I just realized, I'm not even sure why shared libraries need to be
explicitly SS-compatible. Unless they're doing their own asm stack
switches, shouldn't they just work by default? And since I don't
understand this reason, I also don't understand what the failure mode
is when an incompatible library is loaded, and thus whether it would
be possible to detect and attribute the failure to the library, or
whether the library would induce failure somewhere else.

Anyway, a mechanism to allow the userspace implementation to disable
SS doesn't inherently expose a means to do that. A system integrator
doing maximum hardening might choose to build all libraries as
SS-compatible, or to patch the loader to refuse to load incompatible
libraries.

Rich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
