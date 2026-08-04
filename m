Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09ECC55172
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 06:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4U8vmYKAE494KRz8UNnGbyQCTeTKVmHoQGrVLfuTVJE=; b=sCBirxfSBuSBfa
	TtAwMhN7bky9HBIVe+0edfcKykM9O8HFJIA3b6LKa0VjJdlrYsotfqOORPknakP+jEgFftTYY02XJ
	JV3kSzHYqkEFPvHmB4JPfURo/nVAzSRLQdIbwlDJ3lxPUKr2J8YRgxOeGb94XEDpad/5yhMjWxaJM
	ODWyyNVsqk/RONLMuOIC/n9gwg9pDFqm4AmTAacSGkVg6rbnQ/faJ9YDNoTRWhV1md81Lf+kPnpEM
	tSyDej1oc28zSAGXXHE+RidqNAWiJAD3hvcEf2y+9PycFlO2UXKDHnJ9WjiWvGBSLXiFPBJutUKwh
	zIYgCKON5ZyMqIwZw09w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr94e-00000001AQQ-42r2;
	Tue, 04 Aug 2026 06:56:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr94b-00000001APh-49hn
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 06:56:27 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785826581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+sVA5YLiRZ+Crq+gCDcO8gb8PAaQnUuMu7sLEwBtUmo=;
	b=1PbWulaibPGPUjAnPAKtiK6dRU/OHDk7VDOQp+wRf5RMsUWz22w7ZxRsrBSCCCtqFdLUN6
	0eRd8INb0hlPkH6g64ulFJndkU+4Me6IoKx5YNxKpMaW0pBj6izKqHmYvxjZ4VDtHluxfU
	JXOKqMSIhaXOWWJEKaAy2hgXQ4qj6R4N0spQCiAFbLeP/qhH0/UmaHP7BdP4MPEh5TJYHu
	bkQdSblrs2NgfVAc7eZs2vx1av6dUk2a8uJAhTCHfnNIn1b/omb37Zq4LmDKvypcF5ajqj
	FRfNehB1R9IRuD79ugM93yEQoMOoEODwFtwBuZqSD4klGYZF+GZwGYom0jJydQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785826581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+sVA5YLiRZ+Crq+gCDcO8gb8PAaQnUuMu7sLEwBtUmo=;
	b=TTLOGtW/rM9CG/skZ+96TUUvcSKWLNCqOxbdYlM4O8dOf+eVyjNbmgzs0mP5/03T0fWjlr
	NhAkFnDVio7ALkAg==
To: Rui Qi <qirui.001@bytedance.com>, linux-riscv@lists.infradead.org
Cc: Rui Qi <qirui.001@bytedance.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>, Zong Li
 <zong.li@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Lukas
 Gerlach <lukas.gerlach@cispa.de>, Deepak Gupta <debug@rivosinc.com>, Ryan
 Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: kprobes: Prevent probes in breakpoint handlers
In-Reply-To: <20260804064343.1865283-1-qirui.001@bytedance.com>
References: <20260804064343.1865283-1-qirui.001@bytedance.com>
Date: Tue, 04 Aug 2026 08:56:19 +0200
Message-ID: <87wlu6l6gc.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_235626_170318_21703E1F 
X-CRM114-Status: UNSURE (   6.08  )
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

"Rui Qi" <qirui.001@bytedance.com> writes:
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 2f57fd48ec28..5eb5785874dd 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -270,6 +270,8 @@ static bool probe_single_step_handler(struct pt_regs *regs)
>  	return user ? uprobe_single_step_handler(regs) : kprobe_single_step_handler(regs);
>  }
>  
> +NOKPROBE_SYMBOL(probe_single_step_handler);
> +

The usual style is NOKPROBE_SYMBOL() following the function with no
blank line.

Other than that:
Reviewed-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
