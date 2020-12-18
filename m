Return-Path: <SRS0=XAcR=FW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73603C4361B
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Dec 2020 19:10:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AEF223B86
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Dec 2020 19:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AEF223B86
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGuHaPw+jMdYAOk5orOwkVKCuwRZTNOewa90kGCrZ6Y=; b=WJx+QSwg2BdbsRzmqHzTMAyyRp
	0/eNXM+InK4oxLP+k6j3yEeLMjnsHIBZd5ercTSeIcAh3H5bl0vMPV4grWY3kN0h6zI9dD9CMIWFn
	C6qCaUXQsDROkgfOvcVw3O4oH3IjOr7BFyLNo7YCTsrjP+uU8FrHzY6ECT7aOzHen/Y0xsmZPUHFA
	YH2sk1WjLohz52WoYEQ3FMkgy9UNTgdYmQ7PDNPcOxgScMiR0J/vl2S3kU+95TTkDfo3Aw0lp1R2t
	Q/PTUCCAdnnsEPQaUbEh9swgy5TMqQ4oyZDsGJaW56NCu06VW8qjnQY6fAc2YmcPf/uc83MSACtE3
	GYpn1Q+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqL9H-0004ry-BW; Fri, 18 Dec 2020 19:10:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqL9E-0004rX-JX
 for linux-riscv@lists.infradead.org; Fri, 18 Dec 2020 19:10:41 +0000
Subject: Re: [GIT PULL] RISC-V Patches for the 5.11 Merge Window, Part 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608318639;
 bh=HHjqFizdZpjgkWrzLkZbiFgqfTZmzHzCGLToJgYSaD4=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=ca94pmBZcnUytQExMAn4yoXqDY/wuVspvi1WK6m8g8AHzSnytPU7EvX3Wnyufl9RS
 owidJ8CyfUKEkj9LtyKGLWEvyCwqQfVGUDBKW7gI/yo/TWDkkO/xdOqkSXjXM13Iiz
 rarxgQqNrS33bjjLb94bZf5HzEbZGB+06VSkcjrUsPiQgeUoXpotNQ6OBST1+8mGTk
 QMhOaYpocd48FrmHszWBIMyJ7YciUHqlQjSNOKMD9muhS06urz2DLRU75mXtKxBMTK
 ArjWhHCsah3YlkKXRE8DlOldYIAzA6aJhc2PI8+byML+5KaliTRb4NgdF2+sx9t+dl
 qpP+n5w+Glt4w==
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-9bb2f707-7aac-4141-8e3b-edc1b463fcd6@palmerdabbelt-glaptop>
References: <mhng-9bb2f707-7aac-4141-8e3b-edc1b463fcd6@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-9bb2f707-7aac-4141-8e3b-edc1b463fcd6@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.11-mw0
X-PR-Tracked-Commit-Id: 7d95a88f9254b711a3a95106fc73f6a3a9866a40
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e2ae634014d3a8839a99f8897b3f6346a133a33b
Message-Id: <160831863914.5982.8524807332166745328.pr-tracker-bot@kernel.org>
Date: Fri, 18 Dec 2020 19:10:39 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_141040_715521_092D43BA 
X-CRM114-Status: UNSURE (   3.32  )
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
Cc: linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Thu, 17 Dec 2020 19:10:50 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.11-mw0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e2ae634014d3a8839a99f8897b3f6346a133a33b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
