Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537B2C5478A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 19:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UhPaKtuVoJRLZq6OMDQhnfITsZ2LwbOfa42BGzlLobQ=; b=01KQo697yXYTc1
	FFgI/dpQTw3wP6fxrOmP/Gy0bkic4KSAp0VwEeMr4kTa4wZdLi6Zt/13wYgnSE1JHCKJR1iuyu9CN
	B2yeQwDZ9CLyWlMNxAULQ2x/yB3d1Qake3ulxOiZfvyTqdwzxZsqppH4lqBYNHVa3SL7xB2KkC1A9
	iya9V2JXrdY3C6F2MKW06r8s5uTHnGv1Jk5+7GY7uPuN1Xpwsie7d6ELiT/9uCUBQlev3OhKhZTtY
	jDTdSpjhinR3Tbqj3KC/42IGu8hgB7ffg9KFX6liUyQ5SfmtNED5LLJPQXDtJQJMrJpCQ49EtBz/a
	hBKrTZDW9y5DFkfy77dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcrz8-00000002EDG-2dPl;
	Wed, 21 Feb 2024 19:10:26 +0000
Received: from brightrain.aerifal.cx ([2001:19f0:5:42::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcrz5-00000002EBo-3Qde
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 19:10:25 +0000
Date: Wed, 21 Feb 2024 14:10:39 -0500
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
Message-ID: <20240221191039.GV4163@brightrain.aerifal.cx>
References: <20240220185714.GO4163@brightrain.aerifal.cx>
 <9fc9c45ff6e14df80ad023e66ff7a978bd4ec91c.camel@intel.com>
 <20240220235415.GP4163@brightrain.aerifal.cx>
 <a57d6c7eada4b9a7c35addbc8556f5b53a0c3e6f.camel@intel.com>
 <20240221012736.GQ4163@brightrain.aerifal.cx>
 <d18f060d-37ac-48b1-9f67-a5c5db79b34e@sirena.org.uk>
 <20240221145800.GR4163@brightrain.aerifal.cx>
 <4a3809e8-61b2-4341-a868-292ba6e64e8a@sirena.org.uk>
 <20240221175717.GS4163@brightrain.aerifal.cx>
 <b41e39d1-29f9-4958-9728-6781e72230f8@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b41e39d1-29f9-4958-9728-6781e72230f8@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_111024_186544_0513DAC5 
X-CRM114-Status: GOOD (  25.39  )
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

On Wed, Feb 21, 2024 at 06:32:20PM +0000, Mark Brown wrote:
> On Wed, Feb 21, 2024 at 12:57:19PM -0500, dalias@libc.org wrote:
> > On Wed, Feb 21, 2024 at 05:36:12PM +0000, Mark Brown wrote:
> 
> > > This feels like it's getting complicated and I fear it may be an uphill
> > > struggle to get such code merged, at least for arm64.  My instinct is
> > > that it's going to be much more robust and generally tractable to let
> > > things run to some suitable synchronisation point and then disable
> > > there, but if we're going to do that then userspace can hopefully
> > > arrange to do the disabling itself through the standard disable
> > > interface anyway.  Presumably it'll want to notice things being disabled
> > > at some point anyway?  TBH that's been how all the prior proposals for
> > > process wide disable I've seen were done.
> 
> > If it's possible to disable per-thread rather than per-process, some
> > things are easier. Disabling on account of using alt stacks only needs
> 
> Both x86 and arm64 currently track shadow stack enablement per thread,
> not per process, so it's not just possible to do per thread it's the
> only thing we're currently implementing.  I think the same is true for
> RISC-V but I didn't look as closely at that yet.

That's nice! It allows still keeping part of the benefit of SS in
programs which have some threads running with custom stacks. We do
however need a global-disable option for dlopen. In musl this could be
done via the same mechanism ("synccall") used for set*id -- it's
basically userspace IPI. But just having a native operation would be
nicer, and would probably help glibc where I don't think they
abstracted their set*id mechanism to do other things like this.

> > If folks on the kernel side are not going to be amenable to doing the
> > things that are easy for the kernel to make it work without breaking
> > compatibility with existing interfaces, but that are impossible or
> > near-impossible for userspace to do, this seems like a dead-end. And I
> > suspect an operation to "disable shadow stack, but without making
> > threads still in SS-critical sections crash" is going to be
> > necessary..
> 
> Could you be more specific as to the easy things that you're referencing
> here?

Basically the ARCH_SHSTK_SUPPRESS_UD proposal.

Rich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
