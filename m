Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BC3C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 07:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RA3oOCTGp+SajXw9mHVnZWvRcAz0YeT+4hkUKpKqEHk=; b=gTKaZ2Ajb1bomZ
	2UB0GtH7z69xDQTCn5Xr0oMVYh1PkeGOKGzwqb8Fql1nX/mSEMUiE9kkRxrJVdw023xT9uih51Ekj
	siK8cY6+2a9q5COVNJ1ZMc2PXQtpIx4YW+rlcj8KQMgZ9duCo1z+45XWHK3c3puKGjj199j77P9Yt
	JVW6ypEYTjyXYctXVxnRbjdyJHHhKKU4sX0i+ev8hi/4U/mUVPinBIe9cnL6pU+YMqzMhXRSgnTlg
	C5CsNWWAv7cNHKabJK7K+kb/WF3vPDfkaV9wBkDs2n/VNGjQxU0EXWPgd2kJwuF3fLB5XSQ17erqc
	xFYwLCWevMcGBOcFuivQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4dKz-009USw-9b; Mon, 12 Dec 2022 07:34:57 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4dKu-009UNw-Rj
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 07:34:55 +0000
Received: from [198.18.0.1] (unknown [59.59.28.169])
	by APP-01 (Coremail) with SMTP id qwCowACHCe2W2ZZjzGaeBg--.38060S2;
	Mon, 12 Dec 2022 15:34:47 +0800 (CST)
Message-ID: <64354d3c-04c8-ac2f-968c-bf8af2ca1f8b@iscas.ac.cn>
Date: Mon, 12 Dec 2022 15:34:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v10 1/3] riscv: mm: modify pte format for Svnapot
To: Andrew Jones <ajones@ventanamicro.com>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
 xuyinan@ict.ac.cn, conor@kernel.org
References: <20221212065526.805233-1-panqinglin2020@iscas.ac.cn>
 <20221212065526.805233-2-panqinglin2020@iscas.ac.cn>
 <20221212071802.o7cobfdvsp26xoq7@kamzik>
Content-Language: en-US
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <20221212071802.o7cobfdvsp26xoq7@kamzik>
X-CM-TRANSID: qwCowACHCe2W2ZZjzGaeBg--.38060S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw1fZw4kWF13Ww4DtrWxXrb_yoW5GFy8pr
	WxGF1xKF4DtF18CFWIg348XFsYq3Z7Kay3Xr98trn8C3sxZryfJrs0k3Z5G34DZr4rt348
	WFWrWa1j9an8ZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8I
	j28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr
	4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY
	jI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU5QyCtUUUUU==
X-Originating-IP: [59.59.28.169]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCQQSDGOWle-NAAAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_233453_331857_A09069DE 
X-CRM114-Status: GOOD (  18.09  )
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

On 2022/12/12 15:18, Andrew Jones wrote:
> On Mon, Dec 12, 2022 at 02:55:24PM +0800, panqinglin2020@iscas.ac.cn wrote:
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> Add one alternative to enable/disable svnapot support, enable this static
>> key when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
>> option is set. It will influence the behavior of has_svnapot. All code
>> dependent on svnapot should make sure that has_svnapot return true firstly.
>>
>> Modify PTE definition for Svnapot, and creates some functions in pgtable.h
>> to mark a PTE as napot and check if it is a Svnapot PTE. Until now, only
>> 64KB napot size is supported in spec, so some macros has only 64KB version.
>>
>> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 67ef08d33d3a..4b5bb719bc6f 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -397,6 +397,24 @@ config RISCV_ISA_C
>>   
>>   	  If you don't know what to do here, say Y.
>>   
>> +config RISCV_ISA_SVNAPOT
>> +	bool "SVNAPOT extension support"
>> +	depends on 64BIT && MMU
>> +	select RISCV_ALTERNATIVE
> 
> Hmm, shouldn't we also be selecting HUGETLBFS?

RISCV_ISA_SVNAPOT is not dependent on HUGETLBFS, so
it may not be necessary to select HUGETLBFS here? :)

> 
>> +	default y
>> +	help
>> +	  Allow kernel to detect SVNAPOT ISA-extension dynamically in boot time
>                                  ^ the                              ^ s/in/at/
> 
>> +	  and enable its usage.
>> +
>> +	  SVNAPOT extension helps to mark contiguous PTEs as a range
>> +	  of contiguous virtual-to-physical translations, with a naturally
>> +	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
>> +	  size. Without CPU's hardware extension, turnning on this feature
>> +	  may cause some little momory leak now.
>> +
>> +	  If you are sure your CPU has not SVNAPOT extension, say N.
>> +	  If you don't know what to do here, say Y.
>> +
> 
> 	The SVNAPOT extension is used to mark contiguous PTEs as a range
> 	of contiguous virtual-to-physical translations for a naturally
> 	aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
> 	size. This option unconditionally allocates some memory for each
> 	NAPOT page size supported by the kernel. When optimizing for low
> 	memory consumption and for platforms without the SVNAPOT extension,
> 	it may be better to say N here.
> 
> 	If you don't know what to do here, say Y.

Your expression is more accurate. I will resend the v10 patchset with
thisparagraph in it. Thanks!

Regards,
Qinglin.

> 
> 
> Thanks,
> drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
