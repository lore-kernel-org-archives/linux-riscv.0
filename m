Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D865DC678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 11:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jb/s3dn0XUoJifV5E1yZFYqTepuwu34aOfshPrEZQbQ=; b=Te2LK3KB2G8sNE
	5y+JHgLRlzJiYDJSKLE8SfAUnjbhpRUusldzYMAq6RCt+Zq77hfZsjdC/3bjtMYtO9aOfMsjrBUSw
	kpGKxOVhfCJjmHCj3Ksez7UCTZVyxFEvAOXU+W0+Pn1TKBom1VuPSSOLLnGKjEBKt3TJA+KbGJoQi
	IjfMxB1TmhGhDYPGt6gRO41/kak/0KOHS1w0sqyoQSFnAJ2YabsmEDz0q9AxfJ2yHc/p2WA7JJ7d3
	xA3f8HR4YTdv1YhUTNTwauJv5c3UJmcg1MiVwXD+3bc6Cu3kiN1CjZtzUQCirXkg+Bane1YpIrB4I
	V+ziVm41W+aWaH1zfhQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZs3q-004d22-38; Wed, 08 Mar 2023 11:34:22 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZs3m-004cze-BS
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 11:34:21 +0000
Received: from [198.18.0.1] (unknown [124.16.141.244])
	by APP-05 (Coremail) with SMTP id zQCowAAHHhaucghktHEUAA--.3622S2;
	Wed, 08 Mar 2023 19:34:06 +0800 (CST)
Message-ID: <1cb7e7c4-3444-a643-8e11-2f280262004a@iscas.ac.cn>
Date: Wed, 8 Mar 2023 19:34:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v14 1/3] riscv: mm: modify pte format for Svnapot
To: Conor Dooley <conor@kernel.org>, Qinglin Pan <panqinglin00@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, jeff@riscv.org, xuyinan@ict.ac.cn,
 ajones@ventanamicro.com
References: <20230308074853.4393-1-panqinglin00@gmail.com>
 <20230308074853.4393-2-panqinglin00@gmail.com>
 <42440bf0-f329-41c4-9e44-e0711b7ab23f@spud>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <42440bf0-f329-41c4-9e44-e0711b7ab23f@spud>
X-CM-TRANSID: zQCowAAHHhaucghktHEUAA--.3622S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWxKrWUXr45Wr47JrWfuFg_yoW8XrWfpF
	40gF9xKFs8G34fC34IqFn8ua4Fqa15Kws8K348urW8CanrJryfXwn0yasIkasrXF1FqFy2
	gFZYg3WrWayUZ37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4UJV
	WxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW8KwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUb2Q6PUUUUU==
X-Originating-IP: [124.16.141.244]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCQAEDGQILqDKLwAAsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_033418_817380_4BC037CB 
X-CRM114-Status: GOOD (  10.05  )
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

On 3/8/23 5:09 PM, Conor Dooley wrote:
> On Wed, Mar 08, 2023 at 03:48:51PM +0800, Qinglin Pan wrote:
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
>> Signed-off-by: Qinglin Pan <panqinglin00@gmail.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> index e3021b2590de..ba9f4650f051 100644
>> --- a/arch/riscv/include/asm/hwcap.h
>> +++ b/arch/riscv/include/asm/hwcap.h
>> @@ -42,9 +42,10 @@
>>   #define RISCV_ISA_EXT_ZBB		30
>>   #define RISCV_ISA_EXT_ZICBOM		31
>>   #define RISCV_ISA_EXT_ZIHINTPAUSE	32
>> +#define RISCV_ISA_EXT_SVNAPOT		33
>>   
>>   #define RISCV_ISA_EXT_MAX		64
> 
>> -#define RISCV_ISA_EXT_NAME_LEN_MAX	32
>> +#define RISCV_ISA_EXT_NAME_LEN_MAX	33
> 
> I think this change is not needed.

Hi Conor,

You are right. I change this by mistake..
A v15 will be sent out two days later :)

Thanks,
Qinglin.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
