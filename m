Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EFFC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 04:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iDxWmph9PkOEQqBsEhiSzdYGP91cxTwrVDRYpfcaSbA=; b=G6weVDc7dDh310
	znS9Vd6VvRS9Dca4wJYV2QICZkrT283VELTGi9bekuZMrsQEz4tOSkDhP5huBqxKfMjWQV44CHACM
	OCZhIVGdY3IrRafNS6KUeZf21ZewNqyswoCG6heI4rbHJcWv4XqLBfQw9KJ6Mr9solc/rg8NO/yVQ
	TNMniZRF9yyVzG6yazEd0FKLS/tUzu8uvZ2jAq+5Z5iR/SocW/uXwUBG+ch3u/5gM4twbkgpahUl2
	Sv00W3RwjjGQGAoLtIgaKr1M1/eOcaGfloxZu6GrIr040qm/WSgg9Eis7fx4oV22QWLqxcib8IEtM
	IGQ5rfW4BhEUZVMMez/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofwH6-00CR0I-Si; Wed, 05 Oct 2022 04:44:52 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofwH3-00CQzt-0S
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 04:44:51 +0000
Received: from [198.18.0.1] (unknown [124.16.96.231])
	by APP-01 (Coremail) with SMTP id qwCowACXnvq9Cz1jPa1LAw--.23517S2;
	Wed, 05 Oct 2022 12:44:46 +0800 (CST)
Message-ID: <6b2f68ac-2df5-aab3-b032-f40b420a74be@iscas.ac.cn>
Date: Wed, 5 Oct 2022 12:44:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v5 4/4] mm: support Svnapot in huge vmap
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
 xuyinan@ict.ac.cn
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
 <20221003134721.1772455-5-panqinglin2020@iscas.ac.cn> <Yzx/fdjxLZodZLlO@spud>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <Yzx/fdjxLZodZLlO@spud>
X-CM-TRANSID: qwCowACXnvq9Cz1jPa1LAw--.23517S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Wry7Xw1rtw1rAFy5KFWUtwb_yoW8GFWUpr
	WxJFs29ryjqrWfuFWay3W8WrWYqan3KayfGrykta1rZr15Cr929rsY9w1IvryUArW0grWj
	9Fyxur90gwn8A37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9ab7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4j6r4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x0
	82IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXw
	Av7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0
	xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7IU0U8n5UUUUU==
X-Originating-IP: [124.16.96.231]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCgMKDGM8RdDWBgAAsV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_214449_447173_F9ED4E74 
X-CRM114-Status: GOOD (  13.85  )
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

Hi Conor,

On 10/5/22 2:46 AM, Conor Dooley wrote:
> On Mon, Oct 03, 2022 at 09:47:21PM +0800, panqinglin2020@iscas.ac.cn wrote:
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> The HAVE_ARCH_HUGE_VMAP option can be used to help implement arch
>> special huge vmap size. This commit selects this option by default and
>> re-writes the arch_vmap_pte_range_map_size for Svnapot 64KB size.
>>
>> It can be tested when booting kernel in qemu with pci device, which
>> will make the kernel to call pci driver using ioremap, and the
>> re-written function will be called.
>>
>> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 3d5ec1391046..571f77b16ee8 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -70,6 +70,7 @@ config RISCV
>>   	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
>>   	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
>>   	select HAVE_ARCH_AUDITSYSCALL
>> +	select HAVE_ARCH_HUGE_VMAP
> 
> Maybe you should take a look at the following patchset and see how your
> code interacts with it:
> https://lore.kernel.org/linux-riscv/20220915065027.3501044-1-liushixin2@huawei.com/
> 
> Possible you may have some feedback for Liu Shixin or get some ideas :)
> 
> Thanks,
> Conor.
> 

Will have a look at it and to interact with it:)
Thanks for your information again : )

Qinglin.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
