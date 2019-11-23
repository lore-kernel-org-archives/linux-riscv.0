Return-Path: <SRS0=E7Bo=ZP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736E4C432C0
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Nov 2019 03:58:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4590F20721
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Nov 2019 03:58:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rrr9Clbv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4590F20721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MsNdfyv6DYXJhr8YsqNA5WfKOMi3fSor685RFgbh3o=; b=Rrr9Clbvb+h7AC
	igERE+n3YdONl5EflnDuqrTIlh7rSu+X8etSmHMBJuIXAeMoLaYonhVsPOXTW0A+FyXBljHMHDcIF
	AGrBlsdR1G6Kvqnrm6dqQ4GjuIC4UpZKl7JzuIFiMLG9YwdMRuhkJ099jlg+A6h6uLHjEtCBxNauo
	SOT733juJujvsOSpZ06IPaYKQupCmDO81PRIYCWQXBAVkY4J8pdYbi4A383CFqcaYVpuhra4FR7zd
	aFyTEWNjhOChTr0GMQhilXOAosXkpRl/yIWCxYcP/xN+p2iaf2qKqI6SohfGVzwVB54Ixkh9X+F5p
	Ksr5ZEYWOYNuT306S7pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iYMZ5-0003C9-Sm; Sat, 23 Nov 2019 03:58:31 +0000
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iYMZ2-0003Bw-0b; Sat, 23 Nov 2019 03:58:28 +0000
Date: Fri, 22 Nov 2019 19:58:27 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] Documentation: riscv: add patch acceptance guidelines
Message-ID: <20191123035827.GZ20752@bombadil.infradead.org>
References: <alpine.DEB.2.21.9999.1911221842200.14532@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1911221842200.14532@viisi.sifive.com>
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
Cc: krste@berkeley.edu, aou@eecs.berkeley.edu, waterman@eecs.berkeley.edu,
 corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 palmer@dabbelt.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 22, 2019 at 06:44:39PM -0800, Paul Walmsley wrote:
>  Documentation/riscv/patch-acceptance.rst | 32 ++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/riscv/patch-acceptance.rst

Should this be linked into the toctree somewhere so it's findable
on kernel.org?  Maybe add a line to Documentation/process/index.rst
to include ../riscv/patch-acceptance.rst?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
