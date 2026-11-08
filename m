Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70FF606A31C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 11:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h+3e9m73;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ItgUl6Pz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l5rVlz189yZey5mXymqAJimWoECKxPCs4XpZaI9XNe4=; b=h+3e9m73jfCLQeyEoPlb3vM+lO
	Tan3QdUjuo35zewN0c10mVngaRCcvSzJBmYPAiPegEXgtvrN8SttoDHcdCN5mXc7P6E0fZKIMDHLE
	BOpGxzCzNly3BMWpOsp/vmt7yplykR+kJNs54mglVLI68Ab7EirBmUTkjsvDDmcgDV+KnSMhlzhUz
	dsvEypGdYb28YINVVYvNfIh2jxybWP1aKZ4oWzI9INE4+53sRHHTpXNumz0U5ig7Vfg64fNGi//D7
	8dSBZglpJkCAkpjiVeumVSMPP7Hw1KlgJoIObKRZn65DERtPJCqzA5as3Xi2SJxNGwwMZ4qVCJ63Z
	DFdm2dBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1Xt-0000000G6SE-063D;
	Sun, 08 Nov 2026 11:58:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1Xr-0000000G6S8-1Qih
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 11:58:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B673B43349;
	Sun,  8 Nov 2026 11:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A932C1F0089F;
	Sun,  8 Nov 2026 11:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794139126;
	bh=frdSBuiNZsaClAfWL1rszk93uoKIYFoT/2az2pnoHt4=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=ItgUl6PztSGNn2uQTaSE+c6elZ9dMsyQ66yn/YThcn1L1YS4hJFN5IQlHvj/kF/z1
	 2d/R7zA2en/UUgYrH/8IyMFqGeJtvBopjb584BWfSR2dG/uCQvL8WWgq7iczslSCHW
	 g9jh31BAYYxunw1f8Ybd70aYzBl7tUwxFyf83fm2gqAAuXqBEIzgRMhXPK+sWrknzs
	 yMomCSE/ysWqphi5xPPltDnJvmfe7v1TaeNySdKNo6HydM3ejnHBPeHMRBnoylZmCQ
	 ut7bXtq2vbcTEu6vTCD0q452CzUGVIplVMci32BvaekxFaPtw37zCLVdnVlEtEhCt/
	 qcPGw/hRNSamQ==
Content-Type: multipart/mixed; boundary="===============7105721968340737727=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <61dfc5e627706ca6bd1b23fbc8e9e4af7196ac827d3089fcc038079536f848eb@mail.kernel.org>
In-Reply-To: <20261108110406.97495-2-cuiyunhui@bytedance.com>
References: <20261108110406.97495-2-cuiyunhui@bytedance.com>
Subject: Re: [PATCH v9 1/3] riscv: implement this_cpu operations
From: bot+bpf-ci@kernel.org
To: cuiyunhui@bytedance.com,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,dennis@kernel.org,tj@kernel.org,cl@gentwo.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,memxor@gmail.com,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,bjorn@kernel.org,pulehui@huawei.com,puranjay@kernel.org,thuth@redhat.com,ajones@ventanamicro.com,ben.dooks@codethink.co.uk,rkrcmar@ventanamicro.com,samuel.holland@sifive.com,zong.li@sifive.com,conor.dooley@microchip.com,tglx@kernel.org,debug@rivosinc.com,seanwascoding@gmail.com,andybnac@gmail.com,menglong8.dong@gmail.com,cyrilbur@tenstorrent.com,wangruikang@iscas.ac.cn,atishp@rivosinc.com,apatel@ventanamicro.com,linux-riscv@lists.infradead.org,linux-kernel@vger.kernel.org,linux-mm@kvack.org,bpf@vger.kernel.org,arnd@arndb.de,nathan@kernel.org,nick.desaulniers+lkml@gmail.com,morbo@google.com,justinstitt@google.com,qingfang.deng@siflower.com.cn,linux-arch@vger.kernel.org,llvm@lists
 .linux.dev,dave@stgolabs.net,emil@etsalapatis.com,ihor.solodrai@linux.dev,broonie@kernel.org,cuiyunhui@bytedance.com
Cc: ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Sun,  8 Nov 2026 11:58:45 +0000 (UTC)
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

--===============7105721968340737727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> riscv: implement this_cpu operations

TL;DR: this_cpu_write_N casts val without parentheses, so expressions like
"zero - 1" or "a < 0" may store different values than the generic code on
RISC-V; no in-tree caller found that triggers it.

> diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
> new file mode 100644
> --- /dev/null
> +++ b/arch/riscv/include/asm/percpu.h

[ ... ]

> +#define this_cpu_write_1(pcp, val)	_pcp_protect(__percpu_write_8, pcp, (unsigned long)val)
> +#define this_cpu_write_2(pcp, val)	_pcp_protect(__percpu_write_16, pcp, (unsigned long)val)
> +#define this_cpu_write_4(pcp, val)	_pcp_protect(__percpu_write_32, pcp, (unsigned long)val)
> +
> +#ifdef CONFIG_64BIT
> +#define this_cpu_write_8(pcp, val)	_pcp_protect(__percpu_write_64, pcp, (unsigned long)val)
> +#endif

Should these casts be (unsigned long)(val)?  this_cpu_write() passes val
through unparenthesized, so the cast binds only to the first operand of an
expression, which changes the stored value compared to the generic
implementation:

  u64 pcp; u32 zero = 0;
  this_cpu_write(pcp, zero - 1);
    generic:  0x00000000ffffffff
    here:     (unsigned long)zero - 1 = 0xffffffffffffffff

  int a = -1;
  this_cpu_write(int_pcp, a < 0);
    generic:  1
    here:     (unsigned long)a < 0, which is always 0

This is the same problem arm64 fixed in 885bff055a0f ("arm64: percpu: Fix
this_cpu_write() casting").  I did not find an in-tree caller that
currently triggers it, but a future caller passing a binary expression
would get a different value on RISC-V only.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/42475504268
--===============7105721968340737727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7105721968340737727==--

