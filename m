Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F18EB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 01:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5sd6T+rqgh3+n0eOZhz8Lc2gvjBa1Dkv0NOnM2koCY=; b=FOo+s/1BcjfmEx
	EerwVitK/ADx5Fqc1+Anzml/5VHRcsVITu5mG7T1rvM69fIFIuN6ExzkPjHvSB+6Ee7E5PTqXM6O/
	NcMOuWzrX90Lh5AfPJ6RHFRo/TNwou2Ahq85cSONFYiKZhxdb35nFWiPOSaNHaGpiEjUTgcYmJERd
	s4dCAbZ5D6v+E8xIisoXK0x6Jxy7mtaKWRprNH6k0thbuD465R3BgOsdqTke/FmUPkGdU05A8mSQS
	UByMEhRljDOks3X5eDx53UMKGGuuwldMVL8OIkV70cqJSpVF6cPunqdhh373FIPiKIeZcXoxiFI3F
	Ih+kBTZeYf5IOCDzss9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEJYc-00ETqk-29;
	Wed, 28 Jun 2023 01:01:18 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEJYZ-00ETpz-0R
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 01:01:16 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 4950B5C0199;
	Tue, 27 Jun 2023 21:01:14 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute1.internal (MEProxy); Tue, 27 Jun 2023 21:01:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1687914074; x=1688000474; bh=1C
	mL+OsJfO32uUM+cLpgDuXbofgPpKxCFNKoabUu/g0=; b=j64aCXxfUsfNQh9nG3
	nsUxUn4qA8bSWqRgmWTChjAtPWv9ZmLdXyz1FRDFOxrIopA0zIVCbkaeeiMe19ic
	b3IbGq+ueLd3ULtIqW3AxW5Z6BdI0UdfLcS1TG4itTR46AENALLS9pt08q+g0DL8
	CeOsxkzoM7Hdacl0AszgQZQyh2GfW0gZvShHRBSNovgiCNHbN7SQfXniEo3XWR29
	kP8THoLfDS2wnCs9afOTBvPLkl5obVwC5Xb797CDpKU7dPhjhkXNg1/kC8DgqoGf
	jV7YMQpIxA4tzLf/MgC177m8AtiDrFSVhFan7MUmm88EGBfGBPSY4eP9MXKjM4UG
	8QTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687914074; x=1688000474; bh=1CmL+OsJfO32u
	UM+cLpgDuXbofgPpKxCFNKoabUu/g0=; b=c2t31nV3sL2V+8FnRj34agaiEh+a0
	BhVWCWi4QuiePs3LZXCN5NFi9L7yr2ClKINcXRs8PGYtcvElTUUF9k+rrfYVDL87
	DtPeU4Le/XjZWg76GjVFQHaIJDqp9EdzAcAO+4+LAdociR8QYnPwBNZ7Wll7QK5j
	WTtp7wTcnSss+KFgCXtVSe4ouaCf+sCcgbvMj8XKqaTFNL9B6oT+EY+oyrZwc9aJ
	htcFjAYMDkP1EnDtbp09r1E1tnIzqlHEM7DuU0gr6Oderf3PIqk/YRHCgo03dquU
	NDWTuTXR8bfRVXsnWy+LB0/36qANrMtx+OnR5vSG7GUwFofRJJ+OOau0g==
X-ME-Sender: <xms:WoabZPkAXdcerGAo9dvMkgOQ9yPoF7zZxy302qRGLQtJ4QmU3LCK-g>
    <xme:WoabZC08-1w-Tc2XpC0sLXVoxdSTO8p6Kkm10Ut5pFNK3dD-XatWN6sVAiGYvjdEB
    1y8P943L9lQPeMoaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtddugdegvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfuthgv
    fhgrnhcuqfdktfgvrghrfdcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeejueehgedtueetgefhheejjeeigffhieefjeehuddvueegtdfh
    heevgfeggfektdenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsohhrvggrrhesfhgr
    shhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:WoabZFpl5cXU8RCT25oQjJ7N-CeqyQnYSv8ZDHU52L6YFu54MdhbSw>
    <xmx:WoabZHlvlhuW0By92VFWWWMoG7gvp6hStN5jesOWcM2Hdl9bgI5vtg>
    <xmx:WoabZN3wA9XugdNy-kCwNF0HL2EdGrFRYF2l99So96UdNf_QwFcdjA>
    <xmx:WoabZM0hlA_U6U58QD_of_vd9RyYuag_KxJVo6YCodbe5OKKhSopaw>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E266A1700089; Tue, 27 Jun 2023 21:01:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <644e7acf-905d-42b2-87d9-81b98ccca25c@app.fastmail.com>
In-Reply-To: <20230627143747.1599218-4-sameo@rivosinc.com>
References: <20230627143747.1599218-1-sameo@rivosinc.com>
 <20230627143747.1599218-4-sameo@rivosinc.com>
