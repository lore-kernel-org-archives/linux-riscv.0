Return-Path: <SRS0=FvZO=D5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF189C388F7
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 20:31:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F36924248
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 20:31:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="njONNPrT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCEDnnVY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F36924248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t/LWYVcWPwviLtinEl8e4ds+T1OjmU/rQj7PJSY/htI=; b=njONNPrTUM9qtF76M0lXvtbMW
	ydzwZp+rGI3M4gh40T22OjvPF5alGKy+uu2NWN/vqTwmF4A2fX5LqCgYntbqOM16e5s6u+XDVLVDK
	YuJyGZvMiPysfrT2Fm9Jd4msQ56eSBfCrXZkP9QvVzUpm8MoWo12Sb50jXBji/Ulea0M39kp//TkO
	dB00YdfGYxNNJVVS9R9BCXybPeBk0FOGV9zxEbDVvu/RvacHA3HeLw/+PaJAl1o/qVNK5/uYFj7/w
	a5dT4lfVNcuYrXgPDO161OoPEoT7KkogaafS4+S2hn6fibTmyxfIaqCSHeCSmXHI6sicZaSCiatVX
	P1nq2x1iA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVhEh-0004FR-DL; Thu, 22 Oct 2020 20:30:59 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVhEe-0004Ec-PR
 for linux-riscv@lists.infradead.org; Thu, 22 Oct 2020 20:30:57 +0000
Received: by mail-qk1-x743.google.com with SMTP id 140so3201662qko.2
 for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2020 13:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wbhvsaCRrs4jtNqhJx9Hg4U8cZvjQkjnncra9qHwBN8=;
 b=nCEDnnVYi8l6v920iNkTRhx8eVoYuGHtdQNFOoh0w/Sg0G3SWL4hFrec/0BzKctIsQ
 /AFnZLPH2ufWFHLB2QBBMBE4rPVQdhM6zVulUs4K7+X8Nh07VrysgFWPds3IPpYjlMxD
 MuY+80htSSo6Ms+bxWgwf2ga6TVlHFtlNg+BxU+qBzeYmXQbk0Nf2fhRZ56lwpR+z2Qb
 EsDHWJXpBl3Pq4aX5tj1WD4fadqfSuAedm8eHg9Zz16BTruMZ6kY/b3mJT3hRDZa+F3G
 oh0MvGzAPeA6ZobVnLUs1/TcpKpORRkHPY5UxqTyoxOq6OVFnMMbsWyGQyiSjTUxypr6
 uDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wbhvsaCRrs4jtNqhJx9Hg4U8cZvjQkjnncra9qHwBN8=;
 b=TTuC6zDeIkHDWRDToLX6Cu2/yf0bGAUBq+A2/EVPIvfwx2EQ6d32GBJN0YrfkWCqlD
 /hguyYhO1tmbC1SNIVd2C607H+SGP0w3QZp9/416hp88ebxFo2+yBLsaJGInEGCEXnI6
 T5qI/e3RURhscFxq9o+p7cR+c9LoAe3vFk2SFBqsnOjyuhxiR7diXnsKKsJv4Vsf860G
 ARcLq0xZVm3n2nhXUZdvzNC/CkbKHKEttaOGRTeN2E9cbG31JjShprA6FQ25h9uIJnVn
 SpXzLDIJ1WtLt68PsoyMYcxiuJLuDuwN4clELd67Qyzvo4vIjQeHad43TEZCBVoN5acO
 D+CA==
X-Gm-Message-State: AOAM531Rx4WPlzPezGM+XeIXvnwa1g3ER8zWP0aO4OhLDV8UqcMfC0N9
 G9eQyyD4rqrvo35jooognNY=
X-Google-Smtp-Source: ABdhPJx/AS4mmXn3cLPwHEeYVHOkaS3/Yk6/gVnSX1x02a+guBZltsV24VrFfUjbeQF8DybiWrVk9Q==
X-Received: by 2002:ae9:e508:: with SMTP id w8mr4515207qkf.110.1603398655460; 
 Thu, 22 Oct 2020 13:30:55 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id a30sm1797312qtn.55.2020.10.22.13.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 13:30:54 -0700 (PDT)
Subject: Re: [PATCH] riscv: Set text_offset correctly for M-Mode
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20201017182848.125139-1-seanga2@gmail.com>
 <BL0PR04MB651474C90B702F1B72A68490E71E0@BL0PR04MB6514.namprd04.prod.outlook.com>
