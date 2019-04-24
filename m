Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2B7C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 16:51:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C9CC206A3
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 16:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WaVdaJ/T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="YLsNKG9n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C9CC206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HIfslgFFRbbHAa7XYYYn8ku8Lw2vIpoF7vtu+IyE/zY=; b=WaVdaJ/TdvUb/4RmN08pEhi0I
	69Wdn1rUi+X1Kus7emj5Rp48PxRERgsYR17QgEfx6Awmzyf6haT3ve25Rz0d0S1V8t71EHROfLDQT
	As44/r8QeydvLAlDdYS8Q8gV3URtlQmHwaE2oBGYStELSyThmI3rFl4sb3zXrWwvXVJzjwEf1umP4
	nM8y9+hSRa9bQmiOVe4FsZcS1ljE7wzASjnKuo0ay+Xki25W8zv7n15iNBLHDxyqyYq9MdXMtJ0BD
	V/sA56kxNi27FlMoBxjhrstP+JBw7SUR70YdwJRBThId1+/VE/vzKrwIVzObUJu9f/wSzQ/WT7aL1
	YnbKymsbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJL6t-0005Av-3b; Wed, 24 Apr 2019 16:51:03 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJL6q-0005AB-39
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 16:51:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556124660; x=1587660660;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=GlUjytnYt3dDfD0kI047DD3j/C12yQtxAL+gnd5rzyQ=;
 b=YLsNKG9nE2C0WLAtsN+V0rQ74UUPnwSHiEFfyi6PffyOGNlfMSJ86PIM
 2Av2RET8PYPBVJXSiUMR0zJhY5R7dcybmtM47KaQRMks8g+xi2KH8J0Nu
 7WiOJ7jek70YRJyHbaXVqKOi+I71Zc/jdtbjddZqdmHhx9OtmSLeiajyQ
 SU7nHE5QP99iJcVhBh9IxSKoiE+cYugcW3Va9SET8pgrRmKa/bkfIHCbG
 yTyYKzhyiNvMrPw6bdE7DCf3R9nhI6ygkPEMHGbPbxE3AYQGUTCifWPG3
 c9MUxqvA2JiwE4Z7KeXGyA8hK+mEW8QyGo1IyFsRp7lcS/99H8muU449q A==;
X-IronPort-AV: E=Sophos;i="5.60,390,1549900800"; d="scan'208";a="111663280"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2019 00:50:58 +0800
IronPort-SDR: 2rOkeIRYnTS3YUkb+qSsENUp1Spn9ZejUc3krSdT9H3dyYxC+dXN5+vP2UAYnwTc9OPPwpDY9m
 VGDbMOHYxR2BMuuvSkUmH1R7LL7bHyL0vmUMHxTt4Zn+DdPRWS498kQwIiS69P7Njh6C8ZSF99
 rCp7WYd60VEEmvxEDxSYCn9xDn5llIMlgCYe6QemgozAv9VQhkPaE4m+xl1O/gc5/6+kOIeh7p
 aatMKgpkwqjbLEAw2R4J2P5jFS4W5kumd+irFfUtlxIKsApFZ8CoX1rGaZySGhWQf5IruNAE1l
 50MrZ/YSNms9D/hc2+7i2AOA
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 24 Apr 2019 09:29:37 -0700
IronPort-SDR: iKIwQD+L/YrbHh+8Mjv83xcedcVEBFiC5eNSUa0uHyC2o8OqEN5mNdiXRkVFPVGX+kULGjXisq
 LNTS/ceDKZEGekwAkSeetUdE8mtV/ggbXZzG96yo7HXvdLWxB21LZG3iOGrpTVWJvD9nNf1JhL
 ilJN8gi9QCI3DJu/cdF50cHOmTkysowvc4ndBhIXN5Ejf6hKEVGhJnm+9NxVgu1HS1HY24BtuI
 rFctAfZ5hoRACwrxvOmHHnCwIQb1+qeJB8VFRhi/BdiqpNl+C+M80lhizuZZW7m/I1m2Zr6Z0f
 Q78=
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.66.167])
 ([10.111.66.167])
 by uls-op-cesaip02.wdc.com with ESMTP; 24 Apr 2019 09:50:57 -0700
Subject: Re: [PATCH v3 1/3] RISC-V: Add RISC-V specific arch_match_cpu_phys_id
To: Sudeep Holla <sudeep.holla@arm.com>
References: <20190424000227.3085-1-atish.patra@wdc.com>
 <20190424000227.3085-2-atish.patra@wdc.com>
 <CAPKp9uZNEdL=Jt7vsxMBo72WR=ArefB6Vi7fLxnxMwAfUT3JOw@mail.gmail.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <0d7be79c-3a74-dcb2-6618-d391e4cfec70@wdc.com>
Date: Wed, 24 Apr 2019 09:50:56 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAPKp9uZNEdL=Jt7vsxMBo72WR=ArefB6Vi7fLxnxMwAfUT3JOw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_095100_252557_A51890F3 
X-CRM114-Status: GOOD (  17.29  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Andreas Schwab <schwab@suse.de>, Palmer Dabbelt <palmer@sifive.com>,
 Johan Hovold <johan@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/24/19 2:07 AM, Sudeep Holla wrote:
> On Wed, Apr 24, 2019 at 1:03 AM Atish Patra <atish.patra@wdc.com> wrote:
>>
>> OF/DT core has a hook for architecture specific logical cpuid to hartid
>> mapping. By implementing this, we can pass the logical cpu id to cpu
>> node parsing functions.
>>
>> Fix the instances where logical cpuid is expected as an argument in
>> of_get_cpu_node.
>>
> 
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> 
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   arch/riscv/kernel/cpu.c | 3 +--
>>   arch/riscv/kernel/smp.c | 5 +++++
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
>> index cf2fca12414a..c8d2a3223099 100644
>> --- a/arch/riscv/kernel/cpu.c
>> +++ b/arch/riscv/kernel/cpu.c
>> @@ -136,8 +136,7 @@ static void c_stop(struct seq_file *m, void *v)
>>   static int c_show(struct seq_file *m, void *v)
>>   {
>>          unsigned long cpu_id = (unsigned long)v - 1;
>> -       struct device_node *node = of_get_cpu_node(cpuid_to_hartid_map(cpu_id),
>> -                                                  NULL);
> 
> I assume it work working just fine as you are doing cpu to hartid
> conversion here and
> weak implementation of arch_match_cpu_phys_id does direct match.
> 

Yup. That's correct.

Regards,
Atish
>> +       struct device_node *node = of_get_cpu_node(cpu_id, NULL);
>>          const char *compat, *isa, *mmu;
>>
>>          seq_printf(m, "processor\t: %lu\n", cpu_id);
>> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
>> index 0c41d07ec281..94db72662f60 100644
>> --- a/arch/riscv/kernel/smp.c
>> +++ b/arch/riscv/kernel/smp.c
>> @@ -70,6 +70,11 @@ void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out)
>>          for_each_cpu(cpu, in)
>>                  cpumask_set_cpu(cpuid_to_hartid_map(cpu), out);
>>   }
>> +
>> +bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
>> +{
>> +       return phys_id == cpuid_to_hartid_map(cpu);
>> +}
>>   /* Unsupported */
>>   int setup_profiling_timer(unsigned int multiplier)
>>   {
>> --
>> 2.21.0
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
