Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074D8C54E94
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 11:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I7EFpfgrLsu8GiatoIJOj7aNU9P6j799ohGdJX/Zpy8=; b=DGEeijRHmvCiCx
	UlytbB09IOf4ox0+POtR1+SaYdk2CW49UU2mJ5aq6f4Ig34nV1G5PPLzzACiKX2jDGh1saOJPyKo8
	iETaOWRVMQqglv2unOUZSOsTIPeO0Nl7wVRoVbbwyWDb9Jiq7VpKep8oi1digKpUsmh7aMUBXeS39
	EsVi3Q5+Z2F/v3At32WLHPDef5ALY/yPNnRGHNztekCZTKQt2GwkhCPSsoINkj92R6Rpesz0rGJTY
	MaqdxNnJ6ZDQ+Cs4NO1cKKsR8hkzvmvFiOR5F+yGjTisonacrj+PJ6bw501tHPWpZb1okyEq8E8Uf
	HbZjTCtyxESOekwR53Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL0Id-00Ahtq-5a; Thu, 26 Jan 2023 11:20:11 +0000
Received: from smtpout140.security-mail.net ([85.31.212.143] helo=fx403.security-mail.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL0IY-00Ahqb-2b
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 11:20:09 +0000
Received: from localhost (localhost [127.0.0.1])
	by fx403.security-mail.net (Postfix) with ESMTP id 74C625A293C
	for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 12:20:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
	s=sec-sig-email; t=1674732001;
	bh=OqCvIwTp55CF55aZkBqjkzrzT0JUeA+LZlEPOgMrjUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ItVfUK/SWpZBayLQn9djlHKarvWPtxRbO0LpCIVMyK7PXCdF2oBhm/4CN0E36dJqn
	 Dw+eu+lUqiTEdEMd0mCELfXG+QU46EsibHLGn5jb0aFfz9e/4ex6kocJBkTBGikY9u
	 CgNNWf0E4QSvqVW5rfvJqqQdL5LgNy6EYYM7SrO4=
Received: from fx403 (localhost [127.0.0.1]) by fx403.security-mail.net
 (Postfix) with ESMTP id 3C4475A2BAB; Thu, 26 Jan 2023 12:20:01 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx403.security-mail.net (Postfix) with ESMTPS id BDAA15A2E81; Thu, 26 Jan
 2023 12:19:59 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 536A727E0492; Thu, 26 Jan 2023
 12:19:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 0D8A427E0493; Thu, 26 Jan 2023 12:19:59 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 maeNwHrd1O4C; Thu, 26 Jan 2023 12:19:58 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 54C0E27E0491; Thu, 26 Jan 2023
 12:19:58 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <156e9.63d261df.bb9ea.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 0D8A427E0493
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1674731999;
 bh=WZmMAU5oDXdE8nH21Z9/oEYDB4aJcVI+BZJZRijscoE=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=j1vE3RefRWU+Edbs1N0iE0tzWyYjxl/gZtHYHoLg28itdNE33MgiN2bfdUzmsCNIf
 fGvnQLCt1UYpe9OwO6IsOgMVMGeyfjhuKTk/jBo/Rj9J9XlDnsZIL2Y/krX965mtdP
 7zbosDMpwSortwRdjow6i9u+UCMvgvCsEuTSJU/k=
Date: Thu, 26 Jan 2023 12:19:57 +0100
From: Jules Maselbas <jmaselbas@kalray.eu>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Yann Sionneau <ysionneau@kalray.eu>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Will Deacon
 <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng
 <boqun.feng@gmail.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook
 <keescook@chromium.org>, Oleg Nesterov <oleg@redhat.com>, Ingo Molnar
 <mingo@redhat.com>, Waiman Long <longman@redhat.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Nick Piggin <npiggin@gmail.com>, Paul Moore <paul@paul-moore.com>, Eric
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
 A. Donenfeld" <Jason@zx2c4.com>, Qi Liu <liuqi115@huawei.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark
 Brown <broonie@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Alexey
 Dobriyan <adobriyan@gmail.com>, Benjamin Mugnier
 <mugnier.benjamin@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mm@kvack.org, linux-arch@vger.kernel.org, linux-audit@redhat.com,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [RFC PATCH v2 11/31] kvx: Add atomic/locking headers
Message-ID: <20230126111957.GG5952@tellis.lin.mbt.kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-12-ysionneau@kalray.eu> <Y8qw2MaCJZzu3Ows@FVFF77S0Q05N>
 <20230126095720.GF5952@tellis.lin.mbt.kalray.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230126095720.GF5952@tellis.lin.mbt.kalray.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ALTERMIMEV2_out: done
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_032006_408147_A16B1766 
X-CRM114-Status: GOOD (  13.52  )
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

On Thu, Jan 26, 2023 at 10:57:20AM +0100, Jules Maselbas wrote:
> Hi Mark,
...

> > > +static inline int arch_atomic_add_return(int i, atomic_t *v)
> > > +{
> > > +	int new, old, ret;
> > > +
> > > +	do {
> > > +		old = v->counter;
> > 
> > Likewise, arch_atomic64_read(v) here.
> ack, this will bt arch_atomic_read(v) here since this is not atomic64_t
> here.
I took a second look at this and I think we are not doing the right
thing, we do not need to defined arch_atomic_add_return at all since
we are including the generic atomic right after, which will define
the macro arch_atomic_add_return as generic_atomic_add_return

> 
> Thanks
> -- Jules
> 
> 
> 
> 
> 
> 
> 
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
