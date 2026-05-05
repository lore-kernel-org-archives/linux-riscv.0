Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CFDFF885A
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 12:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Q+jUTKxWv2+4eNlLj/nAjzbJ+jt+z15qUBuxDDfD88=; b=SpuVS9wdAKMohq
	ku0uV1DXIF57+j6dmqCM02sK08Vj3LhvyeMdRtHXizyF9xrCP870MCBoAA7We7Z6QqGTJWej5YIFJ
	UU/qVINkFH3xh/pJzUnxgN2JtIV/VNUxi/JL2COxz3OBe+y6q7HnHfdclPh5+TIhYCI+glayC9sSj
	BryxtEgdHXk3GuZsvS43GJuIPZzlWyNN2L9J5igCd5CzRY7qn61b0/aSQDLUT9q6MpEAX4ABdSs2y
	gLY+nElliC9pZiiDNu2q2QdIT7qc0+fAK3DB13MYnIdOEe4bik8F/TkeCU5s/Q8h0R4A0AEFFOd7M
	PeE5/NOdIj4trhPQDp9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEYU-0000000G8Jy-0CAp;
	Tue, 05 May 2026 12:07:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEYR-0000000G8Il-1YrU
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 12:07:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2E944189D;
	Tue,  5 May 2026 12:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B22C2BCC7;
	Tue,  5 May 2026 12:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777982830;
	bh=oW/HofVwVDDCs7aU29w4wlnOuMO7mQT+FHY2O43m8As=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tdnA3CP9DcboDmLXrTZ6UuHmsSYkYq/F9IV7SO5ynR9eBf1MhiCQhnV1hL538mswT
	 JiN1nIcLCbOJ4mY9Lw/2qu56Z23xkqLTuLehVhNjxxMyLu0YdBXZWJlgMgN4FUOQdH
	 4+rb2va1huwxHEoS9OBcx20jeLgf1ncb4FGeDv2MNtAOyCFAYcVO4+EwfQ4r5WwfW6
	 nlQ3BGVXqqPnG31jMWOOfNlfT0/ziH8ZsLBiH8E2ZxrmI7WY2UIINsUNUa35lYxfiK
	 71bA7FQ9ylnxK0V+wEjMSbY4dpdg7AUjCLCmrHu9drTEXVw86JEAiVR82qdFSV4gk7
	 fScmLvIcrJ/iA==
From: Mark Brown <broonie@kernel.org>
To: Yixun Lan <dlan@kernel.org>, Alex Elder <elder@riscstar.com>, 
 Guodong Xu <guodong@riscstar.com>
Cc: linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20260505-spi-spacemit-k1-fix-overflow-v1-1-77564c2e4e86@riscstar.com>
References: <20260505-spi-spacemit-k1-fix-overflow-v1-1-77564c2e4e86@riscstar.com>
Subject: Re: [PATCH] spi: spacemit: add u64 cast to NSEC_PER_SEC to avoid
 32-bit overflow
Message-Id: <177794648818.568329.10654930281467778555.b4-ty@b4>
Date: Tue, 05 May 2026 11:01:28 +0900
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oW/HofVwVDDCs7aU29w4wlnOuMO7mQT+FHY2O43m8As=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+d1r1OyUdmuot+JUsi74qKBLVXlu6w350F1MN
 ZHSlVhFRbeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafndawAKCRAk1otyXVSH
 0G9OB/47BN6chYC+exVNUiFfISGR2RdvFG1yQe0ShvZ/KP71smIwsW8HWvmzMHhzVwjDcRUs5OW
 GAyMF2xGDphYUP6+aXbRlVgdlcqDcad8iFlYbsWMlit3ByJfKsfnSv5qcW4qa25HUAFytTC4xKD
 xzqg3Ot7c+gHFLRHMomockXGuqqidjD7bSHB/XHvMHDWYo09KOspOZ/XHTYsEVMx2ilbiCSGwYi
 d3vfLGVQHJn2fo/yzPCfC8Eq4q5DzGQGjUz4IazbdVEHX0bdoj67Uu3XoI32pVRDMro8paeB7ZI
 mErh8p3HoT7lEzX2dAup8px/E8cXbbVt+hKsjVoklPRzDQDo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_050711_438569_F3CCA563 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
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

On Tue, 05 May 2026 09:53:34 -0400, Guodong Xu wrote:
> spi: spacemit: add u64 cast to NSEC_PER_SEC to avoid 32-bit overflow

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[1/1] spi: spacemit: add u64 cast to NSEC_PER_SEC to avoid 32-bit overflow
      https://git.kernel.org/broonie/spi/c/00cef7eb08c8

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
