Return-Path: <SRS0=+z5f=CQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961DCC433E2
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 06:11:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E212F21548
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 06:11:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1AmXBrL9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dn2D9TiX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E212F21548
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1P8mOV8JycfvXoKEt4CTNSBvroNfQiNOBoUJjwa9NYo=; b=1AmXBrL9trUGDE3x6F/lqjyLJ
	nz0+Ss2TB9fxSFsnz5AOCI1pUXdXNT10dpVuDMKiZim+EV8EdegzT8cC0y4gPzW25BgcXlFxojwZ0
	C9wWhkuJCaHPJ108mF8zvzRCc6nXNdqGQNmBBzNXAW1MQths8mnkx7cElDlt75wsw2279cPFNhp2k
	c+vWtH320hpx6/SJL+JMme3+M2muoh+sVaVeSewUK55ONj4sIEO+XlRu+PGGrZCKZRV1k/ZpvuVTE
	5QkyHrDilKNd4JlDRiOOWgNwUC4JQmMoqRxhhHCqqIJ0/PyZXHUI5OUqdcl+yUZFjjy4EgTJG5NFh
	ud6BssGmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFANI-000563-A0; Mon, 07 Sep 2020 06:11:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFANG-00055l-Ji
 for linux-riscv@merlin.infradead.org; Mon, 07 Sep 2020 06:11:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qfcALgvFzZYc/TWT3h5fMbHKeWOPoZL7AoIZsE93hQo=; b=dn2D9TiXe1LDIDlV1gQsXwiTjX
 5dA9T1ojQpMSM5eJyXJPC+XIleTHAJp2xN8n4Vmxa+uPtaPXMLjwBNVaQlEc4JXjJ+AZXOTbktX1Q
 HEYagLu5mM5tpQz68LbkspH8Rl/+4maOP1z4/Q7lR2Trde+6AdiJJSb84ctKey68868Mi7iBdCdG8
 XSFe2xxB4SkRrx/qlOl1BPytAIMjYsImzjZ55XT9n4Q7Qw02TGYmMZNolsHpaXTDKr7iwPT1zlo1B
 FGHOTlcrCQzMIopOcac4bS0lxYWGpeF4jxoWAdkIomOlLbKDeQbqw7VDbXSRnT7qSTKTzADqQfwTq
 Sfv0OQoQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kFANC-0003wC-UU; Mon, 07 Sep 2020 06:11:26 +0000
Date: Mon, 7 Sep 2020 07:11:26 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 2/3] soc: sifive: Add SiFive specific Cadence DDR
 controller driver
Message-ID: <20200907061126.GA14999@infradead.org>
References: <1599457679-8947-1-git-send-email-yash.shah@sifive.com>
 <1599457679-8947-3-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599457679-8947-3-git-send-email-yash.shah@sifive.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: devicetree@vger.kernel.org, tony.luck@intel.com, james.morse@arm.com,
 linux-kernel@vger.kernel.org, rrichter@marvell.com, sachin.ghadi@sifive.com,
 robh+dt@kernel.org, bp@alien8.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, mchehab@kernel.org, aou@eecs.berkeley.edu,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 07, 2020 at 11:17:58AM +0530, Yash Shah wrote:
> Add a driver to manage the Cadence DDR controller present on SiFive SoCs
> At present the driver manages the EDAC feature of the DDR controller.
> Additional features may be added to the driver in future to control
> other aspects of the DDR controller.

So if this is a generic(ish) Cadence IP block shouldn't it be named
Cadence and made generic?  Or is the frontend somehow SiFive specific?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
