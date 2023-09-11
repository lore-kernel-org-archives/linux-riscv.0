Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8344C71153
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 02:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NXWq++DaDfSNWbZ74372pdCd2aNita6dpcpUlwf6qsA=; b=v23fpRRVzkWsaQ
	1omiGguJjqADbytm7zPrqLzI9gzn3uy/TWUBUgC45S3VjcR/K04qjzi/h7RliDDLblgoGlYmlNdqq
	I7mSl07Qd9AkVFAsKTby1oIEJAIKGpUR+30IMhetju6jYW79GidEVuBBdTSJG0UT9rW7iOo+XTvEk
	ab+Zn604WaVX0vIyU9eU4Im9QEt6UPyis7K6K8rpSLQZlddSCmKv/dh6WRQYZHq6gQDVQziujU6vF
	g/WDhdn6v/Q0RND/27E+W8VfTf0fFbnxpGZwW1V3Bqwha9vM9/UFLzGHZ8TNvwz7uC4vrRu5NwGG1
	KKMLrSj5WUDC/3QHx5Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfWq0-00H6rK-1R;
	Mon, 11 Sep 2023 02:39:44 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfWpw-00H6qq-27;
	Mon, 11 Sep 2023 02:39:42 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 38B2d6rT053136;
	Mon, 11 Sep 2023 10:39:06 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Mon, 11 Sep 2023 10:39:03 +0800
Date: Mon, 11 Sep 2023 10:38:56 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: <ajones@ventanamicro.com>, <heiko@sntech.de>, <samuel@sholland.org>,
        <geert+renesas@glider.be>, <n.shubin@yadro.com>,
        <dminus@andestech.com>, <ycliang@andestech.com>,
        <tim609@andestech.com>, <locus84@andestech.com>, <dylan@andestech.com>,
        <linux-riscv@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-perf-users@vger.kernel.org>, <paul.walmsley@sifive.com>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <conor.dooley@microchip.com>, <atishp@atishpatra.org>,
        <anup@brainfault.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/4] riscv: errata: Add Andes PMU errata
Message-ID: <ZP59wF5Knq3G7On_@APC323>
References: <20230907021635.1002738-1-peterlin@andestech.com>
 <20230907021635.1002738-4-peterlin@andestech.com>
 <82a82449-3af0-4756-881a-b31b6b187e6c@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <82a82449-3af0-4756-881a-b31b6b187e6c@sifive.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 38B2d6rT053136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_193941_128480_865DBB5A 
X-CRM114-Status: GOOD (  11.53  )
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

Hi Samuel,

On Wed, Sep 06, 2023 at 09:48:35PM -0500, Samuel Holland wrote:
> If the code here needs to be different, then it must check that it is actually
> running on an Andes core, not just that the errata Kconfig option is enabled.

Thank you for catching this, will fix in PATCH v2.

> However, I suggest setting riscv_pmu_irq_num to the real IRQ number:
>   riscv_pmu_irq_num = ANDES_SLI_CAUSE_BASE + ANDES_RV_IRQ_PMU;
> and then adding a new variable for the mask:
>   riscv_pmu_irq_mask = BIT(riscv_pmu_irq_num % BITS_PER_LONG);
> which handles the large IRQ number somewhat more generically, and reduces the
> number of bit operations needed elsewhere in the driver.

I will make changes according to your suggestions. Thank you!

> Or we could use IRQ chip operations here instead of direct CSR acccess. But
> maybe the direct CSR access is needed for performance?
> 
> Regards,
> Samuel

Best regards,
Peter Lin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
