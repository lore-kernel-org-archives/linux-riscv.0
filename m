Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71ECC25B77
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 08:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z/zPbP+ZN3r08t/h1RM6U3AZ1VUtr4BGofg2NS1Pxic=; b=P83fwvKkFzLnTv
	p6YgunD0aBIyFF/9Y+Ec7wSYMeUdsF+9mz0u73u058TpnqWQrKkGcYix3T6L1zGX/r3xw617hldCA
	leQgRWsnA1kaV/DiaZoixa1eiIRKga+YY/uRBIje/TRh8bXiXfrO5nkiYcoWr6MD7gQAvZapfXZCN
	X/+8blajdfFdUdsFliA1Oq8ba8T7geI2seY9Q6Fyy96kSY+3jdZ/oieCs9grdqxzqnv7H9ulav0PK
	0JGA2sYxWqbwoKDuMoVe9hSrK1dTPbbyT2iXW6fEUvxLmPJQj/vCEFMNQ3dBaYCcbV7T0PIy9MTFv
	61Oz89X3kV3Mp/Bdl+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79aZ-00000000sOf-3tI0;
	Wed, 15 May 2024 08:02:15 +0000
Received: from mail.explorepulse.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79aW-00000000sMT-0f59
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 08:02:14 +0000
Received: by mail.explorepulse.pl (Postfix, from userid 1002)
	id 6B8B72496D; Wed, 15 May 2024 10:01:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=explorepulse.pl;
	s=mail; t=1715760125;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=BdpyR+bVUjqGQ8R26dB4SULc6TfLhGiJ9sGSmncNWNZFy7NpEk8s5k4+0ckaxkY2x
	 eCkKNrBw3dLazYxA6yygTy70B1TTxtCKlMitVn0bhb0KT0eF2BKTINld/s43wzUq1W
	 lrDNfZtul6Ip79bMqMrzV1hJCoKOAcW4Q2seXIjumoKskFKt8CYOUqJoMJkuX8qy5I
	 vCFN7ezEecaDHM2bKNNbeX5OL1wEonbGcgpUs0mXhLwNgTtGEPjzomevM4tzaqmBLy
	 IiyGJ8lxahgsoNuo8vmDZ7iD2/AHcAAmYf9aHEfCAJtmWXBLXyqeVpFVRRvXDjp/ir
	 0tCqc19OrfXmA==
Received: by mail.explorepulse.pl for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 08:01:03 GMT
Message-ID: <20240515084500-0.1.b7.qgah.0.n9kynvo3gf@explorepulse.pl>
Date: Wed, 15 May 2024 08:01:03 GMT
From: "Marcin Gard" <marcin.grad@explorepulse.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.explorepulse.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_010213_035438_E86F9A4F 
X-CRM114-Status: UNSURE (   0.02  )
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
