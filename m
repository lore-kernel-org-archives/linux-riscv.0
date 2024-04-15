Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29A4C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 08:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z/zPbP+ZN3r08t/h1RM6U3AZ1VUtr4BGofg2NS1Pxic=; b=q7wgzQSvaKMk1p
	F3Bz2gHPjDtP62sYRpN93724jRMIVXfKRD9Ha1Kpy+K+dvQ/4rDhVXW1ifuli/Q6VNXB6cpYTdjb9
	XgC3xaa20WkMFNsLgdEjoMnSUO6ZNG9q56D8TVe4/0drOEK5Lyg18bDT0RZJwWaZvEFmzXB2a4ADk
	m94IA5tCUIBCKyaNHGaHfyaCRC/V2MB7dO0UEjxH8pwlodos6SQug54w0ROPVeYl+d98scIc5VUpv
	i8YUn+9/L2J+wZp4GQJUsgCQ0OoJTHx5dUGHLJVVqQYeH1uAiiJ/epyCaa4cBPbw9jp/FGoLk8Z5j
	ZqJ1sbbeF7oz17pOowkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHSD-00000007UBr-0pFx;
	Mon, 15 Apr 2024 08:12:41 +0000
Received: from mail.explorepulse.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHS9-00000007U89-0ohq
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 08:12:39 +0000
Received: by mail.explorepulse.pl (Postfix, from userid 1002)
	id 2EB8B24D1A; Mon, 15 Apr 2024 10:11:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=explorepulse.pl;
	s=mail; t=1713168751;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=QRf7Fj3xleMyn79HXG27pHFYZtg1DHbdaOz5gMxQjVXTjzpPL/c/IHh4CRn3zy760
	 0nnZ4vXztsdBucV9VTSoDu8qfGXliOk6sN88n8Z98ng3jcPhDSRjtlnquiA/DOCcSn
	 03/PoO+3OPGyuJFddaP3ZZ1fGYnSBVby+6GHQi9qtA/Xsx0kn7CyaYVx0f9x/eogSj
	 sTAmDjb86fRuxAyrEpnPMMMwGmKc+ij7tkiEiFbPM+Fsq0CktC5JfU64A/fQ7w69IA
	 +o43xdiZeeRKKovDEV5g4WCBeNCAvF/v40w38FvIbvmels5iiLcDLU3rb/B7ZvbVUY
	 paiFf9Gy2Fz2A==
Received: by mail.explorepulse.pl for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 08:11:12 GMT
Message-ID: <20240415084500-0.1.am.jm69.0.5qd54afkc4@explorepulse.pl>
Date: Mon, 15 Apr 2024 08:11:12 GMT
From: "Marcin Gard" <marcin.grad@explorepulse.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.explorepulse.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_011237_951083_60374DE0 
X-CRM114-Status: UNSURE (   0.01  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbSBzZXJkZWN6bmllCk1hcmNpbiBHYXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
