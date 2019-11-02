Return-Path: <SRS0=JPPY=Y2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4404CA9ECF
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2019 00:25:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9D38208E3
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2019 00:25:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BnOnR0vE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzusSL9B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9D38208E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZOPj9pIjD99Pns3iDUI8/fShBydo6l3YiN/ITUiA8l0=; b=BnOnR0vE8YVuib
	T9I4ovM1LHp7MLLE7Yg8gDnf1RcsetSH8SsR4/i9h9EgZH1RDYJhw+QJXKvTFqVCpp5Z2YCF0nvK0
	8diRWPbcgct75PjOFOZ+qsXqUITjzdSMn6QCKiVS7mMeU2LIqNV21BKnvwmYi6oHtT4IkuLphevTp
	kmwGau/C6TNrRwHBOsB7i/EHmX6aVa1V5Qo1PXtp8OyPfWPfszcONrkKS+P5GzcWn4oI6vkxjQFby
	V7ZkZYDpvaMyw3oCqIyMzN5LKGts1ITv57+BgqsDc2ksZrmZmCR5BYIi7HOnXTbi+s4OrU8les+VX
	72mS+7hzVKy5zg7vkagQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQhE4-000850-II; Sat, 02 Nov 2019 00:25:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQhE1-0007Zv-Nc
 for linux-riscv@lists.infradead.org; Sat, 02 Nov 2019 00:25:07 +0000
Subject: Re: [GIT PULL] RISC-V updates for v5.4-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572654305;
 bh=rtAbQmYG1g57RZPGwAl6aXJA/mCq5GppXcLSxLzbGqM=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=IzusSL9BViZswqm8g/Ec0jDdXkP067plgtjoOZ3LNphTL/jpNA/HFDnB9RJrOqFV4
 eQWePFTHbpTBXMBrYdCdh3zHkld+cjMa9WzDnlAsyO5E02bz5N8zm4bJx31cKjSdPj
 2S8EgzQYORfqWooAtzCuG/GzmTrRF0ZznJhuTo9w=
From: pr-tracker-bot@kernel.org
In-Reply-To: <alpine.DEB.2.21.9999.1911011707090.16921@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1911011707090.16921@viisi.sifive.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <alpine.DEB.2.21.9999.1911011707090.16921@viisi.sifive.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv/for-v5.4-rc6
X-PR-Tracked-Commit-Id: 1d9b0b66c3ef03e42db63068e1a4e7250992e2b1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e5897c7d2e6507ac2423455bada21c8a6b005db6
Message-Id: <157265430498.28513.2104609031890890050.pr-tracker-bot@kernel.org>
Date: Sat, 02 Nov 2019 00:25:04 +0000
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191101_172505_812359_16F6CB91 
X-CRM114-Status: UNSURE (   0.80  )
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
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 1 Nov 2019 17:10:16 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.4-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e5897c7d2e6507ac2423455bada21c8a6b005db6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
