Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BDECAC5B0
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 18:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0CuI1rlVQNzRpoatry+T/eRNXkDuez4VamCIsX2yE4=; b=ME9iMA6nEKGyMX
	nbiD9ezURC3dcZxDVDYRJD6P+enpX+sFg6XZ3yxsx64bUWBvunE+azTxjs1G90QoCCftwkhngI6zC
	4/9h+GPt13FcAk/FENwmWsohcbYu2QTC6qRWIEIYwHZudyMzLJLzA2NVkHtZth/q4Bj5xMAHvMVGj
	WDygS3r/dmWDa6FApn2b3eOKSSA1gHJKOiYbVcZaCfxvkoebGOLIE4sYx8IkTWVATV0YJQLvWq5sk
	VIM5UOR/esc7/XDYyugr4xIvP8PMJ9oavAySIPXjUoM0i4khPNo5l/QHGf4SB3/uPdI6JFaQu3bzX
	njE3sUHFHS+4MQxeH2BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Nk5-0000000B0Tn-4AqS;
	Thu, 02 Oct 2025 18:09:25 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Nk4-0000000B0TQ-03Rj
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 18:09:25 +0000
Received: from trampoline.thunk.org (pool-173-48-113-189.bstnma.fios.verizon.net [173.48.113.189])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 592I8v8J032183
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Oct 2025 14:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1759428540; bh=azyzB4IWARU4Sm+tCHrW1KeNNkSgcOf/KRtTdLleI/8=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=MjR4iaCFRxhcC8Eov3sP97hRfzDj45cFSTQXys99vQ1hEYIN95HJG6hHD6wduuAZo
	 uFTLP/wS//CqdFc0sVvvUsqiOh40POgJLuxVOdfWCKstl0fqEu1TJB/B7FFvFaMPO2
	 cwcgl3nkOkDNcTieqNLLDmdPyaZTnEr/ngXa6ZG8RuJlTEtzXp6NObC8XmyCaw2kmw
	 NcHiVGECdGGkGKdSP741gd+Xiz7iPNc5AEFoB2eXHMQcyEg86X1BpgDdGWzukpT/gn
	 ixnC3BuP/iw6viwYsI6KI4CmteqrHKcadlx9QIu54W/supqRWxUdvC1QMOSC55qX9R
	 dobFeAUicW/kg==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 835F92E00D9; Thu, 02 Oct 2025 14:08:57 -0400 (EDT)
Date: Thu, 2 Oct 2025 14:08:57 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc1
Message-ID: <20251002180857.GA354523@mit.edu>
References: <2c804359-3d43-0fba-7173-a87f9aec4bd2@kernel.org>
 <066d70c7-b0a7-45e5-9337-17901bc95664@codethink.co.uk>
 <CAHk-=wgfpswvq0TypePyjv3dofO5YaUC_fSd_MjzY7jogCUnCg@mail.gmail.com>
 <3c9d9f92-aaf8-4d4d-a2d9-8d6a410edc30@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c9d9f92-aaf8-4d4d-a2d9-8d6a410edc30@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_110924_319248_8CB0C935 
X-CRM114-Status: GOOD (  12.78  )
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

On Thu, Oct 02, 2025 at 01:48:47PM +0100, Ben Dooks wrote:
> 
> We first tackled big-endian support on ARM32 nearly 15 years ago, and
> drawing on that experience, we saw value in doing the same work on RISC-V as
> a way for newer engineers to gain hands-on experience contributing in the
> open.

Given the cost to the Linux kernel ecosystem as a whole, is giving
newer engineers "practice" really worth it?  I'm not convinced it is.

> > RISC-V is enough of a mess with the millions of silly configuration
> > issues already. Don't make it even worse.
> 
> This feels like the price you pay for making a flexible and free ecosystem
> to build cores.

Just because the RISC-V ecosystem wants to have a flexible ecosystem
doesn't mean that Linux kernel ecosystem is obliged to be just as
flexible, no?

					- Ted

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
