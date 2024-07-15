Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7479C3DA4B
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 19:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3C5zVFzWEb0Tw5sJmhSX73cu8EDqCFgxlaSWk26hB14=; b=Gi6zEgOFqJQBHb
	ybHOMrv91dlU/01fp8BveQScUMmwyGGhN5kj0IFUdO8kgvx5RMajWhAoaCSadB+g1dZUkerTUz7wT
	9J2FRSVUTYDrCMZPalh9KdUTOAQ2+oBqhWROWMALTyYc7381Mclf4pBL11oZTzdLLx5/mQj+5Wzs5
	claUCPL7hGXzjKk1wiX/qSbeTDPZK8wcEFJmp3hSuSpPtyJU+NzN1bH+5ZpZ4KzzXANhRfNphDTIY
	tfELPfrvFVicm3roy4EwFUBICQni4PhL6TnhrefODdXt24VgI4a4quzUaDbgpX22r+xrgI/x5xchc
	tcV6Y3ri6UL+wsef7Q2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTR61-000000085zu-3Yom;
	Mon, 15 Jul 2024 19:10:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTR5x-000000085xg-3MJk
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jul 2024 19:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BEA8FCE1116;
	Mon, 15 Jul 2024 19:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F62C32782;
	Mon, 15 Jul 2024 19:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721070642;
	bh=90dN1i/RdIaAfX4f5m/aBEH2BBi6U95fhiT1/0tgZfk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=m9QY4RYoPm9esneh9990iAT+gB5JatNPV7zSpAbttHTI1b0nF6OvwI9leLgL+sqWW
	 DEFi08Jyw7v9WYpL1yvieLvro8uZHh243dqRpZdcJcLpKgoYbfSN3IVdDlvWbQiGo9
	 p3hFXpEwy+cbnFwbvZU6g7FdeY3xWbU6FLFnnf2jnXEL1NahWAkHQHJA7judK3C2eQ
	 OWui90fxBsnaN1AIx5lhO1XJbg1y/fGC5NSFA0GOVnN1Gbwdbld/MNMEpntO57DouS
	 EJVKOsWZrzYvUfIMA2rcDXXlDdjIWCTgiZHZtx0tbXhdVsqbe91h7cGD77d6OHglgu
	 58k/530JQSzaw==
Message-ID: <91c750b79c9d2b2ae70f07177546a214.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240711-th1520-clk-v3-2-6ff17bb318fb@tenstorrent.com>
References: <20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com> <20240711-th1520-clk-v3-2-6ff17bb318fb@tenstorrent.com>
Subject: Re: [PATCH v3 2/7] clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
To: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Yangtao Li <frank.li@vivo.com>
Date: Mon, 15 Jul 2024 12:10:40 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_121046_049536_D3897E1B 
X-CRM114-Status: UNSURE (   5.88  )
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

Quoting Drew Fustini (2024-07-11 09:56:20)
> Add support for the AP sub-system clock controller in the T-Head TH1520.
> This include CPU, DPU, GMAC and TEE PLLs.
> 
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
> Co-developed-by: Yangtao Li <frank.li@vivo.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Co-developed-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
