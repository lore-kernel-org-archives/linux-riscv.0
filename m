Return-Path: <SRS0=aNP4=OO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632A5C04EBF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  5 Dec 2018 09:59:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35F81214C1
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  5 Dec 2018 09:59:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rMmILCmx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHXQQTvO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35F81214C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3aly2WDi8BLTXZi/JUe3SjwxPlLwHiUza4i3885fNWY=; b=rMmILCmxrqvmJZ
	ah4rJOdrJabRJ+PNZdg18rmzl6NJN1qmro86Zb9k5GLUcK5k7Ak+4cjzTq2HW+tRQfOWy4YpMSyRd
	Sz/Zp5vTdIWhRlA7swa39wtzM4LGbe0eC3jYTEUpLpya/5UIceScWOUI/BayvB73HgjLcqrj4Dc5o
	6RIXlZzITa9I2NXh08zLY5Tp2bFmwvjP95taDpNylNWRP0F38Nwz1OByqIr4DFQIVY7wiUnJ6lCE3
	almSYjLn1R+5bG8q3QUqyIk/WJ46tyvxWCNPHn1GOSX7dwSdIGDG5Ly/cdnaYdkoNRLc+ApFM1sco
	s9oZQ2ox5uqwxOLi3eTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUTxN-0001C6-LI; Wed, 05 Dec 2018 09:59:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUTxL-0001B4-NX
 for linux-riscv@lists.infradead.org; Wed, 05 Dec 2018 09:59:01 +0000
Received: from localhost (5356596B.cm-6-7b.dynamic.ziggo.nl [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 83A3620989;
 Wed,  5 Dec 2018 09:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1544003929;
 bh=zeaIt5HzIj6Fqr5d3L3HkY1hqMyG7zhVpRYaqsFl5L8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mHXQQTvO95vopuKN0O5OHz+ay1Txtvnr3jDz7Sl7YIt3bAeThXpwkEwRncgN6NBbV
 WjBAdcypeV9WzrErdmXc5XR+sij3+tR72kVRV443dos4LSK+tONxWKXnu9IpjeKomL
 oahkleBF7JqCaKTXkMJkwdmMgQJNmeweE2gjANGo=
Date: Wed, 5 Dec 2018 10:58:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH 1/3] tty/serial: Add RISC-V SBI earlycon support
Message-ID: <20181205095846.GA9847@kroah.com>
References: <20181204135507.3706-1-anup@brainfault.org>
 <20181204135507.3706-2-anup@brainfault.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181204135507.3706-2-anup@brainfault.org>
User-Agent: Mutt/1.11.0 (2018-11-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181205_015859_780034_F71DE244 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 04, 2018 at 07:25:05PM +0530, Anup Patel wrote:
> In RISC-V, the M-mode runtime firmware provide SBI calls for
> debug prints. This patch adds earlycon support using RISC-V
> SBI console calls. To enable it, just pass "earlycon=sbi" in
> kernel parameters.
> 
> Signed-off-by: Anup Patel <anup@brainfault.org>

This makes more sense to take through the riscv tree, so feel free to
add:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

to it and take it that way.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
