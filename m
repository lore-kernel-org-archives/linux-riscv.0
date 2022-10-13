Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D42C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 17:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXkbp0gkMGRhxbzIpC+oRxpwUlGQBoyvf0zEtlgUJh0=; b=cIpZj23CMEgnxND4WMfA67l3o8
	cYaqyxG9IqfKFqyHgNeN1kK0hGfONNZ8rrWIaxHZI8C11kEDq4T5grKVsrBrqbHqx/VszSBtvdHz1
	CGHb/icjnOrx9R0JogZ7eZ42KiLWNucop2xWGp75VaeDAysKVZIExCz25HlPmoNrkiMR4E7cjAyi3
	aZflUsH99JLxWPiGuC1WMSgow2BaSiSf8at8ycEvH6BAq0H6qitn0+WE5eAkoqaVamMc0J4Jtcq+y
	Q7tYSUSIl4Ss34LrCubQFqmxa6XhpxuvhAOcKFP+F36L4FlgA4OEuH3IGK+n3Q0pvJvogx/nskZfU
	4plftGUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj2QS-00CaE7-MG; Thu, 13 Oct 2022 17:55:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj2QQ-00CaDL-Qm
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 17:55:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 610A36190B;
	Thu, 13 Oct 2022 17:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97446C433D6;
	Thu, 13 Oct 2022 17:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665683717;
	bh=nxgfWbmszJW/pcNngF+ADL4BRBz+QPL7HdS6m/seybw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lAn3wQCTC5ZT0cF/8KoWCEfjdzLn+JUQ/CwYKkEDGUA+PfFV3uiswKXpQzXonn2z3
	 5DR37REMXazF507SZLlH/Mc2P3QEOeObMwekWxBPPoFOw2ZF7QrvwMuGRK4ygKUeeX
	 PEWqPVa6rdWnvfmSbnkvvKc6c8UxQBJQMcV+b5dzIf0hRwYNJ1D7TMTxx3/5g7G+5x
	 vm5VpL5SLOYVFSlON/zpefA9E6XWhvyZk0kMjgQCeYi63mR5syokW3krL1faOZB76U
	 s3qHr6OAVMEI6Y8xG5QuxTT0dOz+htKq+PqzBAXOiRh2DjpdbsL5pvlFIYcyyaiHEm
	 2/3nOD4c2vKEQ==
Date: Thu, 13 Oct 2022 13:55:16 -0400
From: Sasha Levin <sashal@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	mturquette@baylibre.com, sboyd@kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.0 20/67] clk: microchip: mpfs: add MSS pll's
 set & round rate
Message-ID: <Y0hRBNz4opKb09Ei@sashalap>
References: <20221013001554.1892206-1-sashal@kernel.org>
 <20221013001554.1892206-20-sashal@kernel.org>
 <93982EAD-5EE5-4096-9AD6-BFA76905F1BB@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <93982EAD-5EE5-4096-9AD6-BFA76905F1BB@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_105518_919162_92B3502E 
X-CRM114-Status: UNSURE (   6.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 13, 2022 at 06:29:03AM +0100, Conor Dooley wrote:
>Not a fix, NAK. Same for 5.19.

Ack

-- 
Thanks,
Sasha

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
