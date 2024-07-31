Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC34C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 21:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HoFepgek88vPBfNbF0hTNKC6D0MlcHefyousXC3MFVc=; b=AjZcIcK2fgNEDo
	pCSZmcTVkVZlzk5vbbNcUMJMIE/uvdR18jGwnZAIFm/HPoNsiNMasSkDtyDKjHDUb2tpK6jTUi/ZI
	8Lwv7mUvAN4Jt8Mb2NRwxhi04eLj8NyOq0tyN8koujS8fzNf3TJn5HYwJ1lDjtDyvO04DslI2Kyv1
	HlHj8Sy9r5eZbf25hyRGi49LKmfGi8Rae+EPqjYDS3aCCzsn+KlImpGhAOgLfAyVEeDRdT2WOUl5G
	bgVUC51E+v22RGKhVHc3v3F1QQHulfbI7nwhtDCbyAi2zqs9A44rzeAgGgKD+2EQZGXAx5Yaf3Sv1
	23W/zJ84zgNfmG8MzUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZHFW-00000002dWE-3VKl;
	Wed, 31 Jul 2024 21:52:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZHEq-00000002dPm-0TfU
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 21:52:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A3056256E;
	Wed, 31 Jul 2024 21:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF7C0C116B1;
	Wed, 31 Jul 2024 21:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722462722;
	bh=LzrxpMDPHD8tdlmRH+vOiXD1KsGz4EH0qN3aZbe0v/k=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tgd++1cxuCDTl1r42SQmpyjbWvvfkraBvQKeUuxbcAWw0j/2SIzfTHZTaBgrbRC8a
	 KAn9jn28xZNJFJbIzsVPnTcnA7RwWTHJEUHXyC3N8vTMtPTlyWR6p0RmIRiSK704J/
	 SatyyVjtdAyjawOGbRnnbkEyNcT1zuA5feyD2qAz77YMnsOT8T43ILwmMA/yTsmpXY
	 DEm5G67M2xiL04T6KsjY6XaHoUOpZgA4oNMnbMHB/PGYhdUK5QtBylqyq+aliIkO/Z
	 yI0qr/sKpwSN/jnwb4uCCpV7Ki2e6xXe4CELQAkr1dYP5rZgS5KhQmTzFOOikTcEit
	 mN9c+en4DGUWg==
Message-ID: <dfb7e69f944a5d5821a503b23bd9c1a5.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240731061439.3807172-1-drew@pdp7.com>
References: <20240731061439.3807172-1-drew@pdp7.com>
Subject: Re: [PATCH] clk: thead: fix dependency on clk_ignore_unused
From: Stephen Boyd <sboyd@kernel.org>
Cc: Drew Fustini <drew@pdp7.com>
To: Drew Fustini <drew@pdp7.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Wed, 31 Jul 2024 14:52:00 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_145204_309269_65A327B9 
X-CRM114-Status: UNSURE (   5.84  )
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

Quoting Drew Fustini (2024-07-30 23:14:40)
> Add the CLK_IGNORE_UNUSED flag to the vp-axi clock (CLK_VP_AXI) to avoid
> depending on clk_ignore_unused in the cmdline. Without this fix, the
> emmc-sdio clock (CLK_EMMC_SDIO) fails to work after vp-axi is disabled.
> 
> Signed-off-by: Drew Fustini <drew@pdp7.com>
> ---

Applied to clk-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
