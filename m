Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79525CCD192
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 09:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqHkFFBIi+yiZHexMkU0Iy3Id6DDfPMzgYEPkR/k0As=; b=cNyQKV8iEA9nSP
	NkOqBhMN4vSMSRHGRcBEC87AZasEtruovu4drwGr/pytH0KaycVB+/NgLOr27f+08kAqiKA0LTPZn
	uc2EZokuPMqChoJpGmC/NM3BlRTVz4WrzbpI0rczivFc+4UTmLxkW8uqVfqFLJFf1Yo8L3roZLvYJ
	9pwuql2dglFATIlUPl2JIos5oMeTOPQ6qSjPFCCHVS2rI4hISrLdm+Z02LT1Z9t65zwDw//fpUHGf
	bcqYc/b7DmiAX6QGx70H7cjO8JsmGHzc0AgqC61/NSLK1pR+VXPjbvpI6/4evvpyaW2DuYMUZLeGS
	6FXYfL+8q7fuumkjGiTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqrT2-00000007yLs-2i9P;
	Wed, 18 Sep 2024 09:59:24 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqrP3-00000007xmW-3SHP
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 09:55:19 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71971d2099cso1753952b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Sep 2024 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726653316; x=1727258116; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QhKG0I/3bMgQH4PBG/+CR/UlqrBpwTQdt5kzBqItdGQ=;
        b=QkDpxWxVpZeUyu9pgg3nzwzcWHYfL/R4UiOfEcha673LzQ9G8SCrZOYGVFgbChOczf
         WgbqnN69RnvuMMoNB+eYY/ngFbcGtZ3cQrn9azdbnuKmBcgUiqeKh0hn2goREr8+r28K
         SAMMWaiqnaBYXmsenr9+I2ii3V+aA92kfyPuTwxFnxNaEHft12pHip4JIFeJRqYmfrxx
         xQRTY+C79nrHUhsL8Cs1TnA3Rw5rZe7kpQv8DHKfH60v4lcK9STYFdHApbGUM+HVeloF
         lHpGJv56Qi+S/gouhgGFDSW5R0dJObMe+RksAd0N4rExMO1cw/IpSqGB+HMEhyR6/aB8
         Takg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726653316; x=1727258116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QhKG0I/3bMgQH4PBG/+CR/UlqrBpwTQdt5kzBqItdGQ=;
        b=sTJH8OQehZmZ7NGkimo076rjVaMPgv/Sql4b6zYp1d6KJR0sta91KJ5J37uo89nT8b
         AxlVLhbaG0JS23Tc2K0/dVhac3j5R7Fr+QTaGwaVcPytzRXeQZDd2Mizx1gc9VTKBQam
         oJAzshcKrm2uOgdOiJ97JkK1WUl7E8c8xykqxBBrvwfFcDn8K9+J1ug/ahTydz2WQSge
         s9GQww0nGvyr3db4KrhRPDwsrgcSIIhvN5NAXq0dC026G5aVvm/8AJWfcTV0B3TAelIl
         YFB9CLb4BiGFkU0QB9clz6DGaDg58kti81UwfbsFgLMI1NJ6QzC5jlWseOlLpDWO+zj9
         goDQ==
X-Gm-Message-State: AOJu0YwwkZMifmM4i/iFdL3TFIiNH7YbFxVqXyNf2i51JROc27pSZFGk
	b+jkoIVqXVYHXgGWviBWO6qvbHexSP67Y18KNSqfR8KdGUccsdz73rmuKcFLgV4=
X-Google-Smtp-Source: AGHT+IFOs09eHXlJpqKGpsw53BR1MtXtSp1SFZu4rm9muof3aMtzAqyN4Ui6B6XqtFn5DWgAireXDA==
X-Received: by 2002:a05:6a00:888:b0:70d:21d9:e2ae with SMTP id d2e1a72fcca58-71936a38e11mr30391866b3a.6.1726653316162;
        Wed, 18 Sep 2024 02:55:16 -0700 (PDT)
Received: from ?IPV6:2601:600:9001:ecb0::c91c? ([2601:600:9001:ecb0::c91c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a97799sm6392134b3a.23.2024.09.18.02.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 02:55:15 -0700 (PDT)
Message-ID: <6ea17387-6efc-49c7-b631-b6a682054d49@rivosinc.com>
Date: Wed, 18 Sep 2024 02:55:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: extern illegal instruction trap and trap RDCYCLE
To: Ben Dooks <ben.dooks@codethink.co.uk>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, atishp@rivosinc.com
References: <mhng-ac746ffc-8099-447d-a45f-772550f23290@palmer-ri-x1c9>
 <bab6f17a-3e39-4be4-a20e-bbdbbc2e81f8@codethink.co.uk>
Content-Language: en-US
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <bab6f17a-3e39-4be4-a20e-bbdbbc2e81f8@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_025518_126187_33C89FB7 
X-CRM114-Status: GOOD (  25.79  )
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

On 9/17/24 7:01 AM, Ben Dooks wrote:
> On 17/09/2024 14:46, Palmer Dabbelt wrote:
>> On Tue, 17 Sep 2024 06:08:50 PDT (-0700), ben.dooks@codethink.co.uk 
>> wrote:
>>> This is a RFC series to change how the illegal instruction trap
>>> is handled and then how to trap RDCYCLE and emulate it with RDTIME
>>> instead.
>>
>> Only 1/3 made it to lore for me, not sure if it's just stuck somewhere.
>>
>>>
>>> I did this when we found multiple libraries using RDCYCLE and
>>> upgrading multiple runners to newer kernels caused many problems
>>
>> OK, so I think we're kind of just stuck with RDCYCLE then -- it was 
>> part of the base ISA when we merged the port, and every time it 
>> disappears we end up breaking userspace.
> 
> Yes, it was an annoyance, we managed to track down all the users and
> patch out.
> 
> I thought this might be a useful idea for more generic type, so might
> look at updating to have a table of instruction masks to call.
> 
>> I'm not sure what exactly the right way to do this is: IIRC there's 
>> some perf-related hooks for this, but there's also systems that just 
>> don't implement the RDCYCLE instruction at all and thus we'll need 
>> some sort of emulation for those.
> 
> I couldn't get the PMU driver to allow it, not sure if there was an
> issue higher up or some other issue?
> 

Here is the way to properly allow it via the driver.

https://www.kernel.org/doc/Documentation/admin-guide/sysctl/kernel.rst

Check the perf_user_access

As you noted, the user space application shouldn't use RDCYCLE for 
various reasons discussed in the past.

If RDTIME is really not an option, you can always set the legacy mode to 
enable access.

>> So hopefully the other two patches get through the lists at some 
>> point, but I think in general this is a reasonable thing to do -- or I 
>> guess maybe a completely unreasonable thing to be stuck needing to do, 
>> but no way around it ;)
> 
> I'll check back later, currently as OSS-EU
> 
>>>
>>>
>>>
>>> _______________________________________________
>>> linux-riscv mailing list
>>> linux-riscv@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
