Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69053606A330
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 11:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xtHOQv0I;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lv0uE8rD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TJzzriB5MD7A9TvXcY0MlK+rb15j79VL6m3eAZHAG3M=; b=xtHOQv0IhvLBpeCu37e25lmQiN
	Kux31V3EPPZV19cUPB+ZPVFiGDY56puAHOkOUUDEJ7ibo0Bk2KeMSdAJ0Tk1oihfZ3v01lJ0R9ajn
	blcfsVouADOKF30rwqFegrvTcx98gX9ucTKOaZm6KBFlpOKeYWItihJ8m9D3UDHKoV2iD/gVpTiEv
	2Qa2lkQJxDNV9HFOzZMmgxGgxZnKp0oj9L126RKMgHDZia7bJ75MqihCTntwNBDx0Klebtpn8e++X
	Cqj3vtoSTZcAdDTACODIanZ4RPQbxRecy9p/KhyXeK3Hrpm3Qq4FlgtpsZVIa+iR3ulkzGBS2Sxrm
	eN6GCdaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRT16-00000009jFR-3iFK;
	Thu, 12 Nov 2026 11:30:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRT10-00000009jC3-1MG2
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 11:30:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B6BEA40AE9;
	Thu, 12 Nov 2026 11:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758841F00A09;
	Thu, 12 Nov 2026 11:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794483049;
	bh=4VQE+wCw+63cnThzXfE5m3Wkr677M0OSU+v7x8jQn64=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=Lv0uE8rD32wyRfV5sPXfxmly+/H4WSct6DgNgB+borGLOHQHrPLIX+nDFWq8WIR5a
	 6AtC7CnbNeLwvde/cSjhKEvSpenf4t0Wu4NTtXot75V8BVGl2rFunUOcGyNsN4UI68
	 wNERe8a2KaEWMchf+DBb8Bs1DvhulbUFaoAuvnrKGZEac6tb6LCixMCO2ciI45WqCn
	 5rzApcOojjQxqR7Be5XjATEt71gD58xH7QXIWmI8trxikOKPyX7zLM0t/f/t7TwpTp
	 molNGWnrHSHxcdMFd0azahw83gPRaA1oGx6MU/a7XQjmmEtHkAo1P+T8dMYcy21pbm
	 BNy/IJvPTGAsw==
Content-Type: multipart/mixed; boundary="===============8011434571142281874=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <9c88485e232da5a503d56c83b14b7765e672fd0c4ccc92686c342cec03c8e350@mail.kernel.org>
In-Reply-To: <20261112104149.38589-10-cuiyunhui@bytedance.com>
References: <20261112104149.38589-10-cuiyunhui@bytedance.com>
Subject: Re: [PATCH v10 9/9] riscv: select HAVE_CMPXCHG_LOCAL
From: bot+bpf-ci@kernel.org
To: cuiyunhui@bytedance.com,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,dennis@kernel.org,tj@kernel.org,cl@gentwo.org,oleg@redhat.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,ihor.solodrai@linux.dev,bjorn@kernel.org,pulehui@huawei.com,puranjay@kernel.org,broonie@kernel.org,cuiyunhui@bytedance.com,dave@stgolabs.net,david.laight.linux@gmail.com,jszhang@kernel.org,tglx@kernel.org,conor.dooley@microchip.com,thuth@redhat.com,ajones@ventanamicro.com,ben.dooks@codethink.co.uk,rkrcmar@ventanamicro.com,samuel.holland@sifive.com,zong.li@sifive.com,debug@rivosinc.com,seanwascoding@gmail.com,andybnac@gmail.com,menglong8.dong@gmail.com,cyrilbur@tenstorrent.com,wangruikang@iscas.ac.cn,atishp@rivosinc.com,apatel@ventanamicro.com,arnd@arndb.de,nathan@kernel.org,nick.desaulniers+lkml@gmail.com,morbo@google.com,justinstitt@google.c
 om,qingfang.deng@siflower.com.cn,linux-riscv@lists.infradead.org,linux-kernel@vger.kernel.org,linux-mm@kvack.org,bpf@vger.kernel.org,linux-arch@vger.kernel.org,llvm@lists.linux.dev
Cc: ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Thu, 12 Nov 2026 11:30:44 +0000 (UTC)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8011434571142281874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> riscv: select HAVE_CMPXCHG_LOCAL

TL;DR: Nit only, no runtime problem: selecting HAVE_CMPXCHG_LOCAL on riscv may
need the cmpxchg-local arch-support.txt feature table updated from TODO to ok
in the same patch.

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -155,6 +155,7 @@ config RISCV
>  	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
>  	select HAVE_ASM_MODVERSIONS
>  	select HAVE_BUILDTIME_MCOUNT_SORT
> +	select HAVE_CMPXCHG_LOCAL
>  	select HAVE_CONTEXT_TRACKING_USER

This isn't a runtime problem, but should the feature table be updated in
this patch as well?

Documentation/features/locking/cmpxchg-local/arch-support.txt is keyed on
this Kconfig symbol and still lists riscv as TODO:

    |       riscv: | TODO |

Nothing later in the series changes it.  Other riscv patches that select a
feature symbol update the matching arch-support.txt in the same commit, for
example d1f014012571 ("riscv: enable HAVE_IOREMAP_PROT").  LoongArch
selected the same symbol without updating the table, and it needed a
follow-up in 0c4c9abbf68b ("Documentation/features: Mark cmpxchg-local as
supported on loongarch").  Would changing the riscv row to "ok" here keep
the table accurate?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/43205409812
--===============8011434571142281874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8011434571142281874==--

