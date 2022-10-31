Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB982C38A02
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 08:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FD5WM1f9Einrh9axL8b3677F5c/daLCwNPIyOzyg0E=; b=IoMY9SUJXp2DCo
	eJtrARjPuq1H67EcVd5MAJb4THxDXOmN7+1s1xeZLEiy+WceYMuwtNiP7NQ1ktNLVEmV4Fj6rJuMR
	EdmDQqZeMqiDjLzBpgpWu4fgh7PSGtkoZgjCcq8hzj+Jr7SFieSwL1EoK/L5K44wsz8dmL5gR7gV2
	cn3TQ3pONycxtG0uRbQ6OwRMbCPB7cSV21zp79UWNUsjW7qEz2lIF8vgbXjV1vCmvkUqy0r0SA/yG
	We6faxQEXy4TJp5MttMEmTorEUd/XPhMbC89JML6Kx9wSwvvnHGRg+1ut+750eCoz8EpdWPw1xltO
	ktNnnlIdAiQbSJdyZ+Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opQdd-009miA-7K; Mon, 31 Oct 2022 08:59:21 +0000
Received: from mail.skyhub.de ([5.9.137.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opQdY-009mdh-J5
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 08:59:19 +0000
Received: from zn.tnic (p200300ea9733e7cf329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9733:e7cf:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B91D91EC0531;
	Mon, 31 Oct 2022 09:59:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1667206746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=ev78IiojEqGZ8VOXUxmz9XVfROk+6cN5zzZ8OowFM8w=;
	b=eI/C2tSlcg0AxMZOuPZM7vJKKoRmjE6inbkFlcyC7xyapkJ4fbL6uqhy9LxHWWR24ASGVE
	A/YY8Nzaqhc5keG/EfmGhgdQunAK7K3mp31A11nA8qzGhVzkP/b4DF6aS9rc2MXsmebhdy
	KGNWf+tkEEOxBllDztC3oUYW5H3eT+s=
Date: Mon, 31 Oct 2022 09:58:57 +0100
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
Message-ID: <Y1+OUawGJDjh4DOJ@zn.tnic>
References: <20221014155845.1986223-1-ajones@ventanamicro.com>
 <20221014155845.1986223-3-ajones@ventanamicro.com>
 <20221028074828.b66uuqqfbrnjdtab@kamzik>
 <Y1vrMMtRwb0Lekl0@yury-laptop>
 <Y1vvMlwf/4EA/8WW@zn.tnic>
 <CAAH8bW_DkvPCH0-q2Bfe0OJ72r63mRM3GP7NKOFrhe3zMO2gbQ@mail.gmail.com>
 <Y1v+Ed6mRN9gisJS@zn.tnic>
 <20221031080604.6xei6c4e3ckhsvmy@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221031080604.6xei6c4e3ckhsvmy@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_015916_792983_78A4C541 
X-CRM114-Status: UNSURE (   8.81  )
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

On Mon, Oct 31, 2022 at 09:06:04AM +0100, Andrew Jones wrote:
>  The valid cpumask range is [0, nr_cpu_ids) and cpumask_next() always
>  returns a CPU ID greater than its input, which results in its input
>  range being [-1, nr_cpu_ids - 1). Ensure showing CPU info avoids
>  triggering error conditions in cpumask_next() by stopping its loop

What error conditions?

What would happen if @n is outside of the valid range?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
