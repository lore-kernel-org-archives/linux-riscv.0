Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0B8C5AC7C
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 17:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=koeg2kfOfk+mDwahq85v31sWxL43GN/je+zBW9gVDfY=; b=X3GbsjXsNzz/nw
	CLDhASZ9IGb4p0FLzBTG8EXxzZtj7UA9ipFU1z8jZILcrM5v525q6CbNqmYX6/q3ZLXLRGg9FEMka
	m32KBLFgcj91T/sTLpQv4i5utwrs8jitpcnHjwUzEssnOBv5mwTyjdtcdeGfkiXSb/pY8NARwDLoF
	u54VsS6pPzPBYL2yfxUSlszUssW+fi5T6VvB7tc4pUC/8lfvbsUBuexS6UMXzHE28vytw6t8W7PSM
	XkxGf+pNm3vVIJ2gCgoAPsqvC7duS5x4fdwLgOAGiIGAJqYBOLe2RiSYxftKG53R/E22cSN14imy9
	RDrIsIYieyuOLE+p18Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1U5-00000006HJU-2Fox;
	Thu, 06 Aug 2026 17:02:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1U4-00000006HJN-1353
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 17:02:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DEA460AB0;
	Thu,  6 Aug 2026 17:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA031F000E9;
	Thu,  6 Aug 2026 17:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786035739;
	bh=OXAQKFIVVBbXnWv8484Zj8obP/yiaKmVTqPj7jB+Q/Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=gNO5ZwQ0z1emNmNw7dGtvsia/4vsFxCFFwfLJOdUtuda28fIvY0ldMPjcZ16rf8Kt
	 dG+1Axcl0PALGVZ9AXKWLGIPAO2E9FoNqfMyHeahTieqVDJndWEga8PLPtdLYov93n
	 4jldhNWnDtVooT+W6XKTnzRxiAovXHBBToB+py4jEzHDFI0XiGNmW/myXJ7laq2zjF
	 YOJoYLI6R7t0HL7sIshOMECX3+J4L7DwLXN8H6g7r5c26O7io7riPCxO4F8PhOUvhP
	 ktJbKzPyo1ZnpxPZkKmNf33NRCrB+x6oLl3RYd6Kspg3AjeQgpEt6nbm0EFVs0wcXt
	 VB59zQlflqvBg==
Date: Thu, 6 Aug 2026 11:02:15 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Rui Qi <qirui.001@bytedance.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Nam Cao <namcao@linutronix.de>, Thomas Gleixner <tglx@kernel.org>, 
    Zong Li <zong.li@sifive.com>, Ryan Roberts <ryan.roberts@arm.com>, 
    Deepak Gupta <debug@rivosinc.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: kprobes: Prevent probes in breakpoint
 handlers
In-Reply-To: <20260806043807.2583001-1-qirui.001@bytedance.com>
Message-ID: <5b07524c-1b93-22a7-ed9b-037d499a5b3f@kernel.org>
References: <20260806043807.2583001-1-qirui.001@bytedance.com>
MIME-Version: 1.0
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

On Thu, 6 Aug 2026, Rui Qi wrote:

> The ftrace selftest multiple_kprobes.tc registers kprobe events on
> the first 256 text symbols from /proc/kallsyms. If handle_break() is
> selected as a probe target on RISC-V, the breakpoint exception path
> can trap again before it reaches the kprobe breakpoint handler. That
> recursively enters do_trap_break() and can make the system
> unresponsive.
> 
> Mark handle_break() and its local probe dispatch helpers as nokprobe
> symbols so they are added to the kprobe blacklist, matching other
> low-level breakpoint exception paths.
> 
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
> Reviewed-by: Nam Cao <namcao@linutronix.de>

Thanks, queued for v7.3.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
