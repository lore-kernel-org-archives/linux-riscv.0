Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6D9C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 15:47:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E67320818
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 15:47:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UMtvXsP/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E67320818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZrMl6dtcB9kZfgN526fj4P85zXbwcLoD4yb+qQD1J8=; b=UMtvXsP/zx1jiU
	aSezUChq1+ArBhF8PyNvsWU+KNLxMSKpOyKnJIaIzOhj0oPnup5oEgrxzXAFpuIs/rUkuucgmBTlj
	Q3vuom3v0bD7mnjsv0B+viv1Zm3dQJnSqB5hxyqduphl/3d3Bvbujpp7HFJJ1pu0JyuoI36L1INEj
	w3rE3eIW6s1QwVI2CJ8SxmTYuu4U/khHGdqlVZqaayPSaVzJJIeM5qjB8BEkWOICMkfHpxLtE45qh
	N+P4iTuZgK0LrkunVFCvFfXUm3SmxB9ivlbvez92ewq0QsXxtYssvuT0b/AwRJ//EO7yTMljXpiQh
	NrqJh/yUj5WhKyzP4Olw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEbvX-0003is-Gp; Thu, 11 Apr 2019 15:47:47 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEbvU-0003iG-UE
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 15:47:46 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 377C668AFE; Thu, 11 Apr 2019 17:47:31 +0200 (CEST)
Date: Thu, 11 Apr 2019 17:47:31 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [PATCH 2/9] riscv: remove dead big endian code
Message-ID: <20190411154731.GA23171@lst.de>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-3-hch@lst.de>
 <3382adaf8be0b44af9ebb8b7528cac41@mailhost.ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3382adaf8be0b44af9ebb8b7528cac41@mailhost.ics.forth.gr>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_084745_120090_1E78A8E3 
X-CRM114-Status: UNSURE (   7.98  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 11, 2019 at 06:40:07PM +0300, Nick Kossifidis wrote:
> I don't think we can definitely say that RISC-V will always have a 
> little-endian,
> memory system only that it is little-endian for now. Also this code acts as 
> a check,

And we don't know if Linux will be around if that ever changes.

The point is:

 a) the current RISC-V spec is LE only
 b) the current linux port is LE only except for this little bit

There is no point in leaving just this bitrotting code around.  It
just confuses developers, (very very slightly) slows down compiles
and will bitrot.  It also won't be any significant help to a future
developer down the road doing a hypothetical BE RISC-V Linux port.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
