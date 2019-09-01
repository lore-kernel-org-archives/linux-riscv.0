Return-Path: <SRS0=GOKf=W4=lists.infradead.org=mailman-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35144C3A5A4
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  1 Sep 2019 12:06:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 001692190F
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  1 Sep 2019 12:06:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oM1+IAud"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 001692190F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=mailman-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Id:Date:Message-ID:
	To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5qYPsI9osmMH/1ze6ONthAUy/xCN0XF0AK3qPeWg2TI=; b=oM1+IAudcClxUi21NWEnAEHGMP
	jJHSeHKPJfspwDD1GhIaMARx8X8qOL+mfcC1V1ZMtkSz6XiPWuFSVHaWb0a+ket0bUBI57rcp60Ub
	HpaRMeb9aOFrzZX2QBKnfFRY2mycyMtmieSE5pTW/wgnag9b1iBh06nFp4u2C5BukViGN++pxf1xP
	h4UlEv4sc0pypMhpOSeG7CEpPMQr9CC5bFrqa9z37HgAbun/FYDf7gpXXHVG3NC9g5fHWP3CORQVp
	sk1Up1X9zxVXFej7QWrMVFTTU7TwP/MsnvRaS8KxPVdOFddT4SOr7Tzrag7rX4SrooRn4LmZuFVtx
	oKX9IwXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4Ocy-0000kE-IJ
	for infradead-linux-riscv@archiver.kernel.org; Sun, 01 Sep 2019 12:06:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: lists.infradead.org mailing list memberships reminder
From: mailman-owner@lists.infradead.org
To: infradead-linux-riscv@archiver.kernel.org
X-No-Archive: yes
Auto-Submitted: auto-generated
Message-ID: <mailman.3407.1567339282.9145.mailman@lists.infradead.org>
Date: Sun, 01 Sep 2019 05:01:22 -0700
Precedence: bulk
X-BeenThere: mailman@lists.infradead.org
X-Mailman-Version: 2.1.29
List-Id: <mailman.lists.infradead.org>
X-List-Administrivia: yes
Sender: "Mailman" <mailman-bounces@lists.infradead.org>
Errors-To: mailman-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This is a reminder, sent out once a month, about your
lists.infradead.org mailing list memberships.  It includes your
subscription info and how to use it to change it or unsubscribe from a
list.

You can visit the URLs to change your membership status or
configuration, including unsubscribing, setting digest-style delivery
or disabling delivery altogether (e.g., for a vacation), and so on.

In addition to the URL interfaces, you can also use email to make such
changes.  For more info, send a message to the '-request' address of
the list (for example, mailman-request@lists.infradead.org) containing
just the word 'help' in the message body, and an email message will be
sent to you with instructions.

If you have questions, problems, comments, etc, send them to
mailman-owner@lists.infradead.org.  Thanks!

Passwords for infradead-linux-riscv@archiver.kernel.org:

List                                     Password // URL
----                                     --------  
linux-riscv@lists.infradead.org          xuowetub  
http://lists.infradead.org/mailman/options/linux-riscv/infradead-linux-riscv%40archiver.kernel.org
