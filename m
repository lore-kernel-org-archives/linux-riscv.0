Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7695A606A9E5
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fqWbMHgz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=F0Cc2K3P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:From:Message-Id:Cc:To:
	In-Reply-To:References:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ab7A67Kcp42hjyfn4MpMSxz/1ZcT6UsYSg6wXhVJhHI=; b=fqWbMHgznd2tWLXhIeKiAOLKTO
	LIiZrXVRmZ3MMcDaF3qU+DK2spLQSuEyfv3vacED3QJzpKn5x7/RSQskRttKgp7NxjFUsgy9AbYTb
	yfHxxBJ8ZIkiNJ5dbZJgDohSL0QcrUCNjHysM4HX4QEIbqvUY3oHupZbFje9+QPmGVu4puUwUYCxe
	1Pkh5pRVbwmOZyPlNhN7kZFg+hxmxeVZfnARumrMPtqV3DWY/tt8mwNrYdx9/oig1vo/5ecM4ze/M
	C2TWcpSsfYNIgoczNxR5inqPgY/naDKiLb9d4Yuu89EnoloMF/xXA4n54OkCu58h8wttvoiYu7rZs
	YFTp/3Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPi4Y-0000000EsnL-3Um5;
	Sat, 07 Nov 2026 15:11:14 +0000
Received: from va-2-38.ptr.blmpb.com ([209.127.231.38])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPi4V-0000000Esmn-2Wkf
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 15:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1794064264; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=oQPzlbbNPRa34Btoy3AXonNbEyy5EMdmOm2x6+nrmWk=;
 b=F0Cc2K3P8hPt4qVXKtMTSRFIMBD6qV7XP3I8WewJo0kfezJJIphdgn3dawAWSx7CLg1dbf
 qP27RJCwj5jhhJU+joOSwDEXe8LmPePgnswuGXQXPOb63oeEAZYFgtjMbYA96e2szkvhgz
 ELXuOf/CFKtl2sAQHVuxnkhW4q1FjLjOoG5xefP1bih754k5/K7lJXskBVskh+y6ofTh+i
 EL71Pite5uokMxQR+kdZA5ZInot0IcLr+muHNPXvKSjNf23Xelrpp4QiFUDgPg6/4K8oYU
 V+vVjo6Lybr2r7H/RH+MHFa7JKLYWho9kV+aw6Obz9Ehe7W8KEmpF7jvTTy73g==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261104075706.73657-1-yang.yicong@picoheart.com> <20261104075706.73657-6-yang.yicong@picoheart.com> <au8oyDjRJuSL9mj_@xhacker>
In-Reply-To: <au8oyDjRJuSL9mj_@xhacker>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: <yang.yicong@picoheart.com>, <pjw@kernel.org>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>, 
	<conor@kernel.org>, <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<alex@ghiti.fr>, <cleger@meta.com>, <geshijian@picoheart.com>, 
	<niehaitao@picoheart.com>, <cuiyunhui@bytedance.com>, 
	<gaohan@iscas.ac.cn>
