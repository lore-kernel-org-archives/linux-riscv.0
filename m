Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C017AC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 12:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyUemhgcdev43E4sd/zZm584Ex9sOs8KbtLsFvLK2ZM=; b=CCk2uo9ulxRypT
	XIhHYewKLrlOeDI+24eZ+PfeAgVp8zbOMMZoytne8h96TcMPvQ4UwlCBk4kfKEvKVMrHNY33WD+Tt
	vXgEA9j0OTvrbtRF04opRND/f4E3gEbZ3ETjzBEhmyRzWFwrGdXti9Pz4IeOiUmr8f2mx4Oxi8elW
	qwRzTx1YM/wsoOq8vsypPfW+K9dDeNXDdQixlpYcSCApJnjAhDrJTzRl78gArj8mqKEhDaSLhmF64
	2sp5JfV5ISzGjXJBEDpImyeFxTNDT+CJwuQFcWvKk/1fHboOhZ/1KbI1up5TGXEHxbPi4mCwoU1jO
	KSVHXs8MQpbhYpfHy4NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og3mi-00E4xV-IO; Wed, 05 Oct 2022 12:46:00 +0000
Received: from smtp23.cstnet.cn ([159.226.251.23] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og3mg-00E4w9-0h
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 12:46:00 +0000
Received: from [124.16.96.231] (unknown [124.16.96.231])
	by APP-03 (Coremail) with SMTP id rQCowAAHuViEfD1j67UPAw--.48409S3;
	Wed, 05 Oct 2022 20:45:56 +0800 (CST)
Message-ID: <f2c058ec-58c9-0e23-f657-039a32b0b369@iscas.ac.cn>
Date: Wed, 5 Oct 2022 20:45:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [PATCH v5 2/4] mm: support Svnapot in physical page
 linear-mapping
To: Andrew Jones <ajones@ventanamicro.com>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
 xuyinan@ict.ac.cn
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
 <20221003134721.1772455-3-panqinglin2020@iscas.ac.cn>
 <20221005111957.ipwsokzrmf4qsfx6@kamzik>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <20221005111957.ipwsokzrmf4qsfx6@kamzik>
X-CM-TRANSID: rQCowAAHuViEfD1j67UPAw--.48409S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tF15Xw48trWkJFW8GF45ZFb_yoW8uw1DpF
	WfCF17KF4DAF1Yv39rZw18Zaya9w1aya45G34rJ3s3Aws5GF909r4Iva4YgFW8Xrs5Ga1U
	ZF4qqa48u390yaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9qb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r
	15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l
	c7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_Xr1l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjxUyDUUDUUUU
X-Originating-IP: [124.16.96.231]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiAwMKDGM9I2p+GAAAs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_054558_454688_30A59969 
X-CRM114-Status: GOOD (  17.44  )
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

Hi Andrew,

On 10/5/22 7:19 PM, Andrew Jones wrote:
> On Mon, Oct 03, 2022 at 09:47:19PM +0800, panqinglin2020@iscas.ac.cn wrote:
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> Svnapot is powerful when a physical region is going to mapped to a
>> virtual region. Kernel will do like this when mapping all allocable
>> physical pages to kernel vm space. This commit modifies the
>> create_pte_mapping function used in linear-mapping procedure, so the
>> kernel can be able to use Svnapot when both address and length of
>> physical region are 64KB align. Code here will be executed only when
>> other size huge page is not suitable, so it can be an addition of
>> PMD_SIZE and PUD_SIZE mapping.
>>
>> This commit also modifies the best_map_size function to give map_size
>> many times instead of only once, so a memory region can be mapped by
>> both PMD_SIZE and 64KB napot size.
> 
> I'd prefer to see the best_map_size() change for PMD_SIZE and PAGE_SIZE
> be a separate patch. Then, the NAPOT_CONT64KB_SIZE support can be added
> on to a ready best_map_size(). In fact, I'd prefer this patch be dropped
> from this series and the best_map_size() for PMD_SIZE and PAGE_SIZE patch
> be either posted as a first patch of the "use svnapot in early boot"
> series or be posted alone, as it's already applicable.
> 

I agree with you. I will drop this commit from the series and post the 
modification on best_map_size for PMD_SIZE and PAGE_SIZE as a single 
patch alone. I will do this in this series' v7.

Thanks,
Qinglin

>>
>> It is tested by setting qemu's memory to a 262272k region, and the
>> kernel can boot successfully.
>>
>> Currently, the modified create_pte_mapping will never take use of SVNAPOT,
>> because this extension is detected in riscv_fill_hwcap and enabled in
>> apply_boot_alternatives(called from setup_arch) which is called
>> after setup_vm_final. We will need to support function like
>> riscv_fill_hwcap_early to fill hardware capabilities more earlier, and
>> try to enable SVNAPOT more earlier in apply_early_boot_alternatives,
>> so that we can determine SVNAPOT's presence during setup_vm_final.
> 
> Thanks,
> drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
