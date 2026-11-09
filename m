Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB45606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 12:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4GzdnnrO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rw1a3E63
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vShdMtefaIwEigZ5LPsrkhJmOwyVfeYOWZK6eve5dPc=; b=4GzdnnrOw39rS5yPnRS82GJ6lN
	/UA1wqqIWwgPfXuv8SGzv8JxYFjr4QmXpEIqoYfXcaI9RDDhBFdzUjtALwyERn6KO1qSU/wS54ELG
	/a0JC+0GUekDMPpKD/3YgEaNtEFQEIp3ovehCvmXk+JT2K7ENBkzRYfHPd+oxLmo7X47/zqszHbIb
	eD1jHH7LYzQz61sCUQQKMywz6C7gNXtsEkGGI2UOmkiYD8Ww/sAfkca61zUPQh08pt1p5pYDw6H1I
	FRg/KLoIS7XWFUWrA96QnkasR/bwSUC5LvJUHSbgn0hYRqopft/qod/EjEd2Xo28tbyaWDeb2OFGE
	VnBUPmAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO8O-00000000cUq-1wA4;
	Mon, 09 Nov 2026 12:06:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO8M-00000000cU2-3WFI
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 12:05:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 511D34585F;
	Mon,  9 Nov 2026 12:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629461F008A5;
	Mon,  9 Nov 2026 12:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225958;
	bh=8VRMkBgMeSqbC5Ba9NzzAeWALgbw62uujK7fDusMRS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Rw1a3E63im1BPzwPFfjalYxnWinbwVrJ62OeoygdnT6Wm3B1HUdFpvPuG6jop+GKW
	 ozvlWkMdFnEoobD/CbcU4A2BrMZFSgk+84DPWhQWs4wo3MM5nQtAQxl582gIe1C/JZ
	 lvQMYtluZuWWRJAcLh/PR4o55eGykZBBJIDX6O8h6nSroU5kn8dNcWzmZgusb5DDZC
	 PkydHofWFJcIiaUYSJIEmJr+yQmWJd4NVZDKzvYDRC54ZJ9GEuH/EYdqRVDdsNLRM6
	 +TNJSQt10EwgYUIDY3u9HLdQfWeZ7GczTYJBsqJE86cHbG6q1XAOklOWEgckospTQ4
	 Fv75q+aFIzEEg==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, "Linux trace kernel" <linux-trace-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] riscv: kprobes: free insn slot in arch_remove_kprobe() to avoid memory leak
Date: Mon, 09 Nov 2026 21:05:54 +0900
Message-ID: <undine-1794225954481525621-8248ce0c28df01fe@undined.local>
X-Mailer: UndineD 0.1
In-Reply-To: <20261013023605.317-1-yuanxiaofeng@eswincomputing.com>
References: <20260731100940.2330-1-yuanxiaofeng@eswincomputing.com> <20261013023605.317-1-yuanxiaofeng@eswincomputing.com>
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

On Tue, 13 Oct 2026 10:36:05 +0800, Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com> wrote:
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
> Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>

Since this fixes a memory leak present since RISC-V kprobes support was
introduced, please add a Fixes tag (and Cc stable):

Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
Cc: stable@vger.kernel.org

And

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

from kprobes point of view.

Thanks,

> ---
> Changes in v2:
>  - Drop the stray blank line before the closing brace.
>  - Extend the commit message with a reproduction/verification note.
>  - Rebase onto linux-next 20261009.
>
>  arch/riscv/kernel/probes/kprobes.c | 4 ++++
>  1 file changed, 4 insertions(+)

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
