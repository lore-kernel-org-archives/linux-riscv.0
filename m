Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52631C83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 08:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JlNp6QTeBzhCxQv0Ma/CevfePtQC0j369lVU8Fg9xOo=; b=0gdJsaY/tC+69h
	dwMtSXAGZ9D5cZ9vhR8sgCIYRKoBKy+yXNl+FHLQbLgnWPt8smmueaDSwB/XtimQPam38vN1rwADn
	nSDQK9GeQhtw+lTS0yp1DdLJAHWzms83HA0k1HLp/DMruUt4lACbcELoAhnffn8RHPMXIS47iTHkX
	80J1NH5oXqURXt4MlVxMl8ybLVPjrZsOC8qLLhKXxxSSZBXF2sVEs68x2Cci3/LTBYaAlZaYPepUI
	FccY+ou3rDU054ezpWOyRokfh1VLQpinO6nFfpVwF2rQb7ffTg0xhgSpw0EwT+EaWleKcyR2F2xpd
	cth/c4jhc+nYWFbn3woQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9Zk-0000000EERl-3JlY;
	Fri, 11 Jul 2025 08:57:48 +0000
Received: from mail.fintara.pl ([51.68.214.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8ml-0000000E57z-48wF
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 08:07:13 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
	id BE6AD4DDAA; Fri, 11 Jul 2025 10:05:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
	t=1752221226; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
	h=Date:From:To:Subject:From;
	b=ZQFWPi3g5jHfrwAgwuR8gHItEoYMREg8olq567g8r3RzL6b6NGQDmnaomBpAGcr9S
	 hfwLWeR981BVUn4+/yEF4uYRqh+nQUrsyO2eE0gapyyvcSyW9KQI74Q3fG/CSqadjD
	 6hDo7SF55jS39+h/zD/i4d1jSX76XXfgv+cbkae00kIIZ0RFqY1upgaSinPFxBp3dK
	 HsQCmNRzx4Pa2Sk12PFMhivxP2Tz6uRIfu4F+zGClLR7Ly8QidiQb5Pk6JNZGJhOTy
	 78UirU6z56d+IS6mAUZ8NxjmHE/G4AtQcKzlB23OJ9MCpsFbO4P6UfCinFnwXqcqVL
	 CnscatfOR4RMQ==
Received: by mail.fintara.pl for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 08:05:10 GMT
Message-ID: <20250711084501-0.1.am.2t576.0.plleqar5ig@fintara.pl>
Date: Fri, 11 Jul 2025 08:05:10 GMT
From: "Dominik Lotka" <dominik.lotka@fintara.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_010712_704194_3C39E43E 
X-CRM114-Status: UNSURE (   0.14  )
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
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpEb21pbmlrIExvdGthCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
