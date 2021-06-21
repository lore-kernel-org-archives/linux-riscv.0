Return-Path: <SRS0=diLN=LP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D3EC4743C
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 14:29:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CD39600D4
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 14:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CD39600D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ji+K3kQHbtrak7/pPzAwfT5Kp2KheiqcHutN1qc6FQ=; b=Aplau0siebfLct
	iH49NlFKkAoQVjqVivKFH0PX3ZCFPXpU24QK5gOEZDR/yZhqW0V1KeaqI1z7QyKunJGnaBX1UffZy
	vPXggNcuATNv0MsHcX8iGv/weJALpkOV0xSJG98LET8vGoqQZgGC9e6b5kj0NdjYMqWkC92s2YIFM
	IXPLihrwp4M/bmZ26Q1SVk8ENo1I46ot/jI/XuktfzypojyZ+9s/Oj5VN91H6M3MHi6Z7NZ6B0bUK
	OEkApR/tXbWeYZbhYY49Bypi8BJuA+qg4+Dh85FK20LH4viv0KemUdgIGL/GpOTG6lj/ClIVCv+RD
	/T+oVmg2jjGR+N8US7DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvKvc-003lXl-Ur; Mon, 21 Jun 2021 14:29:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvKva-003lW6-OL
 for linux-riscv@bombadil.infradead.org; Mon, 21 Jun 2021 14:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6IFijS4A1CMsYF9LXMI82lGpHP++GBbMtZaDe+rkt80=; b=WM5CqpL2hhNoX06P6+L+2bK48Q
 5VFx/eD+JFzkCCZbBoCAMr2vQ+OQBCZei58rQaLkee8cUnLrAsTKzTzAR9yYt28CVatFYqj1w3I3z
 YRXwrDbDdQ8o0cyFzdLP1CtoEJ7aLv5NhN87H7eRnkV4aZ+x0wJwiVIBRO0lbjCKapovL3gF/uHyc
 3XgIMSd7XgxE5vzTG8faBN0P99RaCBp8O4H/sGa02sFs3FHiR66ASFZCj7Q+r9Pl46relgzNMF6NE
 dBp9dCr3TQoKq/rSRcLUaVt6zKqPUTyx77bBOLS3gfgGxxPdsXgIwN7XtIwUfsxPo/A4oXbLpRyJp
 48pIz/cw==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1lvKut-00DBCH-JT; Mon, 21 Jun 2021 14:29:04 +0000
Date: Mon, 21 Jun 2021 15:28:47 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3 2/3] riscv: optimized memmove
Message-ID: <YNCiH7XDMZ7iDKjg@infradead.org>
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
 <20210617152754.17960-3-mcroce@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210617152754.17960-3-mcroce@linux.microsoft.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This looks nice, but I think it would be a good candidate for lib/
again.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
