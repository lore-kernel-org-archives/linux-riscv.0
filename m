Return-Path: <SRS0=n4Ll=MV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4245C64EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 16:15:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83A9D21479
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 16:15:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pnEIIkOo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83A9D21479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2f8tMbuatA8nBCINBCb0PiA1bLPx9OaGRRfaKdWMRA=; b=pnEIIkOoymUmsG
	EYmZJ6qYMEGO1+B/AZKujEqQd2tGRvBDtfRsRemowjwyuapVjJyHBUYWeR7Yc1QRX9wpklBNSLE79
	p4Tbdw7+cK+eabFQsev91QE9AkIhZFDwICtYjcMwjsMh7lZfDw6T1unuDgyU/OoXFV8Yoh0kcFG5G
	jx1ROmN9scCugIuRCziABdxBBbDmfmKFsIRa4goWHA6Z4EBv0F9GPnhAri7qA96uy4lHK6zyC2fcW
	8KfQvXc6zwohMbgwYA0iVh9l7EF/rqhtgIlENUWDgg3MTjkh9rle+V5Ix7oS7Vdq8Bq9dKi43aJGH
	WgCmHtFnndzQAJUp4yyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g9ufB-0005Xo-UJ; Tue, 09 Oct 2018 16:15:13 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1g9uf9-0005Nn-So; Tue, 09 Oct 2018 16:15:11 +0000
Date: Tue, 9 Oct 2018 09:15:11 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: futex_atomic_cmpxchg_inatomic is missing
Message-ID: <20181009161511.GA18519@infradead.org>
References: <mvmh8icabwx.fsf@suse.de>
 <mhng-b1474fef-9750-4bfb-be90-5e4bf4c964d4@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-b1474fef-9750-4bfb-be90-5e4bf4c964d4@palmer-si-x1c4>
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
Cc: Christoph Hellwig <hch@infradead.org>, schwab@suse.de,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181009161511.Y4OSX_TczrSII-rU07RB8fDTlrEw_Bsn2DdmdY7zDrA@z>

On Fri, Sep 28, 2018 at 07:17:17PM -0700, Palmer Dabbelt wrote:
> Christoph published a simple Kconfig workaround a while ago to turn on the
> generic support for non-SMP systems, which might help you work around your
> issue.  My plan was to construct a for-next branch over the weekend, but I
> managed to do so today so I might have time to take a look -- no promises,
> though :)

Can you pull that commit in at least?  It has been dandling in various
riscv tree for more than half a year now..

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
