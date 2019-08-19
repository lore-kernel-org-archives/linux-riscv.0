Return-Path: <SRS0=iyEb=WP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 859D6C3A59D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2019 10:53:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5702720844
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2019 10:53:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VE0A2tCn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5702720844
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=45FWlpSpYA80dK9QRk+1bu5G3f5uS3lYpPn/5AzDAT0=; b=VE0A2tCnUcYsRR
	crHYY9ZtLlMwVzn5TNFMTRjxvU3UaG/0XqQdi9M9BDBKMolwrvlXZ5FmYWrPcgqPQRSUsXsSmYGJ5
	0GgpC9QJKv+8GlupmQqbtOXvmv+72Qh5aV/pOPVWTgL0mwh1wE2jumOpKfycEt1rDdctzJtL7m3YU
	7cW7oohQpYyL4/v5+i/2luJMY7Ocz826CMsTrUpiQWettBJQpaHWJBwDkjiwYtvlljZ/jvqoRcZr4
	nLEz2c3TccTaOd8a4mwyyncB5pL3aOBXwDCWNlAE09laYrsHCjr9OgaLlJMycuASayrRjZsRWfeVf
	ibOe7XZCVdwtk5SCv/6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzfI2-0007hZ-A1; Mon, 19 Aug 2019 10:53:30 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzfHy-0007hE-Ld
 for linux-riscv@lists.infradead.org; Mon, 19 Aug 2019 10:53:28 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2C286B647;
 Mon, 19 Aug 2019 10:53:23 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: Random memory corruption with v5.2
References: <mvm8sshcdwc.fsf@suse.de>
 <CAEn-LTpM-0TMxkNNh6nnLH9Bnr9Zm+VFLf=z1y9sER6RXrQooQ@mail.gmail.com>
 <mvm1ry8au3f.fsf@suse.de>
 <a47ede7577580987feb279d9879a994786a65d1a.camel@wdc.com>
X-Yow: I smell a RANCID CORN DOG!
Date: Mon, 19 Aug 2019 12:53:22 +0200
In-Reply-To: <a47ede7577580987feb279d9879a994786a65d1a.camel@wdc.com> (Atish
 Patra's message of "Thu, 15 Aug 2019 20:52:43 +0000")
Message-ID: <mvmtvadzasd.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190819_035326_857901_F43870AF 
X-CRM114-Status: UNSURE (   6.51  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "david.abdurachmanov@gmail.com" <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Aug 15 2019, Atish Patra <Atish.Patra@wdc.com> wrote:

> Linux kernel:
> http://lists.infradead.org/pipermail/linux-riscv/2019-August/005889.html

I've been using that patch, without any changes to openSBI, to run
bootstrap/regtest on gcc and to build glibc without issues.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
