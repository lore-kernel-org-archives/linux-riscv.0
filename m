Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BECFCD37AC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 01:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6AmiJksGYKvUaHcXN/JhIqIRJjXknNQoDO/VURuPPY=; b=ARr6vVt5jIOZSB
	LdWg69RbITRAaq0dlcnSjUhyCBGLXPa0h9VmliW6A0AT3rSbX4KlHckpB1YuFlDapBZjeHuAcsoM7
	abuO4fjG2JJ8djTzO1LwHxENRinrhu80/etxbJudR+eh/yZzCp39tKHQgQDbTdqkVOx8/52BHJ84O
	Lf9ZX/WusIEQ/vf6pLlVWEV4YWmW6U8vq1wwSDJVh6ko5ddsxv4hg5fZ8WnBGFgmvDeDNy1sfha2y
	TkYqG5wcY2b5JNrmtjFZoKg7j07ObgqyGyDfzrItWRxff96h2j5Uuh1rY/KWA4CxfOhTLBmitfC1G
	bi8k0mXWk9Kp7DA3Dusw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNL1G-00000004Hpm-18Rx;
	Thu, 14 May 2026 01:37:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNL1E-00000004HpH-0cb7
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 01:37:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D4F84189E;
	Thu, 14 May 2026 01:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D02C19425;
	Thu, 14 May 2026 01:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778722663;
	bh=JAiknqCeMzr1Jm72EO+k4Z4Q0E6NbNXwKVqDC+oNyHw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RFPwYKOXAvHStZDKdPz7MjigMMcpdfevXvFUCv0TBh2askYK/dm4fxlIv5rB6fo0D
	 2S212xZ+0Y+51KMtBrfY1oV4kfwt07CpKrS0fCMuMPoLJqFTI+uyG0BzYu0IVpty6W
	 V0JoduGio8XxtwNzU8+NXf5ECc1JSL87DGjBWvm3EsYM9sC2m17cDfIz/J/qoZ9hrZ
	 Lln80LD7TcgmaBfNMFOKuoQvsNSDr3WFXqstSmo8DO5bUwuYEUC8+B63Kxc4hcVAyX
	 1TLOdVT01Sgw43XianozG5j1lMF9pUkXnCQdX4e80Y+WLIVOt+TYWbYhaZ+0oQu8fy
	 QJCzpr2/aF0Jw==
Date: Wed, 13 May 2026 19:37:41 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
cc: Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
    Justin Stitt <justinstitt@google.com>, 
    Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
    linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
    linux-kbuild@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>, 
    linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 08/14] riscv: Remove tautological condition from selection
 of ARCH_SUPPORTS_CFI
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-8-81d9b2e8ee75@kernel.org>
Message-ID: <8a77b39f-1a44-df07-2586-9f568164bad5@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org> <20260428-bump-minimum-supported-llvm-version-to-17-v1-8-81d9b2e8ee75@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_183744_214193_107A37EC 
X-CRM114-Status: UNSURE (   7.77  )
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

On Tue, 28 Apr 2026, Nathan Chancellor wrote:

> Now that the minimum supported version of LLVM for building the kernel
> has been raised to 17.0.1, the condition of the selection of
> CONFIG_ARCH_SUPPORTS_CFI is always true, so it can be removed.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
