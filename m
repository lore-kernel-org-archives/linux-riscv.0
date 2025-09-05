Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0AACA1013
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Sep 2025 00:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wwWSIBdVty0eC9Q/S9+ZMuhvhZahQy3rM4eCCt+lVpQ=; b=WazbgIhHnz0wLt
	2Wf25oq4PsmUmOhO17xYLwvWrgtvcs6kKXzsienTDHD2J1LU+sV/EzjR0xUcwLNexwnUWChpoE3bK
	vJ11B+6YGl8W3G0gpsc6Yfzk7gZeuoFc/f8YvQrq15cYUCZNYlrzBjGwN2AZJVIABIYXf4sUY2cr1
	0U+f678kp5N6UbaUsiLjZl21uOScE1+r22O1chrwsVh6qc+D9FyBIrL6af5jOBpDUc0catQpd0T8U
	Qi4Bj1tdaW7lIy+9q6yrMKRKsXcoql4RgDmqEJ42TxnA1yU3RfZaIIsaGRjqsYmvJGZWHGb05t4gY
	jOmD+SdnvcMIGr3GSmAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugZJ-00000005YIn-06f1;
	Sat, 06 Sep 2025 00:14:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuez2-000000051Wx-025B
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 22:32:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E766601AA;
	Fri,  5 Sep 2025 22:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27E2C4CEF1;
	Fri,  5 Sep 2025 22:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757111527;
	bh=6FrtTxPEN52lzkFvK+3bnvv4NDllAZgpLegwqgfZQBs=;
	h=Date:From:To:cc:Subject:From;
	b=ghAESxcfe9NYbz7DG85weYilhRu157seaUAfdEUpcCSiyD6LhEb+lWS6p33AuqEsF
	 PYhaVeXvLqoMPhhaf2QI5T6JNGZgL1ulRUbOVUAyyBvVZF6bPUjgog1MiljOBE4pJ0
	 VMUQhlw0ednQ9BUBnln7TvVF6NvphwnEgOWeKdFD7sElV615DBv6hTxUVv7MhHEbqM
	 wdx2JDI/jkkpXGZ1UrzUvfQ1zUmLbcM0OOIlQkjUYmlSfzV5mMsBVCnfp6Sywc6N0P
	 s2/d/xblDeJ5imMcPF7pQDAC7F/pswnM03W073UXsHCe1BirdXtNi+jfq9fDs5yFpN
	 /ghEtRWBGz6bg==
Date: Fri, 5 Sep 2025 16:32:01 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org
cc: palmer@dabbelt.com, alex@ghiti.fr
Subject: Helping out with arch/riscv maintenance 
Message-ID: <4620eefc-8304-85a5-5a89-dcc6610edbfb@kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


Hi folks,

At Palmer's request, I'll be helping out with arch/riscv maintenance for a 
little while.  Palmer's been doing a great job, and I'm sure I won't be 
able to do as good of a job as he's been doing.  Let's see if we can keep 
things moving smartly in the interim.

As you may have seen, a fixes PR was just sent to Linus.  Many of the 
patches were initially collected by Alex Ghiti, and I borrowed some of his 
curation work for that branch - thanks very much, Alex.  Will plan to send 
at least one more set of fixes to Linus before the merge window.

Some of my local kernel maintenance infrastructure is a bit out of date.  
I'll be cleaning that up over the next few weeks.  Thanks for your 
patience while that gets updated.


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
