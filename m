Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E22C54EDA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 07:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+l8slE+SI343KaLdmpnDkeT3i/savhnVPVQ1UGmBs+U=; b=WyvfGJkbdCCbb0
	xklxy3BWwDw4DgoZnFECGugdrMS45p4b0tpEBCiSxKIWOKQEuOwHfZNar8X9broSgUtPNFArdMets
	BDVotfJWKDqn9hu4OQi9d6dqljcDFL3fettDrz3b5KIrQrmoqllF+GKpCCELEAQ7qHC6RAuCdyYP0
	3TvXwLiEWKTPziw/N31ZzrPSs8zfggd/aAqPgcCf9RGYkHQsdatSHJXP5nYgVRbKiYZbLsVMCjTmn
	DPPpiFTsiPGC7R7w/+77t42QuHZITSC38VPguDFJUWnZTq/ej4BY8WHpSVNTmm8OdWD4MywJ08/c4
	67Yic5UfCjG8kJ7cfKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0Y5-00000000A2q-2v7Q;
	Thu, 22 May 2025 07:41:05 +0000
Received: from mail.taskflame.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0Ty-000000009Rb-10ZT
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 07:36:52 +0000
Received: by mail.taskflame.pl (Postfix, from userid 1002)
	id A300B25455; Thu, 22 May 2025 09:35:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=taskflame.pl; s=mail;
	t=1747899341; bh=w4+HQbQP74/lcux9sCovXIK7fEvSRotrOw+Jrj90l5c=;
	h=Date:From:To:Subject:From;
	b=n13i+iUTZe53w51HTSwabDbr9/y7wYnwJB/2MuW0Spr15qCsCdPXG9YtIg4lEfz0C
	 ZesZzz11XNp9sQ+glMinLRaeNbt8WEIhK/eHB4GTuA/a9b++22lqyyDjcfn75OSUWi
	 hueBg4yvjV3HFVJyD4WweWci/rws2bQhE4p0VHJUEJrWqMty43pWSJQaK3INy4U+nt
	 liYzoosQRoIC6IIJwKXV8eZ9vMtZGHpGPOhDp2ur+0Rbgv6YPWbLsuwdPNdtmu6ulX
	 4MQBSNSBJ9YNYBe22bMN9U88YxjyDYj0C3gIHljFYo2MRA4dQDtUHYDqjCmTgtowln
	 Y+4T+GoKinqHA==
Received: by mail.taskflame.pl for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 07:35:05 GMT
Message-ID: <20250522084500-0.1.ib.38ggi.0.0lvj04pebk@taskflame.pl>
Date: Thu, 22 May 2025 07:35:05 GMT
From: "Marcin Gard" <marcin.grad@taskflame.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.taskflame.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_003650_956749_795213D2 
X-CRM114-Status: UNSURE (  -0.10  )
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
