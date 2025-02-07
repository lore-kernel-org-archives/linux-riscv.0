Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA94C02194
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 11:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V1FWzbY/PoAx12PBqhRu65ojRfB2borW+DHe309ZLd8=; b=Rbo9ZpsFk5JEpp
	ZROLeQ69eXGoBD1Np06wLDIBJC8ks8q0ITT2YdJJm2dj7XI4ct+qcKMmtgBtzCx1kEAZ2TagYJ35i
	mf/e2Hr4aGKzuPvxpTP+1knBXdCVHRteKIpUPnwBGz5tKa1cJ7tuymGXE5W5tyiPne7ojh0oAe7wN
	d/j88LFqEASSHXCvVNmtxKeaG4wW1H3csOrk5h03tjCvs1gDe7z+CsYolH+9JWZZeYhbbfQ7Bva91
	5vvlrOLF014pZCnSrrYyvT35UZnZd6XoSCzhdiIHIeGLe9rCtnGf7DXnYHj5MIs56JKBZK4/5k5om
	NLG4AzYiVviaK1EzmNqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgMOX-00000009KQM-3dGs;
	Fri, 07 Feb 2025 11:19:37 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgMOV-00000009KPI-108b
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 11:19:36 +0000
Received: from localhost.localdomain (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 33AAC33FEF1;
	Fri, 07 Feb 2025 11:19:27 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH] MAINTAINERS: spacemit: update various info
Date: Fri,  7 Feb 2025 19:19:10 +0800
Message-ID: <173892684286.8747.5832912324248040390.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org>
References: <20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_031935_296636_087C1E28 
X-CRM114-Status: UNSURE (   8.28  )
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
Cc: Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, Alex Elder <elder@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Tue, 28 Jan 2025 12:22:52 +0800, Yixun Lan wrote:
> Add a wiki page to track status of mainline effort, add a dedicated
> mailing list which can reduce the email's CC list a bit, the irc
> channel should be useful for people to communicate.
> 
> 

Thanks, Applied to SpacemiT's SoC tree:
 https://github.com/spacemit-com/linux/ (for-next)

[1/1] MAINTAINERS: spacemit: update various info
      https://github.com/spacemit-com/linux/commit/4a0c4e723c94172ae10cd6492a8a35f9aaae7163

The for-next branch will be sent via a formal Pull Request to
the Linux SoC maintainers for inclusion in next merge window.

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
