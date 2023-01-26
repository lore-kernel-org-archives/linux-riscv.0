Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C7BC61DA0
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 09:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEZ+HDO7AKR+LXdGmaPqyFU7QN4xlsn1trKawuE2Bls=; b=1dc4ucONeO6x4N
	O4Me1443KlZWnc2llYgIXZdZKsdtNsK0P/JJ6Nolqmro6GZ4riQ2MiBLsAQv3UkVOfP0lEPFvzzn/
	jHmB0NUqBbvczBQ/QnwWS4cWRDYIWJvlMCiCdb6pn73GNRntYaRiTkodELQeE1rn8SCrNRCxORZN0
	pkpaXXzQdmZyPFLiQsRUxGZPo/Pxs0Y1r0qkg6wz1XK8+Ssi1Bjmo92G5YHUEI5tn8wN9TS/0UITK
	RvwifqFjWrePmuG+FnnXbWiSHOD20vNqQuye2a8TBqObqGinQ4ZNHQvoIDjnBLzeFJoj3nD743yrJ
	/Zg8JsDAXkvA0eR2qarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKz0d-00ALMk-62; Thu, 26 Jan 2023 09:57:31 +0000
Received: from mxout.security-mail.net ([85.31.212.46] helo=fx303.security-mail.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKz0Z-00ALLb-HT
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 09:57:29 +0000
Received: from localhost (fx303.security-mail.net [127.0.0.1])
	by fx303.security-mail.net (Postfix) with ESMTP id 5173130FAEE
	for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 10:57:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
	s=sec-sig-email; t=1674727044;
	bh=uO7MCO8H75KotDHIyR6heNsXJ56/BH7BOfcV5EHmMEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=4YNoRhcr0vybNM+PSAQBurpnOdCztzxH+iMpLbZRkwaOFBCUhxO6eaicTA9Tgpxiw
	 yyi5tk9BOYgQgv5G1xx/sGwlEQlAzTDotmiQCdl4pirN7a56hiuQg+ut19xnPRBIUL
	 m9dEzRbdZRU2U54/uh0pmQDG+FGknzhTneAV6w/E=
Received: from fx303 (fx303.security-mail.net [127.0.0.1]) by
 fx303.security-mail.net (Postfix) with ESMTP id C371730EF1E; Thu, 26 Jan
 2023 10:57:23 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx303.security-mail.net (Postfix) with ESMTPS id 9311130F6B1; Thu, 26 Jan
 2023 10:57:22 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 4C3C027E0491; Thu, 26 Jan 2023
 10:57:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 11B4E27E0492; Thu, 26 Jan 2023 10:57:22 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 TSfNN6-img6f; Thu, 26 Jan 2023 10:57:21 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 9A5BE27E048E; Thu, 26 Jan 2023
 10:57:21 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <1f18.63d24e82.905d3.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 11B4E27E0492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1674727042;
 bh=y0pU6bUB9NtRwjLHJtgOZpwuFzZAZbLkd/6NSd04WhM=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=X7BuUXlibp43NQwoW2XoKczIL4vzGNFTCj5F8yW370vweqIXc9XTSGMKEFeNuiA5e
 bkUAd/wPpBSOBVN1KkeOkTfHQXjfCuCp1M/EQOs9zosEydOfE9WuKyG1Bj/44r3wGZ
 mysuu23qG+bNP9s2Himt9ysP+5Wj3jljQFPyrv34=
Date: Thu, 26 Jan 2023 10:57:20 +0100
From: Jules Maselbas <jmaselbas@kalray.eu>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Yann Sionneau <ysionneau@kalray.eu>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Will Deacon
 <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng
 <boqun.feng@gmail.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook
 <keescook@chromium.org>, Oleg Nesterov <oleg@redhat.com>, Ingo Molnar
 <mingo@redhat.com>, Waiman Long <longman@redhat.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Nick Piggin <npiggin@gmail.com>, Paul Moore <paul@paul-moore.com>, Eric
 Paris <eparis@redhat.com>, Christian Brauner <brauner@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guillaume Thouvenin
 <gthouvenin@kalray.eu>, Clement Leger <clement@clement-leger.fr>, Vincent
 Chardon <vincent.chardon@elsys-design.com>, Marc =?utf-8?b?UG91bGhpw6hz?=
 <dkm@kataplop.net>, Julian Vetter <jvetter@kalray.eu>, Samuel Jones
 <sjones@kalray.eu>, Ashley Lesdalons <alesdalons@kalray.eu>, Thomas Costis
 <tcostis@kalray.eu>, Marius Gligor <mgligor@kalray.eu>, Jonathan Borne
 <jborne@kalray.eu>, Julien Villette <jvillette@kalray.eu>, Luc Michel
 <lmichel@kalray.eu>, Louis Morhet <lmorhet@kalray.eu>, Julien Hascoet
 <jhascoet@kalray.eu>, Jean-Christophe Pince <jcpince@gmail.com>, Guillaume
 Missonnier <gmissonnier@kalray.eu>, Alex Michon <amichon@kalray.eu>, Huacai
 Chen <chenhuacai@kernel.org>, WANG Xuerui <git@xen0n.name>, Shaokun Zhang
 <zhangshaokun@hisilicon.com>, John Garry <john.garry@huawei.com>, Guangbin
 Huang <huangguangbin2@huawei.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Bibo Mao <maobibo@loongson.cn>, Atish Patra <atishp@atishpatra.org>, "Jason
 A. Donenfeld" <Jason@zx2c4.com>, Qi Liu <liuqi115@huawei.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark
 Brown <broonie@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Alexey
 Dobriyan <adobriyan@gmail.com>, Benjamin Mugnier
 <mugnier.benjamin@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mm@kvack.org, linux-arch@vger.kernel.org, linux-audit@redhat.com,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [RFC PATCH v2 11/31] kvx: Add atomic/locking headers
Message-ID: <20230126095720.GF5952@tellis.lin.mbt.kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-12-ysionneau@kalray.eu> <Y8qw2MaCJZzu3Ows@FVFF77S0Q05N>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8qw2MaCJZzu3Ows@FVFF77S0Q05N>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ALTERMIMEV2_out: done
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_015727_746319_0EA121E6 
X-CRM114-Status: GOOD (  24.69  )
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

Hi Mark,

On Fri, Jan 20, 2023 at 03:18:48PM +0000, Mark Rutland wrote:
> On Fri, Jan 20, 2023 at 03:09:42PM +0100, Yann Sionneau wrote:
> > Add common headers (atomic, bitops, barrier and locking) for basic
> > kvx support.
> > 
> > Co-developed-by: Clement Leger <clement@clement-leger.fr>
> > Signed-off-by: Clement Leger <clement@clement-leger.fr>
> > Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> > Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> > Co-developed-by: Julian Vetter <jvetter@kalray.eu>
> > Signed-off-by: Julian Vetter <jvetter@kalray.eu>
> > Co-developed-by: Julien Villette <jvillette@kalray.eu>
> > Signed-off-by: Julien Villette <jvillette@kalray.eu>
> > Co-developed-by: Yann Sionneau <ysionneau@kalray.eu>
> > Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> > ---
> > 
> > Notes:
> >     V1 -> V2:
> >      - use {READ,WRITE}_ONCE for arch_atomic64_{read,set}
> >      - use asm-generic/bitops/atomic.h instead of __test_and_*_bit
> >      - removed duplicated includes
> >      - rewrite xchg and cmpxchg in C using builtins for acswap insn
> 
> Thanks for those changes. I see one issue below (instantiated a few times), but
> other than that this looks good to me.
> 
> [...]
> 
> > +#define ATOMIC64_RETURN_OP(op, c_op)					\
> > +static inline long arch_atomic64_##op##_return(long i, atomic64_t *v)	\
> > +{									\
> > +	long new, old, ret;						\
> > +									\
> > +	do {								\
> > +		old = v->counter;					\
> 
> This should be arch_atomic64_read(v), in order to avoid the potential for the
> compiler to replay the access and introduce ABA races and other such problems.
Thanks for the suggestion, this will be into v3.

> For details, see:
> 
>   https://lore.kernel.org/lkml/Y70SWXHDmOc3RhMd@osiris/
>   https://lore.kernel.org/lkml/Y71LoCIl+IFdy9D8@FVFF77S0Q05N/
> 
> I see that the generic 32-bit atomic code suffers from that issue, and we
> should fix it.
I took a look at the generic 32-bit atomic, but I am unsure if this
needs to be done for both the SMP and non-SMP implementations. But I
can send a first patch and we can discuss from there.

> > +		new = old c_op i;					\
> > +		ret = arch_cmpxchg(&v->counter, old, new);		\
> > +	} while (ret != old);						\
> > +									\
> > +	return new;							\
> > +}
> > +
> > +#define ATOMIC64_OP(op, c_op)						\
> > +static inline void arch_atomic64_##op(long i, atomic64_t *v)		\
> > +{									\
> > +	long new, old, ret;						\
> > +									\
> > +	do {								\
> > +		old = v->counter;					\
> 
> Likewise, arch_atomic64_read(v) here.
ack

> > +		new = old c_op i;					\
> > +		ret = arch_cmpxchg(&v->counter, old, new);		\
> > +	} while (ret != old);						\
> > +}
> > +
> > +#define ATOMIC64_FETCH_OP(op, c_op)					\
> > +static inline long arch_atomic64_fetch_##op(long i, atomic64_t *v)	\
> > +{									\
> > +	long new, old, ret;						\
> > +									\
> > +	do {								\
> > +		old = v->counter;					\
> 
> Likewise, arch_atomic64_read(v) here.
ack

> > +		new = old c_op i;					\
> > +		ret = arch_cmpxchg(&v->counter, old, new);		\
> > +	} while (ret != old);						\
> > +									\
> > +	return old;							\
> > +}
> > +
> > +#define ATOMIC64_OPS(op, c_op)						\
> > +	ATOMIC64_OP(op, c_op)						\
> > +	ATOMIC64_RETURN_OP(op, c_op)					\
> > +	ATOMIC64_FETCH_OP(op, c_op)
> > +
> > +ATOMIC64_OPS(and, &)
> > +ATOMIC64_OPS(or, |)
> > +ATOMIC64_OPS(xor, ^)
> > +ATOMIC64_OPS(add, +)
> > +ATOMIC64_OPS(sub, -)
> > +
> > +#undef ATOMIC64_OPS
> > +#undef ATOMIC64_FETCH_OP
> > +#undef ATOMIC64_OP
> > +
> > +static inline int arch_atomic_add_return(int i, atomic_t *v)
> > +{
> > +	int new, old, ret;
> > +
> > +	do {
> > +		old = v->counter;
> 
> Likewise, arch_atomic64_read(v) here.
ack, this will bt arch_atomic_read(v) here since this is not atomic64_t
here.


Thanks
-- Jules






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
