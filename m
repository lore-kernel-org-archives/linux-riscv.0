Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E2EC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 12:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAiVDExX2hZl8ijmeIvYqOidjNuivMFdoXl45zCvqDo=; b=NYmzeskfz8soD4
	srjLl+xLEde+Yl5W8K0Mj2M3GiJIZdP4+SN2pL7bg7OahPP3idx9Hqcch2aJVX7KHO3LxXivlUoRy
	caXQpDYEcS5IQAyw7MBAHzffldMHXdYQIxBTnTIN/4AjwtpSs5qdueECxxUDsEdoylojNjaBPYsBF
	UlyBqWvvI+CXhiy0ZqEE+7U6kxM68hr13sSJqWxQS6iFiaGtEDVD6RyLlrW17KqO/N9BK0LgPTQVj
	rEAW1PVnf1Xl1e4ISz+7VjOt+Y+64+CaBr4J2YhFjz22kpZRl+5/TghEAgZ4BqghAdS2v+2k4MAgd
	2icJxt3303d3S3DZdWAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weX8k-0000000GuOr-2aXH;
	Tue, 30 Jun 2026 12:00:34 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weX8e-0000000GuM7-2QYP
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 12:00:30 +0000
Received: by mail-pg1-x544.google.com with SMTP id 41be03b00d2f7-c85a297d2d2so2923230a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 05:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782820828; x=1783425628; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rQJzhkIkVPlkRxcrVSAS1/qxSmuU/Saa7J0AIvXGGuk=;
        b=Bj1LapwFxR1TnBUo1E/O03bWfzspCNxY6Mt+kzdR+2iqoaGgAw7gpWY9ohvuX/WpWb
         sLINU/rHbLcPYExwXfTyNjfGTIfsSf+QJW+Sbt35OG+deLWBdIkcMrN4i+MnHHMtocCo
         00APTfl/IUJ2T0YVejBoSpZMDXra1FcNK2/ec+lqewx/L6StAULqdaoXFG7icoby130v
         24DxUzqpBwZ9s+rBw6JUSrd5Ge2WxmdXt2OAVXmOsRnkNwFmKIbTkY6aM5Aou41iTvBJ
         zA/q4ncMKkDoxfu47Rda8F9Q9QOMl5yAB2d7uVvkBg1v2qCHbVizLhHzTRIRNAx35dPb
         lw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782820828; x=1783425628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQJzhkIkVPlkRxcrVSAS1/qxSmuU/Saa7J0AIvXGGuk=;
        b=fOTDmhOxZWVI7HUZMC1K/MU8HWwllLJjjHmJd2bkDKxJ53R7A2dQSeH4vdffpAZBlE
         EgXSz6JfQM+cwvjCXzm/hbSlHkZ1BFnlpFXNSh0O4Ab5/uomYkCX9k9q6aU80EgXCYD+
         O8wyzr1iJKnOUBHA2eDBcGGjfJBGUKjgckq/GT9V7JhlizihNrTlQ0GkdWj6fOCcO7BN
         kRz7a8fM/zyfdgAyYREMBMo8BVkvwddH+5Rj8t8t2PgYvgRCLbN3fTHhuenyYeC3p7Dn
         bPArtH+atKnZj2jvFfmpFJIkjLy3TyfZBH41GwkFfm1TuK8PnS7nvxJ/sQusKD3BpwSm
         5AFw==
X-Forwarded-Encrypted: i=1; AHgh+Rohm5Bpr4NwU37WOFLjKFeNytXPH7uUGBhK/wPe5l1vQTpujGBU3zfa6nL+mrB+bvOdYmJmxnRoyGVprw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzry079fi9hlS0CBU+AuXX/auUpwRXhvuxvffIwen7H97x96EMS
	qGvATbx+oAQjUxjX4COnwaNyfYqUfZkBblRZEamJwFS2iOBUlEpW4pwk
