Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1991C27C5E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 07:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z/zPbP+ZN3r08t/h1RM6U3AZ1VUtr4BGofg2NS1Pxic=; b=RfDrnml2a+Ut7D
	5YHB+hoFeXd1NMgPwG6w4vSbcJJ+nBVjtkeBsSDKsa32m4ASv7kje9emPa5g8cHxqXbOAgoTUhwjM
	OSYJD8Ax46E38cFCHnitFRApcI3lKBIxrL7BoThJlVfvaih7KeyemLkk7Wcikeo5LkTNvhAVP4E+J
	A8I8cfKnJH5ylcegFsLiU+MbK2tpII9x9c4/MUH7moxjqFeNjC5u5nEkj/pW1VvQhMlsaswF/V0Xx
	bLlnhf/I9vV/NWS+muSILM1zGp+J6HJ571erUWX3yHukd4BCuVH/BXS24ok7ww/6sqTdSsKFZZm1t
	dpdaCD0EXqdE5Oxp7Klw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGZZh-000000046MN-2Ni8;
	Mon, 10 Jun 2024 07:36:17 +0000
Received: from mail.explorepulse.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGZZW-000000046Go-1BCr
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 07:36:11 +0000
Received: by mail.explorepulse.pl (Postfix, from userid 1002)
	id BFF6323DF4; Mon, 10 Jun 2024 09:35:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=explorepulse.pl;
	s=mail; t=1718004950;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=SuzBXnw4/3NKNYTx3F24A0rioe7GmUgosHAtOp0kdOnrv3+lZTkEEUvbimbU0TRHd
	 sMKXPvHqyuHLzM5jn9I2PNqC9gMwjWEuoqSN2Fl88+VJRuv6OdYBDBfvWGi3/GCdHI
	 ra/tTeKOlxa/4fOFfbwfUSRys7Tk+RsTC6eiyJq/Q6fKVrX/m7CPZ6iuTpN2mc4Qpe
	 tLxG7V7hKl3yeq07S4jlKqfZCNSWKQiR7LY2xXKpwWhTaS+dJ3mYRYQVgUsRj11U1U
	 1NPL2q2uNz47X9QdQ82diqdlI70fhGrfKOrgDyze7SPe3Jy6eJ15CsnptLLGfQ8Oxq
	 rKopOrXeLwYsg==
Received: by mail.explorepulse.pl for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 07:35:46 GMT
Message-ID: <20240610084500-0.1.bo.sgls.0.xhu088i0ht@explorepulse.pl>
Date: Mon, 10 Jun 2024 07:35:46 GMT
From: "Marcin Gard" <marcin.grad@explorepulse.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.explorepulse.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_003607_094208_5A49657A 
X-CRM114-Status: UNSURE (   0.35  )
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
