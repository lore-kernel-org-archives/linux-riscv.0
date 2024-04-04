Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BA1CD128A
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 02:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cngwIgJTtlnu6NRP0jd40/jKNUBOtz3dm6vQ0yjB2Go=; b=RPAACjgmcnoQdV
	asih4nsDYJZl4abypano3aGlXbWWb9xsDa19uRfY0SMQJAjfxQchOloefYQJZWHPONN1R9lK3pQjR
	/jQIT2I2jbhVce22Af4UP038ck1hxjXPZP/VjydG2O8CHqEfhfoA0t7R8FWblFvyvLmHK1sQgLBNE
	peKdCx+XBzEepoj+bcnyXbeMU1ozDidEgcGtMGN+BEGOSdnfudAF5n6CD6E5PiphnIorCqRSnloaM
	FycM86oolyhQiB7VPsekhQ7OBO+zhxvfarVY2n+iWNOGglt2eHyQhAAgR3gr1OczCIrEze8X5TeVB
	uEJbASTtS7aZMguL57zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsCcf-00000000xmF-3zr4;
	Thu, 04 Apr 2024 02:14:37 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3] helo=gandalf.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsCca-00000000xho-42FX;
	Thu, 04 Apr 2024 02:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1712196863;
	bh=0PcvpW5SQPrf4QnOqaQeX/XXu99U3a1qNIXPB0jb71k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VyMVQ3ztogSJTiIgLxBnLkNGFUgd68Qe2KDkfvwgzAo6UXogiTKbR69fLdEZZdu7n
	 j3iNV2JgacCj30EfVfA0nufM6LLB0HhkUu4/gC0cH9GF15bjP6K55yY/SHfDcHG5LZ
	 C6A3Ro/1onK6pyPh3jlVC2U8y95oPYSyx7VeOvKtcmV57g7fuqL83rvaMyFKYOVpxw
	 oxm58pQDGWVdn2ucF5HZ6tep2QVSw9tARy9V9golouCtHYA3Tik7KGkuZEvWcLHYKF
	 3HCUbzR0cNgClz2PklZaCGNb+9TQaIfvB8jeqaIi2XVH6tgkaEYydsWFGiIh6MP6A8
	 HT6H386UWr5YA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4V94th0jq3z4wcQ;
	Thu,  4 Apr 2024 13:14:19 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Guenter Roeck <linux@roeck-us.net>, linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?utf-8?Q?Ma=C3=ADra?=
 Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Kees
 Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>, David
 Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>, Naresh Kamboju
 <naresh.kamboju@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, Ville
 =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Daniel Vetter
 <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, netdev@vger.kernel.org, x86@kernel.org, Guenter
 Roeck <linux@roeck-us.net>, Linux Kernel Functional Testing
 <lkft@linaro.org>
Subject: Re: [PATCH v3 15/15] powerpc: Add support for suppressing warning
 backtraces
In-Reply-To: <20240403131936.787234-16-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
 <20240403131936.787234-16-linux@roeck-us.net>
Date: Thu, 04 Apr 2024 13:14:16 +1100
Message-ID: <874jch98nb.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_191433_211192_3E518E74 
X-CRM114-Status: GOOD (  13.13  )
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

Guenter Roeck <linux@roeck-us.net> writes:
> Add name of functions triggering warning backtraces to the __bug_table
> object section to enable support for suppressing WARNING backtraces.
>
> To limit image size impact, the pointer to the function name is only added
> to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
> CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
> parameter is replaced with a (dummy) NULL parameter to avoid an image size
> increase due to unused __func__ entries (this is necessary because __func__
> is not a define but a virtual variable).
>
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2:
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
> - Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
> v3:
> - Rebased to v6.9-rc2
>
>  arch/powerpc/include/asm/bug.h | 37 +++++++++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 9 deletions(-)

I ran it through some build and boot tests, LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
