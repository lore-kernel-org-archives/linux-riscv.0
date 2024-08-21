Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8236DC5472C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 15:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nl6Rl+rS2l2LpNypWVaauPlk/lIF9wMqK4OO99JuKs=; b=CupihUVa0xSr8P
	lM8kv1lGHgOYLkQs+vjFtN3mA6YUY5J3yBD/suizsHobxMAJhLmIoQXxur5y21JIMqjyiqtOnvoh2
	ekow5s1Aq0B103uMlrmvpS2ovTbl5TWWkFqLEdorU6n/J1LDGWj7JMIwbaB1BjTG+KFM1+fmCXACH
	UyxhtaVpFHALIJqAmblNuFlSyx/fCHAFR9FEs56c3lvs+Xca9SIMq011TMzmL8RKD8dQulW2L5oBK
	r+hjUdvRnlPDB9usw9vZta0EbchZKTDkOjLOQHLgIvG+M8Me+ffW/7tk9KROCvgxkv0Aha6Dul86A
	dQTtpDOsAOsRD5RHe5Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgnPK-00000009WZh-1Qed;
	Wed, 21 Aug 2024 15:37:58 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgnOY-00000009WKH-2uuS;
	Wed, 21 Aug 2024 15:37:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ED86DCE0E69;
	Wed, 21 Aug 2024 15:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBEF4C4AF09;
	Wed, 21 Aug 2024 15:37:01 +0000 (UTC)
Date: Wed, 21 Aug 2024 16:36:59 +0100
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
Subject: Re: [PATCH v10 22/40] arm64/mm: Implement map_shadow_stack()
Message-ID: <ZsYJm51qLzkvtnMM@arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-22-699e2bd2190b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801-arm64-gcs-v10-22-699e2bd2190b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_083711_175809_0B2F6A3F 
X-CRM114-Status: GOOD (  22.99  )
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

On Thu, Aug 01, 2024 at 01:06:49PM +0100, Mark Brown wrote:
> +SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsigned int, flags)
> +{
> +	unsigned long alloc_size;
> +	unsigned long __user *cap_ptr;
> +	unsigned long cap_val;
> +	int ret = 0;
> +	int cap_offset;
> +
> +	if (!system_supports_gcs())
> +		return -EOPNOTSUPP;
> +
> +	if (flags & ~(SHADOW_STACK_SET_TOKEN | SHADOW_STACK_SET_MARKER))
> +		return -EINVAL;
> +
> +	if (addr && (addr % PAGE_SIZE))
> +		return -EINVAL;
> +
> +	if (size == 8 || size % 8)
> +		return -EINVAL;

Nitpicks: use PAGE_ALIGNED and IS_ALIGNED(size, 8).

> +
> +	/*
> +	 * An overflow would result in attempting to write the restore token
> +	 * to the wrong location. Not catastrophic, but just return the right
> +	 * error code and block it.
> +	 */
> +	alloc_size = PAGE_ALIGN(size);
> +	if (alloc_size < size)
> +		return -EOVERFLOW;
> +
> +	addr = alloc_gcs(addr, alloc_size);
> +	if (IS_ERR_VALUE(addr))
> +		return addr;
> +
> +	/*
> +	 * Put a cap token at the end of the allocated region so it
> +	 * can be switched to.
> +	 */
> +	if (flags & SHADOW_STACK_SET_TOKEN) {
> +		/* Leave an extra empty frame as a top of stack marker? */
> +		if (flags & SHADOW_STACK_SET_MARKER)
> +			cap_offset = 2;
> +		else
> +			cap_offset = 1;
> +
> +		cap_ptr = (unsigned long __user *)(addr + size -
> +						   (cap_offset * sizeof(unsigned long)));
> +		cap_val = GCS_CAP(cap_ptr);
> +
> +		put_user_gcs(cap_val, cap_ptr, &ret);
> +		if (ret != 0) {
> +			vm_munmap(addr, size);
> +			return -EFAULT;
> +		}
> +
> +		/* Ensure the new cap is viaible for GCS */
> +		gcsb_dsync();

s/viaible/visible/

On the comment itself, the barrier does not ensure visibility in
absolute term, it's all about ordering relative to other accesses. It
might be good to clarify what we actually need in terms of ordering. One
aspect came up in an earlier patch was around thread creation. For the
current CPU, subsequent GCS accesses in program order will see this
token. Classic LDR/STR won't without the barrier. I think this matters
when we check the token in the clone3() implementation. Maybe write
something along the lines of "ensure the new cap is ordered before
standard memory accesses to the same location".

Anyway, the patch looks fine.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
