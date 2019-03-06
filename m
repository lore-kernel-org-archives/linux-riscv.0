Return-Path: <SRS0=iCzv=RJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11948C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2019 11:08:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D160320675
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2019 11:08:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QLDSPSBA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D160320675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BScANOGACv5UH5e/GTKuelhnaj7ZYYUQEMjrY7wCTLc=; b=QLDSPSBAsrGvaJ
	4y41owBac2aYWTCkQ7j1kshHVyZPlA6lE/+CwCBxy851B1oJzVKwgGZSnZSPau705o3CdiHOIcKIi
	1yVLHrP3KESvKRYD5ChS0GGxT0ym5wgrLdu7KhQuB4T+0mt7GA0wI36qXHtSFSxFC4KdW1ehQBlBT
	BGIuNn2hNC93nB2gzNTB6M87CjJOua47XDTHSakLz7bTtwbvDDx8MmwDAoENZsI8GB/+XkiuMkTg1
	iPMW/saQ9VRXj2nrCVdeO/DP10507w0muDO2Jj+6JziFMp9MAbHLJBPzoJAUvHNz194BMlhtny/lj
	62BjznMwpFy+ClobYnBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1UPM-0005ra-SM; Wed, 06 Mar 2019 11:08:20 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1UPI-0005qo-CI
 for linux-riscv@lists.infradead.org; Wed, 06 Mar 2019 11:08:19 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 06D25B9BB;
 Wed,  6 Mar 2019 11:08:12 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v3 0/2] tty: serial: add DT bindings and serial driver for
 the SiFive FU540 UART
References: <20181020101045.15991-1-paul.walmsley@sifive.com>
X-Yow: I've got an IDEA!!  Why don't I STARE at you so HARD,
 you forget your SOCIAL SECURITY NUMBER!!
Date: Wed, 06 Mar 2019 12:08:12 +0100
In-Reply-To: <20181020101045.15991-1-paul.walmsley@sifive.com> (Paul
 Walmsley's message of "Sat, 20 Oct 2018 03:10:44 -0700")
Message-ID: <mvmr2bkxntv.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190306_030816_558005_8457441E 
X-CRM114-Status: UNSURE (   7.09  )
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
Cc: devicetree@vger.kernel.org, Wesley Terpstra <wesley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Trying to log in on the serial console causes the system to freeze.  The
last message is:

[  115.597858] sifive-serial 10010000.serial: BRKINT/PARMRK flag not supported

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
