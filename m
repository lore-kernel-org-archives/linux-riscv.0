Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987EAC10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 18:42:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 622012184E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 18:42:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GcgrsyvQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="GukXmT0J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 622012184E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ynKwlnDF17obC/ZRaqYmg2K0PsEoSNFm2QkUratnCog=; b=GcgrsyvQwihnlQNPZpkfnzyaQ
	VeoMGca5mltwv1gGmItykul53GTWTaT30ghD0JcYQmp/BaX4a3Af+4TCdSiB9H6jD8ie+p23cFzdF
	SjStz06dMPaOh358tviNo2FzxEC/tZGMpSosIb4+RvcL9fpQeXs4AMt5KOB64gpZ5W6NNUUddmFdl
	qh+N/DWZVOO0axNXHtMgZYGOZsEnk82t37gVMlu9hVPVxlWh96sVA4CBxUCwxFab7vOExqfpcXP1x
	EPi6FiSlm+7m33UBnv7CfEmRcm9cMTj+IeB7fPNyCRLwECWJwQYztQKPy2XSYPezS8qiFQ4ZK1NZ8
	vc1LYdHuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEeeL-0007fb-4h; Thu, 11 Apr 2019 18:42:13 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEeeI-0007e8-Mi
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 18:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555008130; x=1586544130;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hIqJpL9qmrEfYgXeeTAks3CkmZml+PfGdaFICYG+Af4=;
 b=GukXmT0JhR/irSe94NvkgT2ZMnxGV3uzMI2sv5WKO62mYdIbYFHkj0yK
 s1w1uOQ+bNipKeNrfSevkn26j6HSoQKyzRIScK3nDaH8H95b/7RSvf08L
 Wj67aOOVaM56cmlgtxZXUBpYmpMkUR0PsyjzWKVHCF+7T2okFTkByz7AM
 DBt9FzTm/93363dZfrdLao+FBQtpAtVN6GALNS3CTDXtWu/uJudT2YYld
 gOwmkwqg8bqohS6bXSmDoDR/erU+bQY7/F98DBhC3/t6jt+usagJbs0up
 +ICDc77ZhwT3c56o5BOznboFu0wQtWFMyKwe7pFhcjW/4k3cVh+9Il9je w==;
X-IronPort-AV: E=Sophos;i="5.60,338,1549900800"; d="scan'208";a="211407705"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Apr 2019 02:42:08 +0800
IronPort-SDR: lc47e2TcYeKHL4JnvxY3IzBOzZZ24uXaQKarIufrgyHMFEU+3vE2zDjMu0y/KjUHX0xChtz3gh
 AtJ4HIAV70UX0gyNbnzUPN48PkxPPdafiSVLP/QIla4mPajNuBkP3hUxWPARS1D06VTyROMy/E
 mSx2JvwTyJcu9RdgqgoKfVTkPZrt/rrCUBekLUlHMy6yUyi+Iy3w/ZspzRGR6ZX2n+WSlKDjHv
 7GkdTXUCrMFKa0VcUMLvLtPIxqZ8pxFBDER7hFggsT64FslQnrOC4f+WaCP4AYF/d/CWWCijn7
 /w67fg6VoUJJvTArZXTO0hBX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 11 Apr 2019 11:19:01 -0700
IronPort-SDR: APu4HWZAoD3hiQKINbXvLNyEuMol863baIgLCy4vuWkwm6FK6hYK51/GHCU1H9rYryicNpsrkw
 m7KD+ZP+INUni8aG7daUFJEDXzVL7DT/6CnuRCUFiP372o1d3w/9pdF+94BbsXa0eSjmNyc+aO
 gcOpCUdM/tZnvlXUag0xbt+CkJSxmANSsuHtwm6f4qORcY0WX7VtjcxpYlcSrDMBxVgkX5A9fe
 3IQ0VUZ84MeQQbD0ZWF22ir3Ifu8bW+Hx+FeIPGonucoknTNJwzsFxno6VnGZYJYC4bD8RhXW7
 IcI=
Received: from r6220.sdcorp.global.sandisk.com (HELO [192.168.1.6])
 ([10.196.157.143])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 Apr 2019 11:42:09 -0700
Subject: Re: [PATCH v2 3/4] RISC-V: Implement nosmp commandline option.
To: Christoph Hellwig <hch@infradead.org>
References: <20190410230443.15729-1-atish.patra@wdc.com>
 <20190410230443.15729-4-atish.patra@wdc.com>
 <20190411070119.GD29422@infradead.org>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <fbc18e77-f75c-6f34-2f2e-b461807ba910@wdc.com>
Date: Thu, 11 Apr 2019 11:42:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411070119.GD29422@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_114210_883206_84F702A0 
X-CRM114-Status: GOOD (  16.88  )
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
 Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/11/19 12:01 AM, Christoph Hellwig wrote:
> On Wed, Apr 10, 2019 at 04:04:42PM -0700, Atish Patra wrote:
>> nosmp command line option sets max_cpus to zero. No secondary harts
>> will boot if this is enabled. But present cpu mask will still point to
>> all possible masks.
>>
>> Fix present cpu mask for nosmp usecase.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   arch/riscv/kernel/smpboot.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
>> index eb533b5c2c8c..a8ad200581aa 100644
>> --- a/arch/riscv/kernel/smpboot.c
>> +++ b/arch/riscv/kernel/smpboot.c
>> @@ -47,6 +47,17 @@ void __init smp_prepare_boot_cpu(void)
>>   
>>   void __init smp_prepare_cpus(unsigned int max_cpus)
>>   {
>> +	int cpuid;
>> +
>> +	/* This covers non-smp usecase mandated by "nosmp" option */
>> +	if (max_cpus == 0)
>> +		return;
>> +
>> +	for_each_possible_cpu(cpuid) {
>> +		if (cpuid == smp_processor_id())
>> +			continue;
>> +		set_cpu_present(cpuid, true);
>> +	}
> 
> Most other architectures seem to use init_cpu_present() here.
> 

I did a quick grep through other archs. Mostly, init_cpu_present is 
preferred when you update a entire cpumask or cpu 0.
We can just use cpu_possible_mask and init_cpu_present together to avoid 
the loop. It will just set the current boot cpu bit once more.

But looking at ARM64 code, we may have to bring back the loop when we 
have some implementation similar cpu_ops.

Regards,
Atish

> Otherwise this looks fine to me.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