From: Sean Anderson <seanga2@gmail.com>
Autocrypt: addr=seanga2@gmail.com; prefer-encrypt=mutual; keydata=
 mQENBFe74PkBCACoLC5Zq2gwrDcCkr+EPGsT14bsxrW07GiYzQhLCgwnPdEpgU95pXltbFhw
 46GfyffABWxHKO2x+3L1S6ZxC5AiKbYXo7lpnTBYjamPWYouz+VJEVjUx9aaSEByBah5kX6a
 lKFZWNbXLAJh+dE1HFaMi3TQXXaInaREc+aO1F7fCa2zNE75ja+6ah8L4TPRFZ2HKQzve0/Y
 GXtoRw97qmnm3U36vKWT/m2AiLF619F4T1mHvlfjyd9hrVwjH5h/2rFyroXVXBZHGA9Aj8eN
 F2si35dWSZlIwXkNu9bXp0/pIu6FD0bI+BEkD5S7aH1G1iAcMFi5Qq2RNa041DfQSDDHABEB
 AAG0K1NlYW4gR2FsbGFnaGVyIEFuZGVyc29uIDxzZWFuZ2EyQGdtYWlsLmNvbT6JAVcEEwEK
 AEECGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4ACGQEWIQSQYR1bzo1I0gPoYCg+6I/stKEQ
 bgUCXT+S2AUJB2TlXwAKCRA+6I/stKEQbhNOB/9ooea0hU9Sgh7PBloU6CgaC5mlqPLB7NTp
 +JkB+nh3Fqhk+qLZwzEynnuDLl6ESpVHIc0Ym1lyF4gT3DsrlGT1h0Gzw7vUwd1+ZfN0CuIx
 Rn861U/dAUjvbtN5kMBqOI4/5ea+0r7MACcIVnKF/wMXBD8eypHsorT2sJTzwZ6DRCNP70C5
 N1ahpqqNmXe0uLdP0pu55JCqhrGw2SinkRMdWyhSxT56uNwIVHGhLTqH7Q4t1N6G1EH626qa
 SvIJsWlNpll6Y3AYLDw2/Spw/hqieS2PQ/Ky3rPZnvJt7/aSNYsKoFGX0yjkH67Uq8Lx0k1L
 w8jpXnbEPQN3A2ZJCbeM
Message-ID: <1c2e3498-e633-3018-3c49-053e9011ac30@gmail.com>
Date: Thu, 22 Oct 2020 16:30:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <BL0PR04MB651474C90B702F1B72A68490E71E0@BL0PR04MB6514.namprd04.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_163056_831268_DDC3D83E 
X-CRM114-Status: GOOD (  17.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Atish Patra <Atish.Patra@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 10/18/20 8:08 PM, Damien Le Moal wrote:
> On 2020/10/18 3:29, Sean Anderson wrote:
>> M-Mode Linux is loaded at the start of RAM, not 2MB later. Perhaps this
>> should be calculated based on PAGE_OFFSET somehow? Even better would be to
>> deprecate text_offset and instead introduce something absolute.
>>
>> Signed-off-by: Sean Anderson <seanga2@gmail.com>
>> ---
>>
>>  arch/riscv/kernel/head.S | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>> index 0a4e81b8dc79..74679f338c65 100644
>> --- a/arch/riscv/kernel/head.S
>> +++ b/arch/riscv/kernel/head.S
>> @@ -27,12 +27,17 @@ ENTRY(_start)
>>  	/* reserved */
>>  	.word 0
>>  	.balign 8
>> +#ifdef CONFIG_RISCV_S_MODE
> 
> Shouldn't this be:
> 
> #ifndef CONFIG_RISCV_M_MODE
> 
> CONFIG_RISCV_S_MODE does not exist.
> 
>>  #if __riscv_xlen == 64
>>  	/* Image load offset(2MB) from start of RAM */
>>  	.dword 0x200000
>>  #else
>>  	/* Image load offset(4MB) from start of RAM */
>>  	.dword 0x400000
>> +#endif
>> +#else
>> +	/* Image load offset (0MB) from start of RAM for M-mode */
>> +	.dword 0
>>  #endif
>>  	/* Effective size of kernel image */
>>  	.dword _end - _start
>>
> 
> Otherwise, looks good to me.
> 

Thanks for spotting that. Should be fixed in v2.

--Sean

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
