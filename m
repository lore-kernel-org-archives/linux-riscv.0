Return-Path: <SRS0=SgWD=ZD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F364EC43331
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2019 20:37:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C548820659
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2019 20:37:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n5t2ngxH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C548820659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxhB5Lr8hAsPyjxNt5mVZAH1tHP23BkOg+tAfoUFJv4=; b=n5t2ngxHJJS7Qf
	u9Np3zoWzB0OJJSL2PjHueyuuSVlLPKm2fhlPc6Ai5w1vboS7af/O6ESQgAKWVhzv+MaRPwutr/4l
	dzQAVo5LNRektev1KroGlIvDaynlYmp2XCF+N98dV55dc8zSrQCiP2zjGByuVhUtaS7NgvtYmHsiK
	Uc0UXfBKGWccCPt/reHdYIDvKLF8ChP1OavuLAXOWjpAySK5antVcpF7Cwbss7FYkkFGX3orlPahj
	rE7zAchitEzYNAhUtBD502mUe+1ZtjJdPqdA2rVeOcb8dFiSmtY+Lc75Q9Hv7vutGZULKsGx6BDzs
	PpC+MnfUaNR2z7E1qAPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUGRc-0004j1-H4; Mon, 11 Nov 2019 20:37:52 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUGRW-0004eP-LE; Mon, 11 Nov 2019 20:37:48 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 45C7368B05; Mon, 11 Nov 2019 21:37:43 +0100 (CET)
Date: Mon, 11 Nov 2019 21:37:43 +0100
From: Christoph Hellwig <hch@lst.de>
To: Alan Mikhak <alan.mikhak@sifive.com>
Subject: Re: [PATCH RFC] PCI: endpoint: Add NVMe endpoint function driver
Message-ID: <20191111203743.GA25876@lst.de>
References: <1573493889-22336-1-git-send-email-alan.mikhak@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573493889-22336-1-git-send-email-alan.mikhak@sifive.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_123746_841597_D96DF7AF 
X-CRM114-Status: UNSURE (   6.24  )
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
Cc: lorenzo.pieralisi@arm.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, kishon@ti.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, bhelgaas@google.com, linux-riscv@lists.infradead.org,
 hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 11, 2019 at 09:38:09AM -0800, Alan Mikhak wrote:
> A design goal is to not modify the Linux NVMe target driver
> at all.

As I told you before that is not a "goal" but a fundamental mistake and
against the design philosophy of all major Linux subsystems.  Please fix
your series to move all command parsing to the code based on flags for
fabrics vs PCIe in the few places where they significantly differ.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
