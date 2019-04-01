Return-Path: <SRS0=Hus7=SD=lists.infradead.org=mailman-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25C2C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2019 12:02:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 800202086C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2019 12:02:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QoYsVxf1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 800202086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=mailman-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Id:Date:Message-ID:
	To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5qYPsI9osmMH/1ze6ONthAUy/xCN0XF0AK3qPeWg2TI=; b=QoYsVxf1ukSwYRYCwYEKZPKX+U
	kewF28c82FyuCagdlSWLSUA3VC72rOx7+OLXmrqmqI/oaZcHG8j+qA9GV/ktDF7JHvkBpa3fgqgKE
	RLEwvalkEqRFLozoW/42JlMChdqAmX90G6GDrKyB2KwMymdNW5/0GqKLviT9WBFQ2WzizovSOtGGn
	NeFsbxapadzRkDA5WtamYH6v/O1rqaZ0vi9Uw5XAYZcGEwHTjCSA0z47OsvVadVee3o4ZQjvDuSRP
	P5IqpgbGzUysZv23uuv7wBVsRgl3UZ5KUWHM5MwIamtc4ko0NGHGVLaOL4sMmRhC3WoEIyXiRrYrs
	gENlndlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAve1-00084Y-Qc
	for infradead-linux-riscv@archiver.kernel.org; Mon, 01 Apr 2019 12:02:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: lists.infradead.org mailing list memberships reminder
From: mailman-owner@lists.infradead.org
To: infradead-linux-riscv@archiver.kernel.org
X-No-Archive: yes
Auto-Submitted: auto-generated
Message-ID: <mailman.1643.1554120027.18266.mailman@lists.infradead.org>
Date: Mon, 01 Apr 2019 05:00:27 -0700
Precedence: bulk
X-BeenThere: mailman@lists.infradead.org
X-Mailman-Version: 2.1.21
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
