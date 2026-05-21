Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6D8CD5BAB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 22:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6ieAtCoBzV4kgtmrGG4XPxdogpsLX11dP8H0e48WrE=; b=06sMU37rr8qro+
	XaqQpPmDpB8U7oiJmk0//MIyw9cuNeUvTo/O8HakIt//wToypSfdxgYh5dBo0c+96w9arCPbXPgHO
	KRCDVRg7RNj/2Mt/7EGpvD+du/azuI6Cm8j9oZjeSKJ4t3ez1jGXAZiIf3OIF5IrrlYTMC2zVkcVO
	7C0Yu2BkaRcKzwgnBtwrHIN7+Z0XEqS0lwNAw3ZZRNpuymBlRqrqA9ojivJpVCsYrg9YQ3fou82Tl
	OOm1RTZRkRiSNTx71OPfQMfg4wUDt+HGR7bMLfAFY7P+oOVvA1Uc+pxzZuEfre6Pc+pI63D2gX5P4
	lgNYHt2DhQTdgOIuXjTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQBey-00000009CiG-3tuI;
	Thu, 21 May 2026 22:14:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQBex-00000009Chp-0r8K
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 22:14:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73C6C600FF;
	Thu, 21 May 2026 22:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA28B1F000E9;
	Thu, 21 May 2026 22:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779401670;
	bh=U57C2uRBVxiF1fTTpjeW1yofBxseUWTqJnzoC6A2llg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Wl/Ez9PSLXBQpkpIn8uMl3Ha9uN46Wo0EdmNVjzPguBJcfUL0IHjr1M9WyXOm5TcW
	 Ql9oYpX7MIlg9EECKjR6cyuSXlj+1k48snkkejN3drEHk5um+1chfVTE/7YoYoXHP5
	 4su8Yhf3bEH8sJJfMAxgz28TxnZalBNG8ZrO8Q1/1FJMfh2MIyPanqCxfkWPr/oHVv
	 Z2g/2bnQcMdl9rDo8ez9HQzUuzeVVpnXpEO2JSnApjwcBp1049vVzxi1KnKcqBM88I
	 kRjuCY6jxZ1N9q4/RO4ZqZtdA0uMekirlUXvxRO2qGFBYyC/QMLeZMEfNs79/LtECy
	 KkpYM8hYT9mMg==
Date: Thu, 21 May 2026 16:14:27 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Song Shuai <songshuaishuai@tinylab.org>, 
    =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, 
    Breno Leitao <leitao@debian.org>, Kees Cook <kees@kernel.org>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH] riscv: kexec_file: Constrain segment placement to direct
 map
In-Reply-To: <20260519170641.123517-1-gaohan@iscas.ac.cn>
Message-ID: <4f1d7f4e-e2a3-9d9e-4116-861f037f2799@kernel.org>
References: <20260519170641.123517-1-gaohan@iscas.ac.cn>
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

On Wed, 20 May 2026, Han Gao wrote:

> When kexec_file_load places segments with buf_max=ULONG_MAX and
> top_down=true, they land at the highest available physical addresses.
> On RISC-V the size of the linear mapping is determined by the active
> VM mode: SV39 caps the direct map at roughly 128GB, while SV48/SV57
> extend the range substantially further. When the installed physical
> memory exceeds the direct map size of the active mode, top-down
> placement puts DTB/initrd at physical addresses outside the linearly
> mapped region. The kexec'd kernel cannot reach them during early
> boot, triggering a page fault at memcmp in start_kernel.
> 
> Fix by constraining buf_max to PFN_PHYS(max_low_pfn), which reflects
> the runtime direct map boundary for the active VM mode (SV39/SV48/
> SV57). This keeps all kexec segments within the linearly mapped
> region while preserving the upstream top_down allocation strategy.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Thanks, queued for v7.1-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
