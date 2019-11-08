Return-Path: <SRS0=zeqi=ZA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96C0FC6194
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2019 06:10:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEA2621882
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2019 06:10:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jwn0+pTk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEA2621882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6z+FjELFPFaK6HOcDSuPV4j4vKyG2BLUUQQhGPW1sW4=; b=jwn0+pTk/9AqBt
	h0jg272jMm+PUhSVibu6PVknrxq1Kr17jGdnCZD5ribBhcHKFYK0ohqtVZDQA8N1kY9WxN/jC/9En
	/xDcVek34t/lus3QyfiJPEFF25AodD/ZWxmuzNEoDHkISVLJpjb+v9KgDIGCw0tXTzdyMY+fbMWuF
	OSSzG1sjeCNNSlQB5DS8RBxJS+zVzpM1M//X41xUKnZbYmvWxmyY/4sxsqSw6RIc9nCXZmf90eIja
	aPEokmRr1rMhNMOdmKzMHkXklYz2/AgCRKN6CQTCZ1d2W9BF0GDQKCZvpw98q60Y5SXPR+6vCAF8v
	bFaIDyWBJtEe6QuvyBLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSxTJ-000671-So; Fri, 08 Nov 2019 06:10:13 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSxTI-00066b-3k
 for linux-riscv@lists.infradead.org; Fri, 08 Nov 2019 06:10:13 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 68D1368BE1; Fri,  8 Nov 2019 07:10:09 +0100 (CET)
Date: Fri, 8 Nov 2019 07:10:09 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: admin-guide: add earlycon documentation
 for RISC-V
Message-ID: <20191108061009.GA30335@lst.de>
References: <alpine.DEB.2.21.9999.1910091252160.11044@viisi.sifive.com>
 <CAMuHMdUfqvkVJHHwyuYxLSxj_iUofx-vSvEj92C5mg3bGxHqmA@mail.gmail.com>
 <20191010112347.4a7237bb@lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010112347.4a7237bb@lwn.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_221012_303414_B719E21A 
X-CRM114-Status: UNSURE (   6.22  )
X-CRM114-Notice: Please train this message.
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Andreas Schwab <schwab@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Jon,

can you please revert this?  The paragraph above this addition already
describes the riscv case perfecty well with my previous patch:


	earlycon=	[KNL] Output early console device and options.

			When used with no options, the early console is
			determined by stdout-path property in device tree's
			chosen node or the ACPI SPCR table if supported by
			the platform.

			[RISCV] When used with no options, the early
			console is determined by the stdout-path
			property in the device tree's chosen node.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
