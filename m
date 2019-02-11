Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FFBC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 08:25:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D90220818
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 08:25:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J6xgZKMB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D90220818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mg8ANC5vzBh5FgWtXEDG7u6Fz06lDxezlmziWrZ+rUM=; b=J6xgZKMBftUa+y
	/OaVENbUBeDXlDCV1nShrZFncBQ8TpL5MisjWXQTPrVm2KYtbe+8fkFiP4SdMmmt/ZAY9KQIF/ynR
	sDCn715UbMe1UexvgmlEy6U0ELV3nDgnB3MHDU5xsZk07OB8hW1a6Jy0vki54278jGKZ6m3kEZhnN
	T6z+a7FRNckPXjA7HbpC6/W5+EMKkliDimFwJ8tI0C02zDytGIVAoXEEC2p40Y0/H4gWg274H8wWW
	LKbs/5pX0DUHCw2+KPnpCwLl2hqhMhRk/EzkrUh9TwgNnnlzQmXUr138Vm8lMKtPjo6j/mZPK7v5g
	Lj1wvXc8l7ElOmQ8JMDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gt6tn-0004Qe-Uf; Mon, 11 Feb 2019 08:25:07 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gt6tm-0004CF-MA; Mon, 11 Feb 2019 08:25:06 +0000
Date: Mon, 11 Feb 2019 00:25:06 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: kernel after 5.0-rc2 may not boot using BBL
Message-ID: <20190211082506.GA13103@infradead.org>
References: <CAAhSdy3im4i0PJvKqDAfq2iDFvTA2O3ZsxjM6wSgdnFUU1eVcw@mail.gmail.com>
 <mhng-487587c1-cd66-40f3-86fc-aa2f034f5028@palmer-si-x1c4>
 <CAAhSdy2pBp10bp_jvCnApGYZa4Y2779ELrvH2DgcP4TRiKUzwg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy2pBp10bp_jvCnApGYZa4Y2779ELrvH2DgcP4TRiKUzwg@mail.gmail.com>
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
Cc: Anup Patel <Anup.Patel@wdc.com>, Andreas Schwab <schwab@suse.de>,
 Palmer Dabbelt <palmer@sifive.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Feb 09, 2019 at 09:00:27AM +0530, Anup Patel wrote:
> IMHO, best solution would be to use mature open-source bootloader as
> payload (i.e. U-Boot or similar) and always boot Linux from bootloader. Using
> Linux as BBL/OpenSBI payload can still continue to exist but it can be more
> of a developer usage.

Yes, that is a good long term plan.  But in the meantime we should not
gratiously break the precious setups people got working..

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
