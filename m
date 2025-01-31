Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C33C0218D
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 08:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+l8slE+SI343KaLdmpnDkeT3i/savhnVPVQ1UGmBs+U=; b=NzPumlISYQKxAp
	N9LKag0F2lf2Xl17NsfcO4y+cMa38XMtpec2VohHL4qaOa22fTyiqPVEok7+UsqCJWOODleVWBXc3
	FtQUJ4XZw2JFWJx2SOTD4yamLaiPYSXKpPkA5dE+pEhWsFvCrjed6qQt+HKmxSAUkZiGVR8F3if75
	zWHWzBp6rSi99dWtTCRHyxzgLWPNtspqVginwmRlyOcrjvPG6wzmLaElqm7BfETKvBMhKtR6X69hB
	cCF9yowhbHRIQvgj7q3az3w/z8RBebtHCtTf9v2f7sRuS5bm5gZRIjWRDb2HJQTDkOx5Mw2MNKZRe
	BrPl7XZqprOshSsM08sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdmip-0000000AFDi-0jeQ;
	Fri, 31 Jan 2025 08:49:55 +0000
Received: from mail.completesolutions.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdmik-0000000AFDJ-48d6
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 08:49:53 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id 0005924C58; Fri, 31 Jan 2025 09:45:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1738313162;
	bh=w4+HQbQP74/lcux9sCovXIK7fEvSRotrOw+Jrj90l5c=;
	h=Date:From:To:Subject:From;
	b=JrnWMBbPr4mAPQLqSLnPckpAzW0y8l0NWBcU5LPIPLIgOrU6gw2BStZHCF9r11JbD
	 YjQWvDq6r11nW1FGBvc0kYFxekveCVti0xg1S8KQediwKv1z70yRAwZFFDA4ameGyF
	 i3oL/xsOvJ2ktEXMA18cmspzTpK7EX+CH8rnp8mPC+XdrE3Mwb7t3IQClIAcva7ZC0
	 5RBIatcNYqEJnPbwirE06BBf0WymwwD/lDGiplRA9IHEhPntXmnxaoEtzfJtE19DSy
	 vsLiYN/U9QctcjDPhP2dbRIVYoq6X4X6JEuXTdaMgTfaf6abuKA+Br3KB5EG7YDGhN
	 SN0KFh4Kpghog==
Received: by mail.completesolutions.pl for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 08:45:46 GMT
Message-ID: <20250131084500-0.1.g7.2c8yq.0.2xvwtxpyk5@completesolutions.pl>
Date: Fri, 31 Jan 2025 08:45:46 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_004951_718727_6C322A61 
X-CRM114-Status: UNSURE (   1.27  )
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

RHppZcWEIGRvYnJ5LCAKCkN6eSBpbnRlcmVzdWplIFBhxYRzdHdhIHBvenlza2FuaWUgbm93eWNo
IGtsaWVudMOzdz8KClpham11amVteSBzacSZIHByb2Zlc2pvbmFsbmllIHdzcGFyY2llbSBmaXJt
IHcgdHltIHpha3Jlc2llLiAKCk5hc2kgcGFydG5lcnp5IHp5c2t1asSFIHN0YcWCeSBuYXDFgnl3
IG5vd3ljaCB6bGVjZcWEIG9yYXogemFtw7N3aWXFhCwgYSB0eW0gc2FteW0gendpxJlrc3phasSF
IHN3b2plIHd5bmlraSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcHJ6ZWRzdGF3acSHIHN6Y3pl
Z8OzxYJ5IGRvdHljesSFY2UgemFzYWQgaSBtb8W8bGl3b8WbY2kgd3Nww7PFgnByYWN5PwoKClBv
emRyYXdpYW0KTWFyY2luIEdhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
