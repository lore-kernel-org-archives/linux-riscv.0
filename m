Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C4FC43334
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6KbnX6Bk/lp/nIiTdOlDllAQ4ic+lBe4pMMGASiRjXI=; b=OgeydOLICGrvWZ
	ql21Z+4voCX+NIuGvaK7gw4pLn+NiMPXhSAqKaqsH66H762quFwim2CHJAJ+zg+hPzfCtXGYCQlbz
	k4jFTcdUK8mHt/hb0OH74YIH1oSnAdh/dGf/6EYhrowvMpEbpxUXXompZflJqnXeMLzbxSNugpjod
	b8yPcpCVbMflvkeKAZ3+00H5cAVbeansLGb/ecB7Gopky/JBJvusOs5e1djIgQl2j7zb5baHaQ0oD
	64DAD5zvO8oaBW9ww7zdZT3SzeiZ7apvwuDEqSwKrnn7/KygKlcBOBmFAxGtFFFPzI60lq5/h/COq
	7KIHA02X1dcKQFAWtNCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1NzE-00D9Eh-0S; Wed, 15 Jun 2022 08:02:48 +0000
Received: from mail.olerise.pl ([46.183.184.59])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1NzB-00D9Dy-EB
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 08:02:46 +0000
Received: by mail.olerise.pl (Postfix, from userid 1001)
	id 1C88723431; Wed, 15 Jun 2022 10:00:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=olerise.pl; s=mail;
	t=1655280041; bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=;
	h=Date:From:To:Subject:From;
	b=Zg8a839mMB85f3UDs9lN515MkoPoPd9f7jQDZqK989On5/TqmeswzFCcg3K7JwlQF
	 Y8vr8acK1zE+oR+BoGuwTtb7SrX0V51BGhKilWMZ74RPbeMrjHhXS5shlQhOdoNSwU
	 dZHA1fLoyeCxhajF6jkaPj0tbrfRSQUeqefLa5UsLhmkocLX9nqkk5Ep9RA/Cd8xAN
	 DR4Nkn+omyItLqSHeiPxBEiHelltItGtYIJuE7O1qqrgR4DZtvOOTkTjDc+i/eB9SB
	 OgNVZMr0TmT7cZMUCTgts7gBjjtdCVsrpDikV2LIZltFJ0gvco46LWzshNAs+fjbFv
	 aMziYjFflt8Mw==
Received: by mail.olerise.pl for <linux-riscv@lists.infradead.org>; Wed, 15 Jun 2022 08:00:27 GMT
Message-ID: <20220615084500-0.1.f.83gr.0.fh3pok2fok@olerise.pl>
Date: Wed, 15 Jun 2022 08:00:27 GMT
From: =?UTF-8?Q?"Przemys=C5=82aw_Wr=C3=B3blewski"?= <przemyslaw.wroblewski@olerise.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.olerise.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_010245_661176_8E7F0AA1 
X-CRM114-Status: UNSURE (   0.46  )
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
