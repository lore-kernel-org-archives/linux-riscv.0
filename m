Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D29BC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 00:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o9PuR4P3N+/GMiodwKiXqwXfxKpwRlsi+LLmN3cgCUU=; b=qYawUmHU6O8jnl
	q6bkeGImgErg0kPPHCeb0acoCg38FUXwSeBCptmT+KOhOKruFwvarHGcCpgQ0+BtYJt5utV8qqPTX
	pa9ztTMLRiZGWBEi/zjBnOWqLRimPkZX8RPX9dvGVFAG7gXyFHE/DdXT9vO6S9iy9SOVvQbq86E+e
	+zXMNIOw1U8QieDNITRQSPFTlGXjfA+c0HAlhi/OKgCrYncII6xOnIXdW73SB8xLOjo0eucl4768k
	mUdyVcc5jNZgRbiApdGvFahysg90vbX9s+xEH4lERxXy8jUpgA7/IuhyzsHhgQof5ELx6TTuMeytU
	DSAEzI6KXnUgFPkmWmjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8V8Q-009b0r-1z;
	Thu, 30 Nov 2023 00:42:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8V8N-009b0T-2G
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 00:42:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E9AB61D3F;
	Thu, 30 Nov 2023 00:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE9A2C433C8;
	Thu, 30 Nov 2023 00:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701304946;
	bh=8nzlEGlTs23WnuWO60c1e2cluA21UQcXiLq8MdrlUq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Alcgnt/BtUoUp4InDQMZgs/IX+8gQPxIZcPXGUc0udT5b6Tq/haKiZm04X93M1BzD
	 Cg2H1jkgvc5R6esOS+bKTc/iFFT9zDGZs+aQqPHL5H6aNrRhLBIV6v3ckvPghTNTiw
	 ZKEes9qGssNEGFZXCGEqr1E0pfLLZ0qlTxIvKO1wxGHBL/kg0agO2xr80k+T196MZY
	 IasBxgkod+kYtMMOaFuZg7Mv2JV5d2Ji2lJMMPNjpFO7MITDIg8DovvYNYpkFwdNcl
	 NDOJAyyQw273ZvY0UoQUICBsc6cWBZQ6iz0LH4Kcv7JjIf502bEGHIiPPd18e74MH2
	 ErMz8UgWXsP/A==
Date: Wed, 29 Nov 2023 17:42:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Pan Xinhui <Xinhui.Pan@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev, arnd@arndb.de
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Message-ID: <20231130004224.GE2513828@dev-arch.thelio-3990X>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <20231123-headdress-mold-0dd7a74477f7@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231123-headdress-mold-0dd7a74477f7@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_164227_884751_45966F7A 
X-CRM114-Status: GOOD (  12.02  )
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

On Thu, Nov 23, 2023 at 02:23:01PM +0000, Conor Dooley wrote:
> On Tue, Nov 21, 2023 at 07:05:15PM -0800, Samuel Holland wrote:
> > RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
> > architectures. Enabling hardware FP requires overriding the ISA string
> > for the relevant compilation units.
> 
> Ah yes, bringing the joy of frame-larger-than warnings to RISC-V:
> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: warning: stack frame size (2416) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Wframe-larger-than]

:(

> Nathan, have you given up on these being sorted out?

Does your configuration have KASAN (I don't think RISC-V supports
KCSAN)? It is possible that dml/dcn32 needs something similar to commit
6740ec97bcdb ("drm/amd/display: Increase frame warning limit with KASAN
or KCSAN in dml2")?

I am not really interested in playing whack-a-mole with these warnings
like I have done in the past for the reasons I outlined here:

https://lore.kernel.org/20231019205117.GA839902@dev-arch.thelio-3990X/

> Also, what on earth is that function name, it exceeds 80 characters
> before even considering anything else? Actually, I don't think I want
> to know.

Welcome to "gcc-parsable HW gospel, coming straight from HW engineers" :)

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
