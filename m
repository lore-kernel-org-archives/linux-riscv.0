Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA74CCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 06:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwZ2Xr+p/XhjPYMwbZ7ZxKHNO9DAdO+bdOXRvzLojlk=; b=fzA3czpab7TOnc
	skw/GEAhB+7TubCo0r0tZUh9JUFveIbBoctNFOwPP8ImdttUJ2K1tWCGOEC3pFuR7EQFJ8mDQC6IY
	mj4LLLPEU3mlcwHjmDCZ41QrdtqNvos8NjI1ev6uq0uHDOx3qINYc+GVWCNGjapQIQ66txuv8Pz0C
	hslfdzy2K4wnHqdayQE62y31Jf+Xn/JBWfKc9jRsjC37lowC91VvqF2Eq0xPdFbiYN2ITYTLUN+Sc
	EnN+Lt4CeTRyOxb/YlIei/D/R6NRpEDPIwNLFaPE7CRJdrAIk+EOWqT0KPeWSclxVmD+ECqNSKidF
	gintk17+DvcipUk1h5Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDd5T-0000000FKHp-1cWc;
	Tue, 28 Oct 2025 06:21:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDd5Q-0000000FKHQ-0mak
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 06:21:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E04B438DC;
	Tue, 28 Oct 2025 06:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22400C4CEE7;
	Tue, 28 Oct 2025 06:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761632499;
	bh=cBb99/Rk/YrwDvp4oXeogz9Ml7yvcmAlg5Zf25ML1MM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JmHiXQ/ljBFCx9GEA9sDwjA4WxE8Hb8Ui9zHWjkhnkj6SSgP8J6xqAV6u7RTeLIDQ
	 PHAA45UCwq0lF4pzca245V8nfnXtQex3kwJTU/HhrGHeNBabj6Sl2A5NaMdQDtHnxo
	 D0Vt5Ty20SVdQB1iFONXfPKUOd8VF/7R89peWeR47ZQ0GXyI1P8zOwC8RNefjraooC
	 WlapMYEUHZ63G3CRwzF5+r2VBhyQtbhhM8DKxtStPLZdXkiaFJRFn5PaN4Kfy7MfRX
	 phQIqfk61NQkjlS9SFaTQEG3sJ+PEssNGeNtbqxfy/0oFOWa3HkbQCeFm7ok1wdyKQ
	 ndSOG9eQsW8ZA==
Date: Tue, 28 Oct 2025 00:21:34 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    WangYuli <wangyuli@uniontech.com>, Huacai Chen <chenhuacai@kernel.org>, 
    linux-hardening@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: KGDB: Replace deprecated strcpy in
 kgdb_arch_handle_qxfer_pkt
In-Reply-To: <20251011004750.461954-1-thorsten.blum@linux.dev>
Message-ID: <e5c98ef4-40a0-433f-b4e5-3f1bc62a0c21@kernel.org>
References: <20251011004750.461954-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_232140_248084_E9339421 
X-CRM114-Status: UNSURE (   7.31  )
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

On Sat, 11 Oct 2025, Thorsten Blum wrote:

> strcpy() is deprecated because it can cause a buffer overflow when the
> sizes of the source and the destination are not known at compile time.
> Use strscpy() instead.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, queued for v6.18-rc fixes.

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
