Return-Path: <SRS0=k7QB=MW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E661C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Oct 2018 13:12:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 317BC21479
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Oct 2018 13:12:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="baAJKcq9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 317BC21479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVz4PEFNnNTeciWUrLosbXosl6ehU2RiMLipgUPBStg=; b=baAJKcq9zvDsRM
	bccDRIY5yUex8FySa8CE4ThNXMzXSWG3DwsmuafAb+v2fCe1mS7KX/ND42fb9RD1/ltwVGkqH7/WZ
	34SCOWgyUISHyLEYeMJICtYwk+WFps93h4NDzIgITr/kjnC+SiY1zhIMe7AvwpVbORnxm13rulWLE
	cXgpbEmmg/fFXXjlj4OztZYWFlAgTIhqpnq/Wm+shIQG6QNwcvbJ0EBkf1zSdqmtZm+paWRnBwTUw
	/3Y3BVsazD8gcKXnagAzT1QBlJpGsTm1QEUpRpgs2+5I5Q8ePtMZlZv3D+nEAaT9tqVZt84LkOut4
	PwPqXMZMXOPLou54/DLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gAEIM-0001xN-5R; Wed, 10 Oct 2018 13:12:58 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gAEIJ-0001wU-NE; Wed, 10 Oct 2018 13:12:55 +0000
Date: Wed, 10 Oct 2018 06:12:55 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [RFC 4/4] gpio: sifive: Add GPIO driver for SiFive SoCs
Message-ID: <20181010131255.GB29142@infradead.org>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-5-git-send-email-atish.patra@wdc.com>
 <mvmo9c22bx2.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvmo9c22bx2.fsf@suse.de>
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
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 hch@infradead.org, Atish Patra <atish.patra@wdc.com>,
 devicetree@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181010131255.BrEnLEdFgCSvNv0FXylvWCg8-bC5N9Y6M286PPHhUc8@z>

On Wed, Oct 10, 2018 at 03:01:29PM +0200, Andreas Schwab wrote:
> On Okt 09 2018, Atish Patra <atish.patra@wdc.com> wrote:
> 
> > +static void sifive_set_ie(struct sifive_gpio *chip, unsigned int offset)
> > +{
> > +	unsigned long flags;
> > +	unsigned int trigger;
> > +
> > +	raw_spin_lock_irqsave(&chip->lock, flags);
> > +	trigger = (chip->enabled & BIT(offset)) ? chip->trigger[offset] : 0;
> 
> This should use test_bit instead.

Given that this apparently needs the spinlock for atomciy with more than
just the bitmap test_bit would be rather pointless.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
