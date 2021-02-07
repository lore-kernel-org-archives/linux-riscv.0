Return-Path: <SRS0=UnsP=HJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA25C433DB
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 19:46:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAB3E60C3E
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 19:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAB3E60C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NQMzH8LCzW9gKkiapG6r4tNxA6i7oWr6ObhRBLcOVFA=; b=2kwnsfVEzZGIyv5WwOJ1jnq3T
	MF9rQ7U7hyK98lIRCkK6//3dMSfHcCzR1kyioryp/WB2/ZHRV7M6H/cmGATYRbWu45E4CEC1KzBUi
	RVlPYMyqzb9jy2o8liCXd/jGxu9/Em0bIuJO+DvOZ6n7BCrGhHwtpCq6LL/57vHZ3JeEdO6jhZg+j
	comer3bqfkWE9VOjg6zJsR9gd6a2G2ntetH1MPXQJTaaCV7EXNoc/WmgQgV2JqeKA2ykwde9MWhqo
	/7qjhYb4J86iuLCRt8gcCZ07x/AaGZB4Ckqel7b0IJ5EciK3LDcKQd/kyXH7t+oHg8bQxFBdzJ1SN
	kR8x81qxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8q0b-0005iv-LK; Sun, 07 Feb 2021 19:46:13 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::4])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8q0Y-0005iE-8v
 for linux-riscv@lists.infradead.org; Sun, 07 Feb 2021 19:46:12 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id D317E9200B4; Sun,  7 Feb 2021 20:46:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id CC3B09200B3;
 Sun,  7 Feb 2021 20:46:04 +0100 (CET)
Date: Sun, 7 Feb 2021 20:46:04 +0100 (CET)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Andrew Burgess <andrew.burgess@embecosm.com>
Subject: Re: [PING] Re: [PATCH] riscv: add NT_RISCV_CSR constant
In-Reply-To: <20210120153402.GA1226955@embecosm.com>
Message-ID: <alpine.DEB.2.21.2102072021330.35623@angie.orcam.me.uk>
References: <20210120153402.GA1226955@embecosm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_144610_489734_1FE95209 
X-CRM114-Status: GOOD (  11.68  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 20 Jan 2021, Andrew Burgess wrote:

> I'm not sure if this is the correct mailing list for this patch, or if
> this should be posted to a more common list for consideration?

 You might consider cc-ing <linux-arch@vger.kernel.org> and obviously LKML 
for a wider audience.  There might be too little expertise present here.

> Does anyone have any thoughts on this?  As RISC-V gains more
> extensions (like vectors) it seems inevitable that at some point we
> would need to claim a RISC-V specific number range for notes.  It
> would be super useful if we could coordinate the note numbers used by
> Linux with those used in other tools to avoid conflicts.

 FWIW, these numbers are solely for Linux use (note name "LINUX"), so I'm 
not sure how including privileged registers would be relevant here.  These 
notes reflect OS registers, which may not necessarily bijectively map to 
hardware registers.  See the NT_MIPS_FP_MODE note for a good example.

 As I say I suggest reposting your change with the lists named above cc-ed 
and making the inclusion of LKML with all submissions routine.  You might 
be able to gather more feedback there.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
