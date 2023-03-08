Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625B0C678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 09:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mxWHUxc2+n0YY6Y5ufRonppqOnZQ/pfR3/8Hn08w+CA=; b=QZbUkVVclt7R//
	bFKAKh3nbcp96IAYY2dO/w7fd7kAFTAoqiEVoWGzkYaV+DuiBKujuGcs9b+aAP3ECtt9KF8L5Yysf
	GGDcRcoDrg2dmgzpU/v3Zzyhxs8sb0CvF+Wkgi7iUw4/gtry77ONijEqUWSeVyYQRH59M8LVBYWlC
	r5jnv8+O3WaAqMAaa3VPctfakz//zTMnZ7JmpV6MvRw0evuqejMXbgihctUMMbD0bNbhWFRdHRiAU
	tmLCRNTBJHmJ4ffgsfALV5ExSW9Jn2Fd8vB36mlAynAxJv8mryTPFpRiO89u7K94A7HQychZRKp1W
	ES0SB56UP2kozvv8+4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZqBg-004DP3-3n; Wed, 08 Mar 2023 09:34:20 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZqBd-004DNF-2s
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 09:34:18 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net ([86.15.83.122] helo=[192.168.0.16])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pZqBV-00FV0T-Jx; Wed, 08 Mar 2023 09:34:09 +0000
Message-ID: <f8b68b7d-f755-2b32-6177-98125a3e957e@codethink.co.uk>
Date: Wed, 8 Mar 2023 09:34:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] riscv: alternatives: add 3-config alternative set
Content-Language: en-GB
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, heiko.stuebner@vrull.eu, conor.dooley@microchip.com,
 ajones@ventanamicro.com
References: <20230307205834.1426289-1-ben.dooks@codethink.co.uk>
 <20230307205834.1426289-2-ben.dooks@codethink.co.uk>
 <d22da238-9f7a-420b-b02a-20ccee20eff4@spud>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <d22da238-9f7a-420b-b02a-20ccee20eff4@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_013417_159243_A2F6AF63 
X-CRM114-Status: GOOD (  20.69  )
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

On 07/03/2023 21:31, Conor Dooley wrote:
> Hey Ben,
> 
> On Tue, Mar 07, 2023 at 08:58:33PM +0000, Ben Dooks wrote:
>> Add a 3-config alternative macro set for cases where there are
>> three different choices for a given erratum. This will be used
>> when we come to patch the issues with SVPBMT and ZICBOM.
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   arch/riscv/include/asm/alternative-macros.h | 38 +++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
>> index 51c6867e02f3..8c74b00d707c 100644
>> --- a/arch/riscv/include/asm/alternative-macros.h
>> +++ b/arch/riscv/include/asm/alternative-macros.h
>> @@ -50,8 +50,18 @@
>>   	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
>>   .endm
>>   
>> +.macro ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
>> +				new_c_2, vendor_id_2, errata_id_2, enable_2,	\
>> +				new_c_3, vendor_id_3, errata_id_3, enable_3
>> +	ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \errata_id_1, \enable_1
>> +	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
>> +	ALT_NEW_CONTENT \vendor_id_3, \errata_id_3, \enable_3, \new_c_3
> 
> A matter of opinion maybe, but there was a previous ALTERNATIVE_CFG_3
> posting that was implemented using ALTERNATIVE_CFG_2 that, to me, is
> easier to grok:
> https://lore.kernel.org/linux-riscv/20221212115505.36770-2-prabhakar.mahadev-lad.rj@bp.renesas.com/
> It's certainly an easier pattern to replicate for the inevitable
> ALTERNATIVE_CFG_4,5,6,7 etc.
> 
> I'm not super bothered either way, but worth considering I think.
> 
> Cheers,
> Conor.

I'll have a look, whatever way we need to have this support before
we can add the fixes for zibom fixes in.

>> +.endm
>> +
>> +
> 
> btw, here & further down in the patch there's some instances of double
> newlines that automation is gonna whinge about.
> 
>>   #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
>>   #define __ALTERNATIVE_CFG_2(...)	ALTERNATIVE_CFG_2 __VA_ARGS__
>> +#define __ALTERNATIVE_CFG_3(...)	ALTERNATIVE_CFG_3 __VA_ARGS__
>>   
>>   #else /* !__ASSEMBLY__ */
>>   
>> @@ -98,6 +108,13 @@
>>   	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1)	\
>>   	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
>>   
>> +#define __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
>> +				   new_c_2, vendor_id_2, errata_id_2, enable_2, \
>> +				   new_c_3, vendor_id_3, errata_id_3, enable_3)	\
>> +	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1)	\
>> +	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)		\
>> +	ALT_NEW_CONTENT(vendor_id_3, errata_id_3, enable_3, new_c_3)
>> +	
>>   #endif /* __ASSEMBLY__ */
>>   
>>   #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
>> @@ -108,6 +125,13 @@
>>   	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),	\
>>   				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2))
>>   
>    ^ there's also trailing whitespace here that git am complains about.
> 
>> +#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
>> +				  new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2,		\
>> +				  new_c_3, vendor_id_3, errata_id_3, CONFIG_k_3)		\
>> +	__ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),	\
>> +				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2),   \
>> +				   new_c_3, vendor_id_3, errata_id_3, IS_ENABLED(CONFIG_k_3))
>> +	
>>   #else /* CONFIG_RISCV_ALTERNATIVE */
>>   #ifdef __ASSEMBLY__
>>   
>> @@ -121,6 +145,9 @@
>>   #define _ALTERNATIVE_CFG_2(old_c, ...)	\
>>   	ALTERNATIVE_CFG old_c
>>   
>    ^ and here too.
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
