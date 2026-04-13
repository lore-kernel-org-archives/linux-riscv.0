Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620D5EBFD38
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 11:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zI5UByRwYV3p+gJdY2MISFQFo8zhWOLA/OfdBlft+xo=; b=H5YiUqq5EOGJAI
	EsAxbAFWMAgxcQ3DycvDzL0ECiNogYuyNDhQ1a5PCW84CfvFabsCTd8/aYV2t69NYIIGUQOV5qbRp
	yFag3Y7KK2sHEZDMO72fRJ5c01CPgvEWmcen4WX3wcW5JN1GEvjozChSjKduPWLb0DUjJ1yGhsshk
	mCgvKSUsKQ39wFIQCISJVt68GP95+3qRwPxs0lnS8uHGe2Yk8Xh5PZ6m+GgX5bsQFF2ALpnhjgJld
	FVv4wF9EhbcIOgrAcur9F/l0FHWtG624mRP1Twjw+eqQ5PsIKo78lxU0F9xbdrtaX+qCcqfJkbaSq
	NQuBkTmNmRvQRvOzHLsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCF2b-0000000FXgv-2hlc;
	Mon, 13 Apr 2026 11:01:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCF2Y-0000000FXgC-2TmB;
	Mon, 13 Apr 2026 11:01:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8493C3581;
	Mon, 13 Apr 2026 04:01:05 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BACD83F641;
	Mon, 13 Apr 2026 04:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776078071; bh=P5560RAnvZN21+y42j1UNU3zw/F77/WG44SpxSSnyqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NgLb3FObr2jCRDXSLm8COFWaQdrrXHeryVHOrr+La3FNXGfYu/NTKqn8Qwma5HnOj
	 jPUSYrOfKWA6U4R1W121xjN1n7pfjokpsNwPc6rXIbPZf7zgREg5R3M/N35h90VOP/
	 zt8JyZ/FWVvEXZhvjQy9D8u/7u8vulPNvFJcA5CA=
Date: Mon, 13 Apr 2026 12:01:05 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Will Deacon <will@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v3 2/7] arm64/runtime-const: Use
 aarch64_insn_patch_text_nosync() for patching
Message-ID: <adzM8RtjbOy0kLOC@arm.com>
References: <20260402112250.2138-1-kprateek.nayak@amd.com>
 <20260402112250.2138-3-kprateek.nayak@amd.com>
 <adjE6WzFM7NogzlU@arm.com>
 <c45ede13-f8d0-4b6a-b2ed-f06af4882ebc@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c45ede13-f8d0-4b6a-b2ed-f06af4882ebc@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_040114_852029_5CF9B475 
X-CRM114-Status: GOOD (  21.93  )
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

On Sun, Apr 12, 2026 at 01:24:45AM +0530, K Prateek Nayak wrote:
> On 4/10/2026 3:07 PM, Catalin Marinas wrote:
> > https://sashiko.dev/#/patchset/20260402112250.2138-1-kprateek.nayak@amd.com
> > 
> > In short, aarch64_insn_patch_text_nosync() does not expect a linear map
> > address but rather a kernel text one (or vmalloc/modules). The other
> > valid point is on aliasing I-caches.
> > 
> > I think dropping the lm_alias() and just use 'where' directly would do
> > but I haven't tried.
> 
> Ack! I completely missed that subtlety of passing "where" to
> caches_clean_inval_pou(). I'm still surprised that it didn't
> blow up in my testing.

For the first part (passing a linear map address), I suspect we get away
with this in vmalloc_to_page() as it just walks the page tables and
VIRTUAL_BUG_ON() is a no-op with defconfig.

For the I-cache aliasing, you may not have the right hardware but even
if you did, it's harder to hit.

> Anyhow, following diff, on top of the full series builds and
> tests fine and has been blessed by review-prompts:
> 
> diff --git a/arch/arm64/include/asm/runtime-const.h b/arch/arm64/include/asm/runtime-const.h
> index 21f817eb5951..d3f0dfa7ced0 100644
> --- a/arch/arm64/include/asm/runtime-const.h
> +++ b/arch/arm64/include/asm/runtime-const.h
> @@ -57,21 +57,21 @@
>  } while (0)
>  
>  /* 16-bit immediate for wide move (movz and movk) in bits 5..20 */
> -static inline void __runtime_fixup_16(__le32 *p, unsigned int val)
> +static inline void __runtime_fixup_16(void *where, unsigned int val)
>  {
> +	__le32 *p = lm_alias(where);
>  	u32 insn = le32_to_cpu(*p);
>  	insn &= 0xffe0001f;
>  	insn |= (val & 0xffff) << 5;
> -	aarch64_insn_patch_text_nosync(p, insn);
> +	aarch64_insn_patch_text_nosync(where, insn);
>  }

You might as well keep the __le32 *p argument and just dereference it
directly, no need for lm_alias(). The kernel text is readable and you
avoid having to change all the other functions.

>  static inline void __runtime_fixup_ptr(void *where, unsigned long val)
>  {
> -	__le32 *p = lm_alias(where);
> -	__runtime_fixup_16(p, val);
> -	__runtime_fixup_16(p+1, val >> 16);
> -	__runtime_fixup_16(p+2, val >> 32);
> -	__runtime_fixup_16(p+3, val >> 48);
> +	__runtime_fixup_16(where, val);
> +	__runtime_fixup_16(where + 4, val >> 16);
> +	__runtime_fixup_16(where + 8, val >> 32);
> +	__runtime_fixup_16(where + 12, val >> 48);
>  }

And here change the argument to '__le32 *p' (and in other places where
you changed p to where + 4 etc.).

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
