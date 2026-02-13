Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EA9EF48C1
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 02:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cKYAmRMfrCYaMY8MrL+vHf1nLPYTBnZQ5ean8F3byrk=; b=cNdoPX3c4PSUVd
	DvtCFWEB5Xzzp2Np6KGxKGvau5xpaTZRumJEOXmar2izuv3p36V9u9uCIC5/79hz0tn1UFidJd93A
	jB8Ga7b3W7y04yEk804bJiWz6CpTXDtUlWn8+QpwEjbsJskTR6kWy+kyJUb54vJ3SHAJN40aiA2rX
	SGAE7uG3ggO/x3z56fC5W5jm9mBTzYxlmlnZT2pSQbS7+zT+e+TEymKH/WcBibIZOynOsfnM7z640
	WsoHjlhYJB/vEkaIuDLwadXlNemsYpLySkPdjNiqq7jDF2i1koBsOMfG15tgcR9QPicoTVDawkoJ4
	xRmQ0Z9z2kF45hKWgLqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqjI7-00000002sSO-2mg4;
	Fri, 13 Feb 2026 02:52:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqjI5-00000002sS3-07zk
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 02:52:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 486CD43BB7;
	Fri, 13 Feb 2026 02:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8552C4CEF7;
	Fri, 13 Feb 2026 02:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770951140;
	bh=l3Gi66JZvER/YDr+cJ4GCr6bDEVhkqVzTtQeB4gKZkA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TZipnZHCitrPfNkYz+K1qGTNWFvD8cZcIuftTC1wUzqJpsU2sk/krnZJyEJwCBL9j
	 awcoH+41pCty/0PBUgJqC6ykZCGExu8vPB7OxTFVvdTUlEfMz/BELcwo4LIq27Oq34
	 j62e5A/QiK6pcKj+KtD6NLv4YRz/uVeUISxT5xxgujh58F//zoabmOBnQE4c7Ckphs
	 VSro7N7qyF1v2B39xZ7yEN2rW7UvWvMktTD7JNLBl6m5R9GbMuVozyq8IaqtJufZfM
	 mwZvuqb2uwGEHlzCVvhl8WzyBbi6IWUKHTdNjS6QWMm6KesAfm3BmwagUjFE5KFqGa
	 8mh4VLDpwlxgw==
Date: Thu, 12 Feb 2026 19:52:18 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: "\"$(name)\" <$(mail address)>" <qirui.001@bytedance.com>
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: add hardware error trap handler support
In-Reply-To: <20260202094200.53735-1-qirui.001@bytedance.com>
Message-ID: <ca29aa74-a164-f585-aeb3-4695c6a25464@kernel.org>
References: <20260202094200.53735-1-qirui.001@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_185221_110347_E1C3CD57 
X-CRM114-Status: GOOD (  10.15  )
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

Hi,

On Mon, 2 Feb 2026, "$(name)" <$(mail address)> wrote:

Looks like your mail user agent is broken - can you fix that, please?

> From: Rui Qi <qirui.001@bytedance.com>
> 
> adds support for handling hardware error traps (exception code 19)
> in the RISC-V architecture. The changes include:
> 
> - Add do_trap_hardware_error function declaration in asm-prototypes.h
> - Add hardware error trap vector entry in entry.S exception vector table
> - Implement do_trap_hardware_error handler in traps.c that generates
>   SIGBUS with BUS_MCEERR_AR for hardware errors
> 
> This enables proper handling of hardware error exceptions that may occur
> in RISC-V systems, providing appropriate error reporting and signal
> generation for user space processes.
> 
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>

Thanks, queued for v7.1.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
