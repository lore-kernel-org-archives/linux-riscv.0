Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D80EE49A3
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 16:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryhQauVVCI/SiiZe1kD8qh2DQPYGm/D6hW2hbKcWPpg=; b=uRuiia5kl36YpF
	Nokvvoo9q/YkgYCZDuHO9XpAZCREww88VT7H0r0lT/rcptbe8sNA1Ns80nhxvK1CpnjPWlu1ZUSjz
	iix8lgnrLmmoVs3oeCJFYzGCjBcYGcMLhNUoHC5LuFqLKSpjqUcsavstG6oQeJ6e5/2erhwDpsMoV
	nvpdPe03qOu4yaXjKS1Z54XwUTvJMFB15bVDPi2pXvoSrdwyQv7Ug0SBOrOw/5YwQEbspwMNXAneg
	bv4WOtatZTJVUaORsYbdR1Wi01mHJiNjtIpJ+dCrHYfTeA4mXZWfmFUaz0mX3Vh2v90Tm2CIlh+Wa
	wdkiPlgUEnl1hpkXWoDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYUR9-00GW5B-1w;
	Tue, 22 Aug 2023 16:40:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYUR6-00GW3b-1H;
	Tue, 22 Aug 2023 16:40:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D205B60D3A;
	Tue, 22 Aug 2023 16:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0B8C433C7;
	Tue, 22 Aug 2023 16:40:42 +0000 (UTC)
Date: Tue, 22 Aug 2023 17:40:38 +0100
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
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 21/36] arm64/mm: Implement map_shadow_stack()
Message-ID: <ZOTlBpAbSX6TSZzW@arm.com>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-21-68cfa37f9069@kernel.org>
 <ZNZkADhSnodXuH5F@arm.com>
 <9c722954-8f30-425e-a0a4-6edad463620f@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c722954-8f30-425e-a0a4-6edad463620f@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_094056_481046_4B4E3EB9 
X-CRM114-Status: GOOD (  14.61  )
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

On Fri, Aug 18, 2023 at 06:08:52PM +0100, Mark Brown wrote:
> On Fri, Aug 11, 2023 at 05:38:24PM +0100, Catalin Marinas wrote:
> 
> > Given that we won't have an mmap(PROT_SHADOW_STACK), are we going to
> > have restrictions on mprotect()? E.g. it would be useful to reject a
> > PROT_EXEC on the shadow stack.
> 
> mprotect() uses arch_validate_flags() which we're already having cover
> this so it's already covered.

I searched the patches and there's no change to the arm64
arch_validate_flags(). Maybe I missed it.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
