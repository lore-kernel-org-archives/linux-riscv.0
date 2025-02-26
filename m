Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439D7C021A4
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 03:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZKV96Nzw0+1NpY4YF7FhkFVPXeGihHkOE3U78dWP+0=; b=aWd+l4eh0tUNh+
	7PpW8wqVpR5FiwYY5BcpliS5OYHh9Sz57yY11bI67IlGp/uljdjRXZP6gA2SMDpY3L1XEFQ7HnFpG
	V1wHWsuK0FOvrJt4GkGBj/Y2CWB9QTUZJkMxoxRwJsGw1vwdcvbFSF5ZvW4gf06HH8IaAbd6gNy8C
	Zh+dy6tdKeGa0s6By5T+ch1Y4WIg0KVpomlAc/wXsJo4HuHFZbxLu1HE1honyXQfKRsDw6vkxR0xh
	elMIYb+46jCYR8gc4Qfci0Jd/rStxz+Q3KgLfxJNyu/Wo8Mxr5T0nKI/6AaURY3QiMRYwodPMXvlm
	jVNeRuhhuqHGPsUc/TVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn8MY-00000002JQl-2Kd8;
	Wed, 26 Feb 2025 03:45:34 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn8MW-00000002JQA-1hpf
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 03:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=kqrb1Tuv45oCW2s52tTkGEMymHWWUvdmwqaWUOHB7w8=; b=H
	gX8tasUmKHVA1Lxwkufzo1CRzUWwwHfkJwGvmr2upyq0OHqXkFvJ6K5bT/tRnxhP
	az78h9LgPlnt4hqyWjJN/fw4MMOBTUGAog8SoDjoMkU3p13rX5SHyx1uhDoErgvw
	qJkzBcT0nw75bRJvD8VPPNOxix+RaYYC6m0mefN2uU=
Received: from 00107082$163.com ( [111.35.188.205] ) by
 ajax-webmail-wmsvr-40-114 (Coremail) ; Wed, 26 Feb 2025 11:45:06 +0800
 (CST)
X-Originating-IP: [111.35.188.205]
Date: Wed, 26 Feb 2025 11:45:06 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Alexandre Ghiti" <alex@ghiti.fr>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 12/13] riscv/irq: use seq_put_decimal_ull_width() for
 decimal values
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <4c7393a5-ad1a-4740-b454-a9b85682a78f@ghiti.fr>
References: <20241108162503.9914-1-00107082@163.com>
 <4c7393a5-ad1a-4740-b454-a9b85682a78f@ghiti.fr>
X-NTES-SC: AL_Qu2fAvmfvk0r4CKeY+kZnEYQheY4XMKyuPkg1YJXOp80oyT14wcab19+GEfU1cmEMjuxkDi4QBVL8OF6frh9bYSLHs3bYr0Aa7jmWCMw5TKj
MIME-Version: 1.0
Message-ID: <70e006c0.4333.195405bb2e1.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cigvCgAHrgpDjr5np6FwAA--.46027W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0hIAqme+gqCYAQAGsO
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_194532_776186_CB370812 
X-CRM114-Status: GOOD (  16.88  )
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

Hi, 

Thanks for the test and  review, and sorry for not giving  more attentions to alignment issues when made the patch.
But if alignment should not be changed, simply appending a [space] is not enough:  the patch change
'%10u[space]" to "[space]%10u",   one [space] is moved from tail to the front,  and to restore to its original state
, one [space] should be removed from front.  and It would make the code  ugly and unpleasant  to remove a [space]
from this line 
        seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i, prec >= 4 ? " " : "");
( or make changes to seq_put_decimal_ull_width)


Kind of think that it does not worth the effort if  code changes are way too unpleasant....


Thanks
David
 

At 2025-02-25 23:10:26, "Alexandre Ghiti" <alex@ghiti.fr> wrote:
>Hi David,
>
>On 08/11/2024 17:25, David Wang wrote:
>> Performance improvement for reading /proc/interrupts on arch riscv
>>
>> Signed-off-by: David Wang <00107082@163.com>
>> ---
>>   arch/riscv/kernel/smp.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
>> index c180a647a30e..f1e9c3db094c 100644
>> --- a/arch/riscv/kernel/smp.c
>> +++ b/arch/riscv/kernel/smp.c
>> @@ -226,7 +226,8 @@ void show_ipi_stats(struct seq_file *p, int prec)
>>   		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
>>   			   prec >= 4 ? " " : "");
>>   		for_each_online_cpu(cpu)
>> -			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
>> +			seq_put_decimal_ull_width(p, " ",
>> +						  irq_desc_kstat_cpu(ipi_desc[i], cpu), 10);
>>   		seq_printf(p, " %s\n", ipi_names[i]);
>>   	}
>>   }
>
>
>Very late answer sorry!
>
>I don't have the same output before and after your patch because 
>seq_put_decimal_ull_width() second argument is placed *before* the 
>number, not after as it was before.
>
>The following diff fixes the issue:
>
>diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c index 
>f1e9c3db094c3..4b80ee4e5b2c0 100644 --- a/arch/riscv/kernel/smp.c +++ 
>b/arch/riscv/kernel/smp.c @@ -225,9 +225,11 @@ void 
>show_ipi_stats(struct seq_file *p, int prec) for (i = 0; i < IPI_MAX; 
>i++) { seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i, prec >= 4 ? " " : 
>""); - for_each_online_cpu(cpu) - seq_put_decimal_ull_width(p, " ", + 
>for_each_online_cpu(cpu) { + seq_put_decimal_ull_width(p, NULL, 
>irq_desc_kstat_cpu(ipi_desc[i], cpu), 10); + seq_putc(p, ' '); + } 
>seq_printf(p, " %s\n", ipi_names[i]); } }
>
>Will you respin a new version?
>
>Thanks,
>
>Alex
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
