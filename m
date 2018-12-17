Return-Path: <SRS0=sGlk=O2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D19C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 16:51:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67A2F2145D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 16:51:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qoNJhCJC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67A2F2145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UoBm9NZ6TdwzJmDqttgDNYtgP5aSspE1Mmj4s200fjA=; b=qoNJhCJCCE+TJl
	c37skeaUz9ukzQLtceRsUKCMSKYO+pJRmNBXWZ3TAfH7coq01PHdlTskr9utM98MF4A3UsP6FMFsl
	lFbwUYjzB/NOgJ6ZJLkTuxAHIXNmMtjKrU1358MPhhHELy13UwMiFJ0hdSHjPauA2PNrejzDUpQYh
	DoiTCmZUb8cZGoqwicbvt82vCOyR/iBIlDC7+rrw5OxnAnYun7dytmPKEPwj9R9ROs6Si6SILt8IW
	EdAVg05hwXQ1KRl00OMRsyFjy3+LRZX3h+SM1osfYVJYcTGVGDodk9CvlBaA9TYGwz9OaYNApQOte
	r/lme6Se6M62yw085+gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gYw6v-0007M0-J7; Mon, 17 Dec 2018 16:51:17 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYw6k-0007CQ-5x; Mon, 17 Dec 2018 16:51:07 +0000
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.89)
 (envelope-from <logang@deltatee.com>)
 id 1gYw6H-0002lM-Kq; Mon, 17 Dec 2018 09:50:38 -0700
To: Nick Kossifidis <mick@ics.forth.gr>
References: <20181015175702.9036-1-logang@deltatee.com>
 <20181015175702.9036-7-logang@deltatee.com>
 <4b591ba933363e29392dba218ef63267@mailhost.ics.forth.gr>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <5fd0880c-5896-ffee-4d3c-4fce1649382e@deltatee.com>
Date: Mon, 17 Dec 2018 09:50:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <4b591ba933363e29392dba218ef63267@mailhost.ics.forth.gr>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: hch@lst.de, michaeljclark@mac.com, akpm@linux-foundation.org,
 olof@lixom.net, zong@andestech.com, sbates@raithlin.com, palmer@sifive.com,
 arnd@arndb.de, andrew@sifive.com, aou@eecs.berkeley.edu, robh@kernel.org,
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, mick@ics.forth.gr
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH v2 6/6] RISC-V: Implement sparsemem
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181217_085106_257994_5567F52C 
X-CRM114-Status: GOOD (  11.11  )
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Waterman <andrew@sifive.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-sh@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Stephen Bates <sbates@raithlin.com>,
 Zong Li <zong@andestech.com>, linux-mm@kvack.org,
 Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org,
 Michael Clark <michaeljclark@mac.com>, Christoph Hellwig <hch@lst.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 2018-12-17 7:59 a.m., Nick Kossifidis wrote:
> Having memory blocks of a minimum size of 1GB doesn't make much sense. 
> It makes it harder to implement hotplug on top of this since we'll only 
> able to add/remove 1GB at a time. ARM used to do the same and they 
> switched to 27bits (https://patchwork.kernel.org/patch/9172845/), ARM64 
> still uses 1GB, x86 also uses 27bits and most archs also use something 
> below 30. I believe we should go for 27bits as well or even better have 
> this as a compile time option.

Thanks, that makes sense. I'll make the change for the next time we submit.

> BTW memblocks_present is on master now (got merged 3 days ago).

Great! We'll send an updated patch set after the merge window.

Logan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
