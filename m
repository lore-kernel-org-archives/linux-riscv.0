Return-Path: <SRS0=Rwl5=UH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3896C28CC5
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  8 Jun 2019 08:20:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA7C3214AF
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  8 Jun 2019 08:20:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GU9YHQtM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA7C3214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKnPFlKV9ni1gXrqbIys/Lwum8qfOVQrgXNQOBioFHc=; b=GU9YHQtMHHG/Eg
	cn7NWEL1jRmqclqiUxMI97hW8feb0TQYFX159bgmQaJEmPrg4RbF2bcl2aXHwztsKLSOOY7M1ZiKa
	eITbQoDiA+hTKKbKo4yblatYM50F+UMiqCSG7nNyxm0P3VsQiCt1BKza8+4Quk6OR70Ub7LqN2h+k
	rJTcvHanycigJqHDAm/Ix7nKyo2/QSRBEizi65t0nYmqy+aoU8prRiCR+DsHNtoCa7UFnyikfAXks
	BOGq9QsB+gegt+u0+BBb/t82LkidK5GmjEGS+QGAGN+cdyfz0891bPyCdDr54W1pJKAt0NrXNejsu
	pM1iuBZ1316AlwXuufOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZWa2-0001KA-Us; Sat, 08 Jun 2019 08:20:03 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hZWZz-000149-L7; Sat, 08 Jun 2019 08:19:59 +0000
Date: Sat, 8 Jun 2019 01:19:59 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2] RISC-V: Break load reservations during switch_to
Message-ID: <20190608081959.GA26134@infradead.org>
References: <20190607222222.15300-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190607222222.15300-1-palmer@sifive.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: me@carlosedp.com, linux-kernel@vger.kernel.org, joel@sing.id.au,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 marco@decred.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
