Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697C8C7EE2D
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 15:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEdpWI9eSHq2yMgw30rkC0zey16dLhUVSM4JBvy7sz0=; b=LQf6/9XEkslyUq
	sgVRCVFM+WGD49qWItC7at0b8hjuMqGywniBa8kJQBamDT8ebobohcQpVGgs1DPMTvfiZ75sFX5Zw
	XRu00yvdZ3eNagCY3oOULSBh9TRT2WfJBv3OGunyDVfxTqjRm9bPfGMR1lmnUQexNlRH/EAZr/W3C
	+LRSF+8ldae34FCxNDVrC0G76j7691MxDpbtlYhglwVwXyiUkaN8IcF3z/yZ+0TltaVcg/gpy85KL
	xtS/0b5WrJw4ZzzNVfAzwuF+szBBAR6KR9Ew+KNKRut5BHbFF8YvG8mPRm4bPwU7M6NEU879No4Si
	xbnTM7Mo0jOEXDPfPeKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ToL-00AcaZ-1X;
	Tue, 23 May 2023 15:20:29 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ToI-00AcZ9-0L;
	Tue, 23 May 2023 15:20:26 +0000
Message-ID: <09f31255-e214-01d7-318a-13d712f73837@infradead.org>
Date: Tue, 23 May 2023 08:20:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dmaengine: pl330: rename _start to prevent build error
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jaswinder Singh <jassisinghbrar@gmail.com>,
 Jaswinder Singh <jassi.brar@samsung.com>, Boojin Kim
 <boojin.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>, dmaengine@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20230523000606.9405-1-rdunlap@infradead.org>
 <ZGzI+gsYdF6kEHFk@matsya>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZGzI+gsYdF6kEHFk@matsya>
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



On 5/23/23 07:08, Vinod Koul wrote:
> On 22-05-23, 17:06, Randy Dunlap wrote:
>> "_start" is used in several arches and proably should be reserved
>> for ARCH usage. Using it in a driver for a private symbol can cause
>> a build error when it conflicts with ARCH usage of the same symbol.
>>
>> Therefore rename pl330's "_start" to "_start_thread" so that there
>> is no conflict and no build error.
> 
> Why not rename to pl330_start or pl330_start_thread to ensure we will
> might not conflict ever!
> 

Ok, will do. Thanks.

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
