Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3DDC38145
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 17:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VdXrJY520uoQnotfC7+4KRdJmiAIRUoh7Hoaj0VvK1Y=; b=HlflDfkt2yhzlX
	ebe1JxEzkQsaGLM9ceanCGq9ZpllbmicbhlnZ+du13IJZyVX29y2RBKBoUJuSkFwgJCZeLtnePNAm
	EmjQUi+WztA2gHaGuPveve3QRzhTcHtpjj3j6ipouZ4HMoweIb0pPDJpA+622lbALOE3Q3uHPOLEm
	t6f1t7V668X0PDTG3j0Tn51WOHcHS8uh7kwucKv4oHKpAZg0rtnCO52cviuUncFTrM/xCMmL9OyPR
	tuukJ0rLsLZRV/Z7Niq6cMh+smeYl/3oc4dPYE7C2xriSPbgoS9iY30qgownlprfqB7tQAxFKqRpY
	If1vcVH9ob6v1//bQEEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVyt3-008F0L-0a; Wed, 07 Sep 2022 17:30:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVyt0-008Eyb-8L
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 17:30:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 09079B81116;
	Wed,  7 Sep 2022 17:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C814C433C1;
	Wed,  7 Sep 2022 17:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662571845;
	bh=sTFHKzRTmE4hLkwfjSXF938Aw9yrEtQkwAmeaka9rfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfFLCI7fMLzE5aK8JJSfj7i0reK0wOtw+imOGRCdGPVuwmqKzItva9dK1OhkQGslA
	 y+o5Xtle1k0xknoNKl6J+1zt1ci+VWZtiC+HLBhesKckl1Bbn62GxJWQwK7p2MBHEx
	 HZ8uf4rvc28wA9U5fHIBksC4d9bBKWG6bbK7Hbx1uXlJEoLKI/E4q79mEg8tgTkcvK
	 orBj87E08K/78WOLQ7jUqmgnW4VdadULt/+dv4BhGhyDfAgPE8hqk6e0V7+vm+mZWr
	 mFJXH9DhaTFEkAPYswIIvmWkOXS/fvZXLCMC5PWocE1cMiJZRpq6SQDvH1shyidNMi
	 rcub+uixsZXEg==
Date: Thu, 8 Sep 2022 01:21:27 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Liao Chang <liaochang1@huawei.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	mhiramat@kernel.org, rostedt@goodmis.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/kprobe: Optimize the performance of patching
 instruction slot
Message-ID: <YxjTF2FlIJbbKq0p@xhacker>
References: <20220907023327.85630-1-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220907023327.85630-1-liaochang1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_103050_460954_1AEBCF5B 
X-CRM114-Status: GOOD (  15.89  )
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

On Wed, Sep 07, 2022 at 10:33:27AM +0800, Liao Chang wrote:
> Since no race condition occurs on each instruction slot, hence it is
> safe to patch instruction slot without stopping machine.

hmm, IMHO there's race when arming kprobe under SMP, so stopping
machine is necessary here. Maybe I misundertand something.

> 
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  arch/riscv/kernel/probes/kprobes.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> index e6e950b7cf32..eff7d7fab535 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -24,12 +24,14 @@ post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
>  static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
>  {
>  	unsigned long offset = GET_INSN_LENGTH(p->opcode);
> +	const kprobe_opcode_t brk_insn = __BUG_INSN_32;
> +	kprobe_opcode_t slot[MAX_INSN_SIZE];
>  
>  	p->ainsn.api.restore = (unsigned long)p->addr + offset;
>  
> -	patch_text(p->ainsn.api.insn, p->opcode);
> -	patch_text((void *)((unsigned long)(p->ainsn.api.insn) + offset),
> -		   __BUG_INSN_32);
> +	memcpy(slot, &p->opcode, offset);
> +	memcpy((void *)((unsigned long)slot + offset), &brk_insn, 4);
> +	patch_text_nosync(p->ainsn.api.insn, slot, offset + 4);
>  }
>  
>  static void __kprobes arch_prepare_simulate(struct kprobe *p)
> -- 
> 2.17.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
