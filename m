Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FFFC10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 06:22:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC8E2218DA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 06:22:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sh1dZZt6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC8E2218DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TrXRSwSsW6sL008z+QGxU39wdaelXX2pKd7/HiyHEOg=; b=sh1dZZt6gKE3RF
	ChB3UdclbPjIIwpSFXNvvTo7UlyFVQN1DjLWkBCjCaoQo8Rl7D4h83RRvi/lm/oxh3G3jInC22WjN
	eFtCX1Nip3IJld+YL+JaFGLGECiG2OCM+nS+gZDo1bZ4qzzUoo3PWBO2qMArxIbB3delq8KIYI5tK
	ojcilKnqMIbj3i2It2Doioz3X6M56zebD3XfUkfBxkkC2ztXQ+XC7KLLp73XqfJ6juMIM1cWlUgd5
	R4TVOHnuINcS5rz9a7VFhUPwHaqyab1jRbuPHVgMF3+N8MaJzT+ozXYUBJYvw0vYdFAtw56d3fi9I
	WA8D9ti8feliI1v5+OQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJBIP-0002XF-Iq; Wed, 24 Apr 2019 06:22:17 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hJBIO-0002Wl-8t; Wed, 24 Apr 2019 06:22:16 +0000
Date: Tue, 23 Apr 2019 23:22:16 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v3 3/3] RISC-V: Support nr_cpus command line option.
Message-ID: <20190424062216.GD3902@infradead.org>
References: <20190424000227.3085-1-atish.patra@wdc.com>
 <20190424000227.3085-4-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190424000227.3085-4-atish.patra@wdc.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 23, 2019 at 05:02:27PM -0700, Atish Patra wrote:
> If nr_cpus command line option is set, maximum possible cpu should be
> set to that value.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
