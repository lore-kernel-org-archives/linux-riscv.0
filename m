Return-Path: <SRS0=VR9W=WW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF398C3A59F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2019 11:35:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6AA0217F5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2019 11:35:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LNmI4xB/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6AA0217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WgkwUjQQ+G4Bq3etl9nrCKpbqx8Iuq/0TZA3fgDU1MA=; b=LNmI4xB/N+u2kW
	Wm+xTgbdMiVX1giXvAPH2rSNSQvxB6dY5gyFBwmKtY4p4EEb3WcaQxtASlyRlboeLh3xlzNhnO49P
	ync+jqiOLQsN4H/zUKESN2ZKvuwtkzmq7ghXlY4yentSyPvZfWp9Lxz3ouSZQKhIgTwIS+1bBQOCK
	R+Y/gzg1jjfnuFr2jElZCWr1g5x2Jo4y1uWEN/kEeOC/+xgRaIx+jtrw3ZiKBrZfYhwt8CbVa34/r
	9crnBJxVcaAIt2MLcSkK1SpMv1oxw+2yEYRqqyT2iSyrkFzEDsNKxe7DW8kKt8AtfwtGf7yxIAAmW
	l51BuKAEORun0INWuoYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2DHT-0001vD-DM; Mon, 26 Aug 2019 11:35:27 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1i2DHS-0001v4-Ev; Mon, 26 Aug 2019 11:35:26 +0000
Date: Mon, 26 Aug 2019 04:35:26 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] riscv: add arch/riscv/Kbuild
Message-ID: <20190826113526.GA23425@infradead.org>
References: <20190821092658.32764-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821092658.32764-1-yamada.masahiro@socionext.com>
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 21, 2019 at 06:26:58PM +0900, Masahiro Yamada wrote:
> Use the standard obj-y form to specify the sub-directories under
> arch/riscv/. No functional change intended.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Do you have a document what the grand scheme here is?  Less of the magic
in arch/$(ARCH)/Makefile sounds like a good idea, but unless we have
a very specific split between the kbuild makefile and various override
I fear just splitting things up into two files doesn't really help much.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
