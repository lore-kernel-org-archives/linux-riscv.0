Return-Path: <SRS0=hxTO=OU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90838C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Dec 2018 00:06:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AD512081F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Dec 2018 00:06:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oo4CrnN0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ba/dgqmk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AD512081F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wXfBi/3WirywcfQDj7Q+sBibuUTnB3bvLI08FYOwbyU=; b=oo4CrnN0sFcCWwVXAMUbf+dv1
	DgTyJrPVvTDjlJztb//pk4DhBnBnQq9IDlwg6RslNOF0JN0zrW0Ldwnn0tiAQ3wDaSjN3/6n6cFTV
	W7Sn1z7fzDZWyBKdHEGjBSs0M4w4TEmDGdOXaeYGiYRjBZZBcOMrA2vHKONdJeRdNDMYWJimac+Yn
	KIAppoTt+2A95gVLGMoKJcRH6x9+0Ej8WgH5v7TMJYUPW5hyp8wKC9DI9pER8BWwq0YUNka062ZyR
	PWDIiSQ0A5V0duFdLX2qnWNOCx0BaSbZwUO2frUgpJX1k0idtH1WEyjzScp73i8CRa9QSwGgkUmoU
	JKthqFORg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWVZY-0007Zy-L6; Tue, 11 Dec 2018 00:06:48 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWVZV-0007Y4-Hv
 for linux-riscv@lists.infradead.org; Tue, 11 Dec 2018 00:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1544486806; x=1576022806;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dJcX3EnVblowNrPPWewUjGKMqeSO00giejQO953eZUY=;
 b=ba/dgqmkxZeSUEpi5g22oV4IrQ5YN4YdQXDO7yi/t3Q43XzGjwyKkly1
 3dnuvTBz+FqUmWajEatgnZ+T0tEGaFyETNobhi3G6IEOmLstUg5Xd0mcW
 i8r91aKVg4V732lekpr9XnFxYaSYUzHXR7X1PWvc06HE7R9bH8yRzCwPC
 VK3SblVheWgsT7DWhS+r30EiDOtCvi4QcSeOwNBmQq0xWGGfdYFGn8S7Z
 eK974F+OIxkj4RBf/6KvdF35vOMZv59JTiH+tWjfEEgFLD3QMM2W+69Qh
 g+d3KdBy/hFPPcfG3zEVxs9LLTKFKJT8+u3QeRED07G7Pw01MnxMc8tXr A==;
X-IronPort-AV: E=Sophos;i="5.56,340,1539619200"; d="scan'208";a="98025379"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2018 08:06:34 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 10 Dec 2018 15:48:19 -0800
Received: from colley-l-lt.ad.shared (HELO [10.86.57.118]) ([10.86.57.118])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Dec 2018 16:06:33 -0800
Subject: Re: [PATCH] riscv: don't stop itself in smp_send_stop
To: Andreas Schwab <schwab@suse.de>
References: <mvmbm67etfg.fsf@suse.de>
 <72991c58-91f5-abb1-54f9-35ae4533a26e@wdc.com> <mvmsgz5bqd7.fsf@suse.de>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <b29080ab-ed6f-9dcd-312b-b8990ff9c2db@wdc.com>
Date: Mon, 10 Dec 2018 16:06:33 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <mvmsgz5bqd7.fsf@suse.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_160645_650337_BB72A901 
X-CRM114-Status: GOOD (  14.37  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/10/18 2:58 AM, Andreas Schwab wrote:
> On Nov 29 2018, Atish Patra <atish.patra@wdc.com> wrote:
> 
>>> +	cpumask_copy (&mask, cpu_online_mask);
>>> +	cpumask_clear_cpu (smp_processor_id (), &mask);
>>> +	on_each_cpu_mask(&mask, ipi_stop, NULL, 0);
>>
>> The function header of on_each_cpu_mask says func should be
>> non-blocking. Not sure if that's a hard requirement or not.
> 
> What does that mean?
> 

https://elixir.bootlin.com/linux/v4.20-rc6/source/kernel/smp.c#L617

>>> +
>>> +	/* Wait up to one second for other CPUs to stop */
>>> +	timeout = USEC_PER_SEC;
>>> +	while (num_online_cpus() > 1 && timeout--)
>>> +		udelay(1);
>>> +
>>> +	if (num_online_cpus() > 1)
>>> +		pr_warn("SMP: failed to stop secondary CPUs\n");
>>
>> May be print the remaining online cpus so that we know which one failed ?
> 
> I have copied that from arm.  The only user of smp_send_stop is panic,
> which can cope with that, and the probability of that happening is very
> low anyway.
> 

My suggestion was based on arm64 code. IMHO, it makes more sense to 
follow arm64 code than arm.

https://elixir.bootlin.com/linux/v4.20-rc6/source/arch/arm64/kernel/smp.c#L955


Regards,
Atish
> Andreas.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
