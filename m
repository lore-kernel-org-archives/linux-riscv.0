Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5330C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 14:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDZkSNIyEO/RI/8xbBu4Bqa56diw3GUeBJ+i11efM50=; b=qLUu70L4TV2t3T
	awCpLIk3euoxlbH6erl+wmIJk2W93Ws5LSvIzm/sl2mxfmVl9N7bizE9tBkwCXxdqSy3BuKB8FsiM
	BfiyZMgAK5Nndk2nOVmFaATqitTLk5SQ1pQWGU2Od+0aKysPc8hvAmJNRhiwR0mlF6LmF29c12/ok
	LO/kwX8Kt2b6SAT9wKFckUI7N20QFheodPyfNjdQ0iYIn+x+ddALCfUE5gJvzsQ5EO88kG8jo1huS
	GM26JVBdZIgFFsJJs7KwRx3E5Mgyiu64TDb58qYIIN4zq6JR72J8zqcZ7+pXQ4s7bIIqTvmRfSV7O
	+yIKBohl6x998aIg1dWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIslj-00AqVc-JV; Fri, 20 Jan 2023 14:53:27 +0000
Received: from mxout.security-mail.net ([85.31.212.46] helo=fx303.security-mail.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIslf-00AqTm-P0
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 14:53:25 +0000
Received: from localhost (fx303.security-mail.net [127.0.0.1])
	by fx303.security-mail.net (Postfix) with ESMTP id 503B230F957
	for <linux-riscv@lists.infradead.org>; Fri, 20 Jan 2023 15:53:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
	s=sec-sig-email; t=1674226400;
	bh=jgb+m6qIX2pro82EX6+kbaqARSA1wPefVldKhg9mwIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VH6aD3TZhUe/LBsX91///VLOWzGxkxEDhlR6x6vY6U9mY0YSajPSTLVCgTEJ5dPG3
	 cB3/9ZnmgrFtNhXuju+pTrFwPWywzSl/2mAW7tvLpsncap8eJ5+NEsxMBgWmi6U0Dk
	 aUqc56g/c/TG0zy/mCIGXpqLi9T5jSgSXWFmpfxs=
Received: from fx303 (fx303.security-mail.net [127.0.0.1]) by
 fx303.security-mail.net (Postfix) with ESMTP id B5B5F30F7AE; Fri, 20 Jan
 2023 15:53:19 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx303.security-mail.net (Postfix) with ESMTPS id E20B330F752; Fri, 20 Jan
 2023 15:53:18 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 9BF9427E0437; Fri, 20 Jan 2023
 15:53:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 66A8927E0439; Fri, 20 Jan 2023 15:53:18 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 QJzgroMFk3YE; Fri, 20 Jan 2023 15:53:18 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 057AA27E0430; Fri, 20 Jan 2023
 15:53:18 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <5d9e.63caaade.e037f.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 66A8927E0439
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1674226398;
 bh=kRxe31MnQMmqE5+taZm1AGIuAYHRpwHRpAdaJ1cAplQ=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=YyIqYgrfkWr5S+e3StrmT2Bz+xzv6InOUUAiJ+Ee5064rTXfFh85K084P2UbBDG2W
 gNEkTRz6oiFgP3OpnVk4jtK62FvfzEmQb6Q28gWtIAvW/nr+1y+YLusNgJ1Wd/awAH
 V7jmxOb9IUySl+9rZXiVdENlDVm128usIIPZgMcc=
Date: Fri, 20 Jan 2023 15:53:16 +0100
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
Message-ID: <20230120145316.GA4155@tellis.lin.mbt.kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-10-ysionneau@kalray.eu>
 <aa4d68b2-b5b5-4c17-a44f-7c6db443ea4c@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa4d68b2-b5b5-4c17-a44f-7c6db443ea4c@app.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ALTERMIMEV2_out: done
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_065324_118697_66EE21CF 
X-CRM114-Status: GOOD (  16.67  )
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

On Fri, Jan 20, 2023 at 03:39:22PM +0100, Arnd Bergmann wrote:
> On Fri, Jan 20, 2023, at 15:09, Yann Sionneau wrote:
> >      - Fix clean target raising an error from gcc (LIBGCC)
> 
> I had not noticed this on v1 but:
> 
> > +# Link with libgcc to get __div* builtins.
> > +LIBGCC	:= $(shell $(CC) $(DEFAULT_OPTS) --print-libgcc-file-name)
> 
> It's better to copy the bits of libgcc that you actually need
> than to include the whole thing. The kernel is in a weird
It was initialy using KCONFIG_CFLAGS which do not contains valid options
when invoking the clean target.

I am not exactly sure what's needed by gcc for --print-libgcc-file-name,
my guess is that only the -march option matters, I will double check
internally with compiler peoples.

> state that is neither freestanding nor the normal libc based
> environment, so we generally want full control over what is
> used. This is particularly important for 32-bit architectures
> that do not want the 64-bit division, but there are probably
> enough other cases as well.
> 
>      Arnd
> 
> 
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
