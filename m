Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99530C53210
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jan 2023 06:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vDHOIDXcueeEL7FsaEDGP5Ie2keBXwRvE8zmsd2kQc=; b=voAUZuk9XSb/U8
	2aMoQAEJwZibxyNmmdtyVh4tGJY8dU8ig51OsCeW+iOHtW8TTBjqPPuB0QBJaGXBQOLSVCRRRZPNd
	VUtDAshofnOEncdMepHDLWf9JNA2aW7RtuC0MHbuL6AI3IAA2eCFmL3mUBJa1q258mjcHS+nAoUci
	VXp7NzMyAUPnWcg9V76Wk4XhtzZ8ZeTcvIHwXdsTEmgLhli/dQ0VDHuz/LeD36bZfAO5GtLRkr92r
	JIkuJvTRidHm+xCoAbT0eImBIfW2v8qitTgnpue8LcSfAsppiFGRJonmXAznJ546IszqK0HDQ2Sv/
	Shs70W80YwUlC2JtrpPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEP46-00BnFj-Gi; Sun, 08 Jan 2023 06:21:54 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEP41-00BnDo-4I
	for linux-riscv@lists.infradead.org; Sun, 08 Jan 2023 06:21:52 +0000
Received: from [192.168.31.95] (unknown [36.249.208.21])
	by APP-05 (Coremail) with SMTP id zQCowACnyM3sYLpje8akCw--.58823S2;
	Sun, 08 Jan 2023 14:21:33 +0800 (CST)
Message-ID: <c0da09f3-8439-dc0c-234f-e851bcffd07b@iscas.ac.cn>
Date: Sun, 8 Jan 2023 14:21:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v11 1/3] riscv: mm: modify pte format for Svnapot
To: Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
 xuyinan@ict.ac.cn
References: <20221216062109.865573-1-panqinglin2020@iscas.ac.cn>
 <20221216062109.865573-2-panqinglin2020@iscas.ac.cn> <Y6Dc4XNQmKtTsXom@spud>
 <20221226152213.crknhcpysonhq63c@orel> <Y6nql5IUhFnHv9sr@spud>
 <20221226191925.5crjqnpinsawfwc4@orel>
Content-Language: en-US
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <20221226191925.5crjqnpinsawfwc4@orel>
X-CM-TRANSID: zQCowACnyM3sYLpje8akCw--.58823S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF13Xr45WryftFykWw43Awb_yoWrJryDpr
	W8t3WIkF4Dtr1fArZ2qw18XF1Syw4fKF4UXr98tr98C3sIyr13GrsxtFy5uFykZr4rGr1j
	vFZY9asrZ3Z8AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r
	18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l
	c7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU5QyCtUUUUU==
X-Originating-IP: [36.249.208.21]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiBwIFDGO5fNNhmgABsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_222149_619260_0C9DFFCE 
X-CRM114-Status: GOOD (  21.77  )
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

Hi Andrew and Conor,

On 2022/12/27 03:19, Andrew Jones wrote:
> On Mon, Dec 26, 2022 at 06:40:23PM +0000, Conor Dooley wrote:
>> On Mon, Dec 26, 2022 at 05:01:29PM +0100, Andrew Jones wrote:
>>> On Mon, Dec 19, 2022 at 09:51:29PM +0000, Conor Dooley wrote:
>>>> On Fri, Dec 16, 2022 at 02:21:07PM +0800, panqinglin2020@iscas.ac.cn wrote:
>>>>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>>>>
>>>>> Add one alternative to enable/disable svnapot support, enable this static
>>>>> key when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
>>>>> option is set. It will influence the behavior of has_svnapot. All code
>>>>> dependent on svnapot should make sure that has_svnapot return true firstly.
>>>>>
>>>>> Modify PTE definition for Svnapot, and creates some functions in pgtable.h
>>>>> to mark a PTE as napot and check if it is a Svnapot PTE. Until now, only
>>>>> 64KB napot size is supported in spec, so some macros has only 64KB version.
>>>>>
>>>>> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>>>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>>>>>
>>>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>>>> index e1a9fa47f012..25c230e3bf61 100644
>>>>> --- a/arch/riscv/Kconfig
>>>>> +++ b/arch/riscv/Kconfig
>>>>> @@ -397,6 +397,25 @@ config RISCV_ISA_C
>>>>>   
>>>>>   	  If you don't know what to do here, say Y.
>>>>>   
>>>>> +config RISCV_ISA_SVNAPOT
>>>>> +	bool "SVNAPOT extension support"
>>>>> +	depends on 64BIT && MMU
>>>>> +	select RISCV_ALTERNATIVE
>>>>> +	default y
>>>>> +	help
>>>>> +	  Allow kernel to detect the SVNAPOT ISA-extension dynamically at boot
>>>>> +	  time and enable its usage.
>>>>> +
>>>>> +	  The SVNAPOT extension is used to mark contiguous PTEs as a range
>>>>> +	  of contiguous virtual-to-physical translations for a naturally
>>>>> +	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
>>>>> +	  size. When HUGETLBFS is also selected this option unconditionally
>>>>> +	  allocates some memory for each NAPOT page size supported by the kernel.
>>>>> +	  When optimizing for low memory consumption and for platforms without
>>>>
>>>> nit: Does this make more sense as "When optimising for low memory
>>>> consumption on platforms without the SVNAPOT extension"...?
>>>> Or does disabling Svnapot save memory on Svnapot capable systems too?
>>>
>>> Depends on how we define "save". Disabling RISCV_ISA_SVNAPOT on HUGETLBFS
>>> enabled systems will reduce memory consumption whether the svnapot
>>> extension is present or not. When the extension is present, the memory
>>> consumed may serve a purpose, whereas, on systems without svnapot, the
>>> memory consumed cannot serve a purpose.
>>
>> Right, thanks for the explanation. I'm sorry to be a bore here, but should
>> it be reworded then to "When optimising for low memory consumption on
>> platforms without SVNAPOT, or if HUGETLBFS is enabled, say N here"?
> 
> I'd prefer we keep the instructions as simple as possible. Basically,

Sorry for slow reply.

I agree with Andrew, we should keep it as simple as possible. :)
So I will keep it unchanged unless any new suggestions about this
patchset is given.

Thanks,
Qinglin

> "Turn this off if you don't plan to use it and if you care about memory
> consumption", which, IMHO, is how the text more or less already reads.
> But...
> 
>>
>> I don't really care either way to be perfectly honest, so as I said in
>> my other reply "don't bother resubmitting unless someone else asks for
>> meaningful changes" ;)
> 
> ...I'm not too worried about it either, so I won't complain if Qinglin
> respins with your suggestion.
> 
> Thanks,
> drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
