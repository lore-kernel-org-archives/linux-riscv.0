Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FCAC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 17:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=U0Xb+rl5ZJrSM6KJsqLEm4Y3oaeNDNISJaepoAbBlGo=; b=1EGhUhHZqtR9p45xZD6w6fgPfA
	Dj2kfaNiKA2FMXixXAYc/422S08ei0QAeRMpQVJE+/Z0Pg+6nKbOz3ar85y1HnrENuOJzDlCB/rfQ
	ylHJCbOAmqEgOleWhHhUz/SqglhFjYCzwC2qjo33dS+nDkCqTmJrymm3ELU6UcHkU7NshHFV3BbCa
	FoMLDxv2P4KxCEV2fnTUo4NjPBXfpqI9HSXVYATzapaoOSYZ3n1XeHnkxzS2INoh/UcVkaEJI/DYS
	9a5oIAywh0pgeWyYWque5NRu8bHwXVfoswV5iNUVetHDvvp8mnZDaJDvNv8k8J+EACuNjSc5euJHv
	ZvS2hpHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIDVK-004Wce-Pn; Thu, 10 Feb 2022 17:45:14 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIDVH-004Wc4-Aw
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 17:45:12 +0000
Received: by mail-pl1-x62c.google.com with SMTP id y7so2463239plp.2
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 09:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=AZha1RccIF7za5ssj9x30t78pu69cVkdItKCQ4s8b7Q=;
 b=pia1DVDgF+xurz3e7O68FNSA0J/iWRwRy92bi4S9HpDJnHp9RJuL3LOEZiwRMujIWg
 gfVyO5jVMaswijwM7WDvb2nQQBOAM2OBd2Xdl2ABFTlNhoQUVZJpnnSCc9KmkyF6VOHL
 202b3eRgmQwv500/EBqVswQHkbCFH0yQocrFBiwNhaFki7vThwYo7W9Ny2smyXkZI5Xd
 Cs0FEmCmgLRhzPoqxsy/Lyh/20XyU5f3BVCd49R+Fdt4Ta7YsgTWiKD55Do3TOeDdVNG
 T/VWXYUxPbSybzd5a1RvK7i5Srp3Ax//ejQXhse17yaDUDJCHjNiQq2jrll+NBrAPnTJ
 fF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=AZha1RccIF7za5ssj9x30t78pu69cVkdItKCQ4s8b7Q=;
 b=x9pmI97hio11IZ5B5f0Jn7zGandsYnjgwMhvgvakNjxO01ER5NMq+l1bJlYiY7pb97
 LVZLYT2dcmnI19OqW7wXVr4eiAN9RaIyNDEA30ZY8b1+gIKwMx8vvMvnZ75WEjaltKYk
 +/BPA7VnEExoxFi68EV4v/IBEkmbQ+WnecesMbu1g5RDg7907ewfOuGtUyCSAXuBqznM
 yqwP7Qmz1OYnAMx3RKKjMV09gXXitkEp9PO6GvE4hvno37TB8sybniI5Rl90Ix/wMRL/
 xjPwo7usp084QXAGIK2eyGGAI9FLY/4G7H9djfC2WXkm+ShSkofvUHDQffM5P+UX4Oio
 yb1A==
X-Gm-Message-State: AOAM5305bWRV88giXPtQ2LUxSrNhCkLOc9LJOURuzg8oZtnP6cIhF5FG
 OMZPOmu0jd/faOeUyaliyq9czw==
X-Google-Smtp-Source: ABdhPJz4GKqt91V8rDUVAgYL0FHzY98LSoLvSKITEf7cOWPHMLElbKD8NL9xy4dZek82hZCyQPLAAA==
X-Received: by 2002:a17:902:b213:: with SMTP id
 t19mr8342518plr.65.1644515109654; 
 Thu, 10 Feb 2022 09:45:09 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id s10sm25258174pfu.186.2022.02.10.09.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 09:45:09 -0800 (PST)
