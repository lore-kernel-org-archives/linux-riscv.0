Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA127C87FC5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 21:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3IhFU4xNU5o/Vk0iQVWgvL+e3h5TILuKJ1zxCmfTeo=; b=DE5L58mT3GxQmm
	Hk9G6UcjYShiU13YyJ103ZEEwtgRgE+Qb/KemazUzUiWhFQZzQvEM95FVvAQb5gbeUX5RA5Npb6Ew
	2//pbDDDGTxUOxmG1cQ6VPGNnd/SY8bF6abqJSgRXHEynC1w0M4K2WOThcK2lzXqWWpKJW9RWBOmi
	cn8aJrvTxnjFxVPrtOCaSSp3RNC4y7R94vhR8L9/CuRdstyROaeA8Fad0WZtaRXYFlG0PhEgNhyXi
	B6nAi6WgB0pMnU3J24/mNDjoTBysMYI22ZP0pXhEw3XNqlYqGc98r9b3wpxFPaNOmRNYQZHHDN1oD
	uQt24IdXfCurdbGCxZfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3Iu-00000008SzZ-2ndK;
	Thu, 24 Jul 2025 21:16:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3Dt-00000008SRx-27Bb
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 21:11:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CD2BCA4597A;
	Thu, 24 Jul 2025 21:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4CAC4CEED;
	Thu, 24 Jul 2025 21:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753391488;
	bh=FcG103BTDIRwcd06zh7pGj3Lo6KRz/c3RYa3jUnalm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eIHUfffSFpfVhsn6XRx65By98JfdoAUdY2+BouZju7v/aUex4CSumVwnDH4c6jpJE
	 cysKnX8kzBv5ElkWh17v14zihdGntSyu/beSFCRhOMwgt45NdkUTx938++Wi5V6APC
	 fTnrSTAfIVbo537nEvGtZ/BESvUJEHrM0efEQACTIHH0q/Lo73iMmj2hQ/+njYrIN5
	 VkvejTZG4W9aJnT5JIgqLIse4PzNIQKFDcE+TqR9aKxEvsXNg7XZaA/+tKBRu/pGle
	 /UPvNUyib+xVvyjpdHnpwKHFDn3ZQByrzwzO1ShsqJAX7uEItoPlfioN4BEyCoGaiP
	 foUgYouTCj/lw==
Date: Thu, 24 Jul 2025 14:11:27 -0700
From: Drew Fustini <fustini@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Subject: Re: [GIT PULL] clk: thead: Updates for v6.17, part 2
Message-ID: <aIKhf41ky1gzdOIV@x1>
References: <aIKcFzsCvvz0PCBW@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aIKcFzsCvvz0PCBW@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_141129_626224_3C089A86 
X-CRM114-Status: GOOD (  14.53  )
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

On Thu, Jul 24, 2025 at 01:48:23PM -0700, Drew Fustini wrote:
> Hi Stephen,
> 
> I'm sending this followup PR in case there is still time to include it
> for your 6.17 PR. Yao Zi refactored mux clk registration which fixes an
> orphan mux clk issue which would occur when booting with mainline uboot.
[snip]
> Michal Wilczynski (1):
>       clk: thead: Mark essential bus clocks as CLK_IGNORE_UNUSED
> 
> Yao Zi (2):
>       clk: thead: th1520-ap: Correctly refer the parent of osc_12m
>       clk: thead: th1520-ap: Describe mux clocks with clk_mux
> 
>  drivers/clk/thead/clk-th1520-ap.c | 109 +++++++++++++++++---------------------
>  1 file changed, 48 insertions(+), 61 deletions(-)

My apologies, I failed to just send the delta between thead-clk-for-v6.17 and
thead-clk-for-v6.17-p2.

The following is the correct text of the pull request. Hopefull this is
acceptable?

Thanks,
Drew

--
The following changes since commit d274c77ffa202b70ad01d579f33b73b4de123375:

  clk: thead: th1520-ap: Correctly refer the parent of osc_12m (2025-07-13 12:46:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-clk-for-v6.17-p2

for you to fetch changes up to 54edba916e2913b0893b0f6404b73155d48374ea:

  clk: thead: th1520-ap: Describe mux clocks with clk_mux (2025-07-22 15:40:54 -0700)

----------------------------------------------------------------
T-HEAD clock changes for v6.17, part 2

One more improvement for the T-HEAD TH1520 clock controller this cycle:

Yao Zi has fixed an issue where the c910 mux clk could end up as an
orphan in CCF when the bootloader reparents it to the c910-i0 mux clk.
The solution is to refactor the handling of mux clocks by embedding a
clk_mux structure directly in ccu_mux. This allows the mux clocks to be
registered with devm_clk_hw_register() without allocating any new clk_hw
pointer which solves the orphan issue.

This change has been tested in linux-next. The LPi4a still boots okay
without clk_ignore_unused and peripherals like serial, emmc and ethernet
are functional. The file /sys/kernel/debug/clk/c910/clk_possible_parents
now correctly outputs: "c910-i0 cpu-pll1"

Link: https://lore.kernel.org/linux-riscv/20250722080535.60027-2-ziyao@disroot.org/
Signed-off-by: Drew Fustini <fustini@kernel.org>

----------------------------------------------------------------
Yao Zi (1):
      clk: thead: th1520-ap: Describe mux clocks with clk_mux

 drivers/clk/thead/clk-th1520-ap.c | 95 +++++++++++++++------------------------
 1 file changed, 37 insertions(+), 58 deletions(-)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
