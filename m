Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BA3CD37AC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 01:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTpva6tdevTdytyuARwQ7IE0SOYC/ASSWtNhSX8M+nM=; b=JpIiwv/BnTv7cf
	D59F5ZfY1MNXPysH17ps6S8HF51TdKcXIvZAl03uD5tSuvqxFPCaFN4LYBcFh7sDmRGwd3eV5NHSi
	Yn7MONW9PpHYeGujoJNnL9hW8dLR9zhEZ96VIHsQQlCH2Da5YL0lL/NRCPyKKUBKP6h0PSgj8STwP
	rKQIGgweKOZ8v/mYJawkSy0dwWnfAkKiJqwN6Q61cd8Yqhcr7DQJrTjCnAkuNZPvfjj8WE/LR1E8V
	FkixtETKCQkNh8coF5dTxujPyxue4ehbE+hSUxbm3rClMv1fJ+2HN7N75TncdOA+lfbZiMRRpmNJd
	jDbArE6jf1RihpwudMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNL2P-00000004Hxn-26CO;
	Thu, 14 May 2026 01:38:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNL2M-00000004HxH-3Itr
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 01:38:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D71E43AFD;
	Thu, 14 May 2026 01:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A213C19425;
	Thu, 14 May 2026 01:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778722733;
	bh=azx75L+0LsCmzV7YzgWzSDXiprim9aRbKB+QdHdpWcU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JWelMqc1orGpixsJdFi9RzJHAPx2YWdVYrYvGbGWfan07qTlSKpw03aLSoN/oFIWG
	 Gce/A3jHn6z/5m6YZym0FadHtug59M9PYnI6Dmw8cZ53l7W9qY1RtBiNyG2GlHcapZ
	 V+Ocbx5kF51bz5hu94O6oXtDSfrElIbbOAP4/3LH7pndT21dVP7uIItQ5ur9kQdYYh
	 y/HVozFDPlAkneMoF03TVVZwRqWUz2CxPCP55DmfTBWbS589DnrjsRldEo1lgvCZal
	 eVYNb1GS3paQPLRZrw6k2i7e7f6o8qQnUy6eOnj020OmUIhIj9yz9CwztKzgcKaIF9
	 i+nShwmL0M3Jw==
Date: Wed, 13 May 2026 19:38:52 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
cc: Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
    Justin Stitt <justinstitt@google.com>, 
    Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
    linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
    linux-kbuild@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 09/14] riscv: Drop tautological condition from
 TOOLCHAIN_NEEDS_OLD_ISA_SPEC
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-9-81d9b2e8ee75@kernel.org>
Message-ID: <39e64254-2a21-5b50-a8fa-a6295e61fed5@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org> <20260428-bump-minimum-supported-llvm-version-to-17-v1-9-81d9b2e8ee75@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_183854_844591_72D07AA2 
X-CRM114-Status: UNSURE (   8.40  )
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
> has been raised to 17.0.1, the Clang dependency part of
> CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC is always false, so it can be
> removed. Adjust the help text to remove mention of Clang < 17, as it is
> irrelevant for the kernel after the minimum supported bump.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org> 

Acked-by: Paul Walmsley <pjw@kernel.org>  # arch/riscv


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
