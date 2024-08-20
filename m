Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12370C3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 15:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKB16l8rfcATAR11j3ZyQcclb2ksPZk0Bc1ZDcGymiE=; b=sY5OqnRCH1C6m8
	1JNdQLI348Q2qQqd3f4b11plwXDc5+kBf9iluW+6M9I9nOf6jgwflvyK/uDvYdFH8Luqlj4bJX6wG
	BUtTwP02ENnQ/f/+xcmNYByp4SAsH7YWwVuNpeOTbv+lXhziPbv+a4m4xIylyNfpv61Xch5wMOl5T
	9zPFIppJzOx1HHcUAH/utZOo4QH4BGNuQW3Zl7rO7S2FfsM79jcUWmG7ntyzGWu8s032IZugJlWdU
	wgHHo3wLElbQcVcTjUGIokHSFdoTOO6nOFnkpNgjoZNCk6vKPQQespOYsjZNSqz8H0zmcr8Ibuyge
	G4fIoUsn2hlWPgetDR6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQZe-00000005kiK-2NfJ;
	Tue, 20 Aug 2024 15:15:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQKa-00000005gHQ-0tPS;
	Tue, 20 Aug 2024 14:59:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 371B9CE092D;
	Tue, 20 Aug 2024 14:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA71FC4AF0F;
	Tue, 20 Aug 2024 14:59:23 +0000 (UTC)
Date: Tue, 20 Aug 2024 15:59:21 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 13/40] arm64/mm: Map pages for guarded control stack
Message-ID: <ZsSvSeE303LGtk4b@arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-13-699e2bd2190b@kernel.org>
 <ZsMMDNIp6Pkfbg1e@arm.com>
 <d43f8036-cc06-430c-9e9e-b938037fc64c@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d43f8036-cc06-430c-9e9e-b938037fc64c@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_075932_634120_6F629347 
X-CRM114-Status: GOOD (  31.58  )
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

On Mon, Aug 19, 2024 at 05:33:24PM +0100, Mark Brown wrote:
> On Mon, Aug 19, 2024 at 10:10:36AM +0100, Catalin Marinas wrote:
> > On Thu, Aug 01, 2024 at 01:06:40PM +0100, Mark Brown wrote:
> > > +	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
> > > +		/*
> > > +		 * An executable GCS isn't a good idea, and the mm
> > > +		 * core can't cope with a shared GCS.
> > > +		 */
> > > +		if (vm_flags & (VM_EXEC | VM_ARM64_BTI | VM_SHARED))
> > > +			return false;
> > > +	}
> 
> > I wonder whether we should clear VM_MAYEXEC early on during the vma
> > creation. This way the mprotect() case will be handled in the core code.
> > At a quick look, do_mmap() seems to always set VM_MAYEXEC but discard it
> > for non-executable file mmap. Last time I looked (when doing MTE) there
> > wasn't a way for the arch code to clear specific VM_* flags, only to
> > validate them. But I think we should just clear VM_MAYEXEC and also
> > return an error for VM_EXEC in the core do_mmap() if VM_SHADOW_STACK. It
> > would cover the other architectures doing shadow stacks.
> 
> Yes, I think adding something generic would make sense here.  That feels
> like a cleanup which could be split out?

It can be done separately. It doesn't look like x86 has such checks.
Adding it generically would be a slight ABI tightening but I doubt it
matters, no sane software would use an executable shadow stack.

> > Regarding VM_SHARED, how do we even end up with this via the
> > map_shadow_stack() syscall? I can't see how one can pass MAP_SHARED to
> > do_mmap() on this path. I'm fine with a VM_WARN_ON() if you want the
> > check (and there's no way a user can trigger it).
> 
> It's just a defenesive programming thing, I'm not aware of any way in
> which it should be possible to trigger this.
> 
> > Is there any arch restriction with setting BTI and GCS? It doesn't make
> > sense but curious if it matters. We block the exec permission anyway
> > (unless the BTI pages moved to PIE as well, I don't remember).
> 
> As you say BTI should be meaningless for a non-executable page like GCS,
> I'm not aware of any way in which it matters.  BTI is separate to PIE.

My thoughts were whether we can get rid of this hunk entirely by
handling it in the core code. We'd allow BTI if one wants such useless
combination but clear VM_MAYEXEC in the core code (and ignore VM_SHARED
since you can't set it anyway).

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
