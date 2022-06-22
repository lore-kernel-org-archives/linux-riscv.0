Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1441C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jun 2022 07:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6KbnX6Bk/lp/nIiTdOlDllAQ4ic+lBe4pMMGASiRjXI=; b=M1oY7ZiK/QbSGc
	ij6OHnJ+S2UaI9D1RumwankqfNwbXP7CyDOx3WaNxDZpHz67BsgC7AD6nNaoU4bjbBqzpnUsw2Br1
	0Lnt5Xg5Xb9TsYAIrBuccmiiXHLmsT8gbFKMrWSDfE9uJXzve78PzfbOtZO+r6Fi9ruUWvxBnqzb2
	iGPKnEGbRADemu2Hu5dQWZAxHxY7H5hvJslghxya2ZH2KmZrR8MJFO2Six31ndfBOMeVqJEwGU87u
	cMMfOxjkye8w4/qx8HTMYsce1TwCBqmrqfvg0DS6++sAFfUXTH+i9XK6Z3Af65s57Wi98pQojRcG1
	lvqhM9JDay3rza8M4l8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3vDq-0098SM-70; Wed, 22 Jun 2022 07:56:22 +0000
Received: from mail.olerise.pl ([46.183.184.59])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3vDn-0098N4-36
	for linux-riscv@lists.infradead.org; Wed, 22 Jun 2022 07:56:20 +0000
Received: by mail.olerise.pl (Postfix, from userid 1001)
	id 2504D27AD1; Wed, 22 Jun 2022 09:50:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=olerise.pl; s=mail;
	t=1655884397; bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=;
	h=Date:From:To:Subject:From;
	b=Aakk15hHpGmHcU1KbzcPaJ/ZX5SFsfjGgYHwbs460Ao1ugc7UB/0rMtXj1M9DFgpx
	 zipro0qFSrGAUtb1ZaXwTe/4a7rigLOZaox9QXaN7mBd5RHnsFw+zGBq7EYgiY7SFh
	 DYHAI4mxw2ATpt0nrUfHdelkhng2JtvsMNcnmOuqY2NYBsnCBAp31k7Whe6woyDzVB
	 Nkyk+hG+mrVtSt0r1LheFpyIE07+v53L/vOvFLUfJOc0HC4A8hsTnNkh3WwN7k+1tq
	 YH59blISxqBpcu6OZint1+KjmcZ5QAbMQua3aBaQfYSjXDFnKiED9z7PR/boxR4dNf
	 NUAfUq3REdFxw==
Received: by mail.olerise.pl for <linux-riscv@lists.infradead.org>; Wed, 22 Jun 2022 07:50:21 GMT
Message-ID: <20220622084500-0.1.j.bb9u.0.0214zckrz3@olerise.pl>
Date: Wed, 22 Jun 2022 07:50:21 GMT
From: =?UTF-8?Q?"Przemys=C5=82aw_Wr=C3=B3blewski"?= <przemyslaw.wroblewski@olerise.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.olerise.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_005619_331007_AFD91648 
X-CRM114-Status: UNSURE (   0.38  )
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

RHppZcWEIGRvYnJ5LAoKZG9zdHJ6ZWdhbSBtb8W8bGl3b8WbxIcgd3Nww7PFgnByYWN5IHogUGHF
hHN0d2EgZmlybcSFLgoKxZp3aWFkY3p5bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBpbndlc3R5
Y2ppIHcgZm90b3dvbHRhaWvEmSwga3TDs3JhIG9ibmnFvGEga29zenR5IGVuZXJnaWkgZWxla3Ry
eWN6bmVqIG5hd2V0IG8gOTAlLgoKQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB3ZXJ5
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sClByemVteXPFgmF3
IFdyw7NibGV3c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
