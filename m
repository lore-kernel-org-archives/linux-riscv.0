Return-Path: <SRS0=P6b6=UX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5011C43613
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2019 11:55:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA8A62133F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2019 11:55:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AdmAVEHD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA8A62133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A00WoRB0LeU5nkwavMiAHQ1v/bmEgKNNlYIX6KYDlZw=; b=AdmAVEHD9jJyI5
	f/vTMQBDQJJJin/sbMhrTRT3a3ojGPTT4lkjUa5mGjs7xXxHd2cakTdJh3aQY4y0GWn/3v7NNZOMH
	q1vkAhbFSB4DrbNBsx4UcAy7K9cS9KgQWjLTrE+pPYDV9QYfWjPQ1HJmAv6IBEScYf1M9ICtxb2z2
	JzinYLtU4gWT2nJTqpbotGixyWaCQTxQ9LmO6AX6Gx/mZERIRRcTOrgP8s7QJWUBmt3CKNuDMR3GD
	GydlHi3dt3w7S56gIq+b5S3UsK1njFagfO+/TV6thQjA/zdXgD6B8RywwwjBCeBVEY+tg+teWw+I0
	qIigw0o9f24glakko5Hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfNZ0-0007cF-D8; Mon, 24 Jun 2019 11:55:10 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfNYr-0006pP-HV
 for linux-riscv@lists.infradead.org; Mon, 24 Jun 2019 11:55:09 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 647BB68B02; Mon, 24 Jun 2019 13:54:29 +0200 (CEST)
Date: Mon, 24 Jun 2019 13:54:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: RISC-V nommu support v2
Message-ID: <20190624115428.GA9538@lst.de>
References: <20190624054311.30256-1-hch@lst.de>
 <28e3d823-7b78-fa2b-5ca7-79f0c62f9ecb@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28e3d823-7b78-fa2b-5ca7-79f0c62f9ecb@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_045507_607118_48444BE9 
X-CRM114-Status: UNSURE (   7.82  )
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 24, 2019 at 12:47:07PM +0100, Vladimir Murzin wrote:
> Since you are using binfmt_flat which is kind of 32-bit only I was expecting to see
> CONFIG_COMPAT (or something similar to that, like ILP32) enabled, yet I could not
> find it.

There is no such thing in RISC-V.  I don't know of any 64-bit RISC-V
cpu that can actually run 32-bit RISC-V code, although in theory that
is possible.  There also is nothing like the x86 x32 or mips n32 mode
available either for now.

But it turns out that with a few fixes to binfmt_flat it can run 64-bit
binaries just fine.  I sent that series out a while ago, and IIRC you
actually commented on it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
