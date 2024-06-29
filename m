Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD1AC2BD09
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jun 2024 02:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Qlcuj2VP5u58Dz6BAQvprxuMiV6O6FjSleAfR9rOLE=; b=GjfqVcWyBvE+RK
	nQ7z1jY5UP8KCEtouSE995DKmk8DWcxIoU5WlNNFVegilvx4prFnIv+i2lIA9letpsRXrVuI5AqBq
	azQQY8A8b5VvpsV4BpSpO5xt1AcDgdN/xm6EZi7zh7KNyn3IALIgM/wzXkAqHblon54RTK1WPNzBY
	LY3vq8xCHurG5dodJw5eeSU3qNjiGlcb1EIOj48qVE+AOaxcwR5gK/15stMKobNW59DMsCmsKMgf4
	o5GEMZXbFmwEuFq0xSVdFW2PbaC4lBeojMI2FYBcr9QPVv4YCu6tLWfSIhWwrQ0EP7pVnKwNkW229
	U3+KIExk18+OMYGDpq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNNOT-0000000Ff90-2EuL;
	Sat, 29 Jun 2024 02:00:49 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNNOQ-0000000Ff8F-04Hp
	for linux-riscv@lists.infradead.org;
	Sat, 29 Jun 2024 02:00:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4W9wQr3nqszMrH7;
	Sat, 29 Jun 2024 09:56:52 +0800 (CST)
Received: from kwepemf500004.china.huawei.com (unknown [7.202.181.242])
	by mail.maildlp.com (Postfix) with ESMTPS id D6E0E18006F;
	Sat, 29 Jun 2024 10:00:35 +0800 (CST)
Received: from [10.67.121.175] (10.67.121.175) by
 kwepemf500004.china.huawei.com (7.202.181.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 29 Jun 2024 10:00:35 +0800
Message-ID: <3a09fcf9-b60b-571d-3ec5-e0f7c02cd72f@huawei.com>
Date: Sat, 29 Jun 2024 10:00:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] dmaegine: virt-dma : Fix multi-user with vchan
To: Frank Li <Frank.li@nxp.com>
CC: <vkoul@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Samuel
 Holland <samuel.holland@sifive.com>, Li Zetao <lizetao1@huawei.com>, Guanhua
 Gao <guanhua.gao@nxp.com>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM"
	<dmaengine@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open
 list:FREESCALE eDMA DRIVER" <imx@lists.linux.dev>, "open list:SIFIVE DRIVERS"
	<linux-riscv@lists.infradead.org>
References: <20230720114212.51224-1-haijie1@huawei.com>
 <20240620025400.3300641-1-haijie1@huawei.com>
 <ZnQ/AyffdW+u9C8P@lizhi-Precision-Tower-5810>
From: Jie Hai <haijie1@huawei.com>
In-Reply-To: <ZnQ/AyffdW+u9C8P@lizhi-Precision-Tower-5810>
X-Originating-IP: [10.67.121.175]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf500004.china.huawei.com (7.202.181.242)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_190046_489591_AFBBAB13 
X-CRM114-Status: GOOD (  17.08  )
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

On 2024/6/20 22:38, Frank Li wrote:
> On Thu, Jun 20, 2024 at 10:53:53AM +0800, Jie Hai wrote:
>> List desc_allocated was introduced for the case of a transfer
>> submitted multiple times. But elegating descriptors on the list
>> causes other problems.
>>
>> For example, in the multi-thread scenario, which tasks are
>> continuously created and submitted by each thread. If one of
>> the threads calls dmaengine_terminate_all, for dirvers using
>> vchan_get_all_descriptors, all descriptors will be freed. If
>> there's another thread submitting a transfer A by
>> vchan_tx_submit, the following results may be generated:
>> 1. desc A is freeing -> visit wrong address of node prep/next.
>> 2. desc A is freed -> visit invalid address of A.
>>
>> In the above case, calltrace is generated and the system is
>> suspended. This can be tested by dmatest.
> 
> What's test steps to reproduce this problem?
> 
> Frank
Thanks for your review.
The operations are as follows:
   modprobe hisi_dma
   modprobe dmatest
   echo 0 > /sys/module/dmatest/parameters/iterations
   echo "dma0chan0" > /sys/module/dmatest/parameters/channel
   echo 20 > /sys/module/dmatest/parameters/threads_per_chan
   echo 1 > /sys/module/dmatest/parameters/run
wait for a while and stop the test by:
   echo 0 > /sys/module/dmatest/parameters/run
