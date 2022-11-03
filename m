Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7766C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 17:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWHYIuiYLfCIr2x/t+6DMSpkPiIX3Rk0o1ypJBQebJA=; b=aCeQDDXuLeptFv
	2wvRMtcm8TIJxhpSZJKKt8R8O/RZqjizcFJJ+2TQxofgQrjltVuUsAA/2Ni3/GcqmyKq7ZTFgCknl
	FfOy8GGvlebns5XxgK/HQCKPzTNbWAVZZGEevRLcvSuaHK3KdG3rPbIGc/WlGo9vpzwAQyhB0SnyO
	o15V5W+m+jzyg7buawLXII385ZgfIvLILnwmSq4QuxN+WlTG4LG7z56ZZxNH0Zstc0UR9c2C+yHFb
	3mtqWhahxn65xYMaRn+Ea/nuNRWqhjCMBXJNZuLF5qMlSK+aQLr0tO27ywsNTft5LC5V98wAXFET+
	9r7csOifUr/VKx8KQQ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqdjU-000xY4-NJ; Thu, 03 Nov 2022 17:10:24 +0000
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqdOx-000p90-Sb
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 16:49:13 +0000
Received: from zn.tnic (p200300ea9733e7e7329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9733:e7e7:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E3F291EC04F0;
	Thu,  3 Nov 2022 17:49:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1667494150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=2ASRoXT4dNz3rsz3g7wk4DQzgAno9/V5MAy7ltfZSS0=;
	b=GEBGVYysxzMU6LGJTmZd7M+/R/6mbCD6zp4ZSzgggbaUSAV0SVqDm2Gc6AAhFjue3w91tt
	IAhvE9D7fZ+NRgIf5TsYL8evNAQClXdM104Vgktn6WclPvN36r3al1OF9AVLqkFvz+Oj+i
	92QAmiYx47vWftNfKrMeen4/XGStEic=
Date: Thu, 3 Nov 2022 17:49:06 +0100
From: Borislav Petkov <bp@alien8.de>
To: yury.norov@gmail.com
Cc: x86@kernel.org, linux-riscv <linux-riscv@lists.infradead.org>,
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
Message-ID: <Y2PxAiJ1yNzcUSgs@zn.tnic>
References: <CAAH8bW_DkvPCH0-q2Bfe0OJ72r63mRM3GP7NKOFrhe3zMO2gbQ@mail.gmail.com>
 <Y1v+Ed6mRN9gisJS@zn.tnic>
 <20221031080604.6xei6c4e3ckhsvmy@kamzik>
 <Y1+OUawGJDjh4DOJ@zn.tnic>
 <20221031100327.r7tswmpszvs5ot5n@kamzik>
 <Y2K6clNJBn0SbWU+@zn.tnic>
 <20221103125945.lrr5oxxmylwpam53@kamzik>
 <Y2PX9GfxWYh6+XGT@zn.tnic>
 <20221103153404.uh77nrdkowrxj6cr@kamzik>
 <Y2PsvvOWVs9ZLBsp@yury-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2PsvvOWVs9ZLBsp@yury-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_094912_141441_E9474EC8 
X-CRM114-Status: GOOD (  14.75  )
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

On Thu, Nov 03, 2022 at 09:30:54AM -0700, yury.norov@gmail.com wrote:a
> Callers should pass sane arguments into internal functions if they
> expect sane output.

What internal function? It's in a global header.

> The API not exported to userspace shouldn't sanity-check all inputs
> arguments.

That doesn't have anything to do with userspace at all.

APIs exported to the rest of the kernel should very well check their
inputs. Otherwise they're not APIs - just some random functions which
are visible to the compiler.

> So, the portable code shouldn't expect from cpumasks more than
> documentation said: for a _valid_ offset cpumask_next() returns next
> set bit or >= nr_cpu_ids.

Lemme quote from my previous mail:

"First make sure cpumask_next()'s valid accepted range has been settled
upon, has been explicitly documented"

So where is that valid range documented?

> cpumask_check() has been broken for years. Attempting to fix it faced
> so much resistance, that I had to revert the patch.

The suggestion on that thread made sense: you first fix the callers and
then the interface. Just like any other "broken" kernel API.

Nothing's stopping you from fixing it properly - it'll just take a while
and if it is such a widely used interface, you probably should come up
with a strategy first how to fix it without impacting current use.

Interfaces and their in-kernel users get refactored constantly.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
