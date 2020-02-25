Return-Path: <SRS0=Ue47=4N=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A70C35E01
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2020 18:55:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D79F21927
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2020 18:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dBg8iL3U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oslJEC+V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D79F21927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qaKxTJ4dct+x/wLg5R2mJmgU0pHbiAqEWB1guvDI5WE=; b=dBg8iL3U96xJz2yOyl6QgSse2
	zUMJWS19+KJNcosksuOAuDJOsYpaiwHDAyIBfDKPcq75+iqid8LdG+74T6ocBcA57IeS9e0J24Mvk
	Yo2YNenjJJqAI3UN0xJQeDebgmndNS/scIhhxr73JmbViSrOfDMVz+sBDsfbebuLKLar2rjzQaf60
	+E4ZBO019ZYbRtetpec1a4arKuwXNCBPlGrNUH55TbPquFfrJiDIqIZ2V4q5AtOywskoNGSlw6RZN
	67JDgzrBlutfJNktcaMFMSOlg0TT9qK5+ievRNPQsgtdogINU458nd9mjFTXsuqIrCW+bIqbwZMyM
	Z2q5b5iPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6fMP-0001vp-9x; Tue, 25 Feb 2020 18:55:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6fMM-0001jp-L7
 for linux-riscv@lists.infradead.org; Tue, 25 Feb 2020 18:55:12 +0000
Subject: Re: [GIT PULL] RISC-V Fixes for 5.6-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582656909;
 bh=5TE2/XcIDrM1ynnHbz3LDakd34ty94tFlreoyNAhvOs=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=oslJEC+Vq62ItqEX1IMEEn3ltSMkgn59tAuDuJrmNHAbSMMUUZ057T8FPzEu7FEHd
 LK5+q1YR2aGSwK0ahFe94HIXRLsI57GAX46DN6xObMjjyW97oXLMKMPLhjHATTTCSs
 KbbkWnCMoG7eSm9uF7iQIoyJFH2I2sARzqxmhOV4=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-464e74b9-125c-42e3-9384-60c871d22cfd@palmerdabbelt-glaptop1>
References: <mhng-464e74b9-125c-42e3-9384-60c871d22cfd@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-464e74b9-125c-42e3-9384-60c871d22cfd@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linux-5.6-rc4
X-PR-Tracked-Commit-Id: 8458ca147c204e7db124e8baa8fede219006e80d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c5f86891185c408b2241ba9a82ae8622d8386aff
Message-Id: <158265690948.32229.44686078603210503.pr-tracker-bot@kernel.org>
Date: Tue, 25 Feb 2020 18:55:09 +0000
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_105510_735681_59FEA04A 
X-CRM114-Status: UNSURE (   1.02  )
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
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Tue, 25 Feb 2020 09:37:31 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linux-5.6-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c5f86891185c408b2241ba9a82ae8622d8386aff

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

