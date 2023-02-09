Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB3AC05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 08:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3o3HZU4hmoDbbc095prFf5emWQXS5lsF5gXrgDanUDU=; b=leBAhbugobakVh
	nmOkb0Px0bcOjnd09XDtNcryB/3iljg6OVkAbrRCTiSLlBwmD2zcGxIuc2XUABMr2emCQdR/orvef
	xGcfYOe+ydOtj4Eu+U7Q96E6/1hXzeoyk3Gm+u9gublJsgrnSTUJlot8uQFTW7/JA1E83MdU2HWMc
	3mXPalxscFqsDuTivdh/MtlNpZ9XrfBdMWlhKxxw9LcGL8DN6sOFDTFbVswwEKUhpDFfpOOlPvqKs
	s96GO5Vn7IugSa7qzI2H0P1PGIPJ9I+csQx8kpB2zBe5NZwzS8X2NGBPhYLouX4r5K5rDb8qDfpK+
	PM366zQx7lQ3tsov/yQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2UB-000aJG-Bw; Thu, 09 Feb 2023 08:40:55 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2U7-000aIm-Nr
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 08:40:53 +0000
Received: from [198.18.0.1] (unknown [124.16.141.244])
	by APP-05 (Coremail) with SMTP id zQCowACXnPSPseRj65RHBA--.8101S2;
	Thu, 09 Feb 2023 16:40:48 +0800 (CST)
Message-ID: <f5004cea-283b-6c9f-f0f7-f13eae213b08@iscas.ac.cn>
Date: Thu, 9 Feb 2023 16:40:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v12 0/3] riscv, mm: detect svnapot cpu support at runtime
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org
References: <11ea7918-00db-3f30-2504-53692936aaae@iscas.ac.cn>
 <a1cdf5e6-a6d8-654c-1af2-adb9f0b260c3@iscas.ac.cn> <Y+ShK27/hnApM89n@wendy>
 <9c20cf72-09cc-b005-6d92-a23d053c86ea@iscas.ac.cn> <Y+SsVC7JpdPodjeN@wendy>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <Y+SsVC7JpdPodjeN@wendy>
X-CM-TRANSID: zQCowACXnPSPseRj65RHBA--.8101S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWrCryxGF1xWFW8Xw18Krg_yoW8uw4rpF
	4FgF4xCF47tr1xJrs2y3y0q3Wjvanayr43WF1kCFyIkFyqgFyxXrn7Kr4Y9r9xCr4xGr40
	vrW2q347GryjyFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x0
	82IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGw
	Av7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l
	c7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07bYEfrUUUUU=
X-Originating-IP: [124.16.141.244]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCgURDGPkWj3u4QAAs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_004052_177179_E94D478D 
X-CRM114-Status: GOOD (  21.48  )
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

On 2023/2/9 16:18, Conor Dooley wrote:
> On Thu, Feb 09, 2023 at 04:03:01PM +0800, Qinglin Pan wrote:
>> Hey!
>>
>> On 2023/2/9 15:30, Conor Dooley wrote:
>>> Hey!
>>>
>>> On Thu, Feb 09, 2023 at 12:00:32PM +0800, Qinglin Pan wrote:
>>>> Hi all,
>>>>
>>>> Sorry for bothering :(
>>>>
>>>> This patchset has a bit of a formatting problem.
>>>> Please use another one:
>>>> https://lore.kernel.org/linux-riscv/20230209035343.15282-1-panqinglin00@gmail.com/T/#t
>>>
>>> If you're resending, please either mark as RESEND or increment the
>>> version number so that tools don't get confused.
>>> In this case though, tools found some issues with both version
>>> unfortunately:
>>> https://patchwork.kernel.org/project/linux-riscv/patch/20230209035343.15282-2-panqinglin00@gmail.com/
>>> https://patchwork.kernel.org/project/linux-riscv/patch/20230209035343.15282-3-panqinglin00@gmail.com/
>>> (if you click on the descriptions you should get more information on
>>> what is wrong)
>>>
>>> You can fix those up and send a v13 and it'll all be clear then ;)
>>
>> Your information is very helpful, thanks so much!
>>
>> I will send a v13 later. But I am very curious about why
>> conchuod/alphanumeric_selects is failed and what content is in
>> this test? Could you please give me some hints about it? ;)
> 
> Oh yeah, that output is not very helpful is it. It runs a perl script
> that RMK created that tries to put things in the "correct" order before
> and after the patch is applied. The script is here:
> https://github.com/ConchuOD/nipa/blob/main/tests_rv/patch/alphanumeric_selects/alphanumeric_selects.pl

It is what I really need :) :) :)

> It also re-orders default/depends on strings, and I assume it's being
> tripped up by the config option that you are adding not doing what it
> wants you to do with the order of those.
> I think you can ignore that one for now.
> 
> It's the build errors and SoB issues that I am more interested in
> getting fixed ;)
> 
> I'll go convert the error level of that to a warning & try to fix up the
> reporting that it does.

Thanks a lot for your hard work! ;)

Regards,
Qinglin.

> 
> Cheers,
> Conor.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
