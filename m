Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0830DC02183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 21:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/oiRijAkvWoxHXgg+rpay7kuRjCsNLuK9rIScxC65s=; b=WWiPmQC2W/aewb
	WWyL5tmZ9zhN7gE3h8PJr4EXVS9QJ22s5A1JiwWjnzL4f53DOpBNkrMtpW8dDthN9yGVqJgudkuHl
	T4jNA2CGGKYD0d8sy58nE+lokp+QPRlT21kptcXS16J5o6wfNnaX5WuxRmVQ43ADvKsKyrMLGEWVG
	4C4jRr+N+QQOqaPXooTt78icA795P78c1kLmelcJD69Z2cPAXGPrGSPS2D1dcDEsaqDyRnP1XM1XS
	tKmPKr5xQ4IJoS2iSIlNRuiSNpG1rcCs4P55RKkFNdBCrLTTK/e/eR96XwS682rlLaCFhTABe3peC
	99veWk//QaWWZGBN086A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXS9E-00000006hm3-3YL9;
	Mon, 13 Jan 2025 21:39:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXS9B-00000006hkj-3XGj
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 21:38:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 625F75C5830;
	Mon, 13 Jan 2025 21:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D421AC4CED6;
	Mon, 13 Jan 2025 21:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736804336;
	bh=m/cvfR4XPjeL5EZLp3gh0FhyWowV/OmMngrC8MfECH0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YkZIkY1bxz4WhoT3AehLk18W3BVhppJNfY1e10jsdYcpxxg5dPa5FHDfPmYIhxRhj
	 qRQx9qq0/QmAydOJykOBjFnjkXkNjdnbXoGJ4808rD/4zrqE9/qD9JTehEIm7Nklga
	 ldP0e8e+wMF0wkCzRpnNbWUSXZQzjtw4NGu8ORvd+CsdOuonFiSx0/h+pH20uGQ+eY
	 Jgi1hgimPiTwsUV0dRH/aEbmvtd43CR7GJl8w8U95DgAO4WdHfdNSof3APA8cULyau
	 nOlM3sxUjcyCR9vR1eUjm+9bwIEFREMsEXdsZuHXQQUe/u1Zfyf4PVR5+dZJr0hvEx
	 2U2SZTcNkictA==
Message-ID: <9cc51504129e411dcb69945f15351006.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250113-th1520-clk_ignore_unused-v1-2-0b08fb813438@tenstorrent.com>
References: <20250113-th1520-clk_ignore_unused-v1-0-0b08fb813438@tenstorrent.com> <20250113-th1520-clk_ignore_unused-v1-2-0b08fb813438@tenstorrent.com>
Subject: Re: [PATCH RESEND 2/2] clk: thead: Add CLK_IGNORE_UNUSED to fix TH1520 boot
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
To: Drew Fustini <dfustini@tenstorrent.com>, Drew Fustini <drew@pdp7.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Yangtao Li <frank.li@vivo.com>
Date: Mon, 13 Jan 2025 13:38:54 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_133857_922037_0E35A905 
X-CRM114-Status: UNSURE (   6.69  )
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

Quoting Drew Fustini (2025-01-13 12:31:25)
> Add the CLK_IGNORE_UNUSED flag to apb_pclk, cpu2peri_x2h_clk,
> perisys_apb2_hclk and perisys_apb3_hclk.
> 
> Without this flag, the boot hangs after "clk: Disabling unused clocks"
> unless clk_ignore_unused is in the kernel cmdline.
> 
> Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