Message-Id: <dd751ace-72a0-48c1-bcd2-7a131300a6f1@picoheart.com>
Content-Language: en-US
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: Re: [PATCH v6 5/5] riscv: errata: picoheart: Add workaround for AMOCASQ errata
X-Lms-Return-Path: <lba+26aef3f86+be3212+lists.infradead.org+yang.yicong@picoheart.com>
Date: Sat, 7 Nov 2026 23:10:59 +0800
Received: from [192.168.0.9] ([163.125.164.107]) by smtp.feishu.cn with ESMTPS; Sat, 07 Nov 2026 23:11:02 +0800
User-Agent: Mozilla Thunderbird
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_071111_863121_1DE0907A 
X-CRM114-Status: GOOD (  17.61  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/7/26 9:34 PM, Jisheng Zhang wrote:
> On Wed, Nov 04, 2026 at 03:57:06PM +0800, Yicong Yang wrote:
>> Some Picoheart CPUs implement Zacas extension but lack support
>> for AMOCASQ PMA attribute. Thus makes the CASQ instruction de
>> facto unavailable. Since currently no ways to retrieve the PMA
>> information and the riscv kernel will declare cmpxchg128 support
>> if platform declare support of Zacas, the use of cmpxchg128 will
>> lead to PMA violation and crash the kernel. Add the errata
>> workaround to disable the use of cmpxchg128 on the affected CPUs.
>>
>> Tested-by: Han Gao <gaohan@iscas.ac.cn>
>> Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
>> ---
>>  arch/riscv/Kconfig.errata                    | 12 ++++++++++
>>  arch/riscv/errata/picoheart/errata.c         | 25 +++++++++++++++++++-
>>  arch/riscv/include/asm/cmpxchg.h             | 18 +++++++++++++-
>>  arch/riscv/include/asm/errata_list_vendors.h |  3 ++-
>>  4 files changed, 55 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
>> index c75dec4b0ba7..4e6516ba3a42 100644
>> --- a/arch/riscv/Kconfig.errata
>> +++ b/arch/riscv/Kconfig.errata
>> @@ -202,4 +202,16 @@ config ERRATA_PICOHEART_CBO_CLEAN
>>  
>>  	   If you don't know what to do here, say "Y".
>>  
>> +config ERRATA_PICOHEART_AMOCASQ
>> +	bool "Apply Picoheart AMOCASQ errata"
>> +	depends on ERRATA_PICOHEART && RISCV_ISA_ZACAS
>> +	default y
>> +	help
>> +	  Some Picoheart CPUs implement the Zacas extension but lack support
>> +	  for AMOCASQ PMA attribute. Thus makes the CASQ instruction de facto
>> +	  unavailable. Enable this errata workaround to disable the use of
>> +	  CASQ in the kernel (cmpxchg128).
>> +
>> +	  If you don't know what to do here, say "Y".
>> +
>>  endmenu # "CPU errata selection"
>> diff --git a/arch/riscv/errata/picoheart/errata.c b/arch/riscv/errata/picoheart/errata.c
>> index c945ae694396..a658f38cf4de 100644
>> --- a/arch/riscv/errata/picoheart/errata.c
>> +++ b/arch/riscv/errata/picoheart/errata.c
>> @@ -174,11 +174,34 @@ static void picoheart_errata_probe_cbo_clean(unsigned int stage,
>>  	static_branch_enable(&has_picoheart_cbo_clean_errata);
>>  }
>>  
>> +static bool picoheart_errata_probe_amocasq(unsigned int stage,
>> +					   unsigned long archid,
>> +					   unsigned long impid)
>> +{
>> +	if (!IS_ENABLED(CONFIG_ERRATA_PICOHEART_AMOCASQ))
>> +		return false;
>> +
>> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) ||
>> +	    !riscv_isa_extension_available(NULL, ZACAS))
>> +		return false;
>> +
>> +	if (archid != 0x804a555049544552 || impid != 0x100)
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>>  static u32 picoheart_errata_probe(unsigned int stage, unsigned long archid,
>>  				  unsigned long impid)
>>  {
>> +	u32 cpu_req_errata = 0;
>> +
>>  	picoheart_errata_probe_cbo_clean(stage, archid, impid);
>> -	return 0;
>> +
>> +	if (picoheart_errata_probe_amocasq(stage, archid, impid))
>> +		cpu_req_errata |= BIT(ERRATA_PICOHEART_AMOCASQ);
>> +
>> +	return cpu_req_errata;
>>  }
>>  
>>  void picoheart_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
>> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
>> index 662e160b0522..0488b9314c13 100644
>> --- a/arch/riscv/include/asm/cmpxchg.h
>> +++ b/arch/riscv/include/asm/cmpxchg.h
>> @@ -329,7 +329,23 @@
>>  
>>  #if defined(CONFIG_64BIT) && defined(CONFIG_RISCV_ISA_ZACAS) && defined(CONFIG_TOOLCHAIN_HAS_ZACAS)
>>  
>> -#define system_has_cmpxchg128()        riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)
>> +#define system_has_cmpxchg128 system_has_cmpxchg128
>> +static __always_inline bool system_has_cmpxchg128(void)
>> +{
>> +	/* The vendor erratum overrides the standard Zacas alternative. */
>> +	asm goto(ALTERNATIVE_2(
>> +			"nop",
>> +			"j %l[l_yes]",
>> +			STANDARD_EXT, RISCV_ISA_EXT_ZACAS, 1,
>> +			"nop",
>> +			PICOHEART_VENDOR_ID, ERRATA_PICOHEART_AMOCASQ,
>> +			CONFIG_ERRATA_PICOHEART_AMOCASQ)
>> +		: : : : l_yes);
> 
> This makes the generic code ugly, adds some maintain effort.
> why not discarding "zacas" in the dts? It's much simpler

it'll prevent the usage of other more widely used CAS instructions
in both user and kernel space. we'd like to retain the performance
benefit of CAS over LR/SC for primitives such as cmpxchg() on our
server as well.

since kernel already provides system_has_cmpxchg128() as a
separate capability check, disabling 128-bit CAS here lets us
limit the workaround to cmpxhg128 only and could be a reasonable
solution.

thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
