Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7478FC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 06:48:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44F5F206C0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 06:48:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VQCMhJ8a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44F5F206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfhJM4sCpitPieOaqL8zT6fIv5qV3/iSq7vl2qBf6NI=; b=VQCMhJ8aa18ut3
	5gVAiU4x+1QOM0yne35QDeoMz65MH07ygZFhE5oXVwZuirJ/MlOb3fq/vrC/Ohgql1HotOfhFaqMs
	ZXAjKj906D68ES19wcUskNp4t25rCmGRyHJpZ2+KrGmDMcbtAmUv2NBHGTWhFCsM2AY6P2XaHWtdl
	YPLUEsIlzeQJo+FdgE+6couJYe4/SFUvaKRCIEgachynctCYpGDp+fWGlCUArvXPd5aQsvFbnh4eb
	GGGCsJX8Dz+GmJSfOxbczN2J5a+sJWx6/xx23i+pngR09kIDa9jee7+ZlwTEIOIs7hk7Yj8JIuGbZ
	pn+BPd2f3aBGM23Plmvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8JPK-00019b-L8; Mon, 25 Mar 2019 06:48:30 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h8JPG-00018s-TX; Mon, 25 Mar 2019 06:48:26 +0000
Date: Sun, 24 Mar 2019 23:48:26 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Alan Kao <alankao@andestech.com>
Subject: Re: [PATCH v2] RISC-V: Always compile mm/init.c with cmodel=medany
Message-ID: <20190325064826.GA29111@infradead.org>
References: <20190325033648.16171-1-anup.patel@wdc.com>
 <20190325052550.GA30996@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190325052550.GA30996@andestech.com>
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 25, 2019 at 01:25:50PM +0800, Alan Kao wrote:
> Hi Anup,
> 
> Sorry for being late to the party.  I think one more thing should
> move together with setup_vm():

Ah, I wonded about that yesterday but wasn't sure.  Maybe notrace
is a little cleaner?  Either way we should probably document both
the mcmodel and notrace assumptions in source comments for the next
person touching this code.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
