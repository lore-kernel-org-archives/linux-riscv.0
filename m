Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A68C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 06:29:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0D57218D3
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 06:29:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qYvgaAaG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0D57218D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hSTeEsrZ8xV0hcsLtIuNw88EVmza5k6cmnAdLtk0aoM=; b=qYvgaAaGPcShBu
	5JuP7xrMVxU+2+YkoI5ZWY4wIHj1KemwCNPqHi4YpYCG/EHBsyXHvVGP542voU9Crut7HJFJSs1IV
	DPg8O85jOgoJ0uhKukb32o2DP/Agzt6aSS6wtj5eWSCUL6ZJcafq/rv4j39XlKSLC5OF4KqvUt0ZF
	9WSJi4X8B/YXZvm7qXLA4HF3CXS+nq761RnoMuqZwhWlaMbw/DZuJiFrVE+Gsh8BCg88vQ/mK7JaA
	PJCa/oJnuOVmE3pWc6MKZ8ol3dDi2jAoTr2zni7u41HO0dkXBBUxUSsHcQpGFNz8992Bjt76Bj6wx
	e+QjIMHJECIj4Kw30JnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJBPh-0004fm-2s; Wed, 24 Apr 2019 06:29:49 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hJBPf-0004fT-Vh; Wed, 24 Apr 2019 06:29:47 +0000
Date: Tue, 23 Apr 2019 23:29:47 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH v3 2/3] RISC-V: Add interrupt related SCAUSE defines in
 asm/csr.h
Message-ID: <20190424062947.GB10400@infradead.org>
References: <20190415093648.7525-1-anup.patel@wdc.com>
 <20190415093648.7525-3-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190415093648.7525-3-anup.patel@wdc.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Apr 15, 2019 at 09:37:23AM +0000, Anup Patel wrote:
> This patch adds SCAUSE interrupt flag and SCAUSE interrupt related
> defines to asm/csr.h. We also use these defines in kernel/irq.c and
> express SIE/SIP flags in-terms of SCAUSE interrupt causes.

I'm not a fan of this.  For one this pollutes csr.h with bits not really
needed by most users, and it makes adding the M-mode nommu port which has
to use the M-mode causes much harder:

http://git.infradead.org/users/hch/misc.git/commitdiff/1221f5c32345ebe7ea2c1cd6e8a01ad4b422aaba

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
