Return-Path: <SRS0=Z5mV=BY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6AFDC433E1
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 23:20:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 814FD20768
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 23:20:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3UPdJ9qq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="duCnFkXK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 814FD20768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FzJE4RCGwefDPT8GlVKsGHk4oAe7c0kkcfD/czy/pL0=; b=3UPdJ9qqx1bub/dJYqR6+2DB0
	QXmjQ7Ofe0JaiCWm0IP/w6C+0jqm+BDpwPG0aUCNHHx9kE7zB6QS4z7++R0Ql7SmBduRLcc+d+2im
	ywu7foM4sTTuzIbn8wsieCp5iM2aYHIOYXlDKOfc550MWXhaRowr5rKPYBBuT4Is0HUDEaJB6ZgIk
	ySsSuziXHuZnk1zeUi35dI0QDDQgrOJYlS9J8hcm6NruuPyWl7fcscCC7vR7X/Sk+s7h4RfW/POZl
	61sF3OaYv129D2Z0LL6gSI+Vl+CfKm6dKeurPK7Hxt8wAL7nPuyOkdPD9Pz603dZHCVl6WurC0mjB
	Vybd1neEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6izN-0005lV-NB; Fri, 14 Aug 2020 23:19:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6izK-0005l9-Or; Fri, 14 Aug 2020 23:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=/k+FCjWU06VGb2159RBI2JE7ici1nTwl6uGEUcvW8u8=; b=duCnFkXKHIs9RUqJo10Z/9LP6f
 kHPvfdSST7h1NCcFpY5ySDUPo3g0vY2bpH3A56OvTGU1LDVT3T4FXY5AggTQmUznP3FyyVh8+sUxX
 m3CjcwehIAA6UcUrrEDU3+MFrCwox9hnSBUuJSwSHpVIHbYCw9+is3FeOqe3xN7a6b/4ht95PrydZ
 iyuZlh3txnvSFXxeaWP0dOwcXyyFk3/aOhRCMKXNkycUrt+mq2mHLJlAn2HDCN9IJ53quej40LTDz
 1MxgS3T3C3ycfhDdyrysm9QBxQ/ogQXHwJSc6z6eywFjNDjzGqEBmf95qbiUvNHc6Oxj+cYVI6rrx
 RGhUjLyA==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6izE-0003Yk-MW; Fri, 14 Aug 2020 23:19:49 +0000
Subject: Re: [RFC/RFT PATCH 1/6] numa: Move numa implementation to common code
To: Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org
References: <20200814214725.28818-1-atish.patra@wdc.com>
 <20200814214725.28818-2-atish.patra@wdc.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <abc3e4de-f58e-98c9-b289-477663f64997@infradead.org>
Date: Fri, 14 Aug 2020 16:19:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814214725.28818-2-atish.patra@wdc.com>
Content-Language: en-US
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ganapatrao Kulkarni <gkulkarni@cavium.com>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Nick Hu <nickhu@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 8/14/20 2:47 PM, Atish Patra wrote:
> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> index 8d7001712062..73c2151de194 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -210,4 +210,10 @@ config GENERIC_ARCH_TOPOLOGY
>  	  appropriate scaling, sysfs interface for reading capacity values at
>  	  runtime.
>  
> +config GENERIC_ARCH_NUMA
> +	bool
> +	help
> +	  Enable support for generic numa implementation. Currently, RISC-V

	                             NUMA

> +	  and ARM64 uses it.

	            use it.

> +
>  endmenu

thanks.
-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
