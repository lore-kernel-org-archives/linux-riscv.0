Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D542C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 23:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z6/AMnksCcEzQKwqEQOZnef75PelaX2K6aUt8NRI4m0=; b=BQ6+1DmZLd0obC
	duDCyJEIj9V0OB/IX6K2n3v/LsUkrLW/UvsUZ4WOVfyWE/kAto4sgsksd9eRJpuU4aEnHfwtcUEIb
	VQmlOWlXoTaIbJ/XQHZaMVNl0Cbc0DI4yxq1Wl/UqptHTEgP63F/i9JRVXuAnB6WJNg/r+t7crb2r
	ZldpOwn3jsZcq/ElcGNBooI7OpcqkAUruEwVZr1iOnrX2svZh2NqK2CHUAmFUmkIqxaAn9gGA8yG/
	Mzi1c2XFRGZHZ2ZzydB+ciBYa+kyIa8cfNY1h4dbjZ6fMwjao1Gf35AZQy/yAqD9rR2s+YELKrPZT
	c9G+F7H0nqx/TxV7xe7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqjXw-001xRI-Ec; Thu, 03 Nov 2022 23:22:52 +0000
Received: from mail.skyhub.de ([5.9.137.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqjXs-001xQS-S4
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 23:22:51 +0000
Received: from zn.tnic (p200300ea9733e72b329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9733:e72b:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2C7531EC04E2;
	Fri,  4 Nov 2022 00:22:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1667517763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=vFXHtgwdW+sR6NHK/2Q+5sMTWyhXvQL1n6tMJLF2xxY=;
	b=BSXGpnI0im++wmsWNxkeuxKjQQej60wIR/Sk0cX2RZ7YrtQNhQA0/JrxGI20wDUweZrCEb
	k+o4bwMt5u5otuBKP/2kTjRja1l1PH+j5LW/iISR7O4Sn/JezDmf47qxabojUHY5r8I2aI
	FToXcyX9TTPeCYGemSLF53/TOlVnQ5I=
Date: Fri, 4 Nov 2022 00:22:39 +0100
From: Borislav Petkov <bp@alien8.de>
To: Yury Norov <yury.norov@gmail.com>
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
Message-ID: <Y2RNP/5Xfs0qS/3X@zn.tnic>
References: <20221031080604.6xei6c4e3ckhsvmy@kamzik>
 <Y1+OUawGJDjh4DOJ@zn.tnic>
 <20221031100327.r7tswmpszvs5ot5n@kamzik>
 <Y2K6clNJBn0SbWU+@zn.tnic>
 <20221103125945.lrr5oxxmylwpam53@kamzik>
 <Y2PX9GfxWYh6+XGT@zn.tnic>
 <20221103153404.uh77nrdkowrxj6cr@kamzik>
 <Y2PsvvOWVs9ZLBsp@yury-laptop>
 <Y2PxAiJ1yNzcUSgs@zn.tnic>
 <Y2P68sfCJMvhKmhj@yury-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2P68sfCJMvhKmhj@yury-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_162249_077575_A58CCB22 
X-CRM114-Status: GOOD (  10.33  )
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

On Thu, Nov 03, 2022 at 10:31:30AM -0700, Yury Norov wrote:
> Let's take for example cpu_llc_shared_mask() added by you in
> arch/x86/include/asm/smp.h recently:
> 
>   static inline struct cpumask *cpu_llc_shared_mask(int cpu)
>   {
>          return per_cpu(cpu_llc_shared_map, cpu);
>   }
> 
> It's in a global header and available to the rest of the kernel, just as
> well.

Just like 

static inline struct cpumask *cpu_l2c_shared_mask(int cpu)
{
        return per_cpu(cpu_l2c_shared_map, cpu);
}

should check != must check. 

But it's perfectly fine if you're going to attempt to prove some bogus
argument of yours - I can safely ignore you.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
