Return-Path: <SRS0=n0wm=N2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD75C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Nov 2018 09:12:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD25F21780
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Nov 2018 09:12:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K1XlVTo+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD25F21780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1y8DmS88g14tg+nroZt7QTXSdOMTg7h5sN68zivQrzM=; b=K1XlVTo+R2pB7q
	juuE04Fgf/XoqoAK6mFgLKFg1fQ941lNuoGf00dCjAvUryaehQr9E/13I2Z4MVNNzuEzNDgpejq0/
	xYM1qghq8jM9i8q6Rv1ZFii4EliA8PN35JS7BdjnK/ZquVh1p0gjcEZjOtoH0t36qhCd8gTxmZ5XO
	usQnqXhCdRmJxpKVmoxbVWELyhTywV4nRF7+PP5ySUuuKGSMs0wKaXTwFl5+GuJHErdf+Py8v4c8t
	AqfDHvEL4iAf+Y4fx3ZSM6G5NZpQ7Llb6VNkLGzqRQtiZhv066CF47zcdPMf+sR5nP1jBu9ge0jOm
	pdow0Vz80P1lVrkPO72Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gNDhK-0006lf-0U; Thu, 15 Nov 2018 09:12:26 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gNDhG-0006l3-8c; Thu, 15 Nov 2018 09:12:22 +0000
Date: Thu, 15 Nov 2018 01:12:22 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: Re-run features-refresh.sh
Message-ID: <20181115091222.GA25926@infradead.org>
References: <20181113020113.29640-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181113020113.29640-1-palmer@sifive.com>
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
Cc: andrea.parri@amarulasolutions.com, aou@eecs.berkeley.edu,
 keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>, corbet@lwn.net,
 jcmvbkbc@gmail.com, jhogan@kernel.org, linux-doc@vger.kernel.org,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, yamada.masahiro@socionext.com, jglisse@redhat.com,
 mathieu.desnoyers@efficios.com, ren_guo@c-sky.com,
 david.abdurachmanov@gmail.com, linux-riscv@lists.infradead.org,
 rmk+kernel@armlinux.org.uk, mingo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181115091222.B0NEvq2txrd3kKCNT0BwwiKpYVB4pwDFJC0dBnUB7_w@z>

FYI, we really should kill ARCH_SG_CHAIN in its current form.

See my series here, which could use a review or two:

https://lkml.org/lkml/2018/11/9/958

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
