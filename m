Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BADE2C4708E
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 06:22:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74F38613B6
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 06:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74F38613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ie8VG2srVF3TwVWpZT0203tlLh77YO8K2jEDLygLkVI=; b=uZJ2vxOSMmXfFmDSQzO/yFZRTk
	Kp6AJmyRBXABqI2LVhRSAC+OJ/v+9G/vwZb74migB2veC5f6Nct/jRaQp9d3EucroBakIbu6tfJJr
	L25pvd2/rDOnox9L1gTkDEoOiBbQepkrB8/vOONYMvTyqa4s1ytgb/udl6Q1oUM/T1mLV+yQsh8eG
	w6GmXmsDU7xKdSLUrAvezJDD9SYOw9St+sOJM+q3+GB3e69LFmumApO90885QMZk67XXPDom6Yv44
	mEER9XBHs7xFt5woM/N4tK28ekFTR7AtWbTOjf4IacH9/xnw35aKTEmlTEfqPohpbPLqdCdRckKq3
	a78PJGSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmsLn-003WHO-Vs; Sat, 29 May 2021 06:21:35 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmsLk-003WFC-TE
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 06:21:34 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FsWXy2tp8zWnyy;
 Sat, 29 May 2021 14:16:50 +0800 (CST)
Received: from dggpemm500004.china.huawei.com (7.185.36.219) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 14:21:27 +0800
Received: from [10.174.177.91] (10.174.177.91) by
 dggpemm500004.china.huawei.com (7.185.36.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 14:21:27 +0800
Subject: Re: [PATCH -next] module: fix build error when CONFIG_SMP is disabled
To: "Sunnanyong (Nanyong Sun, Intelligent Computing Solution Development Dep)"
 <sunnanyong@huawei.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <aou@eecs.berkeley.edu>
CC: <vincent.chen@sifive.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20210529020328.36863-1-cuibixuan@huawei.com>
 <4798a93f-f0a5-60f6-5b02-7d507fe60d4f@huawei.com>
From: Bixuan Cui <cuibixuan@huawei.com>
Message-ID: <f3011e4e-9d7c-39c0-e159-31c6df137875@huawei.com>
Date: Sat, 29 May 2021 14:21:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <4798a93f-f0a5-60f6-5b02-7d507fe60d4f@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500004.china.huawei.com (7.185.36.219)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_232133_174402_46A23B49 
X-CRM114-Status: UNSURE (   7.77  )
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



On 2021/5/29 12:43, Sunnanyong (Nanyong Sun, Intelligent Computing Solution Development Dep) wrote:
> Move the prototype of flush_pmd_tlb_range from pgtable.h to tlbflush.h
> 
> can also fix this problem, and it seems that declare flush_pmd_tlb_range in tlbflush.h
> 
> is better.
> 
> We could
Agree with you.

Thanks
Bixuan Cui

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
