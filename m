Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C01C27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 21:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJBuGL3sZ6y6G6lGrXtY+5M0KhHow0nWUsTq3BJInDg=; b=j6FpZ4VhF+TT1C
	D6EQrfr2X+rpOFuGuedHQeAmh7iMuz/77o4FTG1LZV/hJLEARsN9pMsUI+OmM/kZ+XaveP9/UPA0t
	xF/4sGODJi0fVbKx2b64AO2oUAc0OvE1wnfqDa2LR9euEiCGCJPJxYoRaWzawMVfiM1CKL71EfYi8
	p9fqpKrbjWwRUOAlzbsQP80ko3bjmdKHThjNn74ibzAanJx1W4am9c4C52lFJU9Axs0U6h4ndFPFl
	n2i/6JQywPBCU/cxsf8jUoMYTLiwf3gqkkKvWEA4QDeXJcofeIOHKK7+k4rQoybZtpG2ODfRIGmDG
	QyKaE3dHNtypCX2V9TcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKnjy-008vLM-R9; Wed, 25 Jan 2023 21:55:34 +0000
Received: from smtpout140.security-mail.net ([85.31.212.145] helo=fx405.security-mail.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKnjv-008vJP-MT
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 21:55:33 +0000
Received: from localhost (fx405.security-mail.net [127.0.0.1])
	by fx405.security-mail.net (Postfix) with ESMTP id A8DF0335E7E
	for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 22:55:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
	s=sec-sig-email; t=1674683723;
	bh=WtoB9JtlKwd4Y8mogATd1m73eAkNffWMtzkgdcOdrFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R24zqPFVwlJyEATOT1tu/iX7ietNJvIVvv7K7gqBOtn9jLrOTH8pteeRCZC1lCRAg
	 3NNKmyaLawif3kimkn+2sMZ/YTLBkjZ7pNtvQcfEvkvqACBNFbEtQopp5pmYYJNpJ1
	 RKgkwdhP+5VL9HTiu8SKp6QGRQzKa6sZnvRN5JgM=
Received: from fx405 (fx405.security-mail.net [127.0.0.1]) by
 fx405.security-mail.net (Postfix) with ESMTP id 6BA6E335D00; Wed, 25 Jan
 2023 22:55:22 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx405.security-mail.net (Postfix) with ESMTPS id 4E24D335C78; Wed, 25 Jan
 2023 22:55:21 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 0BE4B27E0491; Wed, 25 Jan 2023
 22:55:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id CBFDF27E0492; Wed, 25 Jan 2023 22:55:20 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 S_SO1U8LWSyE; Wed, 25 Jan 2023 22:55:20 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 4AA5127E0461; Wed, 25 Jan 2023
 22:55:20 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <50de.63d1a549.4c368.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu CBFDF27E0492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1674683720;
 bh=OP2H0clmfjMlntXGEQUOupSQETmz7iibW86xdOXdO/c=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=FiSVH+wqDIs88qUIullcsu5BFjd2D7z2E5u8DrTYSpKgGNXgRV/wZx6pLf0jEnjj1
 nq174SqV22wtEYt+DC4eOS10NI0yUL2JmwTj2bfQCvZEO4mxAawGM/7zjbG/MQC8HR
 kpFf4zpnPjbRuo+I0TP0j3cj6aN2Vd984BCzoL6c=
Date: Wed, 25 Jan 2023 22:55:19 +0100
From: Jules Maselbas <jmaselbas@kalray.eu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Yann Sionneau <ysionneau@kalray.eu>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Will Deacon
 <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng
 <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Eric Biederman
 <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, Oleg Nesterov
 <oleg@redhat.com>, Ingo Molnar <mingo@redhat.com>, Waiman Long
 <longman@redhat.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>, Christian
 Brauner <brauner@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guillaume Thouvenin <gthouvenin@kalray.eu>, Clement Leger
 <clement@clement-leger.fr>, Vincent Chardon
 <vincent.chardon@elsys-design.com>, Marc =?utf-8?b?UG91bGhpw6hz?=
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
 Bibo Mao <maobibo@loongson.cn>, Atish Patra <atishp@atishpatra.org>, Qi Liu
 <liuqi115@huawei.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, Janosch
 Frank <frankja@linux.ibm.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Benjamin Mugnier <mugnier.benjamin@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mm@kvack.org, linux-arch@vger.kernel.org, linux-audit@redhat.com,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [RFC PATCH v2 12/31] kvx: Add other common headers
Message-ID: <20230125215519.GE5952@tellis.lin.mbt.kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-13-ysionneau@kalray.eu> <Y8qlOpYgDefMPqWH@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8qlOpYgDefMPqWH@zx2c4.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ALTERMIMEV2_out: done
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_135531_898769_F6C70F2F 
X-CRM114-Status: GOOD (  23.50  )
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

Hi Jason,

On Fri, Jan 20, 2023 at 03:29:14PM +0100, Jason A. Donenfeld wrote:
> Hi Yann,
> 
> On Fri, Jan 20, 2023 at 03:09:43PM +0100, Yann Sionneau wrote:
> > +#include <linux/random.h>
> > +#include <linux/version.h>
> > +
> > +extern unsigned long __stack_chk_guard;
> > +
> > +/*
> > + * Initialize the stackprotector canary value.
> > + *
> > + * NOTE: this must only be called from functions that never return,
> > + * and it must always be inlined.
> > + */
> > +static __always_inline void boot_init_stack_canary(void)
> > +{
> > +	unsigned long canary;
> > +
> > +	/* Try to get a semi random initial value. */
> > +	get_random_bytes(&canary, sizeof(canary));
> > +	canary ^= LINUX_VERSION_CODE;
> > +	canary &= CANARY_MASK;
> > +
> > +	current->stack_canary = canary;
> > +	__stack_chk_guard = current->stack_canary;
> > +}
> 
> 
> You should rewrite this as:
> 
>     current->stack_canary = get_random_canary();
>     __stack_chk_guard = current->stack_canary;
> 
> which is what the other archs all now do. (They didn't used to, and this
> looks like it's simply based on older code.)
Thanks for the suggestion, this will be into v3

> > +#define get_cycles get_cycles
> > +
> > +#include <asm/sfr.h>
> > +#include <asm-generic/timex.h>
> > +
> > +static inline cycles_t get_cycles(void)
> > +{
> > +	return kvx_sfr_get(PM0);
> > +}
> 
> Glad to see this CPU has a cycle counter. Out of curiosity, what is
> its resolution?
This cpu has 4 performance monitor (PM), the first one is reserved to
count cycles, and it is cycle accurate.

> Also, related, does this CPU happen to have a "RDRAND"-like instruction?
I didn't knew about the RDRAND insruction, but no this CPU do not have
an instruction like that.

> (I don't know anything about kvx or even what it is.)
It's a VLIW core, a bit like Itanium, there are currently not publicly
available documentation.  We have started a discussion internally at
Kalray to share more information regarding this CPU and its ABI.

A very crude instruction listing can be found in our fork of
gdb-binutils: https://raw.githubusercontent.com/kalray/binutils/binutils-2_35_2/coolidge/opcodes/kv3-opc.c

Best regards,
-- Jules






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
