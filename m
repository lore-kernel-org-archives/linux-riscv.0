Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41460C3DA6F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 15:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24lNRAqIxLI3mKxocqACSSQFK/IIJZ7nUj7w9ykLoAM=; b=fsxGQUFLF+ZxX5
	lFhinp1obT2AN7GkpGoZs3mSe+LvGhCNHlkiAWAUVTFPA3YY9RZkJn8wceGuRmw/4x2hqvDFVEfdM
	WIWcexPcvHGRHOOUcUV8Lumx05kOCQAWLpRZa69gCBWGka34lxEImdsXRG15g9dJYTfgpa1iW+nkp
	iVqv9GJs2l5QJiqoS5nlw/NEFm+H8euqwbzTiFANdy+j++GsLhT1gv/OC3IIijgp7x5SXx0tFvOHZ
	RAI+p3EcZy2LBSRV4CZ6EtOfv5wat9i5Gea9s6jhxRedcH007Xv9yAHQYNpT1GGkgJvh/BqQkFdnZ
	1bP6y9wzVtj9TjzSsMLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZCUx-003OZr-1r;
	Thu, 24 Aug 2023 15:43:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZCUk-003OUN-0Q;
	Thu, 24 Aug 2023 15:43:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 87C5867110;
	Thu, 24 Aug 2023 15:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D722EC433C8;
	Thu, 24 Aug 2023 15:43:23 +0000 (UTC)
Date: Thu, 24 Aug 2023 16:43:19 +0100
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
Message-ID: <ZOd6lzj29VksAp7L@arm.com>
References: <f4cec4b3-c386-4873-aa1d-90528e062f2a@sirena.org.uk>
 <ZN+qki9EaZ6f9XNi@arm.com>
 <aaea542c-929c-4c9b-8caa-ca67e0eb9c1e@sirena.org.uk>
 <ZOTnL1SDJWZjHPUW@arm.com>
 <43ec219d-bf20-47b8-a5f8-32bc3b64d487@sirena.org.uk>
 <ZOXa98SqwYPwxzNP@arm.com>
 <227e6552-353c-40a9-86c1-280587a40e3c@sirena.org.uk>
 <ZOY3lz+Zyhd5ZyQ9@arm.com>
 <ZOZEmO6WGyVAcOqK@arm.com>
 <ef7272d2-d807-428f-9915-6fc9febadb5c@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef7272d2-d807-428f-9915-6fc9febadb5c@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_084338_211843_B2C12CA9 
X-CRM114-Status: GOOD (  19.31  )
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

On Wed, Aug 23, 2023 at 07:16:52PM +0100, Mark Brown wrote:
> On Wed, Aug 23, 2023 at 06:40:40PM +0100, Szabolcs Nagy wrote:
> > i don't know if we can allow disabled gcs thread creation with locked
> > gcs state. (i can see arguments both ways, so further prctl flag may
> > be needed which may be another divergence from x86)
> 
> I think that if we do add a new flag that'd just be new functionality,
> the divergence would be in allowing configuration via clone3() rather
> than the flag.  TBH I'm not sure I see a use case for locking but
> providing a mechanism for getting out of the lock, that seems very
> questionable.

You are right, once the configuration is locked a plain clone() or
clone3() without a GCS pointer should be rejected.

Is there a use-case for the unlocked configuration to allow disabling
the GCS implicitly via a clone syscall?

If we go for extending clone3, I wonder whether we should also introduce
a sigaltstack2/3 ;). I haven't checked what the current patches do and
won't have time until early September (on holiday from the end of today).

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
