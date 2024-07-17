Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA552C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 07:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/Nba/f/XBMKBEv/0jmUcsmfmXxP2OQAkcWG0N8vp2A=; b=f4Ii8yMZ7wM06s
	6TBQB3qaMCHM98BaIDpIqx4+nRXUKBRIk6IFvxbHYMekRO+PDK/qsH8VLBK9xGxY/GsQdc+DeRpMP
	em2GFm4kKf9oS7xsIzskjfBshYmGXXES93jVbbMUFhgVo+IVtWQIIg9pZRF2Tsfjews9dN4q6lQJM
	h9x+HwEIa2uYbHO2acKQ5iuKRAWunl8AKS0Be/kOpOmaltAGV/qYkXZIuNtlVeHSHJKhmmuUEbjnJ
	kTWVjHnj6r+YBalLwr/I9+elBmoHmxdy/UINyjlLQ4ZVSxnHI9Jfj3AnIk5gA2dbfwwoH2u3SpLV6
	oy++VtUjdXYvDlbmqAZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTzXd-0000000D355-2ZVr;
	Wed, 17 Jul 2024 07:57:37 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTzXZ-0000000D33K-2Hmp
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 07:57:36 +0000
Received: from [198.18.0.1] (unknown [180.110.112.93])
	by APP-01 (Coremail) with SMTP id qwCowADn7spceZdmjKzWAw--.1729S2;
	Wed, 17 Jul 2024 15:57:16 +0800 (CST)
Message-ID: <f95ace9c-112d-4660-b009-a30a3b227694@iscas.ac.cn>
Date: Wed, 17 Jul 2024 15:57:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: add tracepoints for page fault
To: linux-riscv@lists.infradead.org
References: <20240715101400.39103-1-zhuhengbo@iscas.ac.cn>
 <ZpUlxa2yqtkVvUBb@casper.infradead.org>
From: Zhu Hengbo <zhuhengbo@iscas.ac.cn>
In-Reply-To: <ZpUlxa2yqtkVvUBb@casper.infradead.org>
X-CM-TRANSID: qwCowADn7spceZdmjKzWAw--.1729S2
X-Coremail-Antispam: 1UD129KBjvdXoWrurWxWryUWr4rJr13JryrZwb_yoWfArgEqF
	1xtw1rG3WUXr17tF4YgwnrJrnxZ34I9ry5Ja48Xr9FvFy5CrnIgw1kKrZrt3WxJr97tFnr
	CF9aqr1rtr4fWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbrAYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWxJVW8Jr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUJVWUXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8
	JbIYCTnIWIevJa73UjIFyTuYvjxU2co2UUUUU
X-Originating-IP: [180.110.112.93]
X-CM-SenderInfo: x2kxxvpqje0q5lvft2wodfhubq/1tbiBwoBDGaXTZmW5gABsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_005734_012877_B6D7F1FF 
X-CRM114-Status: UNSURE (   7.37  )
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


On 2024/7/15 21:36, Matthew Wilcox wrote:
> On Mon, Jul 15, 2024 at 10:13:55AM +0000, Zhu Hengbo wrote:
>> Introduce page_fault_user and page_fault_kernel for riscv page fault.
>> Help to get more detail information when page fault happen.
> Why be different from x86?
>
>         TP_printk("address=%ps ip=%ps error_code=0x%lx",
>                   (void *)__entry->address, (void *)__entry->ip,
>                   __entry->error_code) );
>
> adding the instruction pointer (ip) seems like it would be useful.
>
Yes, adding the ip information will indeed be helpful. I will update this patch.

Thanks for the suggestion.

>> +	TP_printk("user page fault, address=%ps cause=0x%lx",
>> +		  (void *)__entry->address, __entry->cause)
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
