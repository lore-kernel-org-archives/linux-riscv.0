Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E62606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 04:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NKjwPI1W;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=dcHdFK6f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ic41bzoWHFoGjWUpr8j5Li7eh1GHIV4DQSrX324hhgY=; b=NKjwPI1WnKBNUUBNf9M0L8jdgC
	5pMioQzGiG+dOcqvFO0686FuWYMobb5ii6K01qTZS96XYJSwfEYHYubF2Tf7umqY0snTG6Zr8mW1m
	hpc9njl69UL2OEdpPxQEP4TgsNmUPcTJDwpdGB6QuEJb4kZzI6eJbp6WvJH5Z+tSg3F5f1NNfiNuk
	Epb3oEL+111F9ckYtdiaUsRpo6DoyTsBk3fZJVzU4R6d1hvAwxG1QQ7WHdFWxnf+pphV0cZSJkMuc
	BtYCvz5CxytUgT0DYoUcS32fmydBbG3EP2XU0m7lr6TqyfLlGcHC2eb6WoMtL0S4sdWSrIqYM5Bn2
	G4n3HuCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHPQ-00000008I6l-3r4B;
	Thu, 29 Oct 2026 04:06:36 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHPO-00000008I68-2sl5
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 04:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=a1PhFUYdokHoMeeA0WPauot5ThmFVHZSu+ZYJSEfnH8=; b=d
	cHdFK6fSwvNTdfGaJ8dUaEcejlQafh68z8Oo0JIUwlbThXosz+AfW/Z07S48kuaV
	SQSbg4xKWxGm5VtSPwApHDOsKDaqtH3sCq1PPFds1f/8QcTHrNoxX4CbzVQ8Tz3B
	E8rogBb0+VfPKfLH7kKHOsedmcAxnJhaikG7V2Rbog=
Received: from 19888972804$163.com ( [2610:150:c001:15:81:7818:302a:b455] )
 by ajax-webmail-wmsvr-40-102 (Coremail) ; Thu, 29 Oct 2026 12:01:31 +0800
 (CST)
Date: Thu, 29 Oct 2026 12:01:31 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Marc Zyngier" <maz@kernel.org>
Subject: Re:Re: [PATCH 00/12] irqchip: validate remaining MADT records
 before use
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <86qzhaxmh5.wl-maz@kernel.org>
References: <20261028050039.121080-1-yaojiale02@163.com>
 <86qzhaxmh5.wl-maz@kernel.org>
X-NTES-SC: AL_Qu2SAf6fuUwi5yGeZOkcn08ShO49XMOyvfoi2YFTc+0EoDzV3BInXF1gPGDxz8mkDT2vlyCFSTp15+JbY6xAaRJ2OZipwy2BT3fMJMqiQA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <2625137e.39a5.1a185d1f222.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZigvCgD3f90bxeJqMyFjAA--.1040W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRvKBWrixRsWnAAA3F
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_210635_063542_487CD9EE 
X-CRM114-Status: UNSURE (   6.88  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Tianyang Zhang <zhangtianyang@loongson.cn>, Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Andrew Jones <andrew.jones@linux.dev>, Conor Dooley <conor.dooley@microchip.com>, Hanjun Guo <guohanjun@huawei.com>, WANG Xuerui <kernel@xen0n.name>, linux-riscv@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, Liupu Wang <wangliupu@loongson.cn>, Grant Likely <grant.likely@linaro.org>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>, Tomasz Nowicki <tomasz.nowicki@linaro.org>, Robert Richter <rrichter@cavium.com>, Jianmin Lv <lvjianmin@loongson.cn>, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

At 2026-10-28 16:23:18, "Marc Zyngier" <maz@kernel.org> wrote:
>On Wed, 28 Oct 2026 05:00:27 +0000,
>Jiale Yao <yaojiale02@163.com> wrote:
>> 
>> Several ACPI interrupt-controller callbacks cast generic MADT subtable
>> headers to controller-specific records and access typed fields without
>> first checking that the firmware supplied the complete structure. A
>> truncated entry can therefore cause an out-of-bounds read during early
>> interrupt-controller and CPU discovery.
>> 
>> Add the missing minimum-size checks at the callback boundaries. Records
>> which are passed from a probe validator to an initialization callback are
>> validated once in the validator, before either callback accesses them.
>> 
>> The issues were found by code inspection and have not been tested on real
>> hardware.
>
>How does this compare to the series posted at [1]?
>
>No version number, no change log, and not even an attempt at a QEMU
>test run. If you want people to review this stuff, you need to up your
>game a tiny bit.
>
>	M.
>
>[1] https://lore.kernel.org/20261021144524.364143-1-yaojiale02@163.com

Thanks for your review, I have added test information, with a new series.

https://lore.kernel.org/lkml/20261029035253.2333852-1-yaojiale02@163.com/


>
>-- 
>Without deviation from the norm, progress is not possible.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
