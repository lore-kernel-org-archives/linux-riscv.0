Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA78C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Apr 2022 07:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6KbnX6Bk/lp/nIiTdOlDllAQ4ic+lBe4pMMGASiRjXI=; b=inu955HLbNz4ad
	Kh8rtOl9L6JkkUJQpoo5d/SRsWg5bwJqkBw/bI3jp1lV2l8wf3PhGid0QJeX/VlPqXMWDroX1ZNcI
	O+jeC/ZXyDf2ym32g7ZxBmuSM0bzArkCfFVCtCe7EMBIHXjAwyTZVIdUSMnnA0N2EhYAnjQ7ghJKJ
	Dj7qCduxuGAGGpZ7KiQVXWhG50G5Zhc+UrHeNZwOZNC642tG4gx8VC9RQ71jHE+dEIro5yWczOA0x
	0fxVqrurFU52Mfm6b9qaAm3ZQl7sxcKFXI6qSqgVqif990P/lrNyF+12Jv/7UABs/rUbGjL/waW6j
	oMbzeXjfJEeLlN390etA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njc94-000HxS-2r; Wed, 27 Apr 2022 07:31:30 +0000
Received: from mail.fixingbiz.pl ([217.61.22.139])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njc8s-000Hra-63
 for linux-riscv@lists.infradead.org; Wed, 27 Apr 2022 07:31:22 +0000
Received: by mail.fixingbiz.pl (Postfix, from userid 1001)
 id 2D98DA4EE5; Wed, 27 Apr 2022 08:28:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fixingbiz.pl; s=mail;
 t=1651044577; bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=;
 h=Date:From:To:Subject:From;
 b=ae9b00W1qrEGUACxyEbAIjK0Otn7IaoIL9XpY5/tThCWn2vZGjvvhTxkedZbs9qk4
 klHm+IU3oG+pljLrl1R1GYkMbViTc5qo7rcTV03dl9+FhF95Vg3kmuSOufRSLf7UuD
 uZR+5tbrHUijMvO/KypFH5cjRVRMRjtY4KC8LFOFf8pHe/bGErJ/LwuCxWpJvG3/r9
 EbLHfymYiWVQI/igaHgubVbQpqMKyq6C6Keh1nvg6GisiJ1g/STHnOjWfbHea1Yhr/
 hFE4KNuNC1XGdEgE+CGy2opCnAVl3I0O1e2b1AdK0ZVh8KH9hUFfa4HPLxP9qNPjus
 ND5h+R2nYAv6Q==
Received: by mail.fixingbiz.pl for <linux-riscv@lists.infradead.org>;
 Wed, 27 Apr 2022 07:28:09 GMT
Message-ID: <20220427073002-0.1.22.aifk.0.7w04rbskeh@fixingbiz.pl>
Date: Wed, 27 Apr 2022 07:28:09 GMT
From: =?UTF-8?Q?"Przemys=C5=82aw_Wr=C3=B3blewski"?=
 <przemyslaw.wroblewski@fixingbiz.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.fixingbiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_003118_418409_D1A089AE 
X-CRM114-Status: UNSURE (   1.45  )
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
