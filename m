Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8090CD4F26
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 19:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NHSQgc6jzNBYDEyzxO5GgZqc94w6nPETcfyuAeTUKwE=; b=Z+SUgsQAaN9wT3
	WUX8paLHry7A5q0Q2K8lDNYMUtKD2JMPyHljRE/31OTMCq20b29gRkc9okwW5kamq3tqHaVXSmKHK
	E0uFNChE1BRUn9EWd7SmfTq78h1eRfY54qYk3XwnkpRvJm4NU9/jBrNkDq7/ypxAHuQtS+mFujOEA
	DPfGzHlE3kBIh6Vw76emS+W4wS/+butjdEemjW31+5ncI/kDCc2WZXuayCGIR/miTza0CIZuUwGWt
	d1iMNcUo7i/YT+JJ40toqGaK976ZbM5r4NZbOuCWUw0QomXbu4OMDoETqbv2El7rayu/YiBFpAPCd
	L1zsKYA4gH/4jfDNZfyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waes2-00000002url-0oTc;
	Fri, 19 Jun 2026 19:27:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waes0-00000002urO-2b3R;
	Fri, 19 Jun 2026 19:27:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A6D434456B;
	Fri, 19 Jun 2026 19:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AC61F000E9;
	Fri, 19 Jun 2026 19:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781897234;
	bh=2j25ksHlzzgiJapOxjE0LWoxXkD8fo4E5hLsMP9g7Qg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZjZWeR2B4RDHzs11keZnbEX5GPkDO4ewLXSWIxWl3TtZgmPrYzh/es7rKmPgwLYPc
	 G9/iS15aNLl8yRhv+nscp6GyPkttdugCDo+n+FCaVUJ+BeFCIYtF+Tz1RzU+56fFhI
	 OredVk3jQFGyG1m9pAcuqeECZVannJ2qU5Wst0Xngngfq0xCdq56Jxq14dM30kX2B8
	 gRsKlF7lAAdMILqwQRe9JkuVQEHYr2b2MohI3A2GtWVIyLDHkMeHlNd/PDKS9jbNu9
	 +B+qHCkz1stv2sm/Z5ih0nssJKxSD48jJaDNgnSdRxbHlFulBG38L//Ott12V41Y2X
	 B8d3rWSj0UApA==
From: Thomas Gleixner <tglx@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, tsbogend@alpha.franken.de, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 hpa@zytor.com, kees@kernel.org, nathan@kernel.org, linusw@kernel.org,
 ojeda@kernel.org, david.kaplan@amd.com, lukas.bulwahn@redhat.com,
 ryan.roberts@arm.com, maz@kernel.org, timothy.hayes@arm.com,
 lpieralisi@kernel.org, thuth@redhat.com, oupton@kernel.org,
 yeoreum.yun@arm.com, miko.lenczewski@arm.com, broonie@kernel.org,
 kevin.brodsky@arm.com, james.clark@linaro.org, tabba@google.com,
 mrigendra.chaubey@gmail.com, arnd@arndb.de, anshuman.khandual@arm.com,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC 1/3] cpu/hotplug: Introduce
 CONFIG_PARALLEL_SMT_PRIMARY_FIRST
In-Reply-To: <20260619094130.GU49951@noisy.programming.kicks-ass.net>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-2-ruanjinjie@huawei.com> <87a4srdgk0.ffs@fw13>
 <20260619094130.GU49951@noisy.programming.kicks-ass.net>
Date: Fri, 19 Jun 2026 21:27:11 +0200
Message-ID: <875x3ecovk.ffs@fw13>
MIME-Version: 1.0
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

On Fri, Jun 19 2026 at 11:41, Peter Zijlstra wrote:
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

Probably. Did not think about that as this has to be anyway selected by
the architecture.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
