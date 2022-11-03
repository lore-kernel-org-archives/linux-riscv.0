Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC85C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 15:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjfPU35ZSofiT9eTKVwUl5rXYoI+jhUCO8RGktwX7hQ=; b=RO4mTp1NJhMYpL
	uvcqT7ERuJRfm8B1j594ls+B6GRVmDT+glEEnvzLKz6u+lpgc08e9oOotIItxnVkxlc9PH8UGWOoJ
	6C5Neord2u2GE5yv1Kv2tpfKaLyRGus+lzeHZM8JFgvOFq9CoN71nofmhLnwK5lBL8JHvjwE1kW7n
	jrvM5Y25WJ0fz0XE7CZEFCYclzEab1/huY7tEypuWzTGmq37HDRFdsXGHP00jk7k4EmOmUp9HUuqH
	e2ew/sF3x65j3NcSj4q4WyiMHT+P8QfoNmH6BXyecMegjtcjaykpddY1uZ/8M9XsUQUIfAUgHZ9Og
	gVuCou2BwP7T+/8T7ixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqbjc-000CKA-Ms; Thu, 03 Nov 2022 15:02:25 +0000
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqbjZ-000CHq-Lw
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 15:02:23 +0000
Received: from zn.tnic (p200300ea9733e7e7329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9733:e7e7:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E2C1D1EC0528;
	Thu,  3 Nov 2022 16:02:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1667487736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=5zOKDwJu4FB0xil2b5a/FPJvsZt45ByyRxSMQsaaDR8=;
	b=QSTgD6Ncd3yLcOSJYmXGo3EY1DApfHw02ztOKs7k0PAMuO15QSqsfMgfLs99GK7c8D6O5M
	EIOEJproe4r8R5EXjhGGomlU7hRESTU4jQUJYXGQ2n64qCj7A3JMaFvsauSzmA31U5bm9T
	1HVpbEVPWdzipSAdtoW/ML7JHqLy6kc=
Date: Thu, 3 Nov 2022 16:02:12 +0100
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
Message-ID: <Y2PX9GfxWYh6+XGT@zn.tnic>
References: <20221028074828.b66uuqqfbrnjdtab@kamzik>
 <Y1vrMMtRwb0Lekl0@yury-laptop>
 <Y1vvMlwf/4EA/8WW@zn.tnic>
 <CAAH8bW_DkvPCH0-q2Bfe0OJ72r63mRM3GP7NKOFrhe3zMO2gbQ@mail.gmail.com>
 <Y1v+Ed6mRN9gisJS@zn.tnic>
 <20221031080604.6xei6c4e3ckhsvmy@kamzik>
 <Y1+OUawGJDjh4DOJ@zn.tnic>
 <20221031100327.r7tswmpszvs5ot5n@kamzik>
 <Y2K6clNJBn0SbWU+@zn.tnic>
 <20221103125945.lrr5oxxmylwpam53@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221103125945.lrr5oxxmylwpam53@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_080221_893441_50DC673D 
X-CRM114-Status: GOOD (  14.21  )
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

On Thu, Nov 03, 2022 at 01:59:45PM +0100, Andrew Jones wrote:
> The patch I'm proposing ensures cpumask_next()'s range, which is actually
> [-1, nr_cpus_ids - 1),

Lemme make sure I understand it correctly: on the upper boundary, if you
supply for n the value nr_cpu_ids - 2, then it will return potentially
the last bit if the mask is set, i.e., the one at position (nr_cpu_ids - 1).

If you supply nr_cpus_ids - 1, then it'll return nr_cpu_ids to signal no
further bits set.

Yes, no?

> I'll send a v4 with another stab at the commit message.

Yes, and it is still an unreadable mess: "A kernel compiled with commit
... but not its revert... " Nope.

First make sure cpumask_next()'s valid accepted range has been settled
upon, has been explicitly documented in a comment above it and then I'll
take a patch that fixes whatever is there to fix.

Callers should not have to filter values before passing them in - the
function either returns an error or returns the next bit in the mask.

This thing:

	if (*pos == nr_cpu_ids)

but then to pass in pos - 1:

	*pos = cpumask_next(*pos - 1

looks to me like the interface needs more cooking.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
