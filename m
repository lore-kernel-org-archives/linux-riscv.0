Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8995C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 17:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkB6r04zS7IJvsObGAASlKk5Ljb1hIU+v9JBVOb4Ojo=; b=HCcdSBUsJzTIER
	sFtkZUE/SRyZxxbKK+Cg1cLV+wbHIgNyh4K9zO+7IxVh/ckEgfltyGj/krUNzT+LNNW/mjlpBo5RF
	ttBCATiBD9hn2Kf/sxaF5VCHRx5SzU97hnURLlH2CbuqFZmE4L4Zj3zf0rnGrIdqYtgBeO5HwGWVW
	kVvjf4KH1ItMZ8OI3iLJ3TzlfrQRfza7Ob+lHpC0KBu8MRBKU+i2On26IqesG2TBtM1idN4DavgXn
	H6Vs+iqPWUOmLNt13dkUoFsod4l4BB0u2qnsTxr1ABFSJXlX3WptIrzodC5Fo0dtm6E/HmxitvxBn
	7nyoXtGvQizukWejUZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Ks0-006OmB-Ae; Thu, 08 Dec 2022 17:39:40 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Krw-006Odp-Sk
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 17:39:38 +0000
Received: from [198.18.0.1] (unknown [59.59.28.169])
	by APP-01 (Coremail) with SMTP id qwCowACXnIBTIZJjZRfPBQ--.16834S2;
	Fri, 09 Dec 2022 01:39:32 +0800 (CST)
Message-ID: <5335fe02-2304-e702-6abf-93c5b213ecd3@iscas.ac.cn>
Date: Fri, 9 Dec 2022 01:39:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v9 3/3] riscv: mm: support Svnapot in huge vmap
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
 xuyinan@ict.ac.cn, conor@kernel.org, alex@ghiti.fr, jszhang@kernel.org
References: <20221204141137.691790-1-panqinglin2020@iscas.ac.cn>
 <20221204141137.691790-4-panqinglin2020@iscas.ac.cn>
 <20221208152227.2xuevqxy7k5unsvy@kamzik>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <20221208152227.2xuevqxy7k5unsvy@kamzik>
X-CM-TRANSID: qwCowACXnIBTIZJjZRfPBQ--.16834S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr1kCw15Xr1rZr1xZw1rXrb_yoWfXFXE9r
	1fAasY9F98Ja97uF98Kr45CF90kFWUua1qvrWjgan8Jr18uay3WFZ2yrZ7tr4UGFW8CF17
	Gws0qayfXry2vjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUba8YjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z2
	80aVCY1x0267AKxVW8JVW8Jr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28I
	cVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx
	0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0S
	jxkI62AI1cAE67vIY487MxkIecxEwVAFwVW8MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7IU0OTmDUUUUU==
X-Originating-IP: [59.59.28.169]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiAwAODGOR749YtgAAs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_093937_325913_EA733313 
X-CRM114-Status: UNSURE (   8.35  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hey!

On 2022/12/8 23:22, Andrew Jones wrote:
> On Sun, Dec 04, 2022 at 10:11:37PM +0800, panqinglin2020@iscas.ac.cn wrote:
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> As HAVE_ARCH_HUGE_VMAP and HAVE_ARCH_HUGE_VMALLOC is supported, we can
>> implement arch_vmap_pte_range_map_size and arch_vmap_pte_supported_shift
>> for Svnapot to support huge vmap about napot size.
>>
>> It can be tested by huge vmap used in pci driver. Huge vmalloc with svnapot
>> can be tested by changing test_vmalloc module like [1], and probe this
>> module to run fix_size_alloc_test with use_huge true.
>>
>> [1]https://github.com/RV-VM/linux-vm-support/commit/33f4ee399c36d355c412ebe5334ca46fd727f8f5
> 
> Do you plan to post this test_vmalloc.c patch?

I am sure to do it if it makes sense :)
I will send a patch of it later.

Thanks,
Qinglin.

> 
> Thanks,
> drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
