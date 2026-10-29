Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA04606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 22:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1fAfrrDC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SjNHVtZM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2eaaMCqdQJtkTXnVUY0io2II9DcVNXtQpxdp+eIjzQ4=; b=1fAfrrDCt7w2d+U2SVbXW2SpDU
	9JufCZy2oMNaOvk405EP5n1It07vDxXjHYH+r4q3irrcAKXNuOFJ5WnXpj6AZ7mKRyYJ8Ge544XiM
	sQKsnxmoBhIVCuCJs674oW7b/+MM5Vv1sKty38Ol/EPFZakETx/qsBStj25RGMkf1i8mLDZ/NTmTX
	FWu/C+aRnuz9pGh01UftS2CFEIUp494OuwmTIYVKtN/6kdntUOhaBknPGHe6yt+Rt1MnJh0T3tOON
	pYSMy56zGcjy58UgB/q4HPA5bWtWyEMtycZ43cqo2Il7tdkDTS8Og/F42kjRwK0phLwVKghhsRwCo
	cdFC+8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYsp-0000000AUlY-08OC;
	Thu, 29 Oct 2026 22:46:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYsl-0000000AUlI-2C4q
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 22:46:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A8E6142484;
	Thu, 29 Oct 2026 22:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF4D1F01816;
	Thu, 29 Oct 2026 22:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793313962;
	bh=l2+cNjQ5KGeOolXRC1roOqIk3m2TZLZEQd8mGc6BiX8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=SjNHVtZMc3O3hrFPHqnCPFHvuKJUR3t/uksDTfgzawCAGoHjBKSnmVeAcWplMyiUg
	 SW5TRtRlisvikRKO7kEa7UPDxheP3cFkgwDxZXPcgwf+L8ZLzyumb+Q6PjSZsJEth8
	 3EKZroHiC0M2wk4wuVK3MM5O+fp46RuBSXtgNPeJuXyP92nrAfwQzh7rQKi+KoCkTU
	 pN7rZhRflaX6q4TiwTpOkeXr+CjPIIYEIYRCBiR5CkhfAb0hX8ohH6mHY+QZIUBgzw
	 pRORyquHTwV6vhXYtc8t/ZyQvpMEZ2svxIV4dbt2JL7gOpLcxgzxcOs75oGb+o1n2X
	 tEchI6Pot/UGg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7ED0F38007D2;
	Thu, 29 Oct 2026 22:46:02 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <7cd0fc49-0592-2030-17bc-83edd5003817@kernel.org>
References: <7cd0fc49-0592-2030-17bc-83edd5003817@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <7cd0fc49-0592-2030-17bc-83edd5003817@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.4-mw1
X-PR-Tracked-Commit-Id: a5ae1bf65cee84bcc121d659e7e22a767853f5f5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1b8b67503725fa6deb3a4f00ea61f982bd00c152
Message-Id: <179331396117.734384.10042062120285869563.pr-tracker-bot@kernel.org>
Date: Thu, 29 Oct 2026 22:46:01 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The pull request you sent on Wed, 28 Oct 2026 21:32:56 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.4-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1b8b67503725fa6deb3a4f00ea61f982bd00c152

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