X-Gm-Gg: AfdE7cnpCCz+MzDLaV5blyHyzyK9LOiPkRahdkJfeWzRE+cWCl37gTBxQlVuQZHSFGP
	bb9UygHx9Kl5hnG8UeIdoTTqQ4f/ufVvYg3mG7x11wmiRtNxxkSflFiW393X6ZMlT9XIxqvC08H
	7Z9DrDre27OLVg1Y6ra+NX4FZ5NKqwbhLjFJtF84kqt9I1N8vfZ+2Dc5hXKXIF+ED4En2cz3Hnh
	BgamXPo1+LGwrlvLfPflv4bzduWy9vnsOOEtaDZe05t7DiPQAL8aGn2GkPy0A4QVl7z8zMCsxT1
	eYoagyvObu8IJRNtTyieANRAtyvSbNLpvmPgQeCuBCGT/3TFn/i19dSSnrH2cMBfxHwT+aCG/Zu
	CBXJhEB3SQRGz0ylAp3L6kIgVxcY2efDfG0hbOcwEhIfoAU4vjj4kGs3VGVX3YpixiARSGdJaeZ
	ePR0iZzSzrwPd0uALwriph
X-Received: by 2002:a05:6a00:1ca1:b0:847:902a:57b5 with SMTP id d2e1a72fcca58-8479f2175cbmr2758259b3a.35.1782820827394;
        Tue, 30 Jun 2026 05:00:27 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd39asm1834294b3a.34.2026.06.30.05.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:00:26 -0700 (PDT)
Message-ID: <e6028d44-781f-4d21-bef9-eba0547df03d@gmail.com>
Date: Tue, 30 Jun 2026 20:00:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] riscv: kdump: exclude non-dumpable reserved
 memory regions from vmcore
To: Pratyush Yadav <pratyush@kernel.org>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, robh@kernel.org,
 saravanak@kernel.org, bhe@redhat.com, rppt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 iommu@lists.linux.dev, zhaomeijing@lixiang.com, catalin.marinas@arm.com,
 will@kernel.org, alex@ghiti.fr, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, ruirui.yang@linux.dev, m.szyprowski@samsung.com,
 robin.murphy@arm.com
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
 <20260630074715.4126796-10-chenwandun1@gmail.com>
 <2vxzechoi8o0.fsf@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <2vxzechoi8o0.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_050028_627656_F021B2A8 
X-CRM114-Status: GOOD (  15.76  )
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



On 6/30/26 19:12, Pratyush Yadav wrote:
> On Tue, Jun 30 2026, Wandun Chen wrote:
> 
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> Apply the same non-dumpable reserved memory filtering to RISC-V kdump
>> as was done for arm64. Use of_reserved_mem_kdump_exclude() to drop
>> flagged regions from the elfcorehdr PT_LOAD segments, and
>> of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.
>>
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> ---
>>  arch/riscv/kernel/machine_kexec_file.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
>> index 59d4bbc848a8..25359d583bc3 100644
>> --- a/arch/riscv/kernel/machine_kexec_file.c
>> +++ b/arch/riscv/kernel/machine_kexec_file.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/elf.h>
>>  #include <linux/slab.h>
>>  #include <linux/of.h>
>> +#include <linux/of_reserved_mem.h>
>>  #include <linux/libfdt.h>
>>  #include <linux/types.h>
>>  #include <linux/memblock.h>
>> @@ -64,6 +65,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>>  
>>  	nr_ranges = 1; /* For exclusion of crashkernel region */
>>  	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
>> +	nr_ranges += of_reserved_mem_kdump_nr_ranges();
>>  
>>  	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
>>  	if (!cmem)
>> @@ -77,6 +79,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>>  
>>  	/* Exclude crashkernel region */
>>  	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
>> +	if (!ret)
>> +		ret = of_reserved_mem_kdump_exclude(cmem);
>>  	if (!ret)
>>  		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
> 
> Nit: can you do the usual pattern of if (err) goto err; instead?
> 
Sure, will fix in the next version.

Best regards,
Wandun

> So this would look like:
> 
> 	/* Exclude crashkernel region */
> 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
> 	if (ret)
> 		goto out;
> 
> 	ret = of_reserved_mem_kdump_exclude(cmem);
> 	if (ret)
> 		goto out;
>         
> 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
> out:
> 	...
> 
> With this,
> 
> Acked-by: Pratyush Yadav <pratyush@kernel.org>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
