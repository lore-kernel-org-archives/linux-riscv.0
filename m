Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBC8C64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 22:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xYlrNrXJKgPhSaLckTpjADszy0+c8BOAbuIqzRhRWRI=; b=JYfOwDCNWKBifw
	QBPqHjN2giXy1/mkB/znaKJjOQnYW/sLPp2fsyQU2YLIQfgVqVbCgOmVBu2OG+FsxiKxRA/oCAkzD
	DObHfABFLLQ6UV1O6eGDbS4zvFd41abVOV+yuB3+qKgj/JPV9h//KTaNxE+kn5BaKewgIZPvKuxgQ
	jxXo+qhHNFUjYCCZr4o8rRfJskQ0huY7A/6lwZ8njtbt0TwcNJldzgZqrAxwpi3vN+mA0rAIVxEBx
	VHTYMU6tDfuMMxj59qv4Y/sM7vTCEYpqkFRvO6yYeFQn6JscmWO18meu0U+WlLJpnXo/1qHdHbVAC
	/CcmFUBLG7tYrW43681A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX8iN-00EVV7-Vp; Tue, 28 Feb 2023 22:44:55 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX8iL-00EVTy-7U
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 22:44:54 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id B134A92009C; Tue, 28 Feb 2023 23:44:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id A34A592009B;
	Tue, 28 Feb 2023 22:44:47 +0000 (GMT)
Date: Tue, 28 Feb 2023 22:44:47 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Palmer Dabbelt <palmer@dabbelt.com>
cc: gerg@kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
    linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: support ELF format binaries in nommu mode
In-Reply-To: <mhng-20faeb04-8ed4-4759-8f13-aef3d2446d15@palmer-ri-x1c9a>
Message-ID: <alpine.DEB.2.21.2302282242270.50005@angie.orcam.me.uk>
References: <mhng-20faeb04-8ed4-4759-8f13-aef3d2446d15@palmer-ri-x1c9a>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_144453_468892_482EACDE 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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

On Tue, 28 Feb 2023, Palmer Dabbelt wrote:

> Adding Damien, as IIRC he's had some hacked up userspace bits for the K210.
> I'm yet to get anything running, but it'd be great if we get this to a point
> where I can actually boot test this on QEMU (I'm just doing builds now).

 And I'm still around should someone want to proceed with FDPIC support in 
the toolchain.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
