Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54400C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 02:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfVwgwiSoIyZoDkX9DGYvT+tNuWkUO5LZHjWVwb8090=; b=38v5GNcN1NmfY4wFSqpqLKG+Dg
	JQeQGne/kPMRu+gk5qEywU+RbiAsQcm9wLr3uY4sYxEkBhm4YCZoBpKwNQlBdWKk2miq5VcMdhHnX
	VqhPtl2yHjkUfqop9MNbScN9sM2m9pfV9jvux+lx8TG2l7C3nUehXSewrApybqzu7H61nqVh1pS5X
	yrmAhSEj71IZOy6D9qGn9neuW4kt4MsMt/+0ETyhgyDsb/S7CAnc6K2WJWwb81ZgeZY5Gjtq5GrDK
	TcItv/a3c3k3u+IB0veAC9glZyMU7MFf/ziiHC+KjQRZseZRmNGw28bCQnF5YtVA4ZpIOZUbfygvw
	Wl6Sgetw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBRtW-00GfXy-F4; Wed, 13 Jul 2022 02:14:30 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBRtN-00GfNB-1m
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 02:14:22 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LjLgZ3tNlzVfjb;
	Wed, 13 Jul 2022 10:10:34 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 13 Jul 2022 10:14:08 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 13 Jul 2022 10:14:07 +0800
Subject: Re: [PATCH -next 2/2] spi: microchip-core: switch to use
 devm_spi_alloc_master()
To: <Conor.Dooley@microchip.com>
CC: <Daire.McNamara@microchip.com>, <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20220712135357.918997-1-yangyingliang@huawei.com>
 <20220712135357.918997-2-yangyingliang@huawei.com>
 <87581e76-ceb7-9efa-d6dd-5ad4fe66111a@microchip.com>
 <687d4652-c231-bfa5-f76f-ac826ab1fe98@microchip.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <35cfbaa3-d21a-f75c-7f89-3624e7b43f33@huawei.com>
Date: Wed, 13 Jul 2022 10:14:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <687d4652-c231-bfa5-f76f-ac826ab1fe98@microchip.com>
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_191421_297418_EE1E7AA8 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2022/7/13 4:50, Conor.Dooley@microchip.com wrote:
> On 12/07/2022 15:03, Conor.Dooley@microchip.com wrote:
>> On 12/07/2022 14:53, Yang Yingliang wrote:
>>> [Some people who received this message don't often get email from yangyingliang@huawei.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Switch to use devm_spi_alloc_master() to simpify error path.
>> Hey Yang,
>> Thanks for trying to fix my mistakes!
>>
>> Forgive my innocence here, but why is it okay to remove the
>> spi_master_put() in remove() but not the one in the error path of
>> the probe function?
>>
>> If the devm_add_action_or_reset() in devm_spi_register_controller()
>> fails won't the same thing apply to the probe error path?
>>
>> IOW, I think this patch needs a fixes tag too b/c it also fixes a
>> refcount underflow. Please correct me if I am misunderstanding.
> Ahh, I just saw your revert of 59ebbe40fb51 ("spi: simplify
> devm_spi register_controller"). With that, this makes a lot more
> sense.
>
>> One other comment below.
> This comment still applies for this patch. dev_err_probe would be
> nice.
OK.

Thanks,
Yang
>
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
