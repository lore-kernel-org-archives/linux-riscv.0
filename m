Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979D1CD11DD
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 13:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kv9/TgRU14MqZqhg35wvK9FLmzidkcTlV8p4Ut6jJ/g=; b=Id5VjQMm91unIM
	11YW2cMMq5Dm47mvymdXchOHLwrojCj1nMovc9hEGsqdNKwrwPCGCfI22htq0ZBD5AfJbejJ2VJ9z
	SwVIJqhhc16pDalh0B3UuvhZA0Gax51/ewB3ha0aqqqDQW5p5a13gL2s5sMSpt5CV/F/QcAjL32ey
	t7vN9TCI38a/XYMCkdEGuHL6SzA3H+WkcJIPvxgJBuAP4PI1EKvGPIFb/Ak5mklUUOJOrX3Hc7Ibt
	jNeCrrteK4z/nWyFan4Sw9Q4PqVxJfd1GRPGWRedJKoAQ+NFeOAwFIxcY3/JaXMgzIu25RJo80lj1
	4qfVZYu4tXKHzYCYfJLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqCXc-00000000ikw-3J44;
	Fri, 29 Mar 2024 13:45:08 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqCXY-00000000iis-05s4
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 13:45:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C4FDE0006;
	Fri, 29 Mar 2024 13:44:56 +0000 (UTC)
Message-ID: <7687f1b7-3377-40de-ab06-e90df2d58950@ghiti.fr>
Date: Fri, 29 Mar 2024 14:44:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [PATCH] Update the size of auxv to respect the new
 constant added in e92f469b0771e6db9688a58c0e34a8342da6a6bc
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: victor@torrio.net, linux-riscv@lists.infradead.org,
 Victor Isaev <isv@google.com>, Ivan Komarov <ivan.komarov@dfyz.info>
References: <20240102133617.3649-1-victor@torrio.net>
 <38be1ab1-a080-4d89-a9c6-9837f7fad4ec@ghiti.fr>
 <20240329-persuader-series-0a3e9817007c@wendy>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240329-persuader-series-0a3e9817007c@wendy>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_064504_248175_48551E28 
X-CRM114-Status: GOOD (  18.92  )
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


On 29/03/2024 14:22, Conor Dooley wrote:
> On Fri, Mar 29, 2024 at 01:25:48PM +0100, Alexandre Ghiti wrote:
>> Hi Victor,
>>
>> On 02/01/2024 14:36, victor@torrio.net wrote:
>>> From: Victor Isaev <isv@google.com>
>>>
>>> Commit e92f469b0771 ("riscv: signal: Report signal frame size to
>>> userspace via auxv") has added a new constant AT_MINSIGSTKSZ but
>>> failed to increment the size of auxv, keeping AT_VECTOR_SIZE_ARCH
>>> at 9.
>>> This fix correctly increments AT_VECTOR_SIZE_ARCH to 10, following
>>> the approach in the commit 94b07c1f8c39 ("arm64: signal: Report
>>> signal frame size to userspace via auxv")
>>>
>>> Reported-by: Ivan Komarov <ivan.komarov@dfyz.info>
>>> Closes: https://lore.kernel.org/linux-riscv/CY3Z02NYV1C4.11BLB9PLVW9G1@fedora/
>>> Fixes: e92f469b0771 ("riscv: signal: Report signal frame size to userspace via auxv")
>>> Signed-off-by: Victor Isaev <isv@google.com>
>>>
>>> ---
>>>    arch/riscv/include/uapi/asm/auxvec.h | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
>>> index 10aaa83db89e..95050ebe9ad0 100644
>>> --- a/arch/riscv/include/uapi/asm/auxvec.h
>>> +++ b/arch/riscv/include/uapi/asm/auxvec.h
>>> @@ -34,7 +34,7 @@
>>>    #define AT_L3_CACHEGEOMETRY	47
>>>    /* entries in ARCH_DLINFO */
>>> -#define AT_VECTOR_SIZE_ARCH	9
>>> +#define AT_VECTOR_SIZE_ARCH	10
>>>    #define AT_MINSIGSTKSZ		51
>>>    #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
>>
>> So we discussed this patch in the last Patchwork meeting, and it needs to be
>> merged as it is a valid fix. But, the subject is wrong and then the patch
>> can't be merged as-is, can you respin another version with the following
>> subject please:
>>
>> riscv: Fix the number of arch-specific auxiliary vectors
>>
>> Or something that best suits you. No pressure, but if you don't, I'll respin
>> myself a new version keeping your SoB of course.
> I think what you missed in the Patchwork meeting is that Palmer manually
> fixed this up and it is on fixes:
> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=fixes&id=13dddf9319808badd2c1f5d7007b4e82838a648e


Did not even cross my mind to check that the fixes branch had any update :)


>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
