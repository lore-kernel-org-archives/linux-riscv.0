Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CEAFA3742
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 16:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nahMVEdAwgCKSENtIqdAi7KL9Bi/zrBZHyJrEo5/Vyc=; b=fkz4j9d0I0gD7i
	mRtszSDFzne4s2Ixgui7gApo+a2g9QDCqyOM3SotAlBocqJRS21+qNiGGG9e8Prcmvku03GR8wDo/
	Bq7xKTWcDJ8UYr7u7QJKLAe30UB1ltjgJ/dUmlGZIZXF0o8kSl5CTude/2pD2dYhlMOQUQagkvnfa
	5tDgnXgMBxhlzAVF+TVZ80BDjx+AKWKxzbzRISyasUX9Hm8anWrh84AshXjh8mE9/8nryzo8uTnbu
	V+B4y84goZwM8BsMmETt9791LMcN+A/phZaHIZiywWkKR38TYyVRtrU2vSTIvpsnqBwmN2q5xC9yH
	JzMNhfXbzpa+/t1K/nQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRsm-000mSu-5B; Fri, 28 Oct 2022 16:06:56 +0000
Received: from mail.skyhub.de ([5.9.137.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRsi-000mOS-80
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 16:06:53 +0000
Received: from zn.tnic (p200300ea9733e7ce329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9733:e7ce:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4623B1EC0518;
	Fri, 28 Oct 2022 18:06:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1666973207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=TaSyEs2uDEeNFySFbsAWLGbxmyPJdlW/cEgdh6Dc9LA=;
	b=XHRJ4OhKGvnSUY3FZm5qFAiodKxGqGTCRY5VncUDeCygsxhy9Q4bM8IEzLrXXfF9nBehiX
	F7RLgBP2A6Oi14yCT72nCZ/izgf6RazLC87U75EJpOOQeUI+HZNL9wnR/pPQJCb7fDjnM3
	tBLFlldzMQiEmDed7zRxx/CCa6R7SoA=
Date: Fri, 28 Oct 2022 18:06:41 +0200
From: Borislav Petkov <bp@alien8.de>
To: Yury Norov <yury.norov@gmail.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, x86@kernel.org,
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
Message-ID: <Y1v+Ed6mRN9gisJS@zn.tnic>
References: <20221014155845.1986223-1-ajones@ventanamicro.com>
 <20221014155845.1986223-3-ajones@ventanamicro.com>
 <20221028074828.b66uuqqfbrnjdtab@kamzik>
 <Y1vrMMtRwb0Lekl0@yury-laptop>
 <Y1vvMlwf/4EA/8WW@zn.tnic>
 <CAAH8bW_DkvPCH0-q2Bfe0OJ72r63mRM3GP7NKOFrhe3zMO2gbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAH8bW_DkvPCH0-q2Bfe0OJ72r63mRM3GP7NKOFrhe3zMO2gbQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_090652_508761_72CC8B6D 
X-CRM114-Status: UNSURE (   9.56  )
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

On Fri, Oct 28, 2022 at 10:13:28AM -0500, Yury Norov wrote:
> Because it's related to bitmap API usage and has been revealed after
> some work in bitmaps.

So first of all, that "fix" needs to explain what exactly it is fixing.
Not "it fixes this and that warning" but why the input arg to
cpumask_next() cannot be nr_cpu_ids because... yadda yadda...

> And because nobody else cares.

Why do you assume that?

> If you're willing to move it yourself please go ahead.

If it fixes a real issue, we are taking it. And pls note that x86
patches go through the tip tree.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
