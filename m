Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6ACC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 18:24:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B50B920823
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 18:24:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DmFR4Xks"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B50B920823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sv1d+KlgZdNPImtymwsRiVp46APeU1tAfjHqv5J6czU=; b=DmFR4XksCwVqRa
	wHm1f+KNRgqoZnbXXz4BjBuWycq96cNtCXsBInK3iRFZcQEcDaagN5C9YoyAmx2cosqTqF6OW9dyA
	F4RTkcgcUZC1/MdvrgZ7guFOJqIm0aZh3xq0KDv0x9oW3pOB1bot5waqxTcvVfgIqy5vgSo8yumuD
	isCWtNYbeyD2h94ns+zjwILGZcYFhE3L99kE6Mha6fPQm6UzKwO5z19olAc1goN26PxcnGuNAVAUY
	X3KVS5DqJtlOTKLIFIXjyoNK/FAy2DwdLfQCCsaOLjNZ2cTU7qJAEyZRAbz4LwYwUhOKEFIaSmGnd
	OKZscaqeEB/kRYX+xYKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9Zhj-00079i-Id; Thu, 28 Mar 2019 18:24:43 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9Zhg-00079K-Hb
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 18:24:42 +0000
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.89)
 (envelope-from <logang@deltatee.com>)
 id 1h9Zha-0006cz-4x; Thu, 28 Mar 2019 12:24:35 -0600
To: Anup Patel <anup@brainfault.org>
References: <20190327213643.23789-1-logang@deltatee.com>
 <20190327213643.23789-5-logang@deltatee.com>
 <CAAhSdy0rZCNG4582gCd2wJ9zWwRZJ8uohPLs91=Ww=+=JnG4=w@mail.gmail.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <f6a31d1b-d122-12d7-767a-e5ec767b1929@deltatee.com>
Date: Thu, 28 Mar 2019 12:24:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAAhSdy0rZCNG4582gCd2wJ9zWwRZJ8uohPLs91=Ww=+=JnG4=w@mail.gmail.com>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: zongbox@gmail.com, hch@lst.de, rppt@linux.ibm.com,
 linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, anup.patel@wdc.com,
 atish.patra@wdc.com, sbates@raithlin.com, linux-kernel@vger.kernel.org,
 palmer@sifive.com, aou@eecs.berkeley.edu, anup@brainfault.org
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH 4/7] RISC-V: Update page tables to cover the whole linear
 mapping
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_112440_625478_8F36A0A2 
X-CRM114-Status: GOOD (  11.86  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Stephen Bates <sbates@raithlin.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Zong Li <zongbox@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 2019-03-28 4:03 a.m., Anup Patel wrote:
> I understand that this patch is inline with your virtual memory layout cleanup
> but the way we map virtual memory in swapper_pg_dir is bound to change.
> 
> We should not be mapping complete virtual memory in swapper_pd_dir()
> rather we should only map based on amount of RAM available.
> 
> Refer, https://www.lkml.org/lkml/2019/3/24/3
> 
> The setup_vm() should only map vmlinux_start to vmlinux_end plus the
> FDT. Complete virtual memory mapping should be done after we have
> done early parsing of FDT when we know available memory banks in
> setup_vm_final() (called from paging_init())

That makes sense, but I think a lot of it sounds a out of the scope of
what I'm doing in this patch set.

I could attempt to update my patchset so instead of expanding the linear
region on boot, we add the page tables in arch_add_memory. That would
make more sense when considering the direction you want to head with
setup_vm.

Logan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
