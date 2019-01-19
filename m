Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250C5C5AE5E
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 01:40:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E06A22086D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 01:40:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QpDcmhqA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E06A22086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pwsan.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxivbsTaAuMOgcCDO4llvSbLAVMmY2XEbtm2hK/ink4=; b=QpDcmhqALN9zgk
	31/0ds5TAYHsf9br2faz+UvDDJtjtBY5HxuoH1c4EBcQLwwnkuhfH0O1EWm5vxOQ5SnpGIePX406d
	uEuA9/sCQSzPWc00wh+XJDbbUIrAO9gFX8b1gwHhSLecrLU0fc5i4vpdHkkRs5E5hZeLPJ/Liijtw
	Esm9Kh9sVOAA7tJd4he/WPqAjcsV/2Kl89Vt7jaW+NEymTQvnfkzQzxQqtPXbdr2AYNe+4DcwwOiX
	WsgZtz77nBxW8/7qSQFQsG6xto+ZHrnR6I8HASrWEzTSVzFNeGdGfqy3wqJGGy36/wteyml5Dt6mA
	ILBiUnVoyPqks7pK+SJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkfcP-0001IO-Pu; Sat, 19 Jan 2019 01:40:17 +0000
Received: from utopia.booyaka.com ([74.50.51.50])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkfcN-0001I5-Lf
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 01:40:16 +0000
Received: (qmail 9106 invoked by uid 1019); 19 Jan 2019 01:40:14 -0000
Received: from localhost (sendmail-bs@127.0.0.1)
 by localhost with SMTP; 19 Jan 2019 01:40:14 -0000
Date: Sat, 19 Jan 2019 01:40:14 +0000 (UTC)
From: Paul Walmsley <paul@pwsan.com>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 3/5] riscv: fix riscv_of_processor_hartid() comment
In-Reply-To: <20190118140308.9599-4-johan@kernel.org>
Message-ID: <alpine.DEB.2.21.999.1901190139580.8813@utopia.booyaka.com>
References: <20190118140308.9599-1-johan@kernel.org>
 <20190118140308.9599-4-johan@kernel.org>
User-Agent: Alpine 2.21.999 (DEB 260 2018-02-26)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_174015_788035_A766F406 
X-CRM114-Status: UNSURE (   5.85  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 18 Jan 2019, Johan Hovold wrote:

> The riscv_of_processor_hartid() helper returns -ENODEV when the
> specified node isn't an enabled and valid RISC-V hart node.
> 
> Also drop the unnecessary parenthesis around errno defines.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