Date: Tue, 27 Jun 2023 21:00:53 -0400
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "Samuel Ortiz" <sameo@rivosinc.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: linux@rivosinc.com, "Conor Dooley" <conor.dooley@microchip.com>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Heiko Stuebner" <heiko.stuebner@vrull.eu>,
 "Anup Patel" <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>, "Guo Ren" <guoren@kernel.org>,
 "Atish Patra" <atishp@rivosinc.com>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 "Evan Green" <evan@rivosinc.com>
Subject: Re: [PATCH 3/3] RISC-V: Implement archrandom when Zkr is available
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_180115_249735_18B698AD 
X-CRM114-Status: GOOD (  26.49  )
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

On Tue, Jun 27, 2023, at 10:37 AM, Samuel Ortiz wrote:
> The Zkr extension is ratified and provides 16 bits of entropy seed when
> reading the SEED CSR.
>
> We can implement arch_get_random_seed_longs() by doing multiple csrrw to
> that CSR and filling an unsigned long with valid entropy bits.
>
> Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
> ---
>  arch/riscv/include/asm/archrandom.h | 66 +++++++++++++++++++++++++++++
>  arch/riscv/include/asm/csr.h        |  9 ++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 arch/riscv/include/asm/archrandom.h
>
> diff --git a/arch/riscv/include/asm/archrandom.h 
> b/arch/riscv/include/asm/archrandom.h
> new file mode 100644
> index 000000000000..3d01aab2800a
> --- /dev/null
> +++ b/arch/riscv/include/asm/archrandom.h
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Kernel interface for the RISCV arch_random_* functions
> + *
> + * Copyright (c) 2022 by Rivos Inc.
> + *
> + */
> +
> +#ifndef ASM_RISCV_ARCHRANDOM_H
> +#define ASM_RISCV_ARCHRANDOM_H
> +
> +#include <asm/csr.h>
> +
> +#define PR_PREFIX "Zkr Extension: "
> +#define SEED_RETRY_LOOPS 10
> +
> +static inline bool __must_check csr_seed_long(unsigned long *v)
> +{
> +	unsigned int retry = SEED_RETRY_LOOPS;
> +	unsigned int needed_seeds = sizeof(unsigned long) / 2, valid_seeds = 
> 0;
> +	u16 *entropy = (u16 *)v;
> +
> +	do {
> +		/*
> +		 * The SEED CSR (0x015) must be accessed with a read-write
> +		 * instruction. Moreover, implementations must ignore the write
> +		 * value, its purpose is to signal polling for new seed.
> +		 */
> +		unsigned long csr_seed = csr_swap(CSR_SEED, 0);
> +
> +		switch (csr_seed & SEED_OPST_MASK) {
> +		case SEED_OPST_ES16:
> +			entropy[valid_seeds++] = csr_seed & SEED_ENTROPY_MASK;
> +			if (valid_seeds == needed_seeds)
> +				return true;
> +			break;
> +
> +		case SEED_OPST_DEAD:
> +			pr_err_once(PR_PREFIX "Unrecoverable error\n");
> +			return false;
> +
> +		case SEED_OPST_BIST:
> +			pr_info(PR_PREFIX "On going Built-in Self Test\n");
> +			fallthrough;
> +
> +		case SEED_OPST_WAIT:
> +		default:
> +			continue;
> +		}
> +
> +	} while (--retry);
> +
> +	return false;
> +}

The Entropy Source specification is annoyingly vague about expected retry
counts, only saying that "Without a polling-style mechanism, the entropy
source could hang for thousands of cycles under some circumstances."

Likewise no constraint is placed on the maximum runtime of a BIST or the
maximum number of times SEED_OPST_BIST is repeatedly returned (only that
it be returned at least once if the BIST starts and finishes between seed
reads).

With that, the limit of 10 reads seems suspiciously small.  Is there a
specific justification or is it known to work on some hardware?

-s

> +
> +static inline size_t __must_check arch_get_random_longs(unsigned long 
> *v, size_t max_longs)
> +{
> +	return 0;
> +}
> +
> +static inline size_t __must_check arch_get_random_seed_longs(unsigned 
> long *v, size_t max_longs)
> +{
> +	return max_longs && riscv_isa_extension_available(NULL, ZKR) && 
> csr_seed_long(v) ? 1 : 0;
> +}
> +
> +#endif /* ASM_RISCV_ARCHRANDOM_H */
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index b98b3b6c9da2..7d0ca9082c66 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -389,6 +389,15 @@
>  #define CSR_VTYPE		0xc21
>  #define CSR_VLENB		0xc22
> 
> +/* Scalar Crypto Extension - Entropy */
> +#define CSR_SEED		0x015
> +#define SEED_OPST_MASK		_AC(0xC0000000, UL)
> +#define SEED_OPST_BIST		_AC(0x00000000, UL)
> +#define SEED_OPST_WAIT		_AC(0x40000000, UL)
> +#define SEED_OPST_ES16		_AC(0x80000000, UL)
> +#define SEED_OPST_DEAD		_AC(0xC0000000, UL)
> +#define SEED_ENTROPY_MASK	_AC(0xFFFF, UL)
> +
>  #ifdef CONFIG_RISCV_M_MODE
>  # define CSR_STATUS	CSR_MSTATUS
>  # define CSR_IE		CSR_MIE
> -- 
> 2.41.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
