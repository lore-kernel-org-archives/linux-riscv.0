Return-Path: <SRS0=fYNd=P2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C2AC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 02:13:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F29A720873
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 02:13:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V72Zh9f/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="IFRT24YE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F29A720873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y9tut81EkeVFkcFlxlcQIBHk10J5MKmySkxhzdcNkE0=; b=V72Zh9f/k0W+2kg3GcjLxulRM
	Sx/BOlXZsKsA5jjCMADyLBRuUnH2B/Zuhf9DNHSLzOnVaNXKMG5XARtyQ6K8WkO0pXwBlzmfEVVj6
	aNqyxkuF7xpRokd06ltuF2syVPzQw3DI6aOty9wTQl05PzP68L2orNwZAG5dB5CJkhzi9Ff3j6xJb
	BiRK0pl04B0z7A7qhOFlVt/oksqgNkME5S10prbMeSM7pSeVPAOyqHlgYYcO2KaeX6LjODqrB8hoR
	Vsvrzr7SFqlW2mlrbXIGlDBS1WYkkZXFjYkctr6prXHxg5WARwypBdzWpYVgqJe6Zd0aaTW/slqKP
	8DqOM03UA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkJef-0004m7-S7; Fri, 18 Jan 2019 02:13:09 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkJed-0004ll-BM
 for linux-riscv@lists.infradead.org; Fri, 18 Jan 2019 02:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1547777587; x=1579313587;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=rFlBZNV3NI+o5bHSlNipI8QY+dI7Tht/TtUsVJmoWlI=;
 b=IFRT24YEPoYgHqWgmEmBiw8/gR1Zz3oxPGnULX1JFVyqspZZUlGItzQc
 qKWewIi8Isg6r/+CVzdPV/EXkrwm2g0fwqbEjAY+4n+wCFG2Vz0m6JW8r
 VCqkN8oTMicAxqxfkAXbMmSoFwYMBTFyisyDsjectrNdK1XPTSLhogptS
 758DCWOHc8cXHtz09kx5WfitMqqzR2CQmb37/M1RJV9MdWtVyK/XnqmQZ
 bhUAxW3LsC5RQSJyLv2322+dOaRbwBzfvuUmhy/nblCV5mTcTBZVpTPZw
 xNv+uXyf9jTRt/9/GPB5a1CqYLmSg49eoWD0Mehx5EUO0vVZSw4JRJC1/ Q==;
X-IronPort-AV: E=Sophos;i="5.56,489,1539619200"; d="scan'208";a="100881362"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2019 10:13:06 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 17 Jan 2019 17:52:45 -0800
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.68.123])
 ([10.111.68.123])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Jan 2019 18:13:06 -0800
Subject: Re: [PATCH v2 8/8] RISC-V: Assign hwcap only according to current cpu.
To: Christoph Hellwig <hch@infradead.org>
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
 <1546940318-9752-9-git-send-email-atish.patra@wdc.com>
 <20190115135639.GH28946@infradead.org>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <356b919c-c025-8993-e5ef-2b010bed0b56@wdc.com>
Date: Thu, 17 Jan 2019 18:13:04 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190115135639.GH28946@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_181307_428761_6CB92721 
X-CRM114-Status: GOOD (  13.57  )
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

On 1/15/19 5:56 AM, Christoph Hellwig wrote:
> On Tue, Jan 08, 2019 at 01:38:38AM -0800, Atish Patra wrote:
>> Currently, we set hwcap based on first valid cpu from
>> DT. This may not be correct always as that CPU might not
>> be current booting cpu.
>>
>> Set hwcap based on the current cpu instead of first
>> valid CPU from DT.
> 
> This is generally the right thing to do.  But can the kernel even cope
> with different hwcaps per hart?

I don't think so.
   I know arm land and I think x86 as well
> don't, so we might want to add a sanity check that they match or reduce
> them to the common subset.
> 

I will add a sanity check that they match and throw a warning if they 
don't.

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
