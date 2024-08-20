Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BEAC531DC
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 17:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqIZPjxNWnxxsXuBmO9UGRnToVCIAP25CxqFPWlTHCg=; b=HZFhs7Jc65Fugw
	jxoxIF1G1JpofEgh3XNPG5YdGX3SnZHCqC5VYKO3kZBIe0PHByOmrsf/VLF3hY7+JnRYqQWPYwO4z
	CujHXr7HtvErBAi1zq2ogs6CosWq+NVDv3BI/WZro4h2dx6dAebnNDt5p14Q/weLiivxwYDnGJPwr
	0XkEn5Or43msQnac3wS6J56WVOBXtcKx3ZeHp+xux3SaWIihGiUrucpJD6WVNoMNYCrF/ZCupNFWZ
	cc5KrTRfaRTkPKvtgtS3Z2FhClxYO8eZXNUx6CK2+oE2YdWgQr+YQsDUlsgxXHym/vTTy7O12NsdC
	zgVDslFRj6JTLU99r6GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgSfg-00000006BTF-3lBF;
	Tue, 20 Aug 2024 17:29:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgSex-00000006B7Z-2kjA;
	Tue, 20 Aug 2024 17:28:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BA6CDA402B9;
	Tue, 20 Aug 2024 13:28:35 -0400 (EDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1055C4AF0E;
	Tue, 20 Aug 2024 17:28:36 +0000 (UTC)
Date: Tue, 20 Aug 2024 18:28:34 +0100
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
Subject: Re: [PATCH v10 20/40] arm64/gcs: Ensure that new threads have a GCS
Message-ID: <ZsTSQmKV4zAEnara@arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-20-699e2bd2190b@kernel.org>
 <ZsM0wkRRguMchecK@arm.com>
 <e1d40f17-2c03-4440-8d41-85368e138f03@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e1d40f17-2c03-4440-8d41-85368e138f03@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_102844_112366_92EF36EA 
X-CRM114-Status: GOOD (  35.79  )
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

On Mon, Aug 19, 2024 at 04:57:08PM +0100, Mark Brown wrote:
> On Mon, Aug 19, 2024 at 01:04:18PM +0100, Catalin Marinas wrote:
> > On Thu, Aug 01, 2024 at 01:06:47PM +0100, Mark Brown wrote:
> > > +static int copy_thread_gcs(struct task_struct *p,
> > > +			   const struct kernel_clone_args *args)
> > > +{
> > > +	unsigned long gcs;
> > > +
> > > +	gcs = gcs_alloc_thread_stack(p, args);
> > > +	if (IS_ERR_VALUE(gcs))
> > > +		return PTR_ERR((void *)gcs);
> 
> > Is 0 an ok value here? I can see further down that
> > gcs_alloc_thread_stack() may return 0.
> 
> Yes, it's fine for a thread not to have a GCS.

OK, so we only get a 0 here if the gcs_{base,size} has not be
initialised. Looks fine.

> > > +	p->thread.gcs_el0_mode = current->thread.gcs_el0_mode;
> > > +	p->thread.gcs_el0_locked = current->thread.gcs_el0_locked;
> 
> > > +	/* Ensure the current state of the GCS is seen by CoW */
> > > +	gcsb_dsync();
> 
> > I don't get this barrier. What does it have to do with CoW, which memory
> > effects is it trying to order?
> 
> Yeah, I can't remember what that's supposed to be protecting.

The GCS memory writes in the parent must indeed be visible in the child
that could start on a different CPU. So, in principle, we need some form
of ordering similar to the context switch. However, in case of classic
fork(), the child won't be started until the PTEs have been made
read-only and a TLBI issued. This would ensure the completion of any GCS
memory accesses in the parent (at least that's my reading of the Arm
ARM).

If we have normal thread creation without CoW, is the parent writing
anything to the stack that the new thread needs to observe? The
map_shadow_stack() call will cause a GCSSTTR and this wouldn't be
ordered with subsequent memory writes. But we already have a GCSB DSYNC
in map_shadow_stack() after put_user_gcs().

My conclusion is that we don't need this barrier.

> > > +	/* Allocate RLIMIT_STACK/2 with limits of PAGE_SIZE..2G */
> > > +	size = PAGE_ALIGN(min_t(unsigned long long,
> > > +				rlimit(RLIMIT_STACK) / 2, SZ_2G));
> > > +	return max(PAGE_SIZE, size);
> > > +}
> 
> > So we still have RLIMIT_STACK/2. I thought we got rid of that and just
> > went with RLIMIT_STACK (or I misremember).
> 
> I honestly can't remember either way, it's quite possible it's changed
> multiple times.  I don't have super strong feelings on the particular
> value here.

The half size looks a lot more arbitrary to me than picking the same
size as the stack. So I'd go with RLIMIT_STACK.

> > > +static bool gcs_consume_token(struct mm_struct *mm, unsigned long user_addr)
> > > +{
> 
> > As per the clone3() thread, I think we should try to use
> > get_user_page_vma_remote() and do a cmpxchg() directly.
> 
> I've left this as is for now, mainly because it keeps the code in line
> with x86 and I can't directly test the x86 code. 

I thought for the clone3() x86 code we'll need the remote vma, so we
have to use the get_user_page_vma_remote() API anyway.

> IIRC we can't just do
> a standard userspace cmpxchg since that will access as though we were at
> EL0 but EL0 doesn't have standard write permission for the page.

Correct but GUP goes through the kernel mapping, not the user one. So
get_user_page_vma_remote() returns a page and you just do a classic
cmpxchg() at page_address() (plus some offset).

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
