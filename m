Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCFBC10F12
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 21:16:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF4392087C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 21:16:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mvQqf1El";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="reupX2B9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF4392087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6qJPpi/9PKQ46vRl8ziFHKALoC5qHDhAhFNaz+Feip8=; b=mvQqf1EliAk2SynYcQHuDDtSO
	AJ9SrZu9VL2pZafCaAszYHmKONTHXav5N3IhwpfZolcl3gSeTu5hFU9Si5ias0m0sDOW4xOnNbZT5
	PMY6iOsANC6Gh3dqb9oV+jexjkMFAw0EhPjYiJhdDTkB8K01gXgBEtLZD4sQrihkx8eh1t9ihvnGY
	M/1Lck9bB18XOeAq6AEOMdplka3EcBiu7gCTLagwkL57S44yMQZMyfVE7R6T6mfOkmkV5sjQ2fPMB
	RW4ikuMNgHH2TyWMfyj1GV8AwtsjwduAFriC4YAfym2LMENh/i9OzgQt92pkSOn6gbYhpHkttS050
	Gz7nA16Ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hG8yA-0007DU-2q; Mon, 15 Apr 2019 21:16:50 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hG8y7-0007D1-Lu
 for linux-riscv@lists.infradead.org; Mon, 15 Apr 2019 21:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555363008; x=1586899008;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=mZ06PkjkN1kj6AoAOlS4fY0McGXa90ZE9BqMC0BMkog=;
 b=reupX2B99tna4aBuoYh7xgVxLsxSoz2ZtAG1dJ8MN3eiKAafoNmToNLi
 BN8dGHrtujI0FG31xeTNZvCk0Yk8x2yL/JdD7zp2Ir5nfwPu6LIGzJiSv
 VoOag0r0NIgqyPgPzBdYzgyI/AxfQj5EZcmMOEdAjyfyWtFD0taDI+Fcc
 l8xgUKq5ob0R3NV0syQ5lhmxnO8qlT9HrF+7t7OK7vMOR6zA0Ta6XXaOR
 QmNVEco6/Owmhmqc6aYB0RTGxvobCfhYxj+He0fhBh13w7zrZBfsUmmJa
 og0im7ICNonmwOWjS9WoHDc/LkC8H8ze/Ex9/z+tCQ7Kwcf/83UcMICFv g==;
X-IronPort-AV: E=Sophos;i="5.60,355,1549900800"; d="scan'208";a="106027214"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Apr 2019 05:16:46 +0800
IronPort-SDR: 5TTDkqHK1fr7w1yKy6L3cMOpxttLXJzELrP1MxBTq7/DgGCG/GIqaPtCt0zty393vdDn1iJ7KK
 L32mWKNbOnibEjygQM6PjsLBPcvXuu3ijaQs3zUT/nO82ywEpMLWWkTsfaYgRmtHxFxiNS2+DI
 hLalaRF4ovTiCeGAoO+U1nzE6LwaQNN3k4l67jFjHLG+5hX8SON5JrbRh2eBUi/v3m59GhXdaw
 baVbNMEw5V0NdRu4A5XtPVLzc+hCRNXynbo1fLji6xkq0mSyj1AARTSGO8vuUWf4fq9znH9qwt
 Gjt0AzS7C06UFjkTDP3ySR+b
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 15 Apr 2019 13:53:31 -0700
IronPort-SDR: WyjbmdytrWtcpzzNWefd5pvS4XMx0OHZY9Ezcv8kZjOLto2KRssL/GM/nLI20qrji0nps20rrr
 vwlWCN5S3ROchI5ATm2/z24WqFah18CoBApkHTiOmHxevutj2CGj/pevd3kP4wPbo365ssJ3Pb
 zDPzXTIgJH7d/se4hXe6oKN3xU7SZYHtfno9vcHA8WBnzEVNreyCPQACIy3mqKVCooSeitoWbT
 tq+vsC/kLHfe6VF7FkyxWodOQ5hSeapKDz4x1Rn/n0Gl8VCP80u0kigINPHzIhf+eUdJy+yF/k
 htQ=
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.66.167])
 ([10.111.66.167])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Apr 2019 14:16:45 -0700
Subject: Re: [RFT/RFC PATCH v3 4/5] arm: Use common cpu_topology
To: Sudeep Holla <sudeep.holla@arm.com>
References: <20190320234806.19748-1-atish.patra@wdc.com>
 <20190320234806.19748-5-atish.patra@wdc.com>
 <20190415153147.GB28623@e107155-lin>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <41f890e9-3893-9092-bac7-3daca99f181b@wdc.com>
Date: Mon, 15 Apr 2019 14:16:43 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190415153147.GB28623@e107155-lin>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_141647_778683_D50D923D 
X-CRM114-Status: GOOD (  20.08  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>, Johan Hovold <johan@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Otto Sabart <ottosabart@seberm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Morten Rasmussen <morten.rasmussen@arm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/15/19 8:31 AM, Sudeep Holla wrote:
> On Wed, Mar 20, 2019 at 04:48:05PM -0700, Atish Patra wrote:
>> Currently, ARM32 and ARM64 uses different data structures to
>> represent their cpu toplogies. Since, we are moving the ARM64
>> topology to common code to be used by other architectures, we
>> can reuse that for ARM32 as well.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   arch/arm/include/asm/topology.h | 22 +---------------------
>>   arch/arm/kernel/topology.c      | 10 +++++-----
>>   include/linux/arch_topology.h   | 10 +++++++++-
>>   3 files changed, 15 insertions(+), 27 deletions(-)
>>
> 
> [...]
> 
>> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
>> index d4e76e0a..7c850611 100644
>> --- a/include/linux/arch_topology.h
>> +++ b/include/linux/arch_topology.h
>> @@ -36,17 +36,25 @@ unsigned long topology_get_freq_scale(int cpu)
>>   struct cpu_topology {
>>   	int thread_id;
>>   	int core_id;
>> +#ifdef CONFIG_ARM_CPU_TOPOLOGY
>> +	int socket_id;
> 
> Sorry, but I can't find any reason why we need to do this ifdef dance
> here, especially for socket_id vs package_id ? 

I was not sure if we can rename socket_id to package_id from a semantic 
point of view. If you are okay with it, I will change it to package_id 
and send a v4.

Other's I can understand
> as there are new, but I am sure we can find a way and get away with
> #ifdefery here completely.
> 
That would be good. Any suggestions on how to do that?

>> +#else
>>   	int package_id;
>>   	int llc_id;
>> +	cpumask_t llc_sibling;
>> +#endif
>>   	cpumask_t thread_sibling;
>>   	cpumask_t core_sibling;
>> -	cpumask_t llc_sibling;
>>   };
>>
>>   #ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
>>   extern struct cpu_topology cpu_topology[NR_CPUS];
>>
>> +#ifdef CONFIG_ARM_CPU_TOPOLOGY
>> +#define topology_physical_package_id(cpu)	(cpu_topology[cpu].socket_id)
>> +#else
>>   #define topology_physical_package_id(cpu)	(cpu_topology[cpu].package_id)
>> +#endif
> 
> Since all callsites must use topology_physical_package_id, we should be
> able to rename socket_id to package_id easily.
> 
Sure.

Regards,
Atish
> --
> Regards,
> Sudeep
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
