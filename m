Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB98C36001
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 03:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btSVyymfiWSwzEpVkviY6lD0IWdjjqFQhqqKBbS/XGs=; b=u2Cfz5BmFRfTV+
	lo8D4fCCLDo6j4ktDjRBJvAWsQ4PH0Y2AvEhITNgzO26cGYxXm/rmSygxXxNzIxhvAWek9nvaeAgY
	9wqlBhoHVwRgDZBFsI+8Zu6MS18y286RlZ5N31i0gtI5sYMo8Sk7tBzC1bg4opwSUqcWf+GNZPs6O
	raVqpwDi2+jr7A7GJl1UiYEfkYftADSE17r1ejRbwrSzUKfVVow7PllcyJnJ2ZIDk5wU5JKMrVPof
	ChEkeFKMnhAzQsgL6/Ush+iv312/uLCgDgVNVm51uA4yxdbuGYB6jLmF6gl6qisSa85BhVA3jovk7
	blVQg3k9En/j2EZTB50g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvTDu-0000000DlVy-1AHz;
	Fri, 21 Mar 2025 03:39:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvTCF-0000000DlL6-1rry
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 03:37:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CCBB8615CA;
	Fri, 21 Mar 2025 03:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C3EC4CEDD;
	Fri, 21 Mar 2025 03:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742528242;
	bh=aL28XEpJktFyzSrtGRAjtcrEGubi+gEbKi8XefWZizM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t6XuhqVyWbogmwwm749xUsJgPCnAqqSeCGZTosFqhBb1Xe/PFfgZLonAAxLGXYM2h
	 H5Rjl+jZ+/nUhpAcyb+NZ3oZa+MJTxsW9iUFlD1i+O9EsR5L+oU0GujSqvdi5uPkrH
	 NR5NNeo7jJmgJyvlx+SP0oVtTV3I4MXd52BPL0GeYVJC4yST0Ie41FpzM8R9TM50UP
	 6R0RliihTl36P+7U+ey9yJeNLMJSgXvTkqGnQFHTSzVzTxurGNRx2Vx1Ei5SBQ3zV6
	 HfkpAUO/Iox/kqVD+SqJQdCciahcO9jLLNHKy8PNLdy25hshCxVkg0yldLmNOb2Ub9
	 neF2SocRn9Dvw==
Date: Thu, 20 Mar 2025 20:37:18 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ignacio Encinas <ignacio@iencinas.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: introduce asm/swab.h
Message-ID: <20250321033718.GA98513@sol.localdomain>
References: <20250319-riscv-swab-v2-0-d53b6d6ab915@iencinas.com>
 <20250319-riscv-swab-v2-2-d53b6d6ab915@iencinas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250319-riscv-swab-v2-2-d53b6d6ab915@iencinas.com>
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

On Wed, Mar 19, 2025 at 10:09:46PM +0100, Ignacio Encinas wrote:
> +#define ARCH_SWAB(size) \
> +static __always_inline unsigned long __arch_swab##size(__u##size value) \
> +{									\
> +	unsigned long x = value;					\
> +									\
> +	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,			\
> +			     RISCV_ISA_EXT_ZBB, 1)			\
> +			     :::: legacy);				\

Is there a reason to use this instead of
riscv_has_extension_likely(RISCV_ISA_EXT_ZBB) which seems to do the same thing,
including using a static branch?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
