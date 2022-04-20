Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1B1C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 04:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1/m1UB4waWBLthPeRkw/1V2Df1WEdotDiyq4P7rr/g=; b=m8Bhz+eam1tmgf
	1x+EHQcM2JQgFOH7xXqJpriAIUiOS/qnhJOGALI2BS0In047n55v+5x0LeLOuacWLgubWxgG7lKBx
	jQMRuS3T+asrGVlNyeZlMfsU1lf36BL9OthFX0Sl5BgsrICoCKCxW2G7m3zUVvsoRc/Y5Ff5ZTtc+
	7M3L8jsM1VBCVvUKe8wgh/PRX7X2yZNkpPzgAbaOYdEMHkI0OH1VO/IJ+PnIxfaF32c2HPaFlqfHg
	fBR392TCzBodVTviYdY7ZhRtjpg/zqG09nhAClDkVrNEfuTAddZV7b0j28v5b0XQ3JiOBC8qskXVt
	G/QaoaEV0/dpAvbWev9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh1Zw-007DA9-Nt; Wed, 20 Apr 2022 04:04:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh1Zt-007D9W-SQ
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 04:04:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0C041B81244;
 Wed, 20 Apr 2022 04:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A66C385A1;
 Wed, 20 Apr 2022 04:04:22 +0000 (UTC)
Message-ID: <81788b56-5b15-7308-38c7-c7f2502c4e15@linux-m68k.org>
Date: Wed, 20 Apr 2022 14:04:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] binfmt_flat: do not stop relocating GOT entries
 prematurely on riscv
Content-Language: en-US
To: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Mike Frysinger <vapier@gentoo.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
 <f379cb56-6ff5-f256-d5f2-3718a47e976d@opensource.wdc.com>
 <Yli8voX7hw3EZ7E/@x1-carbon>
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <Yli8voX7hw3EZ7E/@x1-carbon>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_210430_115586_86EB93A0 
X-CRM114-Status: GOOD (  26.31  )
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


On 15/4/22 10:30, Niklas Cassel wrote:
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

FWIW there has been talk for a couple of years now to remove the
shared library support for m68k. It doesn't get used - probably not
for a very long time now. And most likely doesn't even work anymore.

Regards
Greg



> bFLT seems to currently be at version 4, perhaps such a change would
> require a version bump.. Or not? (Now, if there only was a spec.. :P)
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
>>>   static int load_flat_file(struct linux_binprm *bprm,
>>>   		struct lib_info *libinfo, int id, unsigned long *extra_stack)
>>>   {
>>> @@ -789,7 +813,8 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>   	 * image.
>>>   	 */
>>>   	if (flags & FLAT_FLAG_GOTPIC) {
>>> -		for (rp = (u32 __user *)datapos; ; rp++) {
>>> +		rp = skip_got_header((u32 * __user) datapos);
>>> +		for (; ; rp++) {
>>>   			u32 addr, rp_val;
>>>   			if (get_user(rp_val, rp))
>>>   				return -EFAULT;
>>
>> Regardless of the above nit, feel free to add:
>>
>> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
>>
>>
>> -- 
>> Damien Le Moal
>> Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
