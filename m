Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D3D606A896
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 11:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oYCyetgn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dHY9/lJM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0hrlob84biiO93cXG6S8fcRq7u4oElnk/QXAOL5cYb0=; b=oYCyetgnunkhkFEgoSU8PNzfj5
	zpxvAC+fzO8BTlHYOC776mI9E+W8z3zPoblJPmwRt/aEOkDfPRuH2H17o8Oq5MfQSY9gF1qGML7wu
	sTyquDOEp29Em9uZbw37NysmD/owldYTOh5OhWHmzsmcmlxQ+HlxuxzIU79oe4o+16TiDgYgIgZbX
	7MVD0BES1HsQFOdG+tXUDpFvHzfF4SP5lMb6TaLKHpJ0ip6U7/WGclQdbJy/1nXFnBuepxXB5EoFe
	DcW+2n6wII/Ces7x8Am4hqsh1vCo4dTjJzoFo3EuUb1wbTu3jEzTxnV+KIypmjugmHk9DOiHQMWKi
	myLOHmKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRT0x-00000009jBH-2p6g;
	Thu, 12 Nov 2026 11:30:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRT0u-00000009jAg-11sR
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 11:30:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B582E4180A;
	Thu, 12 Nov 2026 11:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797931F00A0B;
	Thu, 12 Nov 2026 11:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794483042;
	bh=TH0+wCv5ifM8REH9nQg/3agFqlZ5DUFIscm/3LxWRo0=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=dHY9/lJMFRTkdoK0UtBygoZvi0viJvrQDXFX2s5FvKi786pb0Fxhon1g90q0LAJNn
	 PENqDFIZIbjRAr6env65rzcSprlxQbjXkDe0p4+7/+w1cPdM9UvcoaclCxkmEnvx/L
	 oE9DKvkZ2ClL78AeiJ7MU1YcU2e6+Dliu2fKS7trzQcaY8LOeI391uTkm+viM/MxVy
	 WDMDLV/0R+iz9jXmxmDqgcXL1XCSVSjY8aMO+Og+0+8IwKBzCv70WgbblclOZGVhak
	 6d/l5yZ3gEYyAKuzNgCi7t9AcEuUPoxh/sg66l5EHUZ40X4td6nIxtPKl+gGBVsMFH
	 3yeE/40xoNEGw==
Content-Type: multipart/mixed; boundary="===============1184916852212940912=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <a0cf14f466cffe1ae1e1138e7ea4466152c96c1b89ba8268a5923a0d13534f28@mail.kernel.org>
In-Reply-To: <20261112104149.38589-6-cuiyunhui@bytedance.com>
References: <20261112104149.38589-6-cuiyunhui@bytedance.com>
Subject: Re: [PATCH v10 5/9] riscv: implement preemptible this_cpu add_return operations
From: bot+bpf-ci@kernel.org
To: cuiyunhui@bytedance.com,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,dennis@kernel.org,tj@kernel.org,cl@gentwo.org,oleg@redhat.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,ihor.solodrai@linux.dev,bjorn@kernel.org,pulehui@huawei.com,puranjay@kernel.org,broonie@kernel.org,cuiyunhui@bytedance.com,dave@stgolabs.net,david.laight.linux@gmail.com,jszhang@kernel.org,tglx@kernel.org,conor.dooley@microchip.com,thuth@redhat.com,ajones@ventanamicro.com,ben.dooks@codethink.co.uk,rkrcmar@ventanamicro.com,samuel.holland@sifive.com,zong.li@sifive.com,debug@rivosinc.com,seanwascoding@gmail.com,andybnac@gmail.com,menglong8.dong@gmail.com,cyrilbur@tenstorrent.com,wangruikang@iscas.ac.cn,atishp@rivosinc.com,apatel@ventanamicro.com,arnd@arndb.de,nathan@kernel.org,nick.desaulniers+lkml@gmail.com,morbo@google.com,justinstitt@google.c
 om,qingfang.deng@siflower.com.cn,linux-riscv@lists.infradead.org,linux-kernel@vger.kernel.org,linux-mm@kvack.org,bpf@vger.kernel.org,linux-arch@vger.kernel.org,llvm@lists.linux.dev
Cc: ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Thu, 12 Nov 2026 11:30:37 +0000 (UTC)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1184916852212940912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> riscv: implement preemptible this_cpu add_return operations

TL;DR: Nit only: the riscv this_cpu add_return helpers duplicate the 32/64 and
8/16 code and the field mask; could they use the existing macro-generated
pattern like neighbouring ops? Not a bug.

> diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
> --- a/arch/riscv/include/asm/percpu.h
> +++ b/arch/riscv/include/asm/percpu.h

[ ... ]

> +static __always_inline u32
> +__percpu_add_return_amo_case_32(void __percpu *pcp, unsigned long val)
> +{
[ ... ]
> +	return ret + (u32)val;
> +}
> +
> +#ifdef CONFIG_64BIT
> +static __always_inline u64
> +__percpu_add_return_amo_case_64(void __percpu *pcp, unsigned long val)
> +{
[ ... ]
> +static __always_inline unsigned long
> +__percpu_add_return_8_16(void __percpu *pcp, unsigned long val,
> +			 unsigned int bits)
> +{
> +	__PCPU_OP_CONTEXT();
> +	const u32 field_mask = GENMASK(bits - 1, 0);

This isn't a bug, but the add_return helpers repeat code that the rest of
this header generates with macros.

__percpu_add_return_amo_case_32() and __percpu_add_return_amo_case_64() are
identical apart from the width and the .w/.d suffix.  Inside
__percpu_add_return_8_16(), the amoadd.b and amoadd.h asm blocks are
identical apart from the suffix and the (u8)/(u16) casts.  The field mask is
rebuilt with GENMASK(bits - 1, 0) even though PERCPU_8_16_GET_MASK(sz)
already exists.

The neighbouring __PERCPU_AMO_OP_CASE and __PERCPU_8_16_OP_CASE helpers take
the width and suffix as macro parameters.

Could the add_return variants be generated the same way (taking sz/sfx, and
using PERCPU_8_16_GET_MASK), so the 32/64 and 8/16 copies don't need to be
kept in sync by hand?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/43205409812
--===============1184916852212940912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1184916852212940912==--

