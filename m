Return-Path: <SRS0=bcqy=RX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B01C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 23:58:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 000C02183E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 23:58:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XVuFUcP3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 000C02183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TOoW8UpND+BTh4VQKgsJEEs/nwM1xe2Hf+bSIyWkhGo=; b=XVuFUcP3D7VQHy
	ZXBLhpCRn4fg1WIiqZPij9kQGeNuEi1g5+SSeAkTfrj3+M2JPbDt7aJ21DfMOWo+z7LqCrykuD6of
	bTGmUfJJq65z4x2Ve3QrpqiHT5tas7UswywWAb3qcWWGKiaofXyYo4BPISWYplwarBMTdoQxWDCJ+
	38GA/vf6juy2xD57n8jT77mxHZvqyIdPsfby3tsbghwH+Q4lwEMyCnXfGjA/knsBPu/EMmd82JSOg
	B4RJrjmqpIxcdE+Gxts+vcOcgQSRsAyiZpJRjvrjiBS4xjyoXhIeGSl9X09fSIL5f8cdkaIT84M+l
	GiJyvxd9/AnXTo9R5h1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6l6j-0004MH-LC; Wed, 20 Mar 2019 23:58:53 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h6l6h-0004Lq-A1; Wed, 20 Mar 2019 23:58:51 +0000
Date: Wed, 20 Mar 2019 16:58:51 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH v3 4/4] riscv: rewrite tlb flush for performance
Message-ID: <20190320235851.GA16662@infradead.org>
References: <cover.1552142593.git.gary@garyguo.net>
 <5f387ef7b800d5626f20e413090b30ee66d1c8d5.1552142593.git.gary@garyguo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f387ef7b800d5626f20e413090b30ee66d1c8d5.1552142593.git.gary@garyguo.net>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Mar 09, 2019 at 02:52:04PM +0000, Gary Guo wrote:
> This patch also includes a IPI-based remote TLB shootdown, which is
> useful at this stage for testing because BBL/OpenSBI ignores operands
> of sbi_remote_sfence_vma_asid and always perform a global TLB flush.
> The SBI-based remote TLB shootdown can still be opt-in using boot
> cmdline "tlbi_method=sbi".

I think that part should be split into a separate patch, as it is a
logically separate change.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
