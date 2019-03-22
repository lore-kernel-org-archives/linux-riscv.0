Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD5FC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:27:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8AF82190A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:27:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JIhuK0DI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8AF82190A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yzFY3kPKaUQvJLVS/tZhzmVN0Ykvi++TiTL5Gb0deQ=; b=JIhuK0DIM8948Z
	2c+vCLI0YOtdhdbRNBe7GeYO4yqN+uMuX4WEz1asV/pOom2fThOE8N4Zrk3N0H374Ec+z1dNXakAh
	tyhROC62aPdmQACqmbPQmUl5s9xjUAe6cyTrYV5rN6Up89ZcS1/Jd/9/WBBUtjoJCtt3Gluu2nGh+
	3caUkGzPe9WUrgD4wjXjl5rwFYVfidIyEYV744oXVEls1RggjNb2+pYbwLbT9s8Ue32SgQJQVaAs9
	I0io9l+eflm3Bl/kXN/4tqxF1PNA8JyXGWiBRYTUNFS2xY1gsGape2FY/GVW+slzdzhEGjxtbR/Zm
	DzRzHqUE6GsJ8HQo9Gtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7KD7-00089X-OO; Fri, 22 Mar 2019 13:27:49 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h7KD6-00089C-No; Fri, 22 Mar 2019 13:27:48 +0000
Date: Fri, 22 Mar 2019 06:27:48 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: [PATCH] irqchip: plic: Fix priority base offset
Message-ID: <20190322132748.GD19263@infradead.org>
References: <20190320223853.1209-1-alistair.francis@wdc.com>
 <20190320234858.GA5304@infradead.org>
 <CAKmqyKPsoi7F_NNLKcm269=VAgdvsUV7HdF3dtkpMBzaKbHhtA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKmqyKPsoi7F_NNLKcm269=VAgdvsUV7HdF3dtkpMBzaKbHhtA@mail.gmail.com>
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
Cc: Christoph Hellwig <hch@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 20, 2019 at 05:04:58PM -0700, Alistair Francis wrote:
> > Well, it starts at 0x00, but the first one is reserved.  If you think
> > that is too confusing I'd rather throw in a comment explaining this
> > fact rather than making the calculating more complicated.
> 
> It doesn't mention that it starts at 0 when you look here:
> https://sifive.cdn.prismic.io/sifive%2F834354f0-08e6-423c-bf1f-0cb58ef14061_fu540-c000-v1.0.pdf

It doesn't say that.  But it is completely obvious from the map,
and from how everything else works.  In this case I think the
documentation is simply written in a confusing way, and we need to fix
it once we have an official riscv spec level documentation of this
hardware.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