>>
>> This patch removes desc_allocated from vchan_get_all_descriptors,
>> and add new function 'vchan_get_all_allocated_descs' to get all
>> descriptors ever allocated.
>>
>> And apply vchan_get_all_allocated_descs to free chan resource and
>> vchan_get_all_descriptors to terminate all transfers, respectively.
>> This avoids freeing up descriptors in use by other threads.
>>
>> Signed-off-by: Jie Hai <haijie1@huawei.com>
>> ---
>>   drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c |  2 +-
>>   drivers/dma/fsl-edma-common.c           |  2 +-
>>   drivers/dma/fsl-qdma.c                  |  2 +-
>>   drivers/dma/sf-pdma/sf-pdma.c           |  2 +-
>>   drivers/dma/virt-dma.h                  | 20 ++++++++++++++++++--
>>   5 files changed, 22 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c b/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
>> index 36384d019263..efdecf15e1b3 100644
>> --- a/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
>> +++ b/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
>> @@ -71,7 +71,7 @@ static void dpaa2_qdma_free_chan_resources(struct dma_chan *chan)
>>   	LIST_HEAD(head);
>>   
>>   	spin_lock_irqsave(&dpaa2_chan->vchan.lock, flags);
>> -	vchan_get_all_descriptors(&dpaa2_chan->vchan, &head);
>> +	vchan_get_all_allocated_descs(&dpaa2_chan->vchan, &head);
>>   	spin_unlock_irqrestore(&dpaa2_chan->vchan.lock, flags);
>>   
>>   	vchan_dma_desc_free_list(&dpaa2_chan->vchan, &head);
>> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
>> index 3af430787315..1e0ad87eb7fa 100644
>> --- a/drivers/dma/fsl-edma-common.c
>> +++ b/drivers/dma/fsl-edma-common.c
>> @@ -828,7 +828,7 @@ void fsl_edma_free_chan_resources(struct dma_chan *chan)
>>   	if (edma->drvdata->dmamuxs)
>>   		fsl_edma_chan_mux(fsl_chan, 0, false);
>>   	fsl_chan->edesc = NULL;
>> -	vchan_get_all_descriptors(&fsl_chan->vchan, &head);
>> +	vchan_get_all_allocated_descs(&fsl_chan->vchan, &head);
>>   	fsl_edma_unprep_slave_dma(fsl_chan);
>>   	spin_unlock_irqrestore(&fsl_chan->vchan.lock, flags);
>>   
>> diff --git a/drivers/dma/fsl-qdma.c b/drivers/dma/fsl-qdma.c
>> index 5005e138fc23..7af428db404e 100644
>> --- a/drivers/dma/fsl-qdma.c
>> +++ b/drivers/dma/fsl-qdma.c
>> @@ -316,7 +316,7 @@ static void fsl_qdma_free_chan_resources(struct dma_chan *chan)
>>   	LIST_HEAD(head);
>>   
>>   	spin_lock_irqsave(&fsl_chan->vchan.lock, flags);
>> -	vchan_get_all_descriptors(&fsl_chan->vchan, &head);
>> +	vchan_get_all_allocated_descs(&fsl_chan->vchan, &head);
>>   	spin_unlock_irqrestore(&fsl_chan->vchan.lock, flags);
>>   
>>   	vchan_dma_desc_free_list(&fsl_chan->vchan, &head);
>> diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
>> index 428473611115..4dc8a8c8ad80 100644
>> --- a/drivers/dma/sf-pdma/sf-pdma.c
>> +++ b/drivers/dma/sf-pdma/sf-pdma.c
>> @@ -147,7 +147,7 @@ static void sf_pdma_free_chan_resources(struct dma_chan *dchan)
>>   	sf_pdma_disable_request(chan);
>>   	kfree(chan->desc);
>>   	chan->desc = NULL;
>> -	vchan_get_all_descriptors(&chan->vchan, &head);
>> +	vchan_get_all_allocated_descs(&chan->vchan, &head);
>>   	sf_pdma_disclaim_chan(chan);
>>   	spin_unlock_irqrestore(&chan->vchan.lock, flags);
>>   	vchan_dma_desc_free_list(&chan->vchan, &head);
>> diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
>> index 59d9eabc8b67..4492641b79f6 100644
>> --- a/drivers/dma/virt-dma.h
>> +++ b/drivers/dma/virt-dma.h
>> @@ -187,13 +187,29 @@ static inline void vchan_get_all_descriptors(struct virt_dma_chan *vc,
>>   {
>>   	lockdep_assert_held(&vc->lock);
>>   
>> -	list_splice_tail_init(&vc->desc_allocated, head);
>>   	list_splice_tail_init(&vc->desc_submitted, head);
>>   	list_splice_tail_init(&vc->desc_issued, head);
>>   	list_splice_tail_init(&vc->desc_completed, head);
>>   	list_splice_tail_init(&vc->desc_terminated, head);
>>   }
>>   
>> +/**
>> + * vchan_get_all_allocated_descs - obtain all descriptors
>> + * @vc: virtual channel to get descriptors from
>> + * @head: list of descriptors found
>> + *
>> + * vc.lock must be held by caller
>> + *
>> + * Removes all descriptors from internal lists, and provides a list of all
>> + * descriptors found
>> + */
>> +static inline void vchan_get_all_allocated_descs(struct virt_dma_chan *vc,
>> +	struct list_head *head)
>> +{
>> +	list_splice_tail_init(&vc->desc_allocated, head);
>> +	vchan_get_all_descriptors(vc, head);
>> +}
>> +
>>   static inline void vchan_free_chan_resources(struct virt_dma_chan *vc)
>>   {
>>   	struct virt_dma_desc *vd;
>> @@ -201,7 +217,7 @@ static inline void vchan_free_chan_resources(struct virt_dma_chan *vc)
>>   	LIST_HEAD(head);
>>   
>>   	spin_lock_irqsave(&vc->lock, flags);
>> -	vchan_get_all_descriptors(vc, &head);
>> +	vchan_get_all_allocated_descs(vc, &head);
>>   	list_for_each_entry(vd, &head, node)
>>   		dmaengine_desc_clear_reuse(&vd->tx);
>>   	spin_unlock_irqrestore(&vc->lock, flags);
>> -- 
>> 2.33.0
>>
> .

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
