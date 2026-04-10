Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C348DF44841
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 11:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1YRzJfXfF7NocGvPbP2DJ2GfBr3s1u7fYzgzuZWjkU=; b=HYb5ERzQrEUfVj
	L5mc3hHq15gDVfPiCxLFdzlNXyWDroQq5HyBYYSpLvg6avi46Kcwv1kj4fpDpFCMdS/e2rcc4KSGw
	eunYhQewXw5vxFjNWRqdFlpBb89VrmTktwTu4LEaQZgzDLCYaMoFJdZpwkld0fOyzNk1jPOKOM0up
	0QQWkToHHQTqv3XXeyeB5+gmC259x66TOhqgb2crBxExJg4FklRIuaK8QtXfpQ0wKTuPZ4gRQyIhm
	ISHcD5DwfpA2kv7RHnLV3TQ2g38Hjmir6f/ErJf9gouN8om8eQ2XwOf3umdOoGAFVgMhqtGGCO3kV
	GdaUc9SejLUPxzln8fSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAAX-0000000C5jp-313e;
	Fri, 10 Apr 2026 11:37:01 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAAU-0000000C5jT-11Dn
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 11:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1775821015; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=i14BS7GrqYV7Zzk+pfr2uQL5MKpn/DMYLWddS0YiJzY=;
	b=SHNHddDsF6jSM0/s24ismZdW/rVgPvpPwhW4U8m/cRa3tRNcHHnD4wEgNep3/xNRn00VvvtQYjzSsPRBDTZH8z/cR9NJq+TTSL8M9F4+88gBKmzB80e0cJwAh/IckvBMKS7CITDhA9Rp9DO3mitpXItdaLsUAduvCbcSJAtyeWE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0X0l8ghE_1775821001;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X0l8ghE_1775821001 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 10 Apr 2026 19:36:50 +0800
From: cp0613@linux.alibaba.com
To: ruanjinjie@huawei.com
Cc: akpm@linux-foundation.org,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Subject: Re: [PATCH] arch/riscv: Add bitrev.h file to support rev8 and brev8
Date: Fri, 10 Apr 2026 19:36:40 +0800
Message-ID: <20260410113640.106730-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311071344.3305640-1-ruanjinjie@huawei.com>
References: <20260311071344.3305640-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_043658_820469_DA3D4386 
X-CRM114-Status: UNSURE (   9.19  )
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

On Wed, 11 Mar 2026 15:13:44 +0800, ruanjinjie@huawei.com wrote:

> +#include <linux/types.h>
> +#include <asm/cpufeature-macros.h>
> +#include <asm/hwcap.h>
> +
> +extern u8 const byte_rev_table[256];
> +static __always_inline __attribute_const__ u32 __arch_bitrev32(u32 x)
> +{
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBKB) &&
> +	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBKB)) {
> +		unsigned long result = x;
> +
> +		asm volatile(
> +			".option push\n"
> +			".option arch,+zbkb\n"
> +			"rev8 %0, %0\n"
> +			"brev8 %0, %0\n"
> +			".option pop"
> +			: "+r" (result)
> +		);
> +
> +		if (__riscv_xlen == 64)
> +			return (u32)(result >> 32);
> +
> +		return (u32)result;
> +	}
> +
> +	return (u32)byte_rev_table[x & 0xff] << 24 |
> +	       (u32)byte_rev_table[(x >> 8) & 0xff] << 16 |
> +	       (u32)byte_rev_table[(x >> 16) & 0xff] << 8 |
> +	       (u32)byte_rev_table[x >> 24];
> +}

Hi Jinjie,

Thanks for your patch. I have two suggestions.
1. When ZBKB is not supported, is it simpler to directly use the generic
implementation __bitrev32 in <linux/bitrev.h>.
2. Could you please provide a benchmark test case to illustrate the
performance comparison with and without this extension (refer to
test_bitops.c) and also provide the results by bloat-o-meter.

Thanks,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
