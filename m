Return-Path: <SRS0=NTR9=SO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE63C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 20:15:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A8A920869
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 20:15:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sTYl73ul";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="I4f+gf/Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A8A920869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/p8Gjr5A0td3iAMvYa5qFW/sRRybyCSNtuLCbmTtMkA=; b=sTYl73ulQKJGKwIlwtFmjnBaC
	/aHpZ+BpR3QLTuoQKXlW/QWDCs4xMvQzyIhN6PnkVLaOBQGAs4FD1hQTtLjkGEr+OlttGl2FQThEv
	qtoqNigxTtL4Y1AixLWIutUQ/VKerYKTuWW2z6i1zCoSmpoIaHh6rihG1eA4MKNgIVkGBaC9RiuEZ
	bZxIFtr2E/SfVKsaLUFvoag7POTlNyXymZ7TPwkgbk94gZY4YqxVJJo3whaPBt1heQW5y3NIMfyJ4
	IbcOOIDG0Xl/PuSS4q0iHCtUQYGY5cqMn83rdrXe/2PgzcGH9Tbq5H7JKRQMcsQaINa8U4vM5OVsH
	ueQ5WW23Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hF2Zj-0003d8-UN; Fri, 12 Apr 2019 20:15:03 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hF2Zh-0003MO-9m
 for linux-riscv@lists.infradead.org; Fri, 12 Apr 2019 20:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555100101; x=1586636101;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=AnAdBTZRjx5A90BLOgiroTyfkrt0mXjK2u0A7ssjdCk=;
 b=I4f+gf/ZjBeZ8czuZ7mKP2hSXSY368yqgtMhueLQKhUp2RevrsGlfSKW
 qDmH0aQ+5wBotgATohv7skUFI9ZlpBgAheHa+Ku56e/IHWPVvHQNCDPjA
 +FzSYPqzs8hQgJN2M+pHQtFWMyRKtli4+Aazk9lnafyeiU5G4cKmQHGQW
 MuaOeNj/Pm3zHkCylfxUlgKWlNOawGSqBhkNd9o1EIwpNIjcvoTBglTlI
 flbToTPRZvBkNXfAneUEvxws8afbgz5X5QLgeIrbnkvGmr02y4L2+uu/p
 f0NH9BpPK+RH4ZCxmi9fGPZXQXPSIhcFp/zAOZW/Rd8x3Vaaufe5QAV8p A==;
X-IronPort-AV: E=Sophos;i="5.60,342,1549900800"; d="scan'208";a="211540185"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2019 04:14:55 +0800
IronPort-SDR: vUxuEVWxDk/dki0ZeXe9csqBosM+wqWw7VmzxYwdltrOjkotxXvztQp8wZNn6S8NJi6w+hpbg+
 5upi7zM1UvLBX6vjRynK1fY48Gk0YpYSweRNOCKPcIy2ynjeBR4rZdWG+hD68+suG5mRYqr4zf
 /vEhJucSTl+5MfVZRK+rSrPBLwFp+wyh9a+rvcteQyICtcFA2ere1GdHcJTVesvUU7m7BCXNtE
 ZMSaaPH5sgTRL/CR5OsNGnUOMi6R609TNXbMghPfiIjTSO0HKtO2Q7iXNPRDjpn/3kdy2PuK+9
 7QfjlXuQRVI+VES5Jb40yPLG
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 12 Apr 2019 12:53:55 -0700
IronPort-SDR: uQweWfHHotcEJPYRE7Xhysj/kojNBRM1zXXDs/iGiGayd+KFafTmwerMlYSjAOg7Veql7v5ySO
 LLNfFMd9oR4TG7d7mYYW+Efjhgs6qT572PrT2At5+pheATDy2I/1WEdJ3EddgdS0LKq2W3eUfS
 +CVDeZ9O52Qw719+noKxCDT87/9mOXBgC3vfz9TdALfhNp3UHYHOj0LbkzGZRMvjpWd+41woqm
 R3JUi4msFbG5KH+DtkDsQbFMRRyOPXk0ACN2OlVeDFrCbcZS5xazAk3KSG9C0N7yBwvKsiSDve
 oxM=
Received: from r6220.sdcorp.global.sandisk.com (HELO [192.168.1.6])
 ([10.196.157.143])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Apr 2019 13:14:56 -0700
Subject: Re: [1/3] x86: Update DEBUG_TLBFLUSH options description.
To: Christoph Hellwig <hch@infradead.org>
References: <20190410224449.10877-1-atish.patra@wdc.com>
 <20190410224449.10877-2-atish.patra@wdc.com>
 <20190411065617.GA29422@infradead.org>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <580d95d1-224f-a372-c656-1d2cbb19d868@wdc.com>
Date: Fri, 12 Apr 2019 13:14:54 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411065617.GA29422@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_131501_475775_8E2D60A3 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Anup Patel <anup@brainfault.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Borislav Petkov <bp@alien8.de>,
 Gary Guo <gary@garyguo.net>, "H. Peter Anvin" <hpa@zytor.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/10/19 11:56 PM, Christoph Hellwig wrote:
> Given that this option enables generic code (which you reuse for RISC-V
> later in this series) please also move the config option to
> mm/Kconfig, proabbly keyed off another ARCH_HAVE_DEBUG_TLBFLUSH
> symbol that the architecture can select.
> 

Sure.

Regards,
Atish
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
