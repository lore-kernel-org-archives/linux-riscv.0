Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2F2C25B4E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 15:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXEWC+Io1LB4lNp1dpws0eQyVWK/m2HWyyIAuW6im1U=; b=ZM5v3b67vOMDDY
	E3Kbm3zzc/BZ1bsaGPquUYx6V0ki99ovKJPFO/WdtcrSO3eBEEK/dZFxXyUeAInCNh5ttplHSUnuU
	5CLLqzr5wYSQcyjNfwNITXhLIcdk6Sxd6Yw68A5jxeTLE9bR6EwWxOQ1xHIm3X5vIztzwmXvxGcdK
	SBj8+vHRcYFdR0FOeg9dT7gXM4+z4JB1/CHqH3T+xD3KsqVYuTl7wWaNYs50G557vFBc3UHHp985T
	jRLUgxB6LsJuvOEsPqNMZLx195msKmFuCdWUUL4TQPDOb6/0dLbj2YU0kCayVIxqYZrNE6XwBWIvy
	8jP7hGUPktpVwcwylsvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsvn-00AtCc-Mw; Fri, 20 Jan 2023 15:03:51 +0000
Received: from smtpout140.security-mail.net ([85.31.212.149] helo=fx409.security-mail.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsvj-00At86-Iu
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 15:03:49 +0000
Received: from localhost (fx409.security-mail.net [127.0.0.1])
	by fx409.security-mail.net (Postfix) with ESMTP id B6CB0349782
	for <linux-riscv@lists.infradead.org>; Fri, 20 Jan 2023 16:03:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
	s=sec-sig-email; t=1674227024;
	bh=UZzOxuculcf7mxi4XmJ6gsSDrAJaXvR6pX1yVHvffJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GtF2LfdtKWixqCR42+DZcgRXKaMfdfYAJ6UOHf7gnW4cnkBtZF/RCQrSs88cAc3cZ
	 aQGNExCgxadMuYTca/988LvOJCxZEnXh71xsVF1vaLRbphwEWNaWXYrdFXwtqL/j1n
	 Gm5szn26Y64+iaTtQ6vD2n1A+PcHK6IUURq28J/0=
Received: from fx409 (fx409.security-mail.net [127.0.0.1]) by
 fx409.security-mail.net (Postfix) with ESMTP id 1D77C349745; Fri, 20 Jan
 2023 16:03:44 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx409.security-mail.net (Postfix) with ESMTPS id B716634960A; Fri, 20 Jan
 2023 16:03:42 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 707CC27E0437; Fri, 20 Jan 2023
 16:03:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 45A9327E0439; Fri, 20 Jan 2023 16:03:42 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 xauCKxWPwxFn; Fri, 20 Jan 2023 16:03:42 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id D59A827E0430; Fri, 20 Jan 2023
 16:03:41 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <e882.63caad4e.b1c35.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 45A9327E0439
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1674227022;
 bh=C7HrnI5K8lMVKwfpvR2iIg1M1ljeou+P3mCJSMAG91Q=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=WDWoyVMbIMPbJepmJq7lETaMqJi8dXSis3WDlHnimStL/D6LcNyVKEyhwC0exaLEa
 /yI1hmzBWA0vpQxL61VK4pLGSFjwDaBXqRRCN+CNJkpmnVhmZT4IznmM53SL6OKcDp
 hoqf7NRBZhx1q/JOV6km7TyZQI9nicecKIciSZ5I=
Date: Fri, 20 Jan 2023 16:03:40 +0100
From: Jules Maselbas <jmaselbas@kalray.eu>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Yann Sionneau <ysionneau@kalray.eu>, Jonathan Corbet <corbet@lwn.net>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Mark
 Rutland <mark.rutland@arm.com>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Kees Cook <keescook@chromium.org>, Oleg Nesterov <oleg@redhat.com>, Ingo
 Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Aneesh Kumar
 <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Moore <paul@paul-moore.com>, Eric
 Paris <eparis@redhat.com>, Christian Brauner <brauner@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guillaume Thouvenin
 <gthouvenin@kalray.eu>, Clement Leger <clement@clement-leger.fr>, Vincent
 Chardon <vincent.chardon@elsys-design.com>, Marc =?utf-8?b?UG91bGhpw6hz?=
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
 Bibo Mao <maobibo@loongson.cn>, Atish Patra <atishp@atishpatra.org>, "Jason
 A . Donenfeld" <Jason@zx2c4.com>, Qi Liu <liuqi115@huawei.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark
 Brown <broonie@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Alexey
 Dobriyan <adobriyan@gmail.com>, Benjamin Mugnier
 <mugnier.benjamin@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mm@kvack.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-audit@redhat.com, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [RFC PATCH v2 09/31] kvx: Add build infrastructure
Message-ID: <20230120150340.GA5952@tellis.lin.mbt.kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-10-ysionneau@kalray.eu>
 <aa4d68b2-b5b5-4c17-a44f-7c6db443ea4c@app.fastmail.com>
 <20230120145316.GA4155@tellis.lin.mbt.kalray.eu>
 <9965e2d1-bae8-4ce7-911c-783c772e9ff1@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9965e2d1-bae8-4ce7-911c-783c772e9ff1@app.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ALTERMIMEV2_out: done
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_070348_149073_EE8F723E 
X-CRM114-Status: GOOD (  21.49  )
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

On Fri, Jan 20, 2023 at 04:01:11PM +0100, Arnd Bergmann wrote:
> On Fri, Jan 20, 2023, at 15:53, Jules Maselbas wrote:
> > On Fri, Jan 20, 2023 at 03:39:22PM +0100, Arnd Bergmann wrote:
> >> On Fri, Jan 20, 2023, at 15:09, Yann Sionneau wrote:
> >> >      - Fix clean target raising an error from gcc (LIBGCC)
> >> 
> >> I had not noticed this on v1 but:
> >> 
> >> > +# Link with libgcc to get __div* builtins.
> >> > +LIBGCC	:= $(shell $(CC) $(DEFAULT_OPTS) --print-libgcc-file-name)
> >> 
> >> It's better to copy the bits of libgcc that you actually need
> >> than to include the whole thing. The kernel is in a weird
> > It was initialy using KCONFIG_CFLAGS which do not contains valid options
> > when invoking the clean target.
> >
> > I am not exactly sure what's needed by gcc for --print-libgcc-file-name,
> > my guess is that only the -march option matters, I will double check
> > internally with compiler peoples.
> >
> >> state that is neither freestanding nor the normal libc based
> >> environment, so we generally want full control over what is
> >> used. This is particularly important for 32-bit architectures
> >> that do not want the 64-bit division, but there are probably
> >> enough other cases as well.
> 
> To clarify: I meant you should not include libgcc.a at all but
> add the minimum set of required files as arch/kvx/lib/*.S.
Thanks for clarifying :)


-- Jules





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
