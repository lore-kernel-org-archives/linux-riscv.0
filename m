Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D631DC19F2D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 00:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:From:Date:
	Subject:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ng1Hzd57AEX9mmYRMaOIz8yjUy7IthnT4a9seW4lANQ=; b=z1Kq0E+4Cgorbv
	/PbUl++YAN6+t87WH0RvXVv959YZk2y27bdARG8ZlRtE1ByAwzcKCn43L9eFfdDYw0xQ4EDI05qPz
	lZRrriiO+vdRuB0Zra+pQEA0QWsBvZYGYFH6RciihG7fsA8uSoK4S4yOenExgautyvr+E3HorYPet
	SAxCogPS524by8PRNOwMg3GHaQwaNwzCmIHTMnqNMCqkTW2pZZGxF0HE0Fm6x5fD2m7lVanxp2aIf
	Y+oDwpklIgq+433mjL5g0bTzvVvoo6AB8mHPyGrDV3zNzQBAP++tp84Me7DwWnXgEARl1jOuDmu3f
	uVGULV2NBogBOxjx8sFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLa2W-007t8n-Q8; Wed, 10 Aug 2022 00:57:40 +0000
Received: from [142.93.222.223] (helo=vigilant-mayer.142-93-222-223.plesk.page)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLa2T-007t4K-4n
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 00:57:39 +0000
Received: by vigilant-mayer.142-93-222-223.plesk.page (Postfix, from userid 10000)
	id EE049830F5; Wed, 10 Aug 2022 06:27:26 +0530 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mahalaxmicomforts.in; s=default; t=1660093046;
	bh=1yRnqHRExlbItockHuVjrsZBA5llWy5vX56W4DlGKwA=; h=To:Subject:From;
	b=FTF/IvGffwXcCRba/xXXNmy45a5W5k+SiEKWVDRCoK4+kiKt2Zgs+9juMumU7uqX2
	 stLZHVw1R2TQ3niWsvXw+xQUFjok/zJ/GHplMkhYnRRK+kPc/6lhW1kMiabwyEz1PF
	 WTfOAEtxRTYNAkc26TapMOotfoS02xn9/PuANbHg=
To: linux-riscv@lists.infradead.org
Subject: =?us-ascii?Q?In_der_Stadt_Aalen_wurden_mehr_als_875_Menschen?=
 =?us-ascii?Q?_Millionare?=
Date: Wed, 10 Aug 2022 00:57:26 +0000
From: WordPress <admin@mahalaxmicomforts.in>
Message-ID: <YQFZAKkrySqOznWkbUGKyjD9YCiA8IjuPDvaVpQEv3o@mahalaxmicomforts.in>
X-Mailer: PHPMailer 6.5.3 (https://github.com/PHPMailer/PHPMailer)
MIME-Version: 1.0
X-PPP-Message-ID: <166009304693.620094.1747791872559428456@vigilant-mayer.142-93-222-223.plesk.page>
X-PPP-Vhost: mahalaxmicomforts.in
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_175738_068275_6A491FEF 
X-CRM114-Status: UNSURE (   0.21  )
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

RWR3YXJkVmVpbWEKSW4gZGVyIFN0YWR0IEFhbGVuIHd1cmRlbiBtZWhyIGFscyA4NzUgTWVuc2No
ZW4gTWlsbGlvbmFyZQpLcnlwdG93YWhydW5nIG1hY2h0IFNpZSB6dW0gTWlsbGlvbmFyIGh0dHBz
Oi8vdGVsZWdyYS5waC9QYXNzaXZlcy1FaW5rb21tZW4tdW5kLTc1MDAwMDAtRXVyby1hdWYtS3J5
cHRvd9CTwqRocnVuZy01OTgzMzEtMDgtMDkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
