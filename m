Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26539C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 14:00:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E705D20657
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 14:00:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hjTOuBWX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E705D20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gln827BK9JHCQbfsgbatUfr/e0qEq5dxP3Byde65Ry8=; b=hjTOuBWX6xfJYp
	LJ+3hp9OkWxtfWeMJHXxfvC91b+4GFjo3KyUa4WtXEJrEpCwINytrhsBMnJWNgVccX8JPRFcjOO3L
	Vhrdgji2NtAs0GyQMsfLogIG9ABwyiKf4dus8OHXJTp6p4CZCyXJC6m435L6CU3XkczGRCenNg/Iu
	K3FtZa6RAWVHAuVnTO76OfMuKPlV0jr0QF01J3VVO2Lt9baBDNhXIGdRxcY4E3IJUIL5EWViGz4Ew
	D0JGQU/+bvpWMA02bDQo7LU3o/RKLV1PYwWKcll7bCaipPDJ5joTtPwAtUD4sgHsR9BvTeXBRVRaF
	hTvv3weuicii32iGBpHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjPGK-00080v-Ki; Tue, 15 Jan 2019 14:00:16 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjPDe-0004l0-FB; Tue, 15 Jan 2019 13:57:30 +0000
Date: Tue, 15 Jan 2019 05:57:30 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Antony Pavlov <antonynpavlov@gmail.com>
Subject: Re: [PATCH] RISC-V: asm/page.h: fix spelling mistake "CONFIG_64BITS"
 -> "CONFIG_64BIT"
Message-ID: <20190115135730.GI28946@infradead.org>
References: <20190108194538.28669-1-antonynpavlov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190108194538.28669-1-antonynpavlov@gmail.com>
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 08, 2019 at 10:45:38PM +0300, Antony Pavlov wrote:
> There is no CONFIG_64BITS Kconfig macro.
> Please see arch/riscv/Kconfig for details, e.g.
> 
>   linux$ git grep -HnA 1 "config 64BIT" arch/riscv/Kconfig
>   arch/riscv/Kconfig:6:config 64BIT
>   arch/riscv/Kconfig-7-        bool
> 
> Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>

This looks correct.  But I wonder why we even bother with the explicit
width and don't just use "%lx" directly without the macro.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
