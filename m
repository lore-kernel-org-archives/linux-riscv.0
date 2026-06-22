Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2893CDB475
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 07:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PyQWvN0ETIAXKpCaawiH3ngx7p34iJxcBWQP0zvXZM=; b=x5V8wQcsqLP95X
	5rm56rdB/K5HE3XmqA8H176tRkhV+OtPLl9fTuqTy5oqgYAJDT6NU9FEKV547/NvWGDwpehv6WYvt
	bTB2K8tEWn5zy4jLh9yxh4UHkLrZ6dtirP1x6Py90avUxWSgp4jwgtt3yc8PBGzs1P8XDyIwUtfBU
	PcV/BfK4asztfLH/HcD+PWuV+7I72qGcMZYTirirr7RGYmq5VaP5OUU+kdHAp+yWw4Cj+UMkUWlfs
	oh4VUOIfn3cIfktHIXnZUoSPHBdRNhO6tnWFWFtfBbIhFO+7loVmKINNreBeEUwvQNUAooD9vb8RW
	fI0OEBjtbuOhnP8OW9hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZR7-00000004Znp-3VB1;
	Mon, 22 Jun 2026 07:51:17 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZQv-00000004Zgn-1FDT;
	Mon, 22 Jun 2026 07:51:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Du1YAWXs/UPrnLFElgZgTTCbCcDeMhPmRE4iiOQnDj4=;
	b=6bkt8gOmaa7gWDwBIF0VGol5P+GXGe6FD1A0V+JeDqhpPMXS+CBpbpxjmLOVzcBQawZT6DrE6
	vCcXWNTux9dudn5wkzhhguKcufFWw9wIBIbXXgppi7D2/dXzJ7HH2L66kqcxbbE2/Rlox6dTmpa
	/lOq7K/lA8TPpVdPa6RIt4Y=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gkKsK5vtszLlTn;
	Mon, 22 Jun 2026 15:41:57 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id D9E2940572;
	Mon, 22 Jun 2026 15:51:01 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 22 Jun 2026 15:50:59 +0800
Message-ID: <b0a758f9-0836-4d99-a424-573e5c8d1fe4@huawei.com>
Date: Mon, 22 Jun 2026 15:50:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] cpu/hotplug: Introduce
 CONFIG_PARALLEL_SMT_PRIMARY_FIRST
To: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <kees@kernel.org>,
	<nathan@kernel.org>, <linusw@kernel.org>, <ojeda@kernel.org>,
	<david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>,
	<maz@kernel.org>, <timothy.hayes@arm.com>, <lpieralisi@kernel.org>,
	<thuth@redhat.com>, <oupton@kernel.org>, <yeoreum.yun@arm.com>,
	<miko.lenczewski@arm.com>, <broonie@kernel.org>, <kevin.brodsky@arm.com>,
	<james.clark@linaro.org>, <tabba@google.com>, <mrigendra.chaubey@gmail.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-2-ruanjinjie@huawei.com> <87a4srdgk0.ffs@fw13>
 <20260619094130.GU49951@noisy.programming.kicks-ass.net>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260619094130.GU49951@noisy.programming.kicks-ass.net>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_005105_502958_346D3C19 
X-CRM114-Status: UNSURE (   6.54  )
X-CRM114-Notice: Please train this message.
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



On 6/19/2026 5:41 PM, Peter Zijlstra wrote:
> On Thu, Jun 18, 2026 at 05:17:03PM +0200, Thomas Gleixner wrote:
> 
>> Something simple like the uncompiled below should just work, no?
>>
>> ---
>> --- a/arch/Kconfig
>> +++ b/arch/Kconfig
>> @@ -102,6 +102,10 @@ config HOTPLUG_PARALLEL
>>  	bool
>>  	select HOTPLUG_SPLIT_STARTUP
>>  
>> +config HOTPLUG_PARALLEL_SMT
>> +	bool
>> +	select HOTPLUG_PARALLEL
> 
> 	depends on ARCH_SUPPORTS_SCHED_SMT ?

Maybe select HOTPLUG_SMT?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
