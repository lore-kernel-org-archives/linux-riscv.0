Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7571C25B4F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 07:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nF3VSReF7saiTG4hgTbkgmpg8aMSjBfG6Nf0Jyu5uLs=; b=MhM4/09AnD37Nj
	mWHFwIsZDGWsr39l85UP3pC48AfAyNrgOGIiA4sWHsnqzMLHrKuzTOjbM9VIVpKz6BwtX2Jjd68ix
	tBWNbAkaR0s3X7dfPeJ1otqwMNW08teZ6SYJJ9XabHa3AuhLKJ6D4n/VAQDPViX1uRVfP11nuN5RO
	HDkmypWIgJn2ht/czjqcmy7JLK9/iXfWEE2a9kagmLCT7RooDlIP7Y8HrxlJmpoLocigM1XaH3DJO
	bSNh+2tSixS53uAyuxkLPQ39muxEk+nka8WiV8tj/+PZNYGIcy4RPg9McwJ1YlV77hXDNJCU7X4gj
	oWmylaAfji2wd2J77kug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2RAW-0000000BrK5-2BON;
	Thu, 02 May 2024 07:47:52 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2RAS-0000000BrGr-0wR9
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 07:47:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 842B1FF808;
	Thu,  2 May 2024 07:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714636066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x8SwW+ELJF0Fre9JQp39dmXVDBVpvYrr5lnpvWL62nM=;
	b=aJW/qp8HM5GIcA9zma+Wm/wS7z8pqOauqHzMTapIbt69hXq7W9aTboL+TUAXfFLk6jS1yS
	iRYmFvhicQFh6JLO7Q8himwCobUqRtb8f4XcX13AH9qKj89VT8kx96QLSe27cX/VHEGHdo
	RCS6P2NdXJV088Ay2x0sbC2BYTwsofbZ5G4erAVAQTQ+2nQjfg27fn1WF+cj0MrdRB9ooS
	KB43b7EFfrqGmUAZr1L055xgMJELD9QgTWEm8Ecw3TWZOfCCHrtS/JTQ1Wpng/EWFGdjZJ
	+YQFO+mbqEo2CZ+N7KvTzD/QEQwQaMvW60PjA2pUgrVTCfp8lNjDj7/0R2Efcw==
Message-ID: <9ad3ab76-812f-413e-826d-97545c403138@bootlin.com>
Date: Thu, 2 May 2024 09:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/4] clk: thead: Add support for T-Head TH1520
 AP_SUBSYS clocks
To: Drew Fustini <dfustini@tenstorrent.com>,
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com>
 <20240426-th1520-clk-v2-v2-2-96b829e6fcee@tenstorrent.com>
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <20240426-th1520-clk-v2-v2-2-96b829e6fcee@tenstorrent.com>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_004748_531211_B0919464 
X-CRM114-Status: UNSURE (   8.15  )
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



On 4/27/24 2:10 AM, Drew Fustini wrote:
> Add support for the AP sub-system clock controller in the T-Head TH1520.
> This include CPU, DPU, GMAC and TEE PLLs.
> 
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
> Co-developed-by: Yangtao Li <frank.li@vivo.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Co-developed-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>

> ...

> +void ccu_disable_helper(struct ccu_common *common, u32 gate)
> +{
> +	if (!gate)
> +		return;
> +
> +	regmap_update_bits(common->map, common->reg,
> +			   gate, ~gate);
> +}
> +
> +int ccu_enable_helper(struct ccu_common *common, u32 gate)
> +{
> +	if (!gate)
> +		return 0;
> +
> +	return regmap_update_bits(common->map, common->reg,
> +				  gate, gate);
> +}
> +

Both of those functions are only used in this file, you should probably 
make them static because otherwise, the compilation process will prompt 
a "missing prototype" warning.

Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
