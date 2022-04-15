Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317E2C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 00:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MFr9u1RUvh4S+CtW66YwJVB0WOxZ26DuMi7zwYk0ubk=; b=rTDBi3yEMBmld/
	f8wD1+6Nu76NLJvx9PtHcOTxmDZqvqKuirYQ07/lHatVN+SNNaZG5jwkSqXndIxAFIjLXcRgozXLv
	azubS/Nk7CVwXlgYAp9KCy31/Os0D2mcd+8RATZLLjAnOrlBeMH8MIeYfR5lkIQo2qofzWZzyVOCR
	1xHmgEqW1buWniXQMWQ6McpmeTY6m3J0ckQgl+uMvjggc0OuY5mXkrQvwjOxc4OQ2HZotlAKkIbm3
	It4hEByDH3uFVCFTXSzWnizMnuwfEEQTkScmSELyl5E6ZswMdiGDn6QpgqEmxUxNZ+SqyioO0dko9
	oDx8zC7MRHkM568+ebjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfAGa-007vj8-0i; Fri, 15 Apr 2022 00:56:52 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfAGV-007vgo-MB
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 00:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649984206; x=1681520206;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PIIeXs/XKpoxh4Ro8M+e5fsOaqPWnqNURWijGAB3loc=;
 b=nEIZbYjUg1SSCYpZ0884GvmdHJk5nsj+/+ZvUug9L8cR0PFVAzNH6PXM
 vU1d88nVyP+DBUjrSaeuhReTeSfoE7buDomaFILtVuQb+/HIbuTiIOuuZ
 042udPO2zzQfbFgaIrS1Y4qjilBRajnzqdEDr7E+cI+h9xJ3v1pu9o7ft
 68pHEZIe9rdOpVOGKDWQgH/aR42gKmqN6nXZAQOW2H2vTpQrS7TtxeYvn
 l0kO0aVciTkMI+WpZ+aQrDkoZWEyK8/bFGFt573wvMeY9JTm5VHCDU81x
 2UPE/fgsB6FeRgpAP/JK2QV8dLUsZcBLAG5qiRd2oi5cyXjsKKpZrgKjZ w==;
X-IronPort-AV: E=Sophos;i="5.90,261,1643644800"; d="scan'208";a="202818074"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2022 08:56:42 +0800
IronPort-SDR: bEK1J0CzUgX1QB9o32Ka9Mk2BCh85dTh5ykEqgg/GInHhj2rNJxW+uXAR/SREztHt6BU5aUSMl
 Ihyu3s2OoYFEYDoQOKY3GC09FLYH7rS3kTT+056jC/SgzfCNM64cQaXYIjQZ5oda9LjhqF1ARb
 HmILLJtmH7A/feddLB1gTGu/IiIJzxyEvDP8MYfDdB1OOe/JGVMGYPtE2xxd9b8B08L0w4JxpN
 q6vKcp08EFq4re6m3cge3+qE+I7obqxltZhafn0lxWxGeBDgcQ26A8tneLuYHxV3UQ3NICYzFf
 z6pE+DmjQVcxpCKEw9fNdhIW
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2022 17:27:56 -0700
IronPort-SDR: UvwCnEpNJd0M6Ll7jPjqiVDeBHDJzFqgtx430KDI0nBaQBxud/3/pv0nihRDadHXv40UcoHBbO
 hOaAWeFY9/b4Xn1lQp/bsqaE3IkOaa5t//OOjzIGhSgk9PT+LzpqjyvB4WfHHvd//1Y1Nguzai
 daNwRV0b5jpc8PTy5U0/Mu7vO4mC0QNnLB7Uxri2A9A2JIpQNZjhwOw2UBkvYFLQlb07i+NJ+t
 puY5cqu9A45pP8dFznY4fvo2wGyJvWVAifr5McMkXMdumIJ04OAaXq6FvQ7Y7cAaB9tfMPCzn3
 iGs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2022 17:56:44 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KfdFR1NqLz1SVp1
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 17:56:43 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1649984202; x=1652576203; bh=PIIeXs/XKpoxh4Ro8M+e5fsOaqPWnqNURWi
 jGAB3loc=; b=XsjOMN5cgk+Kag0RPwLITFO6mtYll1ywbvEhTEODj6B8KE8+QHB
 o/EsbPvhp4pzGPjsGk7lsKF75i+2DyXnmOimROm+EMZ58U7iaZSbo3XnUFFH3J+8
 h6BOGtc9P8l1OUuht0bbSxMXiEYoqRLMuoVfhSA+8u/Ik4A9zm3wmrg7aCqlKel3
 RYrNwv8AVsAS0YhJz0yyRCvlFT8miCTracpnS7T3xrstVEq0nJKLCq0c7dsruYZc
 yfoUdW0hM1MUnspPBPc/3KOUqP1AEtfKnaifOtCPf56rVbqTfvmtAmle9LXVBFCP
 7uNRRC/d2OnpsPpR7Ts5TJxu/6MlLIsAIQQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id Z8khEJkjEQ60 for <linux-riscv@lists.infradead.org>;
 Thu, 14 Apr 2022 17:56:42 -0700 (PDT)
