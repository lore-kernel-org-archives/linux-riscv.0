Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF31C388F7
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 01:44:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A90B8206FB
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 01:44:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2wj6ib3T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="URECsNzO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A90B8206FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=SAytVJz4K83Bn4W7QudOFPwyCNkFJG0u2GyL+OVbcmE=; b=2wj6ib3T1/ho+TGLlwfprjO65
	x7d7JX84N7SDafCQCh5vgs3DecvkhgH0mU1Sx3zalhWUnhkTCZRvG6G8W3yCFO6QUqckmo5UnCTeD
	uEbSPfdeHgYoQ8o2uBuMtlvEk+8rl3qqZt8uhgcKj9dckprVOeKhJr7ap3jNU522D2JrIh/60ATxv
	7WbDuUJyOn2sZzgP8ufwUIcH+TAnZ8OOswQ9Eb7/g3YXdnpolv8SYkhp1UQsollQ5Y4zSrOKig1ky
	21d9AFyT6LNuehkVm8Wve9olZIDB8vfanCrsTC/ELwsBVwghUl40cOtByjeEMhQ8COOxWeloona8w
	gCWhfVenA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaqnB-0007es-Da; Fri, 06 Nov 2020 01:43:53 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaqn8-0007e3-IU
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 01:43:51 +0000
Received: by mail-pg1-x544.google.com with SMTP id i7so2696633pgh.6
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 17:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=aTN6WRlWLsUjLIrI3m0xeUDuOsOcwqT05Nmk3Bvff1o=;
 b=URECsNzO9RXYSHuw4mDT4zXGZeofoBveGTW+8IbryC8ZuYGXuZyMWlyAJrAo/U13Fc
 ho2+X1FKQgCoZwk5Es8mtrIi6IGXkjTmBOi4qo0//4fzqgAhHX38LqxEpOhiBJEd6E2b
 rDAUhM/6PiwUyQm4FTpOYXkUhL7WoGITyCYtSIW6Dutyjn9TgIsivTFl49JBzRVbZ2mn
 ab6c+5h95DJJm9fGiSKJBbmtSqVJ/jDdWqlJqWeBvAuKLMsCqmi5Aczbvlb7TR5HmQku
 jVEDcZMxgYA0NX9UFKVleDumtO7i2KEYtK2dgFOusE93h/Ylhd9lqIngOb7sHIZ22YPY
 EQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=aTN6WRlWLsUjLIrI3m0xeUDuOsOcwqT05Nmk3Bvff1o=;
 b=rl08x15SQ9AFlMsUs6nzkeUWf8vmmWy8WnyMMzSmVpiwYz5qe+JuFsgQwxh4wCVdLR
 oSqV1dxA83Sphs8vfa8+68SLAQ0G+I/UPa5xncsRVlOon2geqcOo1e2UP6A00aR9oQ8f
 +fYV1PmmwDrcSDElb3lQglue5FCUF0E022iAO3N7WWyCnIwQQln9ouokPK6LKhMeCy/m
 4Z8FqZf8gY8KsS/Hly08kAWeSoHxifD+3yhaHmI6+cVqghW9uTEyNkSoAQrkU4xYId5H
 cd9odv5eOwGeXj20kxvELnG3qMKKbTamZlDIQDsAwXY+rjS5FetU2rSKN+Vn0R6hCTs+
 KA5Q==
X-Gm-Message-State: AOAM5304q4hduJzHKMV2Pxvl18ZzVH7kATA69Fh8iSeQ9C5T102MsaOG
 2m9IkAk2pc7LedUkLP2UulGQ3AHL7O6lUw==
X-Google-Smtp-Source: ABdhPJwfPpSOHaFHwdBOovinFD6PcktLBqNeHNd2IeAKEGeg+odVG2dFAFzyDzhtCS3IYeMk3eb08Q==
X-Received: by 2002:a63:5153:: with SMTP id r19mr4944335pgl.130.1604627028540; 
 Thu, 05 Nov 2020 17:43:48 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x5sm4057924pfp.113.2020.11.05.17.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 17:43:47 -0800 (PST)
Date: Thu, 05 Nov 2020 17:43:47 -0800 (PST)
X-Google-Original-Date: Thu, 05 Nov 2020 17:34:16 PST (-0800)
Subject: Re: [PATCH v2] riscv: Set text_offset correctly for M-Mode
In-Reply-To: <BL0PR04MB6514430D1426E3C0CD8A1DC2E71D0@BL0PR04MB6514.namprd04.prod.outlook.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-434fbfef-3e4d-4600-a327-50add822cd36@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_204350_743270_4A128242 
X-CRM114-Status: GOOD (  17.94  )
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
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, seanga2@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 22 Oct 2020 16:55:33 PDT (-0700), Damien Le Moal wrote:
>> On 2020/10/23 5:30, Sean Anderson wrote:
>> M-Mode Linux is loaded at the start of RAM, not 2MB later. Perhaps this
>> should be calculated based on PAGE_OFFSET somehow? Even better would be to
>> deprecate text_offset and instead introduce something absolute.
>> 
>> Signed-off-by: Sean Anderson <seanga2@gmail.com>
>> ---
>> 
>> Changes in v2:
>> - RISCV_S_MODE does not exist; use RISCV_M_MODE instead
>> 
>>  arch/riscv/kernel/head.S | 5 +++++
>>  1 file changed, 5 insertions(+)
>> 
>> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>> index 0a4e81b8dc79..5a0ae2eaf5e2 100644
>> --- a/arch/riscv/kernel/head.S
>> +++ b/arch/riscv/kernel/head.S
>> @@ -27,12 +27,17 @@ ENTRY(_start)
>>  	/* reserved */
>>  	.word 0
>>  	.balign 8
>> +#ifdef CONFIG_RISCV_M_MODE
>> +	/* Image load offset (0MB) from start of RAM for M-mode */
>> +	.dword 0
>> +#else
>>  #if __riscv_xlen == 64
>>  	/* Image load offset(2MB) from start of RAM */
>>  	.dword 0x200000
>>  #else
>>  	/* Image load offset(4MB) from start of RAM */
>>  	.dword 0x400000
>>  #endif
>> +#endif
>>  	/* Effective size of kernel image */
>>  	.dword _end - _start
>> 
>
> Looks good to me. Added this to my upcoming pile of patches for Kendryte and
> tested. No problems.
> 
> Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
> Tested-by: Damien Le Moal <damien.lemoal@wdc.com>

Thanks.  This is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
