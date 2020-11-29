Return-Path: <SRS0=QNeR=FD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423AEC63777
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Nov 2020 00:31:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76991208CA
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Nov 2020 00:31:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZtWBKqez";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDMY+ZZc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76991208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Un5pRhgsAfvEmMqGTjYdPQcYf8XuvZaWynem+Fuvzsw=; b=ZtWBKqezdTr/Cz+MQU6kAs4gmd
	md9o7gHzQTdrPchUVhYqoVCUVht0k0N7jNrxskyOBDhx5bsjVkz0PEYphLsSP5g9oCKN7Bv1ARujB
	LP1gnsOozeI4HfMhxXPw/4WaCCouVI+qDfSxiCtwCUveeV/IDumrz7kIiTmkiRr3YieKNGMa3RPwo
	tp3LBC/sP2C9BTihGJfzoEEjQQzb0AEpuebqGyjAql78hB8b69RIwSuVaVvZHnArfAFQNhhKReW94
	Ha8mr7/hUVxiIlgZBSBduY9YRJ6trWWn7MLIR6hpcuADF/XLUzyrXwDNAtMSFBDMpsTPg2gLRF4IO
	QvtiZ6Ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjAcT-0006zf-5K; Sun, 29 Nov 2020 00:31:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjAcO-0006zH-Vy
 for linux-riscv@lists.infradead.org; Sun, 29 Nov 2020 00:31:11 +0000
Subject: Re: [GIT PULL] RISC-V Fixes for 5.10-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606609865;
 bh=hgqkBHR4Xun9tcO+P6FZaN+z5+ES2O2FSjik8VIpQXM=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=UDMY+ZZcxSJZVDHA6BkuTQ9S14y/dFsjhjopSqpeNByyZ3b+XAB262voLoSAsyVl9
 NieGX5LGmosgA8r9JZv9h81xM9+6wlFAQeIXSQ7S+vlk6uC6XLnc9V8+zvVGeLi2sg
 O5iHDkj1nOOm0D27xXIeGbbqgsyF0G6cmbxdKZL0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-a86b7c3c-7719-48e7-b6b3-5d7ec6b8933d@palmerdabbelt-glaptop1>
References: <mhng-a86b7c3c-7719-48e7-b6b3-5d7ec6b8933d@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-a86b7c3c-7719-48e7-b6b3-5d7ec6b8933d@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.10-rc6
X-PR-Tracked-Commit-Id: 30aca1bacb398dec6c1ed5eeca33f355bd7b6203
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aae5ab854e38151e69f261dbf0e3b7e396403178
Message-Id: <160660986567.2144.11136173652409993464.pr-tracker-bot@kernel.org>
Date: Sun, 29 Nov 2020 00:31:05 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_193109_211990_C6575306 
X-CRM114-Status: UNSURE (   3.69  )
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

The pull request you sent on Sat, 28 Nov 2020 15:00:47 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.10-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aae5ab854e38151e69f261dbf0e3b7e396403178

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
