Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90247C61DBD
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 13:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mCG+hKLl6vNr9pj64rKbUI9ul1NkyvYPQgG8uvx/Wq0=; b=iQSSPWYZx6FmIk
	zjvwhJp03b85Plr5cQPRdsyaOdWe2XDmfQKXc1N6do83Tj0vJlNBVaWMGdyLXhuiuyzEOTYN+9B4z
	kAzHUkiVaKyW4mDIsXUEyu/yiO3INDZLoHnC6DjuEVTkXxG4ci7zP4MJeGVnNqkDAaiHQ88bcdjCX
	UgWXVBR8CfBMmsl7QIDErfTCh225gB3hFmb2aNawJyZ/JlzoLDu0QCNUFdq9XUn5lHhp2jPtqlTlg
	Q0Uljvz0HbRzAzexYZFkrWin2ZKxlWiyyggbx4WQ2yu+s1mk7c1crBxA/lCIN6OpJEeD1OPHbTzXl
	u/RVgNDzwVSW12sRzaOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDQH-00000002UMa-0zUi;
	Wed, 26 Aug 2026 13:12:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDQD-00000002ULt-1dL9
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 13:12:06 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787749923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6tSux68TjAVzHt9ILyO7OorYkWmsxWCF0PwD8LN+AhM=;
	b=mjTRuOTceW6N1SUswgEwYXop3AtLvScDZaD0MC/5Q+xHhRpFcVFkDIFXjlwvfJrrlKEGSt
	IvszXxs88zO+qKWmfohwkgX25eNM4qxppuzI9pU2RQhDi70ial9W3ZClDAF7U0wYwO2Yux
	7wPlmtoz1rse/cwbGC0BialfMFbQl2mhcJv1b1OjyhAik8Bm/z/CdWrDrcvyv6BnJCAFGv
	sAsmn/dHPDml9V4QGZRL20UFUx6G7T7iWDlPdRdXCrcL87y0EY2H+b6YhbrtymSg+VvK60
	9U+uDzWyif1mmC0t+kvUdRhUGct355V4TnZBoeYVGF4pdxBWUELLH5psHAPXcg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787749923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6tSux68TjAVzHt9ILyO7OorYkWmsxWCF0PwD8LN+AhM=;
	b=Rh6rK55qkl6TekdA+YzNGSlskayduNLeLNpS/G8w0Mt6sSI6HBGYjTK0Y1H7RKlyKP17Nv
	WoMLhCmgzDD9BRAQ==
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: Re: [PATCH v3] riscv: probes: reject kprobes inside LR/SC sequences
In-Reply-To: <20260826100256.1418-1-yuanxiaofeng@eswincomputing.com>
References: <20260826100256.1418-1-yuanxiaofeng@eswincomputing.com>
Date: Wed, 26 Aug 2026 15:12:02 +0200
Message-ID: <87tsoht49p.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_061205_573435_87B9D814 
X-CRM114-Status: UNSURE (   6.15  )
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

Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com> writes:
> +	while (tmp > scan_end && count < MAX_ATOMIC_CONTEXT_INSN) {
> +		u16 halfword = get_unaligned((u16 *)(tmp - 2));
> +		unsigned int len = (halfword & 0x3) == 0x3 ? 4 : 2;
> +
> +		if (tmp - len < scan_end)
> +			break;
> +
> +		if (len == 4) {
> +			u32 insn = get_unaligned((u32 *)(tmp - 4));
> +
> +			if (riscv_insn_is_lr(insn))
> +				in_atomic = true;
> +			else if (riscv_insn_is_sc(insn))
> +				in_atomic = false;
> +		}
> +
> +		tmp -= len;
> +		count++;
> +	}

This does not look right. If we have

    lr
    another instruction
    sc
    probed instruction

Then riscv_probe_insn_in_atomic() return true, which is clearly wrong.

Have you even tested this patch?

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
