Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EB8C021B1
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 08:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+l8slE+SI343KaLdmpnDkeT3i/savhnVPVQ1UGmBs+U=; b=rKNH193PzjRQUk
	+z16//EpkWHYCuULipj6snnaVUa+BoKNXusWzG1F1ddIYSl3QT8NGeezx5PEIT3hPac/biYC3mnVg
	XJI6zCyg1cEPfhvpWvBXd5wuD0ewmqDL7o2rcAJmaem+uYpUDoZA4N+VwZamzFsRE50GAZdqQP66A
	2062BWe58AfDvaKKeNdoUjPQsSr7ScrC46H+9eIbwAMaxrM/a9vEJCxxXmL/CVccWa1TEFMPlKbdr
	uIUuWgoiSZYZ7JsuFpyFPH60nkjyBW+7Z0NarWylMqZ5YERvUoEf6Uh4T67VbDkwz7u82/DRLg7wO
	elKQG2fsO+Ooelhu70VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2Is-0000000HTLZ-2TTV;
	Thu, 20 Feb 2025 08:53:06 +0000
Received: from mail.completesolutions.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2HP-0000000HSpH-3kje
	for linux-riscv@lists.infradead.org;
	Thu, 20 Feb 2025 08:51:38 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id 6085D25036; Thu, 20 Feb 2025 09:45:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1740041186;
	bh=w4+HQbQP74/lcux9sCovXIK7fEvSRotrOw+Jrj90l5c=;
	h=Date:From:To:Subject:From;
	b=DhhqseHCBJwTnTDDVMhqeFj6E4fMxowQIWQSqTl4RWvh2vs4A7klmGxntfnHgAQeh
	 6sdSGQlC4+ebik8Qo1HPpl3ttpPf8+K9PCpWsihHVurMiWSQovcfW7FzZBaK6AlMMq
	 2aGreJO9f1IYwg346oFkIv7g7bfxfO2Rxj253u2guIJcSicmsVKzKogIuDZhS8gf/t
	 bjDlEMH5vBgNJJDumqlCesF19W5Kb0SC+7drqrpcu0cLz+Ef5PywE6UZjZFTRBkpkK
	 bDTVPDLaeye8ngj8SfKsK+VD9DA3rPku2DCls4gggLPkqo9E1k3b3W96AMyBW5ffIx
	 b6Mblb7AB/RmA==
Received: by mail.completesolutions.pl for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 08:45:45 GMT
Message-ID: <20250220084500-0.1.gl.2hthd.0.qhu6jo2459@completesolutions.pl>
Date: Thu, 20 Feb 2025 08:45:45 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_005136_613958_847356BE 
X-CRM114-Status: UNSURE (   1.37  )
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