Received: from [10.225.163.9] (unknown [10.225.163.9])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KfdFN0s2vz1Rvlx;
 Thu, 14 Apr 2022 17:56:39 -0700 (PDT)
Message-ID: <6ee62ced-7a49-be56-442d-ba012782b8e2@opensource.wdc.com>
Date: Fri, 15 Apr 2022 09:56:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] binfmt_flat: do not stop relocating GOT entries
 prematurely on riscv
Content-Language: en-US
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Ungerer <gerg@linux-m68k.org>, Mike Frysinger <vapier@gentoo.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
 <f379cb56-6ff5-f256-d5f2-3718a47e976d@opensource.wdc.com>
 <Yli8voX7hw3EZ7E/@x1-carbon>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <Yli8voX7hw3EZ7E/@x1-carbon>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_175647_752321_0FFB7D2C 
X-CRM114-Status: GOOD (  27.82  )
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

On 4/15/22 09:30, Niklas Cassel wrote:
> On Fri, Apr 15, 2022 at 08:51:27AM +0900, Damien Le Moal wrote:
>> On 4/14/22 18:10, Niklas Cassel wrote:
> 
> (snip)
> 
>> This looks good to me. But thinking more about it, do we really need to
>> check what the content of the header is ? Why not simply replace this
>> entire hunk with:
>>
>> 		return rp + sizeof(unsigned long) * 2;
>>
>> to ignore the 16B (or 8B for 32-bits arch) header regardless of what the
>> header word values are ? Are there any case where the header is *not*
>> present ?
> 
> Considering that I haven't been able to find any real specification that
> describes the bFLT format. (No, the elf2flt source is no specification.)
> This whole format seems kind of fragile.
> 
> I realize that checking the first one or two entries after data start is
> not the most robust thing, but I still prefer it over skipping blindly.
> 
> Especially considering that only m68k seems to support shared libraries
> with bFLT. So even while this header is reserved for ld.so, it will most
> likely only be used on m68k bFLT binaries.. so perhaps elf2flt some day
> decides to strip away this header on all bFLT binaries except for m68k?
> 
> bFLT seems to currently be at version 4, perhaps such a change would
> require a version bump.. Or not? (Now, if there only was a spec.. :P)

The header skip is only for riscv since you have that
"if (IS_ENABLED(CONFIG_RISCV)) {". So whatever you do under that if will
not affect other architectures. The patch will be a nop for them.

So if we are sure that we can just skip the first 16B/8B for riscv, I
would not bother checking the header content. But as mentioned, the
current code is fine too.

Both approaches are fine with me but I prefer the simpler one :)

> 
> 
> Kind regards,
> Niklas
> 
>>
>>> +	}
>>> +	return rp;
>>> +}
>>> +
>>>  static int load_flat_file(struct linux_binprm *bprm,
>>>  		struct lib_info *libinfo, int id, unsigned long *extra_stack)
>>>  {
>>> @@ -789,7 +813,8 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>  	 * image.
>>>  	 */
>>>  	if (flags & FLAT_FLAG_GOTPIC) {
>>> -		for (rp = (u32 __user *)datapos; ; rp++) {
>>> +		rp = skip_got_header((u32 * __user) datapos);
>>> +		for (; ; rp++) {
>>>  			u32 addr, rp_val;
>>>  			if (get_user(rp_val, rp))
>>>  				return -EFAULT;
>>
>> Regardless of the above nit, feel free to add:
>>
>> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
>>
>>
>> -- 
>> Damien Le Moal
>> Western Digital Research


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
