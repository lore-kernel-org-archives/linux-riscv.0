Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BC9C87FCF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 09:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVNVVhCmtWeTR3G6TV3Ur24+o7nTCckBy4rLmyMlU3c=; b=hKbvK/ccJrYqjn
	uEOiuq1yDOHiLGpixlszxqPDC5oa940oISaSavfitundsvl0g2ZSnwBdMIpp5hlxoRGMkwY8PUX1J
	Cr8+04J2qrBq5v9EpTnqVUA3dZ7c8kfTW+i3jxse50XTp/u1ElVgIGgZYKoz4nHNgEKxbpQoREbyq
	Srx3EdRO1L8bRrWgw5ed6lDU53YZU0fjT6+3DUsmETXof8/kDWBof3QwZA8yEhLMwRZDn9viNDxK4
	ppHQ+t9MLg6n4ORgNAaX4vB8GJTfXw8xkkg/zR1rKALObiB4X0fQN76luursk/BiQCdTnQxOVQAK6
	RyuNA+RgGwfxw35td5JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujwUP-0000000035V-0ZRD;
	Thu, 07 Aug 2025 09:00:45 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujwUM-0000000035B-3h5a
	for linux-riscv@lists.infradead.org;
	Thu, 07 Aug 2025 09:00:44 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754557239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RGH2JlI9GUgPTp37nJfUpjH4xNokVpg8I/NQB5i9CII=;
	b=RiyMlFnPsFVsfFfA1eKzqWYLJdNr6cPH7PG5SNXUTszb/9OD34U9Q78pKDYBjTLGM1zUM+
	IfTd2lXYlDNi4xafOd9E/S1EnbbaaefDpl2P18C/JtrcOQngp2fObL+LAlsFce0RsQduV9
	zeueDV4RGpoP/MzxALULeIh4XTROpY+MFNKk0JhIUbVb8gv+R0QPjrsIli5EmrjJkC+djH
	Qy2kuV90CncwQeohaJj1PFercUpWw4A/2MQeyy6rlE62ZICwq4wTf/BJY5bcO0AP72/fh7
	3X7zCGOYChwvBiiIX0Ca0tITfwMXC2A5nC5mxui50kycGPukxnT9iEr4ZFRn5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754557239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RGH2JlI9GUgPTp37nJfUpjH4xNokVpg8I/NQB5i9CII=;
	b=juKWrbgYIADz6QF0yqfi5JwtYjQPcAIg/fwsZeHkU/c5pPp3NGSjUb8fu82yE7wmBdSxs1
	MOBBpDjqtfVEwmAA==
To: kernel test robot <lkp@intel.com>, x86-ml <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [tip:irq/urgent] BUILD REGRESSION
 9f7488f24c7571d349d938061e0ede7a39b65d6b
In-Reply-To: <202508071514.CFNi6mo5-lkp@intel.com>
References: <202508071514.CFNi6mo5-lkp@intel.com>
Date: Thu, 07 Aug 2025 11:00:38 +0200
Message-ID: <87h5yjcxqh.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_020043_059272_DA8A0435 
X-CRM114-Status: UNSURE (   6.63  )
X-CRM114-Notice: Please train this message.
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

On Thu, Aug 07 2025 at 15:10, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/urgent
> branch HEAD: 9f7488f24c7571d349d938061e0ede7a39b65d6b  irqchip/mvebu-gicp: Use resource_size() for ioremap()
>
> Error/Warning (recently discovered and may have been fixed):
>
>     https://lore.kernel.org/oe-kbuild-all/202508070607.QKVa8DiU-lkp@intel.com
>
>     ERROR: modpost: __ex_table+0x1584 references non-executable section '.rodata.__func__.103779'
>
> Error/Warning ids grouped by kconfigs:
>
> recent_errors
> `-- riscv-randconfig-002-20250807
>     `-- ERROR:__ex_table-references-non-executable-section-.rodata.__func__.

This has nothing to do with the above commit. That's just a new one
of the same type as the ones which existed before:

WARNING: modpost: vmlinux: section mismatch in reference: xp_fill_cb+0x46 (section: .text.xp_fill_cb) -> .L62 (section: .init.text)
...
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e4 (section: __ex_table) -> .LASF400 (section: .debug_str)

There are gazillions of them and that's a purely riscv specific related
problem.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
