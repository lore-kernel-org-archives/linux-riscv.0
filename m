Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0004BEE4993
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 16:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84kLcHWH/wKVDrw6rKS6aRtstd5lda1kCpBL/Y6C/O0=; b=Jo7XLs1H60fIwM
	3JtvE+Jrl18I5YnmfVHNz7c9M7RFWhUaXhtPxUbtUhKepjEPKYyVGDMSGzw5ZZhyTGq+YSXmBv0Yz
	M9RaeVu1NmIah0L1LnwvUU8JcPHBsLS8jP95R3jyBw9AcUsNPM+F0bQpsB2JD8JmBSLjmqEK6y9U4
	6MYCxoYR0zjE9jevV2OcNDauG54BR55idU1TkdUQJmgReYm174GXVPaiZDj31SQ0XhGg8v7osKGAi
	kCw3jFC9aLKGLonO67tQH1xgqfGx1h3If+RAPeVJC3Zkg3lC1UglrD36df3qhy/MjWMVkm1gg7TAm
	CY0IeySgwTzjzQXiQE/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYqz8-0015qj-1j;
	Wed, 23 Aug 2023 16:45:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYqz4-0015oN-0q;
	Wed, 23 Aug 2023 16:45:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C8D7C649D2;
	Wed, 23 Aug 2023 16:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 676D7C433C7;
	Wed, 23 Aug 2023 16:45:15 +0000 (UTC)
Date: Wed, 23 Aug 2023 17:45:11 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 03/36] arm64/gcs: Document the ABI for Guarded Control
 Stacks
Message-ID: <ZOY3lz+Zyhd5ZyQ9@arm.com>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-3-68cfa37f9069@kernel.org>
 <ZNOhjrYleGBR6Pbs@arm.com>
 <f4cec4b3-c386-4873-aa1d-90528e062f2a@sirena.org.uk>
 <ZN+qki9EaZ6f9XNi@arm.com>
 <aaea542c-929c-4c9b-8caa-ca67e0eb9c1e@sirena.org.uk>
 <ZOTnL1SDJWZjHPUW@arm.com>
 <43ec219d-bf20-47b8-a5f8-32bc3b64d487@sirena.org.uk>
 <ZOXa98SqwYPwxzNP@arm.com>
 <227e6552-353c-40a9-86c1-280587a40e3c@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <227e6552-353c-40a9-86c1-280587a40e3c@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_094530_359859_CC21CBF3 
X-CRM114-Status: GOOD (  20.99  )
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

On Wed, Aug 23, 2023 at 01:51:35PM +0100, Mark Brown wrote:
> On Wed, Aug 23, 2023 at 11:09:59AM +0100, Szabolcs Nagy wrote:
> > The 08/22/2023 18:53, Mark Brown wrote:
> > > My sense is that they deployment story is going to be smoother with
> > > defaults being provided since it avoids dealing with the issue of what
> > > to do if userspace creates a thread without a GCS in a GCS enabled
> > > process but like I say I'd be totally happy to extend clone3().  I will
> > > put some patches together for that (probably once the x86 stuff lands).
> > > Given the size of this series it might be better split out for
> > > manageability if nothing else.
> 
> > i would make thread without gcs to implicitly disable gcs, since
> > that's what's bw compat with clones outside of libc (the libc can
> > guarantee gcs allocation when gcs is enabled).
> 
> That'd create a pretty substantial divergence with the x86 patches if
> they land this time around, there's not enough time to rework them now -
> I suppose it'd mainly bite people implementing libc type stuff but
> still, doesn't feel great.

I don't mind the divergence in this area if the libc folks are ok with
it. x86 can eventually use the clone3() interface if they want more
flexibility, they'll just have to continue supporting the old one. I
think we already diverge around the prctl().

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
