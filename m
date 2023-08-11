Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E138EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 16:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJ+NhRaTOrQ128vgQpqV49XZ3qP3jZisUHtdpg3iJRU=; b=MOyor4jmqm67jX
	o2GI7vCYYvlVsK8uZm/wttixd4h/b8Uhcw+HV3qsb+KGzz4g3biHKwPPwT6VuZcNf7h3R4gSy1wDV
	T7VVsfNDrE5AwdntKHQDSc0/dP7yrcWpGyZwjiEzpCtdXsgZ4rIjkYG4CorA3DVRV8Nr/1FfJeJGt
	k9erUfi511Vo5xos1WiR3bNCBu9SjoSx2HHgmrwwJcWuooxtzwRkYfAFe0hPzbaYMQsq1DGk+FN3a
	gHiYfkdlrqBZs1YQNC5kTl2NzOS0uQXkwfuHj02TPfuj2QugPeB5sw4ERCtboq7tPfSv7uEa/MakE
	GY77csISKtedwDtu5M3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUV7Y-00B7vp-0M;
	Fri, 11 Aug 2023 16:36:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUV7V-00B7v2-14;
	Fri, 11 Aug 2023 16:36:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA45C65728;
	Fri, 11 Aug 2023 16:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80FC3C433C8;
	Fri, 11 Aug 2023 16:36:07 +0000 (UTC)
Date: Fri, 11 Aug 2023 17:36:05 +0100
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
Subject: Re: [PATCH v4 07/36] arm64/gcs: Provide copy_to_user_gcs()
Message-ID: <ZNZjdXTJw2p5vh7C@arm.com>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-7-68cfa37f9069@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807-arm64-gcs-v4-7-68cfa37f9069@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_093613_430372_FCFF4A0F 
X-CRM114-Status: GOOD (  16.85  )
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

On Mon, Aug 07, 2023 at 11:00:12PM +0100, Mark Brown wrote:
> +static inline int copy_to_user_gcs(unsigned long __user *addr,
> +				   unsigned long *val,
> +				   int count)
> +{
> +	int ret = -EFAULT;
> +	int i;
> +
> +	if (access_ok((char __user *)addr, count * sizeof(u64))) {
> +		uaccess_ttbr0_enable();
> +		for (i = 0; i < count; i++) {
> +			ret = gcssttr(addr++, *val++);
> +			if (ret != 0)
> +				break;
> +		}
> +		uaccess_ttbr0_disable();
> +	}
> +
> +	return ret;
> +}

I think it makes more sense to have a put_user_gcs() of a single
element. I've only seen it used with 2 elements in the signal code but
we could as well do two put_user_gcs() calls (as we do for other stuff
that we push to the signal frame).

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
