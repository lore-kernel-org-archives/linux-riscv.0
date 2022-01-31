Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBC8C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 12:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WironPgWkdaVcGh+TNjagU0lSqYJ6cDNu9Ab2G2JUBc=; b=4DZgGQnBQ5q1Na
	vbdvQ+7rl+lTUsTvQaLEpVHFDypPLPNz7+YL88wlSAVozd/cFVrel67936ENWojqSZ/hshOEYpss1
	yrS2WKWVfzH8efARwpjni5LXnh6qMaimM23VGxvrO0tPpVOdg8OMS5JYfozROSGLIOC6wkkOHmyCk
	A1Psr9f66Yq5J2L0JUYwIXhRjwo//VBQeX3hTiagFogcrTuAtrgXmbnbrHYZ9i3MktvQWA+RwyQmP
	PBdeP/QB5jVX/5ZVVJcQmu0/LcQt1urYa0SjP7fh+bnXCFUcdvfpfQaA0wWJPrlFYRRVVieByrTdZ
	BWOj9tzlX8ayprhfcGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEVlA-009L1d-CV; Mon, 31 Jan 2022 12:26:16 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nEVl7-009L0d-Lx; Mon, 31 Jan 2022 12:26:13 +0000
Date: Mon, 31 Jan 2022 04:26:13 -0800
From: Christoph Hellwig <hch@infradead.org>
To: guoren@kernel.org
Cc: palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com,
 wefu@redhat.com, drew@beagleboard.org, wangjunqiang@iscas.ac.cn,
 hch@lst.de, hch@infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V4 16/17] riscv: compat: Add COMPAT Kbuild skeletal support
Message-ID: <YffVZZg9GNcjgVdm@infradead.org>
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-17-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220129121728.1079364-17-guoren@kernel.org>
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

Given that most rv64 implementations can't run in rv32 mode, what is the
failure mode if someone tries it with the compat mode enabled?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
