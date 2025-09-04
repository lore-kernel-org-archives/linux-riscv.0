Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A47CA1002
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 04:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpEyMR7TRMyiXAw26ed8GJDes/KB4HQfSvbNz+T4MIk=; b=zc1whpNYV0qNj9
	SiTuyD22jwFOS6+v6W0pWdBdCo2z3aCPtRWK/vIcmuwlqMn0WLUvll4IykqmZyw9k+mqXfACbcoJA
	RmZonh1SbBhFLZ96cURvczNfll+qqgTFz5qa1uxV97QrpZCmo3GaMuQE+w7az1tox2lKNA+gWLbEI
	SmS/+ecTszWjoH4Id5zqgapkQVO0CDBj/x0VdWHwu7rTcHzcv3G6e21SgRYUbX3NsiqivlA8vDdoG
	npuhqTLMjZw9OX2B8804ayyjD/gmxyUKGASDyF2N+ZXhR3D2ouHn4XCvuamD6PrANj1yukgz1KNlf
	WrOo9ipVHMp7nY4P+WxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu1N9-00000008u71-0SCx;
	Thu, 04 Sep 2025 04:14:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu111-00000008n1c-2B4m
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 03:52:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DDF7543A97;
	Thu,  4 Sep 2025 03:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13EEC4CEF0;
	Thu,  4 Sep 2025 03:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756957922;
	bh=Mq4Kc9uMoIrJADgD3/HVomvbYH3TWWO8E7JKatF4Z2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VbckYjIHgshtdKT9gVoBz9foeJDHDPTsHZpx7aFB7pMnysbfkwoOky6VDUeT2IxIf
	 LcdKdW01cW+oSxbgcGuAnIwXWKyO+q/K3OQ8GPdHjH8sumGc9LYeDOVaHg5ON3NdDF
	 ihonL0iDBEdk5z1IU4hYm3QAfNmUJ/8QGK9BjftJx2aHM0D83ve/WdOhBGaKa0LAep
	 oq4Isj5gSgsWYL1iaPo0mNcBCJkVXWyJrGdaISZZEsnERJ5ZzJRE0M1ZJ7K0BrBYNg
	 gtBhD0M/bxLJsHpvnKE7yMdmufchRPu4X5jMjw++w94uMBHPjiX+d9juBNvrQWsq3a
	 jnkFGEBD3JHqg==
Date: Wed, 3 Sep 2025 20:52:02 -0700
From: Kees Cook <kees@kernel.org>
To: Svetlana Parfenova <svetlana.parfenova@syntacore.com>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.f, viro@zeniv.linux.org.uk, brauner@kernel.org,
	jack@suse.cz, akpm@linux-foundation.org, david@redhat.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com
Subject: Re: [RFC RESEND v3] binfmt_elf: preserve original ELF e_flags for
 core dumps
Message-ID: <202509032051.BF7FC654F@keescook>
References: <20250806161814.607668-1-svetlana.parfenova@syntacore.com>
 <20250901135350.619485-1-svetlana.parfenova@syntacore.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250901135350.619485-1-svetlana.parfenova@syntacore.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_205203_580297_2B4D134F 
X-CRM114-Status: UNSURE (   9.03  )
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

On Mon, Sep 01, 2025 at 08:53:50PM +0700, Svetlana Parfenova wrote:
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a4b233a0659e..1bef00208bdd 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -224,6 +224,7 @@ config RISCV
>  	select VDSO_GETRANDOM if HAVE_GENERIC_VDSO
>  	select USER_STACKTRACE_SUPPORT
>  	select ZONE_DMA32 if 64BIT
> +	select ARCH_HAS_ELF_CORE_EFLAGS
>  
>  config RUSTC_SUPPORTS_RISCV

I'll take this patch and alphabetize the above select into the right
place. Everything else looks great. Thank you!

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
