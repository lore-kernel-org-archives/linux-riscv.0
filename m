Return-Path: <SRS0=CAot=X2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E1BC352AA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2019 10:10:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BC4B21920
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2019 10:10:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NqG5vEOe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BC4B21920
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3W6Z7e0cqFWtf8EodQbhD0BdRs8KhdBHB9kAUXjC1c=; b=NqG5vEOevPF3xa
	9DEIk60rTom9xu+saG15ar+bXmPq9vlfnHCM4/YKz/h8h6MF61m1KJTnApaTgCrUmosip3cykr/c2
	psuCUwacwhwEBCZyAFtqUh9Xqdzi0AgiFRr4tt9mYlppMsDPcmf5G7wLprPGKKDP+Z5qhCOGuko7F
	QV/wzWqsUzNXrburWGurzpV6gw211AB8GCg2D2h04NKj5Qd7McYcMnazz8Mp3QnsFCF4Hvou7uT6z
	EB+DV5gvSyNzEWYlJGGA1dZwe276Rlo6SVWrxPwMbZrQAx5MAC+Wc3ytYqPv8hiXbi9UgOhcw1K2O
	oUPuaqRqdFJjGP9tPlXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFF6p-0007Q3-9z; Tue, 01 Oct 2019 10:10:19 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red
 Hat Linux)) id 1iFF6m-0007Pg-Fv; Tue, 01 Oct 2019 10:10:16 +0000
Date: Tue, 1 Oct 2019 03:10:16 -0700
From: "hch@infradead.org" <hch@infradead.org>
To: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: [v6 PATCH] RISC-V: Remove unsupported isa string info print
Message-ID: <20191001101016.GB23507@infradead.org>
References: <20191001002318.7515-1-atish.patra@wdc.com>
 <20191001070236.GA7622@infradead.org>
 <b0c39a9895698d74e2f44eb1f2faed46eee54bc3.camel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0c39a9895698d74e2f44eb1f2faed46eee54bc3.camel@wdc.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "johan@kernel.org" <johan@kernel.org>, "hch@infradead.org" <hch@infradead.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 01, 2019 at 08:22:37AM +0000, Atish Patra wrote:
> riscv_of_processor_hartid() or seems to be a better candidate. We
> already check if "rv" is present in isa string or not. I will extend
> that to check for rv64i or rv32i. Is that okay ?

I'd rather lift the checks out of that into a function that is called
exactly once per hart on boot (and future cpu hotplug).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
