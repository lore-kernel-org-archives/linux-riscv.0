Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B4FC79F9E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 02:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J60wuR/AFApgBLfg8n1/qmhcfPTkUBwjxDI1el17T2k=; b=bWe1tb7QIA68ai
	ExKC9Eay3bl3OPoJZIx29D3daf8n1mkNFNrekujx+kG8YzQe3MIfow3b7xw/05bRDHba0FHy4si0E
	D/Tw+s16KqQlDI7xbzUsbBLeB8Ef8dbksIhsMi51opaPdy6sxjZ3/6k/1ZUqZCMu/cqv2UX8MQSsI
	i5snLvZe9cOeV7lhz3EK1xBI30A0Aef9b1WlN7lEgPq0FedVQ3mSZpPMEiYfwjvNbf9Tj8Jj8K+g2
	ZvbzJIxCqnNTt4EV0+INOHXEcz4UgZBC0ccuFf0ZurxnY3gWljN1e45hCGzcOQQe4rKYVCyLZ+YTh
	1CM2yQjlSKyZ+UJ+b/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3m0t-00000007wtI-3RbK;
	Tue, 08 Sep 2026 02:56:47 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3m0n-00000007wqO-2ZKp
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 02:56:46 +0000
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id 3ddTxpREfLvgb3m0VxLXyj; Tue, 08 Sep 2026 02:56:23 +0000
Received: from gator4166.hostgator.com ([108.167.190.91])
	by cmsmtp with ESMTPS
	id 3m0Tx7xrM9tXG3m0Txzc3W; Tue, 08 Sep 2026 02:56:22 +0000
X-Authority-Analysis: v=2.4 cv=KK1aDEFo c=1 sm=1 tr=0 ts=6a9f7956
 a=vY9Mjuda9oMEc2E4Cx1x2A==:117 a=vY9Mjuda9oMEc2E4Cx1x2A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=Zo5euW2OAAAA:8 a=hKUfJe5KFNZvrTfkyfoA:9 a=QEXdDO2ut3YA:10
 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pzu+31EHQDtgHMoLr2rB9t7rnhgD7c+9/SW4rLIamaA=; b=H2yCuUhQ80IFtzJJi9mKVHXYkd
	ARjvM4XvKTcyW9NyOHqGhSy+LZ1eebRRDRXprtFQsZ4y7lPn0DQlB1e2GPjt+4JDIPf10AhD+Tb7a
	KPMZUhUpvGuSFqxgE3ShWq2UaPEygEoU1ouJhMP0mDFn/RybUeH4/W7LToQb32i4U6FOeKT6Lc5S3
	qG/5idH5Sm/Vcn4OEy5Vh4cpVhUQ2wZvIQG//Hni3F/uz2Oq2/nDFg/pTY5v++32GbZtH+dqdLXvu
	IBS9NoGg9ntY7X29R+ioKks6R2zag5HCC8V4tUpmcChTSqAPD9dR+fE+xegcRgzot1Q4Bsz7xhVvA
	0707Ua5g==;
Received: from flh4-125-195-69-90.tky.mesh.ad.jp ([125.195.69.90]:50500 helo=[10.203.100.33])
	by gator4166.hostgator.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.5)
	(envelope-from <gustavo@embeddedor.com>)
	id 1x3m0S-00000001ua5-4B56;
	Mon, 07 Sep 2026 21:56:21 -0500
Message-ID: <ce401b42-9dfb-4c8e-9051-7ba08c107382@embeddedor.com>
Date: Tue, 8 Sep 2026 11:56:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: tenstorrent: Assign .num before accessing .hws
To: Aamir Ahmed <elb12345@hotmail.co.uk>,
 Drew Fustini <dfustini@oss.tenstorrent.com>,
 Joel Stanley <jms@oss.tenstorrent.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org,
 stable@vger.kernel.org
References: <AS8P251MB00013BD9A093C06D2D60E10EC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <AS8P251MB00013BD9A093C06D2D60E10EC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 125.195.69.90
X-Source-L: No
X-Exim-ID: 1x3m0S-00000001ua5-4B56
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: flh4-125-195-69-90.tky.mesh.ad.jp ([10.203.100.33]) [125.195.69.90]:50500
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 8
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfM2PU7uUNhGuEaavpfbaAAXrTGUM/vKG89JGLoFE1OChvlmFebuLF8kR+DSN5LhyuUhvI52z3SNZxpAjiFl2H0a2t86G7p3N0diNTdzfDtn5VGyf2lef
 YcrqQLmO6tpab16kc/OW/JV8b19gCVd1UJ9TT2DjHkfW+HEHVFUMAzFy7APWCgvyYR7Cde6Vhn2jKgcIlPwUuq06oz/PYAwoSGwjd2nKBtt5jg9r/5qnwnQS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_195645_301696_C0FA9B76 
X-CRM114-Status: GOOD (  10.04  )
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



On 9/6/26 05:48, Aamir Ahmed wrote:
> Commit f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with
> __counted_by") annotated the hws member of 'struct clk_hw_onecell_data'
> with __counted_by, which informs the bounds sanitizer (UBSAN_BOUNDS)
> about the number of elements in .hws[], so that it can warn when .hws[]
> is accessed out of bounds. As noted in that change, the __counted_by
> member must be initialized with the number of elements before the first
> array access happens, otherwise there will be a warning from each access
> prior to the initialization because the number of elements is zero.
> This occurs in atlantis_prcm_clocks_register() due to .num being
> assigned only after every clock has been stored in .hws[]. With
> CONFIG_UBSAN_BOUNDS and a compiler that implements __counted_by (GCC
> 15.1+ or Clang 20.1+), this triggers an array-index-out-of-bounds report
> during probe, and with CONFIG_UBSAN_TRAP the first store traps so the
> clock provider never registers.
> 
> Move the .num initialization to right after the allocation.
> 
> Cc: stable@vger.kernel.org
> Fixes: 23c8ebc95284 ("clk: tenstorrent: Add Atlantis clock controller driver")
> Assisted-by: LLM
> Signed-off-by: Aamir Ahmed <elb12345@hotmail.co.uk>

LGTM:

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Also, see more comments below...

> diff --git a/drivers/clk/tenstorrent/atlantis-prcm.c b/drivers/clk/tenstorrent/atlantis-prcm.c
> index 6d4386eeb7d..a68534a295c 100644
> --- a/drivers/clk/tenstorrent/atlantis-prcm.c
> +++ b/drivers/clk/tenstorrent/atlantis-prcm.c
> @@ -796,6 +796,8 @@ static int atlantis_prcm_clocks_register(struct device *dev,
>   	if (!clk_data)
>   		return -ENOMEM;
>   
> +	clk_data->num = num_clks;

Looks like variable num_clks can be removed entirely, and just do:

clk_data->num = data->num;

Thanks
-Gustavo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
