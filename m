Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55E4C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 21:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=k363/miXIEGd+X9zbkbiVKktF85HBh6b4QVyW4aTmhU=; b=QnzLcKZdjVnhb+mAVvM6SQkcEK
	rfQxpkOPGooAEtVg+VmgQkqhE0eHWiCPdjfTrhKunCuho2T1ghMWEAu+qLYsX8cpzoWNkRvkzZ3xl
	2mn9o7KneiwK6smaSophijklpnxdV8N8LH1fhOHHwMjHmH9vYJcr7HEdtmE4p7UgoIfInOTnE7m15
	32XEVfckh/8d1XeDU1VBIQrsikQUJBiAeaLVYd38C8S/KDjnX1MNYUwBvx+wZ6UO0MsUR+Lg/I3sC
	ngNvqNg1xZ1wT6qCli9XmYbgX5vKBovhnOALc3POmu9zhkKwfF3fdmtUXMsyt9ZyM8uJIms50Qxaj
	uRAaGcbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p07zl-00BNeN-GX; Tue, 29 Nov 2022 21:18:25 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p07zi-00BNcs-Ng
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 21:18:24 +0000
Received: by mail-pf1-x42f.google.com with SMTP id x66so14928421pfx.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 13:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qygl16IRd8KFG8Vfs0lSqROckw4c/+z2lT7V/S7DmYo=;
        b=p3H/7FJVgm2LlfasNbtmkCmBj7H08S1ZgexDJv43b4JFOKEBjnDpsTEXq/cJKlWVyx
         eSUxQ70ZLhoUpw8qjE/pJi9x4pSclWkNSWgYsXsxB/0iXLbqNYSlLO/6MDEzyTrf1e+e
         sznDlXDmyaPNRPe7yiuJzejdna/VzOZLdZrRMHpmUy+OEc4jaUuskS1GkWDvpds/eeWg
         KEV3Di3XOxQahu4eW2ifA7oHA2EiMNXzpeO+TWdrzl2XtBZnsIEOx/WFjCEWlzq3z9HL
         FlhVLkGrNkelW4e7sG2uWULRhByZR0HfTrysTxaxZUmMPP0oOKTNgSA54vEfLwYsV8OC
         HH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qygl16IRd8KFG8Vfs0lSqROckw4c/+z2lT7V/S7DmYo=;
        b=mHnc7cNYMDkJ6c4/EFma0cUuNbipJrSSdwT+rC0ZKnjAwM6ZfKjAcJhmxdweWeQ4Za
         BPyu2q7p755nMQPtYEC1yFRVLviSFN0XQzCm4+65EVHZWrOM7390igtTQiKKyQjaFBsB
         rZ8xap/6QwLLLt2u819jGPlsHUZnScMCIvte7xrOJv52DHhQ9BztnbwetAnc9m1A9lRF
         HNa6JExysAOvXfDsuyMZ6qQicKCrjkFKH5HhTsc4BVaQFMdWg9pQ9QupVuImvWZcsdfh
         XhwjZPSdDpKs3DgpfSwqIabW2G1p4O4KYgAqZ4HyDhYjQESkYYDX+FAbjIY7TOOPC9+5
         QSOw==
X-Gm-Message-State: ANoB5plJo62qXmcljpqOguj0hK7bZ6jgIdsKdpRaqikrtQXTW9q4IZoR
	proNBMtEapkoUmmDrbqpxezDeuuD/IOcVA==
X-Google-Smtp-Source: AA0mqf6xFpMDrmArt+VJh7x50SPxqtX72gcKaOMe366/4q8jmR6bBPvXn3L6DDSgvv+MqrAEIHP7Fw==
X-Received: by 2002:a63:e505:0:b0:44a:2a6a:bb90 with SMTP id r5-20020a63e505000000b0044a2a6abb90mr53027045pgh.314.1669756699211;
        Tue, 29 Nov 2022 13:18:19 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id p1-20020aa79e81000000b00565c8634e55sm10369849pfq.135.2022.11.29.13.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 13:18:18 -0800 (PST)
Date: Tue, 29 Nov 2022 13:18:18 -0800 (PST)
X-Google-Original-Date: Tue, 29 Nov 2022 13:18:09 PST (-0800)
Subject: Re: [PATCH v1 4/5] RISC-V: hwprobe: Support probing of misaligned accesss performance
In-Reply-To: <3882183.NG923GbCHz@diego>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: heiko@sntech.de
Message-ID: <mhng-e4edd80d-2aa6-4a56-a13d-2d75d7ddd82f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_131823_015090_E52DF22B 
X-CRM114-Status: GOOD (  22.22  )
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

On Tue, 29 Nov 2022 13:09:49 PST (-0800), heiko@sntech.de wrote:
> Am Donnerstag, 13. Oktober 2022, 18:35:50 CET schrieb Palmer Dabbelt:
>> This allows userspace to select various routines to use based on the
>> performance of misaligned access on the target hardware.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> [...]
>
>> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
>> index cbda062de9bd..54bdcf9a5049 100644
>> --- a/arch/riscv/include/asm/cpufeature.h
>> +++ b/arch/riscv/include/asm/cpufeature.h
>> @@ -18,4 +18,6 @@ struct riscv_cpuinfo {
>>
>>  DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
>>
>> +DECLARE_PER_CPU(long, misaligned_access_speed);
>
> just my 2ct ... wouldn't it make sense to have struct riscv_cpuinfo
> as the central instance for all cpu-related stuff, so
> misaligned_access_speed could also be part of it?

I remember going through this one a few times and ending up here despite 
some cleaner-looking ways of doing it.  That way does look cleaner, 
though, so I'll give it a shot and we'll see what happens...

>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index 553d755483ed..1599e40cd170 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -222,6 +226,22 @@ void __init riscv_fill_hwcap(void)
>>  			bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>>  		else
>>  			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>> +
>> +		/*
>> +		 * Check for the performance of misaligned accesses.
>> +		 */
>> +		cpu = hartid_to_cpuid_map(hartid);
>> +		if (cpu < 0)
>> +			continue;
>> +
>> +		if (of_property_read_string(node, "riscv,misaligned-access-performance", &misaligned)) {
>
> I think this wants a "!" in front :-) .
>
> of_property_read_string() returns 0 on success, so running this
> results in a nullptr right now.

Thanks.  I'd not gotten around to actually running this so I bet it's 
broken in a bunch of ways.  Did you try it out?  I was really hoping to 
find some time to get at least the simple stuff in for this cycle, but 
too many things keep coming up.

>
>> +			if (strcmp(misaligned, "emulated") == 0)
>> +				per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_EMULATED;
>> +			if (strcmp(misaligned, "slow") == 0)
>> +				per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_SLOW;
>> +			if (strcmp(misaligned, "fast") == 0)
>> +				per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_FAST;
>> +		}
>>  	}
>>
>>  	/* We don't support systems with F but without D, so mask those out
>
>
> Heiko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
