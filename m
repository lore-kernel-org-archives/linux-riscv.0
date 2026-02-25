Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084F1FD3777
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 17:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKW2crJdxk8duMBSs7vyZ+3/cpTZkvm1+5WI5kegLjw=; b=WIkY0hcsAdEiep
	TCMxVw6g9hJrdzzTw8wyvOJCw24xmeUo77SVm8rM7wIliKYVUPZ4LrGmLtIxcE9IgvEqFr6P6PeyG
	/1KsBvwQgDHOeVNslpUoejEChzxIzpl0+tgbat+AwBTPUhv5kgmJvEeScCjM3QW69ObeUB7W5K+DW
	mJVt9xsx9mZf1+mccEQNzHklsG3enNtDZXdCv9VwGJ3NMK6qmFKO1QwbagfnjD2Lbc1Db3rxKD7yj
	+6zJkfyHr90hajE/Oc27NZLoYySexFed9dA6phjc85y6W3Wjx7ijzlLfFaH+Lyu2GbcoxVZxeqRn3
	saP4OD7po5pJBKDrxcWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIdC-00000004eIP-1tbC;
	Wed, 25 Feb 2026 17:25:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvId9-00000004eGh-3lJu
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 17:25:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E1CFE41730;
	Wed, 25 Feb 2026 17:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A62C116D0;
	Wed, 25 Feb 2026 17:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772040298;
	bh=0e9SqD/+hsqTFerGrgoY6o2/NOjfpeueLYEdBPSeVd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z8KCP8v6TEvoD4b7UR2NbIKZtY7/aATfjB9fLWp+hTa1yD1GCa2wR3uamUDLFnp6b
	 kDTbNJOo2MW6F07WGx0jIn7SHchNDIjhST9sAxGkzBiGjVWJo4bQuOLOc5ki4ESp1w
	 dRncP9MtgjNt6sPdMI+AHo+oIOjnXl8zfQvDq/5RNDYWLO6LoXsh+8raIQpcU0CA3m
	 rfJGb3Km64g/F/ZKDrScLwC12P77UCAHYXF5lfA//yAfl55IRy+89t3X5oo7pEI41k
	 T36F4bX28KIRRg3bl0BB7doDbrT1RUuDjGp57P0cRI8LzLGnlagLKLipxstIEk5Z7i
	 XoehDrvcOfyog==
Date: Wed, 25 Feb 2026 09:24:58 -0800
From: Kees Cook <kees@kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Jingwei Wang <wangjingwei@iscas.ac.cn>,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] vdso/datapage: Define vdso data pointers as arrays
Message-ID: <202602250924.B0A6F658ED@keescook>
References: <20260225024716.work.043-kees@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260225024716.work.043-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_092459_973983_D69BEBDB 
X-CRM114-Status: UNSURE (   8.93  )
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

On Tue, Feb 24, 2026 at 06:47:20PM -0800, Kees Cook wrote:
> The vdso_u_time_data, vdso_u_rng_data, and vdso_u_arch_data arrays
> are seen by GCC as single instances (due to their declarations in
> include/vdso/datapage.h). When the vdso data pointers are dereferenced
> with an offset, GCC thinks there is an access beyond the returned single
> instance. These are actually arrays constructed at link time, so declare
> them as such.

I found 2 more places I needed to make "&var" to "var" changes. I'll
send a v2...

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
