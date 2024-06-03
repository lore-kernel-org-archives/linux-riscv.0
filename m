Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782B6C25B76
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 11:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O6Z2fvNJ9aJmba/VFAc8w0Wot81jqBOPtEPHC2kP7YM=; b=x2lmYGCAPBuoX4
	GISgbkcw6qnMuLziI2AMyueTfKxTh9ZnWLFTBZOV+K8xp5IptobAwhi0yNlk1yNoVCSmmgSMQa59Q
	7rmET7nXVdNttb21mzLKjmy85YeErDmRZDr9y1hBNhrsbADBezyR7WDi7yJfzLgnRRUh2z0NDSZ0f
	MivGh6ftNxnBt8/0++k1f6S4U4+12l6NYbfOCae6UrxZ8w76sbvfYHWoGn0A8SsQpe7rKWyJ49Nkp
	EluBUYbZGTai1P9kRWMVHcHUdXgW1drhVy5ryTdTK7Q0GmZCXsGVuxwKjKH5xCFVLskveLxHBj/RR
	G0GcS+pkY7At3S9jnnDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE5g9-0000000GUYP-21HD;
	Mon, 03 Jun 2024 11:16:41 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE5g6-0000000GUX3-0ywF
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 11:16:40 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VtB313wvyzclBp;
	Mon,  3 Jun 2024 19:15:09 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
	by mail.maildlp.com (Postfix) with ESMTPS id ACEE1180A9C;
	Mon,  3 Jun 2024 19:16:32 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 19:16:32 +0800
Message-ID: <0c16ed1e-5f23-ff6b-80b9-4696fe442e7f@huawei.com>
Date: Mon, 3 Jun 2024 19:16:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] irqchip/riscv-aplic: Simplify the to_of_node code
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, <anup@brainfault.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>
References: <20240527125000.3502935-1-ruanjinjie@huawei.com>
 <87ed9e71ws.ffs@tglx>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87ed9e71ws.ffs@tglx>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_041638_484353_27022D31 
X-CRM114-Status: UNSURE (   6.16  )
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



On 2024/6/3 18:31, Thomas Gleixner wrote:
> On Mon, May 27 2024 at 12:50, Jinjie Ruan wrote:
>> The to_of_node has is_of_node check, so there is no need to repeat the
>> is_of_node and to_of_node. And if is_of_node is false, the to_of_node will
>> return NULL, the of_property_present will also return NULL, so remove the
>> redundant check.
> 
> Please read:
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#function-references-in-changelogs

Thank you, I will read the documentation carefully and change the commit
message as requested.

> 
> Thanks,
> 
>         tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
