Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C08CEE339
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 17:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hL5hXy7gd4Ftwqmuyu2GHmlF8/ZQlx3ylyCPFGiKMQY=; b=LwiiGnFUlF0xh8
	dnrs8fp72VwIKdhKgcUqsScaKzN/9Q+fYF0xZZOFv+K/c6LhPgvMpNMiAIa08S3wtF+D/LYuA/1j1
	loH+T775aMv0NIHfsDatmuEXNSbk+ADKwZA3vT2qctC3pUB3IEumgJLCxR9eyoWaxsCK9Qea1IE14
	vsBvEXdJBhftjM+pX+0NN0Yt2e3RdbFrT4O0w2gquYl6XV7w9uZ6im4JD0Bxumq0pK6atf7ii8rtK
	jyzriQhIQYLmSYz6hXkzeyo4cuLsBhR4wnuYNUtJji1YiEUEXXSdG2UrAXNW5DAtbPitl6K6/RADp
	TMvPB3OAyX9dRxGQtGzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syasO-0000000AHS9-3WUp;
	Wed, 09 Oct 2024 17:53:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syahK-0000000ADia-0w23;
	Wed, 09 Oct 2024 17:42:09 +0000
Date: Wed, 9 Oct 2024 19:41:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728495721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F4NzPkzSamq4wPYIyI+V3fbrjzREE47+0T16MjDevhc=;
	b=idoToPjW9IIZDH/PieIO/xxWGI8o2a+8YKU9EqXIGvgD4bK9DJWpyIR91/icnaVlAVJ/cs
	hvy9Xf2eOZaFWG1V33MriNkIp6WfyRe4n2LD2agxMzks3JRrc135cJxP8HYXvndmwodjDL
	pQ8madiYCpyO19nV3/IFPWvojj8fRnzCWr9DAN6/1r5YoqDdSa7aumXTco8TBmNuqv5nDR
	agxiBOhRXz2P+XKKOsnhcbph9u7DNiO0gCcoiL4OSPPdrqZUoo0vwTx1p9lmjbkkfNlW1y
	ZidEgGlHPeLFPK5RfT+OlSeINWEaGpb5oH6xnetNXtYkyv0XgYlnoQ9ek08bEQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728495721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F4NzPkzSamq4wPYIyI+V3fbrjzREE47+0T16MjDevhc=;
	b=LwR2683q1ylEqzRdIPdSCiWK0i6OwtiwyUSJV+XPu9jSgQYG19E8HY0FpS4GTHltIOHTFP
	A3UfX/d5ECyPvfDg==
From: Nam Cao <namcao@linutronix.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: bigeasy@linutronix.de, tglx@linutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org, hpa@zytor.com,
	aou@eecs.berkeley.edu, bp@alien8.de,
	Catalin Marinas <catalin.marinas@arm.com>, williams@redhat.com,
	dave.hansen@linux.intel.com, mingo@redhat.com,
	john.ogness@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>,
	pmladek@suse.com, senozhatsky@chromium.org, rostedt@goodmis.org,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH 3/3] riscv: Allow to enable PREEMPT_RT.
Message-ID: <20241009174153.Hk5MGakp@linutronix.de>
References: <mhng-64eec780-df98-4e8d-bf6c-0aa07a8d85da@palmer-ri-x1c9>
 <mhng-f0f516a0-6774-4c87-b8da-313601bad133@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-f0f516a0-6774-4c87-b8da-313601bad133@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_104206_665113_F813BB84 
X-CRM114-Status: GOOD (  23.37  )
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

On Wed, Oct 09, 2024 at 09:44:59AM -0700, Palmer Dabbelt wrote:
> On Fri, 06 Sep 2024 11:48:03 PDT (-0700), Palmer Dabbelt wrote:
> > On Fri, 06 Sep 2024 08:13:24 PDT (-0700), namcao@linutronix.de wrote:
> > > On Fri, Sep 06, 2024 at 12:59:06PM +0200, Sebastian Andrzej Siewior wrote:
> > > > It is really time.
> > > > 
> > > > riscv has all the required architecture related changes, that have been
> > > > identified over time, in order to enable PREEMPT_RT. With the recent
> > > > printk changes, the last known road block has been addressed.
> > > > 
> > > > Allow to enable PREEMPT_RT on riscv.
> > > > 
> > > > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > > 
> > > With the printk patches applied:
> > > 
> > > Tested-by: Nam Cao <namcao@linutronix.de> # Visionfive 2
> > 
> > 
> > Thanks.  LMK if you guys want me to take this through the RISC-V tree,
> > but no big deal if you want it somewhere else -- and if there's some
> > dependencies already going in through some sort of RT tree maybe that's
> > just easier.  So
> > 
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > 
> > I don't have a test setup yet, but I figure it's a new feature so I'll
> > just flip it on as a config post-rc1.  Presumably this just works in the
> > QEMU virt board, or is there some wizardry I'll need to copy?
> 
> and it breaks my boot test script.  Looks like it's actually working mostly
> fine, I'm just not getting the "reboot: System halted" message that I'm
> checking for to make sure the system actually went down cleanly.
> 
> I'm not sure if this is expected behavior in RT land, or if we've got some
> sort of bug.  It sort of smells like we're losing the last printk() line...

I also had some occasional problem with rebooting my Visionfive 2 board,
which was fixed with:
https://lore.kernel.org/lkml/20241003084152.2422969-1-namcao@linutronix.de/

Any chance this fixes your issue as well?

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
