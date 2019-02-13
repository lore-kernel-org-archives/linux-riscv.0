Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CB6C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 17:54:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92579214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 17:54:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DlmHZF/y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92579214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MI3To6Nrf/ad5MOHS8ErzDHLK1Qzw04ehLPSXE5VvSw=; b=DlmHZF/yU/7Q2D
	RlnMt9tIVcnKUwA1EQmz9WAjhP9ipaj44zqEzTDZJIhO2S/WXxTP0AYLS78QvwhE5reGy25i8TwKt
	PJ+Tjrqbb08BDVBMMWLBVh9xImSx2CWzaROVwqVX4PMIbJWxZPv1OpqjaOQhB6lGobfuCG1YNAMHL
	u4nPNHqwIIlvoAe6Joqk7V2HX+xMJTDd6iAeRK09ZTiqf8cT96Egwq+ahL3mIkOkOgFFHJfH0vCWQ
	hQP3nlpQR+VhdGi+mgDgpz4g6ZAdePj/PzPkRzkxC2Txvn2WTZ8O5kT1rKXMmhBSfZAzR4acXaUjU
	5eOYA+QrN91lCVG6ZKGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtyji-0004Cl-AT; Wed, 13 Feb 2019 17:54:18 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gtyjf-0004CM-Bs; Wed, 13 Feb 2019 17:54:15 +0000
Date: Wed, 13 Feb 2019 09:54:15 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v4 6/6] RISC-V: Free-up initrd in free_initrd_mem()
Message-ID: <20190213175415.GA11635@infradead.org>
References: <20190213063127.28703-1-anup.patel@wdc.com>
 <20190213063127.28703-7-anup.patel@wdc.com>
 <20190213064419.GA27012@infradead.org>
 <20190213073835.GA18267@rapoport-lnx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190213073835.GA18267@rapoport-lnx>
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
Cc: Palmer Dabbelt <palmer@sifive.com>, CHANDAN VN <chandan.vn@samsung.com>,
 Anup Patel <Anup.Patel@wdc.com>, Will Deacon <will.deacon@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Laura Abbott <labbott@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 13, 2019 at 09:38:36AM +0200, Mike Rapoport wrote:
> memblock_free() is has no real effect at this point, no idea why arm64
> calls it.

Looks like the call was added fairly recently by:

commit 05c58752f9dce11e396676eb731a620541590ed0
Author: CHANDAN VN <chandan.vn@samsung.com>
Date:   Mon Apr 30 09:50:18 2018 +0530

    arm64: To remove initrd reserved area entry from memblock

which claims it is to work around the initrd being displayed in
/sys/kernel/debug/memblock/reserved.

I really think we need to have common behavior there - either do this
for all architectures or none.  I've just sent a series that
consolidates all but a handful of the free_initrd_mem, so implementing
any common behavior on top of that would be good.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
