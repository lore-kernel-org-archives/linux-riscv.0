Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0EF606A330
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 14:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U/Sz2E6Q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=MxBMYSkC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kyTQB4hSyw4rGgyWPwI+fUqeWDXWOkoolnDRiuMsEGI=; b=U/Sz2E6Qpx8keKWF/dalojgRH9
	nfZXjOkHIgOrFIX/pTS1JnD9BR62Zp0KPW/BHPZ/levtiZBxoTj0vmgcNa3t42YLJYZViz64MYSKC
	TDvnQkBjE8b256KUjfbk7wAiS7cX8J11sPMnXPGkUZ3qTmcQYV1Zv1Ix6pjbybiaY2T/0P3MvxFcq
	5cTovJYZPV3W/C7fYxY0yLKgTjeVOQkEjKW2JFjjnSxL/1DHrL243RFYAVvbLF3/IpzPg1nzBfvFi
	9G7GwfD/UhfuW8T7oHSYZ9i9835Zgov/tAl3IeUDn3FIbTRdAHPw+wURyJRx8RIz3I6Aej58eDPXa
	gjo/7ByQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKv2-0000000Cet2-1JAr;
	Fri, 06 Nov 2026 14:27:52 +0000
Received: from zebra.cherry.relay.mailchannels.net ([23.83.223.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKuz-0000000Cero-1PD4
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 14:27:50 +0000
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 3DA64721BE7;
	Fri, 06 Nov 2026 14:27:37 +0000 (UTC)
Received: from pdx1-sub0-mail-a256.dreamhost.com (100-99-200-173.trex-nlb.outbound.svc.cluster.local [100.99.200.173])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id CFF82721D76;
	Fri, 06 Nov 2026 14:27:34 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Wipe-Society: 7e13525769cfa6b1_1793975257071_335491123
X-MC-Loop-Signature: 1793975257071:91848556
X-MC-Ingress-Time: 1793975257070
Received: from pdx1-sub0-mail-a256.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.200.173 (trex/8.0.2);
	Fri, 06 Nov 2026 14:27:37 +0000
Received: from offworld (unknown [172.58.167.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a256.dreamhost.com (Postfix) with ESMTPSA id 4jLhN46Fm3zymb;
	Fri,  6 Nov 2026 06:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1793975254;
	bh=pGouYfVjyKTGZXnLB4H9BJgc3JtVSKN70c+jj0mxOQI=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=MxBMYSkCpvxRollmdthtjiAEFtOMzSCECzxuM40nrv86EzrMh2O3+Wjng/C6xknGI
	 RT67iuYMxTgTVKOOyXsSyFiObPakJJiEwYc3Qwmcro2bphqGzipJOPG/Q44Wo7X76q
	 7x1zrUPVjaqFUQ0DaT5pqrJqCqk9a0aSNgsqon98q/nLr07SDkRKPJZ/qbNJwAfbpT
	 D9/CSbHuVNQp1PONYKYpwND9Rv8HrcFjKax6KtXDMSCqMDa3JgMnSq2UtuHEnMUKxL
	 qkPX8S+VTXN2Owd1aX2S8SmVgsXKy6t4HP2IzK1efKDs/AasxPUp3huPH7OxhmZBJ1
	 Cqh0KGaTqPCSw==
Date: Fri, 6 Nov 2026 06:27:27 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: oleg@redhat.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: uprobes: Avoid redundant icache flushes for the
 XOL slot
Message-ID: <20261106142727.eccjk5h7xbeheruv@offworld>
References: <20261016203009.745042-1-dave@stgolabs.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261016203009.745042-1-dave@stgolabs.net>
User-Agent: NeoMutt/20220429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_062749_497616_2A39C62A 
X-CRM114-Status: GOOD (  10.75  )
X-Spam-Score: 1.9 (+)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ping?

On Fri, 16 Oct 2026, Davidlohr Bueso wrote:

>arch_uprobe_copy_ixol() unconditionally calls flush_icache_range(),
>which has no range form on riscv and is a flush_icache_all(). It
>runs once per single-step, as the generic code allocates and frees
>an out-of-line slot around each one.
>
>The allocator hands out the lowest free slot and the free path leaves
>the slot contents alone, so a hot probe keeps getting the same slot
>back holding the instruction it already wrote there. Rewriting it
>costs a broadcast for nothing.
>
>Return early when the slot already holds this instruction and its
>breakpoint, similar to commit bdf94836c22a ("arm64: uprobes: Optimize
>cache flushes for xol slot"). arm64 can compare against the source,
>but riscv appends an ebreak after the opcode, so compare the
>instruction and that breakpoint word instead.
>
>Measured with the selftests/bpf bench on a SiFive P550, with one
>producer pinned to a hart:
>
>                            before       after
>  trig-uprobe-nop           0.075 M/s    0.514 M/s    6.9x
>  trig-uprobe-push          0.079 M/s    0.425 M/s    5.4x
>  trig-uprobe-ret           0.075 M/s    0.514 M/s    6.9x
>  trig-uprobe-multi-nop     0.079 M/s    0.548 M/s    6.9x
>  trig-uprobe-multi-push    0.078 M/s    0.545 M/s    7.0x
>  trig-uprobe-multi-ret     0.081 M/s    0.549 M/s    6.8x
>
>The uretprobe variants gain 4.8x to 6.0x.
>
>Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
>---
> arch/riscv/kernel/probes/uprobes.c | 19 +++++++++++++++----
> 1 file changed, 15 insertions(+), 4 deletions(-)
>
>diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
>index eb177d0ce8ab..44e566f6b75b 100644
>--- a/arch/riscv/kernel/probes/uprobes.c
>+++ b/arch/riscv/kernel/probes/uprobes.c
>@@ -168,15 +168,26 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
> 	void *kaddr = kmap_local_page(page);
> 	void *dst = kaddr + (vaddr & ~PAGE_MASK);
> 	unsigned long start = (unsigned long)dst;
>+	unsigned long insn_len;
>+
>+	insn_len = vaddr ? GET_INSN_LENGTH(*(probe_opcode_t *)src) : len;
>+
>+	/*
>+	 * Slots are reused without being cleared, so a hot probe usually gets
>+	 * one back already holding this instruction and its breakpoint. Skip
>+	 * the rewrite and the flush then.
>+	 */
>+	if (!memcmp(dst, src, insn_len) &&
>+	    (!vaddr || *(uprobe_opcode_t *)(dst + insn_len) == __BUG_INSN_32))
>+		goto done;
>
> 	memcpy(dst, src, len);
>
> 	/* Add ebreak behind opcode to simulate singlestep */
>-	if (vaddr) {
>-		dst += GET_INSN_LENGTH(*(probe_opcode_t *)src);
>-		*(uprobe_opcode_t *)dst = __BUG_INSN_32;
>-	}
>+	if (vaddr)
>+		*(uprobe_opcode_t *)(dst + insn_len) = __BUG_INSN_32;
>
> 	flush_icache_range(start, start + len);
>+done:
> 	kunmap_local(kaddr);
> }
>-- 
>2.39.5
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
