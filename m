Return-Path: <SRS0=fYNd=P2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84330C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 02:08:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3091320855
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 02:08:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g4NpHgnA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="XQD4D3rU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3091320855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rf1IV4zmy2fDVN1WM+cthsFpIf/37SmH61+xDv0gGoU=; b=g4NpHgnA3lwaO6ij0zS71hcRK
	AWhatehADaIBrOpaSL3VySsrY+0CZr9alH7Fy+XlwUfwwY+bOqjehYIdUu8aUtst150u0rfaVf+3S
	jEsciItxIE1Nxe2hhIUibTwMkvCcD+5TifusfvXdadlSkC+3ilIuEg/CDeUkzB7fWMpi0petj2Jkk
	VyTtkl3RuF5f76nUGrXU4av74K8eSFHiE0wyKUw/HqE65Ja+OR2DaReutaB5yHaY9MvWSJ1ixLW7W
	itnhMvs4jlxB5OM30wamSehZX+Pj4Egbs7c1j9LQv1J1AKUNDkZXJI0suQXOAlyJy147sXRh/NeN2
	7EDqmcA3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkJZy-00037J-HH; Fri, 18 Jan 2019 02:08:18 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkJZv-00036x-W5
 for linux-riscv@lists.infradead.org; Fri, 18 Jan 2019 02:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1547777310; x=1579313310;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=nUzTQsPZiSZq/mJIX/AY5MQuROuAFQ9ZS3mpZfR5e/k=;
 b=XQD4D3rUtRa8dWmaiVAHgackIGQdbvoeuYjpAADbPVAqD+C7E93qwbjr
 Ooo3xDaf2dlROqB1R0QtQt0/Qr800s9hwA1jSycKS2GaK+csL9VGjp9d0
 jOzWD9SS5x/2Swhibtyrkx6DVcus2s4bZ6O050wBlzX/IWg88asJjGp7f
 lTHhhMFDtmpGzmYJnyIVzYu5gYoXRGMfVe4sSP7xi5FjokzBaYi2fqTKe
 tQVtGoxE8LUQ75vr2Sji01DxBQJa/WlB9JUqMENqOAeJJ7nxU994h9FPH
 iGALaULhlSN+ivhcU1dF4ythVaFMwA64X3WrMeDvjhc3tVaxDqcrBFrTk g==;
X-IronPort-AV: E=Sophos;i="5.56,489,1539619200"; d="scan'208";a="197166706"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2019 10:08:24 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 17 Jan 2019 17:47:52 -0800
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.68.123])
 ([10.111.68.123])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Jan 2019 18:08:12 -0800
Subject: Re: [PATCH v2 2/8] RISC-V: Move cpuid to hartid mapping to SMP.
To: Christoph Hellwig <hch@infradead.org>
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
 <1546940318-9752-3-git-send-email-atish.patra@wdc.com>
 <20190115135229.GB28946@infradead.org>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <b7043bae-f95f-5c9a-000f-9ea630e7ba17@wdc.com>
Date: Thu, 17 Jan 2019 18:08:11 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190115135229.GB28946@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_180816_130961_FCB9FDCF 
X-CRM114-Status: GOOD (  10.96  )
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
Cc: =?UTF-8?Q?Patrick_St=c3=a4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michael Clark <michaeljclark@mac.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, Andreas Schwab <schwab@suse.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/15/19 5:52 AM, Christoph Hellwig wrote:
>> +	if (hartid == boot_cpu_hartid)
>> +		return 0;
>> +	else
>> +		return -1;
> 
> No need for an else after a return statement.
>

Correct. Will update it.

>> +}
>> +static inline unsigned long cpuid_to_hartid_map(int cpu)
>> +{
>> +
>> +	return boot_cpu_hartid;
> 
> spurious empty line above.
> 
Sorry for that. Will fix it.

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
