Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E243C3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 13:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWMPWoLTJCSDv4XDZ2P6jsgUPh8WIiA8HAvbUhL+C3c=; b=koksNny75WxtFs
	PdASnt8TJyWgmVnT58APzbNX8prZNcOXnhc+ecj6OkQIAzeCsT0k51QyB+YIbMnbDzQu7jbsL8Ovb
	TcgThwrf8wy62TRgV8aQLFKddCokwqCh1qkOg+8tsUhGDQOmN1WaECVqk8VhHSBqrwMrFh1tW6SVi
	YNxqC8kvsr8kvchhdXPDHOe77eFhRpW/Ol8WSXEL5vLQtynELvTY5Y3Lsjh/MpykOmnChEkhmXyQV
	7xBucmsTzeWqZVPJnGjaUQXqoy09DQrTHfPzXtUj9aSLkYZAVTZ1ANEQTYrG+gGDmB3GxLr/PTAMW
	f1G/sC+6PdzCv8o8i+gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seagC-0000000A4Kc-0lYd;
	Thu, 15 Aug 2024 13:38:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seafX-0000000A4Cg-2nAs;
	Thu, 15 Aug 2024 13:37:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D46EC14BF;
	Thu, 15 Aug 2024 06:37:58 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AA023F6A8;
	Thu, 15 Aug 2024 06:37:28 -0700 (PDT)
Date: Thu, 15 Aug 2024 14:37:22 +0100
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
Message-ID: <Zr4EkmtUKop9o9wu@e133380.arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-23-699e2bd2190b@kernel.org>
 <ZrzEfg5LqdAzgJ6+@e133380.arm.com>
 <08932f6d-01ef-40e8-97d2-08f0d2016191@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08932f6d-01ef-40e8-97d2-08f0d2016191@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_063735_817904_08448F4A 
X-CRM114-Status: GOOD (  34.70  )
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

On Wed, Aug 14, 2024 at 05:00:23PM +0100, Mark Brown wrote:
> On Wed, Aug 14, 2024 at 03:51:42PM +0100, Dave Martin wrote:
> > On Thu, Aug 01, 2024 at 01:06:50PM +0100, Mark Brown wrote:
> 
> > > +	put_user_gcs((unsigned long)sigtramp, gcspr_el0 - 2, &ret);
> > > +	put_user_gcs(GCS_SIGNAL_CAP(gcspr_el0 - 1), gcspr_el0 - 1, &ret);
> > > +	if (ret != 0)
> > > +		return ret;
> 
> > What happens if we went wrong here, or if the signal we are delivering
> > was caused by a GCS overrun or bad GCSPR_EL0 in the first place?
> 
> > It feels like a program has no way to rescue itself from excessive
> > recursion in some thread.  Is there something equivalent to
> > sigaltstack()?
> 
> > Or is the shadow stack always supposed to be big enough to cope with
> > recursion that exhausts the main stack and alternate signal stack (and
> > if so, how is this ensured)?
> 
> There's no sigaltstack() for GCS, this is also the ABI with the existing
> shadow stack on x86 and should be addressed in a cross architecture
> fashion.  There have been some discussions about providing a shadow alt
> stack but they've generally been circular and inconclusive, there were a
> bunch of tradeoffs for corner cases and nobody had a clear sense as to
> what a good solution should be.  It was a bit unclear that actively
> doing anything was worthwhile.  The issues were IIRC around unwinders
> and disjoint shadow stacks, compatibility with non-shadow stacks and
> behaviour when we overflow the shadow stack.  I think there were also
> some applications trying to be very clever with alt stacks that needed
> to be interacted with and complicated everything but I could be
> misremembering there.
> 
> Practically speaking since we're only storing return addresses the
> default GCS should be extremely large so it's unlikely to come up
> without first encountering and handling issues on the normal stack.
> Users allocating their own shadow stacks should be careful.  This isn't
> really satisfying but is probably fine in practice, there's certainly
> not been any pressure yet from the existing x86 deployments (though at
> present nobody can explicitly select their own shadow stack size,
> perhaps it'll become more of an issue when the clone3() stuff is in).

Ack, if this is a known limitation then I guess it makes sense just to
follow other arches.

I see that we default the shadow stack size to half the main stack size,
which should indeed count as "huge".  I guess this makes shadow stack
overrun unlikely at least (at least, not before the main stack
overruns).


Hopping to an alternate (main) stack while continuing to push on the
same shadow stack doesn't sound broken in principle.

Is there a test for taking and returning from a signal on an alternate
(main) stack, when a shadow stack is in use?  Sounds like something
that would be good to check if not.

Cheers
---Dave

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
