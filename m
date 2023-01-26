Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D52C54E94
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 11:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+ktaW+Io8n/El/NcZwGG4RNCZoi91g5Myzb+DdZOd8=; b=vWZ1++Fxt7vhFc
	X/q8569dZNFH+sk/zzHsdqqvjXyOOas+AosrLsh6C7QKythQOqa3wOVPdby01qnLeGXQhldkYUsAz
	3hBRri/w4MSg9ScgBTPytdcPFA8Vp+yjpcHY84pye/3UfgXlsPd1TJPt6MGKpWuxbIZyLaujroZJc
	BK0D5/sDUwf43xiRmWBn7OlFKDX7uYqi87bmrv5KfFqsScNoYHHoG6LOO3c+iXaAKPwF42GaQm0Wc
	1vuh6gui+bVVcGy5KGY1Vz8v/omUZgct0GstZtxQgwMyjg7frsOoHiCwIgCpZu4rs15eutr10FTZe
	ERU4xjNp0bW3GociyRTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL0EW-00Agl9-4T; Thu, 26 Jan 2023 11:15:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL0ER-00AgiX-QO
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 11:15:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32F024B3;
	Thu, 26 Jan 2023 03:16:31 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.10.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 402733F71E;
	Thu, 26 Jan 2023 03:15:40 -0800 (PST)
Date: Thu, 26 Jan 2023 11:15:37 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jules Maselbas <jmaselbas@kalray.eu>
Cc: Yann Sionneau <ysionneau@kalray.eu>, Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, Oleg Nesterov <oleg@redhat.com>,
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>, Paul Moore <paul@paul-moore.com>,
	Eric Paris <eparis@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guillaume Thouvenin <gthouvenin@kalray.eu>,
	Clement Leger <clement@clement-leger.fr>,
	Vincent Chardon <vincent.chardon@elsys-design.com>,
	Marc =?utf-8?B?UG91bGhpw6hz?= <dkm@kataplop.net>,
	Julian Vetter <jvetter@kalray.eu>, Samuel Jones <sjones@kalray.eu>,
	Ashley Lesdalons <alesdalons@kalray.eu>,
	Thomas Costis <tcostis@kalray.eu>,
	Marius Gligor <mgligor@kalray.eu>,
	Jonathan Borne <jborne@kalray.eu>,
	Julien Villette <jvillette@kalray.eu>,
	Luc Michel <lmichel@kalray.eu>, Louis Morhet <lmorhet@kalray.eu>,
	Julien Hascoet <jhascoet@kalray.eu>,
	Jean-Christophe Pince <jcpince@gmail.com>,
	Guillaume Missonnier <gmissonnier@kalray.eu>,
	Alex Michon <amichon@kalray.eu>,
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <git@xen0n.name>,
	Shaokun Zhang <zhangshaokun@hisilicon.com>,
	John Garry <john.garry@huawei.com>,
	Guangbin Huang <huangguangbin2@huawei.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Bibo Mao <maobibo@loongson.cn>, Atish Patra <atishp@atishpatra.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Qi Liu <liuqi115@huawei.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Janosch Frank <frankja@linux.ibm.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Benjamin Mugnier <mugnier.benjamin@gmail.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-audit@redhat.com,
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [RFC PATCH v2 11/31] kvx: Add atomic/locking headers
Message-ID: <Y9Jg2QkbLUoYhimB@FVFF77S0Q05N>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-12-ysionneau@kalray.eu>
 <Y8qw2MaCJZzu3Ows@FVFF77S0Q05N>
 <20230126095720.GF5952@tellis.lin.mbt.kalray.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230126095720.GF5952@tellis.lin.mbt.kalray.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_031552_006388_DC6B0F52 
X-CRM114-Status: GOOD (  22.66  )
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

Hi Jules,

On Thu, Jan 26, 2023 at 10:57:20AM +0100, Jules Maselbas wrote:
> Hi Mark,
> 
> On Fri, Jan 20, 2023 at 03:18:48PM +0000, Mark Rutland wrote:
> > On Fri, Jan 20, 2023 at 03:09:42PM +0100, Yann Sionneau wrote:
> > > +#define ATOMIC64_RETURN_OP(op, c_op)					\
> > > +static inline long arch_atomic64_##op##_return(long i, atomic64_t *v)	\
> > > +{									\
> > > +	long new, old, ret;						\
> > > +									\
> > > +	do {								\
> > > +		old = v->counter;					\
> > 
> > This should be arch_atomic64_read(v), in order to avoid the potential for the
> > compiler to replay the access and introduce ABA races and other such problems.
> Thanks for the suggestion, this will be into v3.
> 
> > For details, see:
> > 
> >   https://lore.kernel.org/lkml/Y70SWXHDmOc3RhMd@osiris/
> >   https://lore.kernel.org/lkml/Y71LoCIl+IFdy9D8@FVFF77S0Q05N/
> > 
> > I see that the generic 32-bit atomic code suffers from that issue, and we
> > should fix it.
> I took a look at the generic 32-bit atomic, but I am unsure if this
> needs to be done for both the SMP and non-SMP implementations. But I
> can send a first patch and we can discuss from there.

Sounds good to me; thanks!

[...]

> > > +static inline int arch_atomic_add_return(int i, atomic_t *v)
> > > +{
> > > +	int new, old, ret;
> > > +
> > > +	do {
> > > +		old = v->counter;
> > 
> > Likewise, arch_atomic64_read(v) here.
> ack, this will bt arch_atomic_read(v) here since this is not atomic64_t
> here.

Ah, yes, my bad!

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
