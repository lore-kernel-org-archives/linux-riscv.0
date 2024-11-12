Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02DAD41D71
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 08:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z/zPbP+ZN3r08t/h1RM6U3AZ1VUtr4BGofg2NS1Pxic=; b=IM+iL7HR9lX/oQ
	A5uA0WBIc6O+xQDMhRpc3+tHEnLVhSAJQkXTquAMEMUJSvOornAcOoebxIKdbr224zJfdUc/YwDiO
	9xxPg35pu01hEqMdbOasZvWON4HmqUIrfDOdxoAYKfhfcZIAUIJKTptfJk0+6FH9V4dkxHKtmJRsm
	yzneYShJpu6lXzKXAZV2lNLR0IV+keQcSNTZaTI8ayK8dRMRN8A2XJ88KcplIEHKD5rX/3TIiv5h6
	MACGE8jajKhGA2Aucqqn15qejdn9DFqDrCOUJQ+78JhWvszJeim6aRl7r0eE39kznlUtsv8BQ0VeK
	vwXjth4RmRI6QieZUIVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmdc-00000002iTF-3E4g;
	Tue, 12 Nov 2024 08:52:40 +0000
Received: from mail.completesolutions.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmcT-00000002i7C-3vGZ
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 08:51:31 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id 144DC23EF4; Tue, 12 Nov 2024 09:51:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1731401488;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=PD+aoFLe9h91TJF9Cl4rEIjqnTzH+N5kHsVoSfaE2kh6T3ogv0pfDKcb3ImroNyK4
	 GOHYsuxVZ15zqNCuXcJd2STQZbRwGuif17Lw0XU/J3S806dQWD70sOsGC3IAle3ZNs
	 nc3YaLelZ5m525nUHmVJ0qwXJcHuUvdxxeF2TFETCTokboYsU7mms8U5qbEPx6qfAn
	 kRJMkl/QLfBun38jMUgmWaLX/22HddnT6RyV9auZVQzERQ3Ome7KgHTptv2F+mlT7p
	 hlsVfxON7duubWQ+7+C9razYrJa0nrJo6RjdkATBDtFzIFYzZU92xIAltRESqOIVHM
	 6tVpaBGaLPxoA==
Received: by mail.completesolutions.pl for <linux-riscv@lists.infradead.org>; Tue, 12 Nov 2024 08:51:17 GMT
Message-ID: <20241112084500-0.1.ep.1pbf3.0.y662nn1xei@completesolutions.pl>
Date: Tue, 12 Nov 2024 08:51:17 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_005130_128714_CE0F9320 
X-CRM114-Status: UNSURE (   1.40  )
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
