Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06908C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 22:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NsBUtXnQUhJqQHQhEJpcaKtCzlObtlAJFVuub+FdlNg=; b=Vt49KJIoY40ZM+
	Ltqw9EQP7qvHk0g5VtFH+VtTV4afM87VxR9uxRqwBmt50FBDzM2XCZ45BLcfOTosuUbRKrslrnaSR
	kg+FiH1FVZFUzl+DwkiccxoqUd3hRM8amXNovkccU8F0HwwIzVG0uD+jf4jetI44vIGrdptlPjizN
	sdtc57qmutSDFIPrkFLT3kGWLE/UJnkeLqSav18kxHBzA1fNZardYn/50QJxz/ltN8qqspdkYqAw2
	YrsnSLN5n8jEgWzutCcgEB5zlSJtdMMLqYY/yiPj/Y15HekQMO9EBrXXV+QaLEIXjqByTJKpCzLc/
	S1N0NBelyXBjZCdh9OKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rosVt-000000029GI-0oYU;
	Mon, 25 Mar 2024 22:09:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rosVo-000000029Bb-0rIX
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 22:09:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B86A161211;
	Mon, 25 Mar 2024 22:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E98FC433C7;
	Mon, 25 Mar 2024 22:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711404586;
	bh=MHgrmDbY6yGfAgeqDr3txltVR53Kng8qLPXpLxZiglw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=NSnWZsxWV5zih75kzQMss0dcrkir5jVOC2GifM2BBPN77g5hkoNR3oxgkh/zNR3j6
	 S2Bq5lxz+2EPod17risV9ZyCEhMThjo9Lf1Xx/wzwwzgX3sxKDx0GrYnFB06OD76Xx
	 0IZO8QQPVYf1VgGcq9PrcoDQ9b4vcF7kMdMIkzHiikVNpbaNYZ0YBwYno3KdjNth5R
	 TD/rmv+qrAzCcx+Xxhb+zxSyXDPaLVHDD/3Vr5jteguD4BNhJ0qhvagGmCpj4EPwZ8
	 L7ptgGeLIynCCC9OhLlGawsSKuX/+wbiaNAq2lBg7WzJLyLwPYt2GQJ578dFIZ9wV0
	 9XlVUjpnhJEYw==
Mime-Version: 1.0
Date: Tue, 26 Mar 2024 00:09:42 +0200
Message-Id: <D036AJAEAOUF.34494O217N0RI@kernel.org>
Subject: Re: [PATCH v5 1/2] kprobes: textmem API
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, <linux-riscv@lists.infradead.org>
Cc: "Masami Hiramatsu" <mhiramat@kernel.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, <linux-modules@vger.kernel.org>, "Naveen
 N . Rao" <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>
X-Mailer: aerc 0.17.0
References: <20240325215502.660-1-jarkko@kernel.org>
In-Reply-To: <20240325215502.660-1-jarkko@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_150948_589380_DFB67241 
X-CRM114-Status: UNSURE (   5.96  )
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

On Mon Mar 25, 2024 at 11:55 PM EET, Jarkko Sakkinen wrote:
> +#ifdef CONFIG_MODULES
>  	if (register_module_notifier(&trace_kprobe_module_nb))
>  		return -EINVAL;
> +#endif /* CONFIG_MODULES */

register_module_notifier() does have "dummy" version but what
would I pass to it. It makes more mess than it cleans to declare
also a "dummy" version of trace_kprobe_module_nb.

The callback itself has too tight module subsystem bindings so
that they could be simply flagged with IS_DEFINED() (or correct
if I'm mistaken, this the conclusion I've ended up with).

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
