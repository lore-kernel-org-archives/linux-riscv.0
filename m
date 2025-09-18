Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3BBCAC59A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 08:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fLVVffkel8TCbV217bei1tqcmpXdrln0FKnfGrgzIRE=; b=1VkoR4LagdMjre
	9mYBGwq/x2J19sbLEVCFSOAXuGOleT6JGA5lftWCNsM8Up9/NSm/oyqvG9tDXX6hczUpPr9TjhSfo
	0wuHlylPDbhmM9O/BbcoesVqvDngyitSJncdpOVaKPIn55GbbrZVD8yPp+m467YmN760gkytVwy/R
	RvDfuGYJS5HIPQczaelQYlT4r5C3kxVZ9CHXQSg4/m6R+PuCwOrkB7PWJleKS++X/fWVYvMIrY4mA
	Xp0AqN7taO5bTleaEkndi9dupNgZM7OT19+RbIpNQrwoRkz4P7XB7Yl4u+yEaPMdB2M7s1sUZOJwN
	qLCdVElJBp0uU+HHJwOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9YV-0000000GcdX-3dyS;
	Thu, 18 Sep 2025 07:59:51 +0000
Received: from mail.biznator.pl ([162.19.205.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9YT-0000000Gcce-0q2C
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 07:59:50 +0000
Received: by mail.biznator.pl (Postfix, from userid 1002)
	id D25EE29908; Thu, 18 Sep 2025 09:56:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=biznator.pl; s=mail;
	t=1758182189; bh=h3k5zkAZf6tEpPtEQC0QHe2u0TTQ7ZFRjUanCKLrdLo=;
	h=Date:From:To:Subject:From;
	b=InTACjcBU2hkt3vb70Mq4dRG77mCDoDfl0Wph2ueYwJWH6jgb9YCHNaniOK0Bl/sv
	 FgEsX+ZjcUAbLIcaBP/3x4SPunteumXzXC6nSsGgnzwUd49PrZ4ZClQ42JzIeY9YoA
	 Mhse1PwR4AUz6/KJ7P9qfdqngCMb1wAx1C9gRMUwdnkvgYveVK64ZNggLhpbi6Uhox
	 OI7P/8xVI/lUQhzY2Ro69W95diqGB6GfLuZvqyHDBTgHdt0BkSObJmj6bzIjDtYeW3
	 RXRb9iPT3W0RP+auleWe7Wlg5HehpWcyTfjw9dTFL6I+g3cjJvLVWMEqOkUF2p/Vcf
	 a7D3+emgh9paw==
Received: by mail.biznator.pl for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 07:55:37 GMT
Message-ID: <20250918084500-0.1.jr.1xbqs.0.8p1ckcinnq@biznator.pl>
Date: Thu, 18 Sep 2025 07:55:37 GMT
From: "Wojciech Mroczka" <wojciech.mroczka@biznator.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Fotowoltaika dla firm
X-Mailer: mail.biznator.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_005949_524758_F9995167 
X-CRM114-Status: UNSURE (   0.34  )
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

RHppZcWEIGRvYnJ5LAoKcG9tYWdhbXkgbWlrcm8sIG1hxYJ5bSBpIMWbcmVkbmltIHByemVkc2nE
mWJpb3JzdHdvbSBvYm5pxbx5xIcga29zenR5IGVuZXJnaWkgZWxla3RyeWN6bmVqIGR6acSZa2kg
bW9udGHFvG93aSBpbnN0YWxhY2ppIGZvdG93b2x0YWljem5lai4gCgpBa3R1YWxuaWUgcHJvcG9u
dWplbXkgYmV6a29ua3VyZW5jeWpuZSB3YXJ1bmtpIHdzcMOzxYJwcmFjeSwgb2QgcGxhbnUgcG9w
cnpleiByZWFsaXphY2rEmSBhxbwgcG8gc2Vyd2lzLgoKUHJvc3rEmSBvIGluZm9ybWFjasSZIGN6
eSBtb8W8ZW15IHByemVkc3Rhd2nEhyBwcm9wb3p5Y2plIGRsYSBQYcWEc3R3YSBmaXJteT8KCgpQ
b3pkcmF3aWFtLApXb2pjaWVjaCBNcm9jemthCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
