Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC283CCFA0D
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 10:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ldfuT7Aw45b9exIRJmAZw+ml2rnclHSgOME2chkzXjk=; b=Vb6PUUi3D+wiCc
	/+AAG7yjh7FsNzfc6+6I2jeLjNozCww6mnBKnAZdyib/c3cOUxcLSMMxawPJix9tiwEOIE7fqeQem
	1XnzM+BQ8HmWKzvbmzAXw4H1GsW9vqDRYn7YuMZApXnmO2MUmodWfAbb6qBwXMkInMg48fKWS4HDD
	Qfg9jUMyhjk6nNa1FVHde30Mas8zZZwTphgdLlF5ZQWAx3w0RPABOjApnTgYTQgl0PJmhD6Y7RWo0
	TH8dGGTnRYDNkyK57O3sdYol90UstcRnAGwAqZKnF6LnZEPiyeOqKiRBfanKe4viUOmGsQTW1PiT8
	4nZ94UG4X7ttmW2Jmg/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGb33-0000000DVIw-0fU7;
	Wed, 05 Nov 2025 10:47:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGb30-0000000DVIW-3CYB
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 10:47:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD9F944527
	for <linux-riscv@lists.infradead.org>; Wed,  5 Nov 2025 10:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7082FC4CEFB
	for <linux-riscv@lists.infradead.org>; Wed,  5 Nov 2025 10:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762339645;
	bh=A49HjhUzPIsjStNWxlIczfpc45kiKt4gtCHUV/WO7Z0=;
	h=Date:From:To:Subject:From;
	b=XQ4BHQi7Jj3a3nQSxx50CDfmLueunZmMY5XaSqyFACKfZoLoR5FZ+omsjtvSaMwlh
	 3XPGSlDxyE6C1LVYjv8DaDnzSeGmWMW0C+hyLuIPvJ2No8Oi4aA5XDTXyKQmykWR2J
	 R8xJ8CeO4QFihYk/eZbwsrHNRXHc30EvZBdYWPqKZLgqmy1B+amFY3FPfAq/HAL61/
	 zPrQDqxZODmO2Pxt0d6BYg3Sn/rVBarAyCYcpMjoB+f/18Qo/NxhukfCGeVLtESbr5
	 +Py/8TqlF9QNIKCL73+lKdBKvGJ44cXDpRl/jsBDdH+NPfe8XIhMMGH84elKqusQ+8
	 09G3prbvoM4WA==
Date: Wed, 5 Nov 2025 03:47:14 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: RISC-V experimental branch updated (tag:
 riscv-experimental-for-v6.19-2025110501)
Message-ID: <8637881e-183e-940a-27a6-c3dc27d2df20@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_024726_848824_9CD314FA 
X-CRM114-Status: GOOD (  11.81  )
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

Folks,

As I've mentioned to several people on the list, I'd like to try to find a 
way to encourage early testing of patch series targeted for the next merge 
window that are under local review and testing here, but which are not yet 
ready to be pushed to the riscv/for-next branch.  As a community, we're 
missing quite a bit of public testing, especially on hardware or 
emulators.

Towards that end, I've started pushing up experimental branches to the 
pjw/riscv.git tree representing various patch series.  I've also merged 
many of those together in the experimental/merged branch.  Like all of 
these experimental branches, this 'merged' branch is unstable and will 
change often, and without warning:

   https://git.kernel.org/pub/scm/linux/kernel/git/pjw/riscv.git/log/?h=experimental/merged

To create collective reference points, I'm also creating tags from this 
experimental/merged branch.  The tags should not change once pushed.  
There's an initial one here:

   https://git.kernel.org/pub/scm/linux/kernel/git/pjw/riscv.git/tag/?h=riscv-experimental-for-v6.19-2025110501

For those of you that have automated test systems, it'd be appreciated if 
you could kick off test jobs using these tags, and to post the test 
results on the list, along with a short description of what was tested, 
and on what platforms.  That will help us build confidence in these patch 
series before we add them to for-next.

Of course, testing for-next is important also.  The intention here is 
simply to increase our collective confidence level in what we're planning 
to push to riscv/for-next in the future.

I expect there may be a few bugs in this process, so please bear with us.  
Let's see if this helps.


- Paul


The tag "riscv-experimental-for-v6.19-2025110501" contains patches from:

- experimental/hotplug-parallel	
- experimental/sse-v8
- experimental/zicbop-v3
- experimental/vector-ptrace-fixes-v3
- experimental/svrsw60t59b-v14
- experimental/has-extension-likely-v4
- experimental/clean-up-pgtable-h


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
