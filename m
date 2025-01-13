Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8737C02183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 21:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLZafU60du8NEhZOJW0sfedUKvJ5/v4JLtuR2T+oxCs=; b=wRnrYt7hjg6jPU
	1vaQUV4MP6XKAzEqdodffXhwHFwBZMdA0tLjdf6l+FAMDbqhUaEEEfVKMnXbpdYDxJ7iw1Wvw54Ya
	4dqCnhqVtM+BC1PSm7/Yny97lu8yQrREBHZFwHWtaT+ngxxR8jgrmgNoIOsQAvotf2Iag/CgDQTa1
	rTEwBFEBeT6lmldxSZIouCwzHFnd3ZjWc8MJPbHVYYiRZx78cELUqK19t/OJoMJXP+4P0Seo+qrBB
	jMcYQPBBAepN0N5jTDEbCNeBrTCsptnOtgwzgV0VVRmXSsrWXnK6C/04KUNY3xl1xK1CGqFRFR4WO
	EA1tJhL96NMVx8oCFKiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXS8n-00000006hf5-35OH;
	Mon, 13 Jan 2025 21:38:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXS8k-00000006hed-34E7
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 21:38:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 94A06A4140D;
	Mon, 13 Jan 2025 21:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516EAC4CED6;
	Mon, 13 Jan 2025 21:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736804309;
	bh=WPwBkuUAy7vej4Aybc5qbqj6eTPxPZvTuoZYr55TIp0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IfYHYc8ou1//6MsF3b2w1c49FtVk9M67MD4c929eHhZ+eX33qd2JP0nCV9S8ZFS6e
	 3ntIgZtSsm4vdnXyyhzpyJcfyjpYXnS9R/EvYBSURVvxKUG7fs6YfbxuUFCfjb9AA1
	 jDl5QtruEBMXxECI24c82mgHzmBpXUwXXjroFV1geTQWTR1GzePw55bbaNxWGX0LJl
	 m92I/VjxCGkHBg7I6wf+WXvEER9Zt45ttHqLN4/1IKA6Lzg+KGTjHkhFdEscogQR3R
	 ScDFAzyMDxLOrSNbj1k5gxE9tMBQZWqLRb4JQP2Rd0d7R/YuExFe47FZsOUasZ0GQ5
	 6QifcaH72X3Vg==
Message-ID: <10445320f7431956d6cb9fc3cd8437d5.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241228034802.1573554-1-dfustini@tenstorrent.com>
References: <20241228034802.1573554-1-dfustini@tenstorrent.com>
Subject: Re: [PATCH] clk: thead: Fix cpu2vp_clk for TH1520 AP_SUBSYS clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: Drew Fustini <dfustini@tenstorrent.com>
To: Drew Fustini <dfustini@tenstorrent.com>, Drew Fustini <drew@pdp7.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Yangtao Li <frank.li@vivo.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Mon, 13 Jan 2025 13:38:27 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_133830_829757_0F4B9924 
X-CRM114-Status: UNSURE (   5.02  )
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

Quoting Drew Fustini (2024-12-27 19:48:04)
> cpu2vp_clk is a gate but was mistakenly in th1520_div_clks[] instead
> of th1520_gate_clks[].
> 
> Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
