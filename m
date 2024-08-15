Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3F3C3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 16:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZOaCVqsYmYv+vNBdOub6MUcoPXuDyVjBn8fl0xKpdUs=; b=x60CDmJNm4+Vuc
	K5XV7lphiTE4zukwC+0/32CSBB62QyfnZcCuMcAW1W4ONJVd+g1kQ4yluVY9UPC9UwjzT1jSvtXtP
	ojmlsAiflJADm4Z5aQsLFc4KCM45nC5mYsZ1S4oqR3buv09fKw4QB6OUNO6nACUDjWcOwxaEzJrz8
	r+7GkXid0fh7JdCeIenL64FuAXsic9xo+ZCJiYRsdrGatXIZyFF2uwyhHN3iXhgdBgeONrVuFExug
	MV6MXDyXwsc0EjWwI2AnVomnZcATlwqCzOYFbTNZaTuE2d3+5OTBybs9xEX3Z98rPQi0Vr1cjZanv
	qVcEtbtT4psQfOoYjsCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sedP5-0000000AWgT-3rZZ;
	Thu, 15 Aug 2024 16:32:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sedOL-0000000AWYO-3H8i;
	Thu, 15 Aug 2024 16:32:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47EB014BF;
	Thu, 15 Aug 2024 09:32:24 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94A073F6A8;
	Thu, 15 Aug 2024 09:31:52 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:31:49 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
Subject: Re: [PATCH v10 23/40] arm64/signal: Set up and restore the GCS
 context for signal handlers
Message-ID: <Zr4tdcj8DF92GzVS@e133380.arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-23-699e2bd2190b@kernel.org>
 <ZrzEfg5LqdAzgJ6+@e133380.arm.com>
 <08932f6d-01ef-40e8-97d2-08f0d2016191@sirena.org.uk>
 <Zr4EkmtUKop9o9wu@e133380.arm.com>
 <c56fa974-88f7-4c1f-83bd-8c481fe0045d@sirena.org.uk>
 <Zr4avB6+U4tLDy8E@e133380.arm.com>
 <7fa96f26-5bf6-490f-8986-258033fbfe0e@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7fa96f26-5bf6-490f-8986-258033fbfe0e@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_093201_893272_6796256E 
X-CRM114-Status: GOOD (  21.11  )
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

On Thu, Aug 15, 2024 at 04:29:54PM +0100, Mark Brown wrote:
> On Thu, Aug 15, 2024 at 04:11:56PM +0100, Dave Martin wrote:
> > On Thu, Aug 15, 2024 at 03:45:45PM +0100, Mark Brown wrote:
> > > On Thu, Aug 15, 2024 at 02:37:22PM +0100, Dave Martin wrote:
> 
> > > > Is there a test for taking and returning from a signal on an alternate
> > > > (main) stack, when a shadow stack is in use?  Sounds like something
> > > > that would be good to check if not.
> 
> > > Not specifically for any of the architectures.
> 
> > Can you see any reason why this shouldn't work?
> 
> No, it's expected to work - I'm just not specifically aware of an
> explicit test for it.  Possibly some of the userspace bringup work
> might've covered it?  Any libc tests for altstack support should've
> exercised it for example.

That's true; if libc is built to use shadow stack, generic API tests
ought to cover this.

> > Maybe I'll hacking up a test if I get around to it, but don't take this
> > as a promise!
> 
> Thanks for your firm commitment!  :P

No problem...

Cheers
---Dave

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
