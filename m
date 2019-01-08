Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34840C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 09:28:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E01E620651
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 09:28:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CGS/k83w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E01E620651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5BQa5/9JqP9+MfNwsEBL3oTNh5s9/aETDYXE+R00kMo=; b=CGS/k83wfNA0HgNsRuHyogVB4
	jCWh7X9w48sNTcsi/yZRxnCLb/eWm28/52IrvWHxAov53WbfHNLuCpX87RFJ544aNwJT5Q9Wlvo9G
	/AptJpzS2LE092pma8Cf+L9c2nD31++7wQunnPz5gvuqmIAVmrDGyC6ojMBIDthvmNdPw2Uq2DINJ
	YLvHn26gKoSsUek2b1U2wemde7ss+OWI/s8hAUrLAzYBcPexwWEw5OSaG3TJyGB+xhjVe6xYFw+cZ
	Z07AmgJmyxVxlrXMZyFeLrgRQbMb6MLxS+7I3/VJpYkmdvp9D4r1xLSqxms8U5soTsttSRTKQwCr1
	UZGk9Utpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggngb-0008Ve-K3; Tue, 08 Jan 2019 09:28:37 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggngB-0008CI-C6
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 09:28:36 +0000
X-Originating-IP: 81.250.144.103
Received: from [10.30.1.20] (lneuilly-657-1-5-103.w81-250.abo.wanadoo.fr
 [81.250.144.103]) (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C0C33240007;
 Tue,  8 Jan 2019 09:27:58 +0000 (UTC)
Subject: Re: [PATCH 0/3] Hugetlbfs support for riscv
To: Paul Walmsley <paul.walmsley@sifive.com>
References: <20181210062146.24951-1-aghiti@upmem.com>
 <817f0993-b200-e484-752a-53df28e846ea@ghiti.fr>
 <alpine.DEB.2.21.9999.1901071351180.14547@viisi.sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <5d9c915f-dfcf-4879-3b73-b53acbe31d02@ghiti.fr>
Date: Tue, 8 Jan 2019 10:26:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.9999.1901071351180.14547@viisi.sifive.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_012812_071639_D2053ACA 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: mingo@kernel.org, aou@eecs.berkeley.edu, catalin.marinas@arm.com,
 palmer@sifive.com, ndesaulniers@google.com, Alexandre Ghiti <aghiti@upmem.com>,
 atish.patra@wdc.com, akpm@linux-foundation.org,
 linux-riscv@lists.infradead.org, mike.kravetz@oracle.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 01/07/2019 10:52 PM, Paul Walmsley wrote:
> On Mon, 7 Jan 2019, Alex Ghiti wrote:
>
>> Can I do something more regarding this series ? Anything that would ease the
>> review process, do not hesitate to ask.
> Does your series need to be rebased against v5.0-rc1 to apply cleanly?
> If so, please rebase and repost.
>
>
> - Paul

The series applies nicely on top of v5.0-rc1 without modifications.

Thanks,

Alex

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
