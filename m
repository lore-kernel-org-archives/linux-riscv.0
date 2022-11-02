Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97408C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 18:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0mSLIRJw9va6Anjr/LAY/0ZT5zzOmzAdFS8CToTfsQo=; b=aQOYjVlLMVLFzl
	KwOcnvcEi2rMmq5P5G5Lsy8VQret/7CEVeG6nhjVnYgKAwk9ktasJdQqb1RteHreJmOuhkr+oAoWA
	ERYgfpyTr4HfX/VviVsVSPrcKtmvGjyi62dMOwp35pH07z8qrTUXam9iJW/lHwiB9e9UYrwEiA0iC
	e24c3tPVrknh+98qRHmCESN6/VsWWY7sXv9ml60n8ssEj7xvDecdGa1XPwOE66VHg9YtUgFxiveQl
	G5nlBMDjEYdoIqmJ2dGty3QrWvDuAw8+A+i8WA5numr8gsv0vaLSsrEONp3jjr71jxt3Bc8AJDw2T
	TfMc1NC5pM3oU0cUtcMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqIii-00DDVP-6c; Wed, 02 Nov 2022 18:44:12 +0000
Received: from mail.skyhub.de ([5.9.137.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqIie-00DDSy-6s
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 18:44:10 +0000
Received: from zn.tnic (p200300ea9733e741329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9733:e741:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 72DBB1EC0430;
	Wed,  2 Nov 2022 19:44:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1667414646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=iOr/2V0DoRyu5jKtmDX0XiBrZE84Kn1Pob6d6OL2TAQ=;
	b=P8xIFXf059+smEe6r5YZYLEbBvKhvHMQlCDMpFuQpPIyUL+0Na11Qye0LmeFzVkyGcJ0Ue
	fIrCmtMkvbI9pekV7eZIq4LZ2B96yVhn3hhIe318CHOxpV0wNqptu2eHkXK4/tBD234sAI
	ZmyjnjRhdV4j8e7O51OrF3B1uOD5hfo=
Date: Wed, 2 Nov 2022 19:44:02 +0100
From: Borislav Petkov <bp@alien8.de>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Yury Norov <yury.norov@gmail.com>, x86@kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>, openrisc@lists.librecores.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	"open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 2/2] x86: Fix /proc/cpuinfo cpumask warning
Message-ID: <Y2K6clNJBn0SbWU+@zn.tnic>
References: <20221014155845.1986223-1-ajones@ventanamicro.com>
 <20221014155845.1986223-3-ajones@ventanamicro.com>
 <20221028074828.b66uuqqfbrnjdtab@kamzik>
 <Y1vrMMtRwb0Lekl0@yury-laptop>
 <Y1vvMlwf/4EA/8WW@zn.tnic>
 <CAAH8bW_DkvPCH0-q2Bfe0OJ72r63mRM3GP7NKOFrhe3zMO2gbQ@mail.gmail.com>
 <Y1v+Ed6mRN9gisJS@zn.tnic>
 <20221031080604.6xei6c4e3ckhsvmy@kamzik>
 <Y1+OUawGJDjh4DOJ@zn.tnic>
 <20221031100327.r7tswmpszvs5ot5n@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221031100327.r7tswmpszvs5ot5n@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_114408_448502_4C35D814 
X-CRM114-Status: GOOD (  16.14  )
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

On Mon, Oct 31, 2022 at 11:03:27AM +0100, Andrew Jones wrote:
> Currently (after the revert of 78e5a3399421)

After the revert?

That commit is still in the latest Linus tree.

> with DEBUG_PER_CPU_MAPS we'll get a warning splat when the cpu is
> outside the range [-1, nr_cpu_ids)

Yah, that range makes sense.

> and cpumask_next() will call find_next_bit() with the input plus one anyway.
> find_next_bit() doesn't explicity document what happens when an input is
> outside the range, but it currently returns the bitmap size without any
> side effects, which means cpumask_next() will return nr_cpu_ids.

That is good to have in the commit message.

> show_cpuinfo() doesn't try to show anything in that case and stops its
> loop, or, IOW, things work fine now with an input of nr_cpu_ids - 1. But,
> show_cpuinfo() is just getting away with a violated cpumask_next()
> contract, which 78e5a3399421 exposed. How about a new commit message like
> this

You're making it sound more complex than it is. All you wanna say is:

"Filter out invalid cpumask_next() inputs by checking its first argument
against nr_cpu_ids because cpumask_next() will call find_next_bit() with
the input plus one but the valid range for n is [-1, nr_cpu_ids)."

But that thing with the revert above needs to be clarified first.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
