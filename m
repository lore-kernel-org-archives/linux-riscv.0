Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCABEEF303
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 05:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7HJ2JYbcr3Bw95W4IJSoOttjHGlbX8fOmcF92FQxzCw=; b=vDkkF84+TVWhxs
	7eAQsVEgYI8ktxRsmmUO+wuOl34NWq4/OFGRSORbFgHxai9hOHoPxQqogn1sgWPneZIgDywUB8s1n
	8/pU0pojy9yFims36QX5IfXHlQbPMFOFOxWTc43Mlled1N+Xh6HiBf28zAZeAq60Vlv6nys855RPZ
	WbiSDL4CxeEZJVOFnRUybRPJDowE4+xlVX05SEoaAG5Wf0rjAlf2diT2oRAtmL2KR+b+gUtc+iGaX
	g1qU4HtdmTNI9hNB8FnjGCBp5hmG2zy4xOlPqCoOk9WH9xDf3Kc/2gTdwNwp1u+hTsVPJK0EuwysM
	zNc9WxLmfljGzRhfpgwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1gJ-00000000xyS-0RNz;
	Thu, 05 Mar 2026 05:55:31 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1gE-00000000xxu-3inj
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 05:55:29 +0000
Received: from [10.213.19.140] (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowABH1Qi8Gqlpj0uuCQ--.59493S2;
	Thu, 05 Mar 2026 13:55:08 +0800 (CST)
Message-ID: <74fd6fda-7607-4afd-a596-b95ca44c4fa5@iscas.ac.cn>
Date: Thu, 5 Mar 2026 13:55:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/4] net: spacemit: Remove unused buff_addr
 fields
To: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Yixun Lan <dlan@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260303-k1-ethernet-more-fixes-v1-0-0ab0122fdd14@iscas.ac.cn>
 <20260303-k1-ethernet-more-fixes-v1-1-0ab0122fdd14@iscas.ac.cn>
 <02bbff3d-1f27-4b03-a963-660bbb7facee@lunn.ch>
 <20260304140535.678e65f2@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260304140535.678e65f2@kernel.org>
X-CM-TRANSID: zQCowABH1Qi8Gqlpj0uuCQ--.59493S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GrWxJr4UtrWUJr1fWr1rZwb_yoWxCrg_XF
	1jy3W8Cr4DGr17GrZ7KwsrJrZFya92qryvvw1Yqr43J34fArZaqr4kKr1fK3WfA3yqqr1D
	KFyYv3y5ur1jvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbakYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GrWl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUgsmRDUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_215527_320148_9834F8CD 
X-CRM114-Status: UNSURE (   6.41  )
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

On 3/5/26 06:05, Jakub Kicinski wrote:
> On Wed, 4 Mar 2026 21:57:57 +0100 Andrew Lunn wrote:
>> On Tue, Mar 03, 2026 at 05:24:18PM +0800, Vivian Wang wrote:
>>> These were never used. Just remove them.
>>>
>>> Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")  
>> If you are giving a Fixes: tag, please use the net tree, not net-next.
> Maybe rephrasing what Andrew said slightly - please read
> https://www.kernel.org/doc/html/next/process/maintainer-netdev.html
> and general documentation about Fixes tags. The tags mean there is
> a bug which may be impacting users.

Sorry for misunderstanding this. I'll fix it in v2.

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
