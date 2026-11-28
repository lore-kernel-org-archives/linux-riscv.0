Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC3C606A31C
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 08:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PQufiMEx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eC1ubHRY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vv2rNGeHJMFM5mGmx38dVgQPEs8AX05Zx41EIljPtvk=; b=PQufiMExkmKUf+lzJWoo8bUnDL
	pI14qPk0r8l3l2zSYeSu/e/9D3RNPxcbY2uh/k+TVc5sciUrl/NqBWwhWx7oLrS+jx9Lr2QWs8/us
	Y1fwi/ryfICsDCZGIY8YgJUvnrFpjTE5l6MgWMF0slkcmQqtto3WUsokBGtd0bT2sZMVFWyUbfSDf
	y7eoqFiOabZpqMhjukyOe0yPT6k4zPCAbIMr3lQwIxEKNLJ2pGxoZxYyhb/DH0UCkGie8VSfPxi4v
	D6eM+uEChWUn8tW1u3mwbfxdAVDvHJBFP6LtowRgvNBsVvjiw0i+HJWd4WIuWCyBaKNy606l+eI26
	HUnXf6wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXDPk-00000000W3Y-16VS;
	Sat, 28 Nov 2026 08:04:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXDPi-00000000W3Q-0lro
	for linux-riscv@lists.infradead.org;
	Sat, 28 Nov 2026 08:04:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A0CC4163F;
	Sat, 28 Nov 2026 08:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86AB1F00897;
	Sat, 28 Nov 2026 08:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795853045;
	bh=ln9OYJXGaH2pYepM+2l2e7RDytV9KomXjhzq9mUaLF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eC1ubHRYpGTbwjEEoOoHnXIZzZTxDpAnMlRx9TUtMGFz1/XpNPxxBQ3MeqB3fgGwy
	 ypSU4wHW0kItZeZCx2D7VWmQ6KZRqNTvs7XoNqKCV2PJJw4v6HOL4FiWQ+nlaAkREs
	 6R+a6PpgXYXGY7/fAl04j0bHx9BxtNHgKG7Aw9b/0kapwFqWF55jObAokJ1xlku0EH
	 mLx8Jxb/nh6R3gXUfxkBJOrhSNEBPekbya4Rw1NarMeaPKdwtd4h1fukZKypznf1ud
	 U6eIhyu20ovxdMiGRlSRGJhStQdy9YRsFLJVwc+gJRcRGUaJGVNt85tY+CBNYrINqB
	 8qyRXxYljtDNQ==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: kprobes: free insn slot in arch_remove_kprobe() to avoid memory leak
Date: Sat, 28 Nov 2026 17:04:01 +0900
Message-ID: <undine-1795853041979314460-9f1047ec8f874a5d@undined.local>
X-Mailer: UndineD 0.1
In-Reply-To: <20261120070849.1239-1-yuanxiaofeng@eswincomputing.com>
References: <20261120070849.1239-1-yuanxiaofeng@eswincomputing.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi RISC-V maintainers,

Can you pick this fix?

Thank you,

On Fri, 20 Nov 2026 15:08:49 +0800, Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com> wrote:
> When a kprobe is removed, arch_remove_kprobe() does not free the
> instruction slot allocated by arch_prepare_kprobe(). This causes
> a memory leak every time a kprobe is unregistered.
>
> Other architectures such as arm64, x86, and powerpc all free the
> slot in their arch_remove_kprobe() implementations. Add the
> missing free_insn_slot() call for RISC-V.
>
> Registered and unregistered a kprobe on kernel_clone in a loop
> inside a QEMU (RISC-V virt) guest: before the fix the number of
> kprobe_insn_page entries in /proc/kallsyms grew by one every 512
> iterations (each insn-slot page holds 512 eight-byte slots), and
> after the fix it stays at 1.
>
> Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
> Cc: stable@vger.kernel.org
> Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
> ---
> Changes in v3:
>  - Add Fixes tag and Cc stable (Masami Hiramatsu).
>  - Add Reviewed-by from Masami Hiramatsu. No code change.
>
>  arch/riscv/kernel/probes/kprobes.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> index 9e2afabf9..a76eab297 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -128,6 +128,10 @@ void __kprobes arch_disarm_kprobe(struct kprobe *p)
>  
>  void __kprobes arch_remove_kprobe(struct kprobe *p)
>  {
> +	if (p->ainsn.api.insn) {
> +		free_insn_slot(p->ainsn.api.insn, 0);
> +		p->ainsn.api.insn = NULL;
> +	}
>  }
>  
>  static void __kprobes save_previous_kprobe(struct kprobe_ctlblk *kcb)
>

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