Date: Thu, 10 Feb 2022 09:45:09 -0800 (PST)
X-Google-Original-Date: Thu, 10 Feb 2022 09:44:43 PST (-0800)
Subject: Re: [PATCH] riscv: cpu-hotplug: clear cpu from numa map when teardown
In-Reply-To: <mhng-9439ea0d-b7ab-48ed-a359-702383ad6321@palmer-ri-x1c9>
CC: kernelfans@gmail.com, kernelfans@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 jszhang@kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-8c873be3-015e-47f2-8dd2-fe631be92be4@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_094511_401712_59D13D49 
X-CRM114-Status: GOOD (  19.45  )
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

On Tue, 08 Feb 2022 17:13:21 PST (-0800), Palmer Dabbelt wrote:
> On Sun, 23 Jan 2022 04:13:52 PST (-0800), kernelfans@gmail.com wrote:
>> There is numa_add_cpu() when cpus online, accordingly, there should be
>> numa_remove_cpu() when cpus offline.
>>
>> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> Cc: Jisheng Zhang <jszhang@kernel.org>
>> To: linux-riscv@lists.infradead.org
>> ---
>>  arch/riscv/kernel/cpu-hotplug.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
>> index be7f05b542bb..78d156a359ef 100644
>> --- a/arch/riscv/kernel/cpu-hotplug.c
>> +++ b/arch/riscv/kernel/cpu-hotplug.c
>> @@ -40,6 +40,7 @@ int __cpu_disable(void)
>>  		return ret;
>>
>>  	remove_cpu_topology(cpu);
>> +	numa_remove_cpu(cpu);
>>  	set_cpu_online(cpu, false);
>>  	irq_migrate_all_off_this_cpu();
>
> Thanks, this is on fixes.  I don't really have any NUMA-related test
> setups, but if someone has a QEMU-based config that's meaningful then
> I'm happy to add it.

I think I accidantally pushed this to the public branch rather than my 
staging branch, so I missed a build issue (missing numa include in some 
configurations).  I've force pushed a version of the patch with the fix, 
it's included here for reference -- I generally don't like to force push 
fixes, but given that it's a pretty trivial build failure I think that's 
the best way to go here.

commit f40fe31c01445f31253b15bef2412b33ae31093b
gpg: Signature made Thu 10 Feb 2022 09:17:00 AM PST
gpg:                using RSA key 2B3C3747446843B24A943A7A2E1319F35FBB1889
gpg:                issuer "palmer@dabbelt.com"
gpg: Good signature from "Palmer Dabbelt <palmer@dabbelt.com>" [ultimate]
gpg:                 aka "Palmer Dabbelt <palmer@rivosinc.com>" [ultimate]
Author: Pingfan Liu <kernelfans@gmail.com>
Date:   Sun Jan 23 20:13:52 2022 +0800

    riscv: cpu-hotplug: clear cpu from numa map when teardown

    There is numa_add_cpu() when cpus online, accordingly, there should be
    numa_remove_cpu() when cpus offline.

    Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
    Fixes: 4f0e8eef772e ("riscv: Add numa support for riscv64 platform")
    Cc: stable@vger.kernel.org
    [Palmer: Add missing NUMA include]
    Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
index be7f05b542bb..f7a832e3a1d1 100644
--- a/arch/riscv/kernel/cpu-hotplug.c
+++ b/arch/riscv/kernel/cpu-hotplug.c
@@ -12,6 +12,7 @@
 #include <linux/sched/hotplug.h>
 #include <asm/irq.h>
 #include <asm/cpu_ops.h>
+#include <asm/numa.h>
 #include <asm/sbi.h>

 bool cpu_has_hotplug(unsigned int cpu)
@@ -40,6 +41,7 @@ int __cpu_disable(void)
 		return ret;

 	remove_cpu_topology(cpu);
+	numa_remove_cpu(cpu);
 	set_cpu_online(cpu, false);
 	irq_migrate_all_off_this_cpu();



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
