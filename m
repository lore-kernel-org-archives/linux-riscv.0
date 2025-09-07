Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1EBCA1017
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Sep 2025 03:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYx2Jm8aZZ4rj9Kn1vfjVwIhX3b7Eew/HyrsaJGUozo=; b=1C6SQa6JONxfVE
	ZWE3CXMyBY8a7NX38/5/tcyTfmFtvWbXdHywwNYziRIKXDbHSf/4jUu7x4FEB4xVlYOFDUyGhqeS1
	+0Hr3/5Xub2vedhnVy0IESpnPJz68vQEhM3WU2eUJxmccGXE+9odFQaa5d83EW2K4xiPWUNFT4Oy5
	ZC30o2muoZDeKpdtpmIbBDFK2YjJ73pdS9tVAaVJjiI4BQ+iVnEtP8p4zSGMKgw/tZn4Daer8Y5ZU
	0xfcJnaNExxeytELFJLiAbTS/1fXRAGpGy/gDCT9mBwvUsMBPALPunbXrBEZ15VvI08VFJUfU1ExT
	9lnUegv/7zR2uqR1N30w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv5uQ-000000097ne-3WhY;
	Sun, 07 Sep 2025 03:17:42 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv5uN-000000097mC-468O
	for linux-riscv@lists.infradead.org;
	Sun, 07 Sep 2025 03:17:41 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7772D20E83;
	Sun,  7 Sep 2025 05:17:38 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8t3ZYEGffzYV; Sun,  7 Sep 2025 05:17:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1757215057; bh=LhDHTlcfR1jGlZto3p6JzzhQfbrunIuTuGNvuvqpJWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jrWfrwVvsp5VR5ASaKQCO0jC+3CL6AoWx6zFsTPONS1ul+pILsdE6xQfe5oHrOgbg
	 yNKw6gCy8+kBwGl9bVE+U6elHWFtNqJzjhtOrYeePFNhEK+oP2k8PgiY6ypUxAWnqL
	 Eqbr7JmA89v3x1q0pS3inbCvfvHYKpA/jXN3nRRn7Ckmc9upfw+O5STwWo2sbLB1Ym
	 FZ6IdAQZcCQHM/yYjLWtI12ugh2CJoLdVDsnHfXOhgVK+Vg5pVwdt9GYe3v/SiWyRw
	 pZWZh2C+CuNlqz8Xbs4ZntgGi5S0EtHpuQsPrnrrIlA6flrLkblWWq+hfl3rlZxhT8
	 WSKXzQqrsmMDQ==
Date: Sun, 7 Sep 2025 03:17:26 +0000
From: Yao Zi <ziyao@disroot.org>
To: Xukai Wang <kingxukai@zohomail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>
Subject: Re: [PATCH v8 2/3] clk: canaan: Add clock driver for Canaan K230
Message-ID: <aLz5RsjBoi0KVGSJ@pie>
References: <20250905-b4-k230-clk-v8-0-96caa02d5428@zohomail.com>
 <20250905-b4-k230-clk-v8-2-96caa02d5428@zohomail.com>
 <aLz4Q7LZFEfQQGUj@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aLz4Q7LZFEfQQGUj@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_201740_151093_B07742A6 
X-CRM114-Status: UNSURE (   8.26  )
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

On Sun, Sep 07, 2025 at 03:13:07AM +0000, Yao Zi wrote:
> > +struct k230_clk_rate_self {
> > +	struct clk_hw	hw;
> > +	void __iomem	*reg;
> > +	bool		read_only;
> 
> Isn't a read-only multiplier, divider or something capable of both a
> simple fixed-factor hardware? If so please switch to the existing clock
> hardware, instead of introducing a field in description of rate clocks.
> 
> It's worth noting that you've already had at least one fixed-rate clock
> (shrm_sram_div2).

It should be "fixed-factor" clock instead of "fixed-rate" clock, sorry
for the typo.

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
