Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788E3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 07:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6KbnX6Bk/lp/nIiTdOlDllAQ4ic+lBe4pMMGASiRjXI=; b=OxtzyWSBZhewKV
	Z+jttQ5vd8RXUHxC4oaMz5oPMkgbx/ZB8FoXgiTMQWIgnBubpyKuTyPc1Bb/SUT55eUr6d28KDxWF
	7bw6ZP0MVVfatsIQtVEegISo9Y3yP3tot1qVqImDCcqcZRYmFxQROzkNTNjsc2ygwqcfhpIge+bXJ
	90o35nGqLkkQIg7+JtDvyCooXNeJZEhSDStecZEPiw2nvelVpAiQLXgiartIeMAEHtaSZo6/Ce7vd
	Ceeo8yZ1y3P8f5uYGd0Dxl7h0aWRjve2tB2LT5iabAzDkjEKyb0fbf6KiqfBnsEq4z4x075YQ6UD0
	6pYNJTapzQD/fMZaOe1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh50C-007qg6-Lf; Wed, 20 Apr 2022 07:43:52 +0000
Received: from mail.fixingbiz.pl ([217.61.22.139])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh4zo-007qSe-7j
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 07:43:29 +0000
Received: by mail.fixingbiz.pl (Postfix, from userid 1001)
 id 8C265A39F8; Wed, 20 Apr 2022 08:42:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fixingbiz.pl; s=mail;
 t=1650440591; bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=;
 h=Date:From:To:Subject:From;
 b=1fwXfSphFHFA/bNE+GuLGSeQjtKU4UT8afnMr/9z/kOpyEiKkIlyrSpF/G+JvWK6/
 3Fd7uU8VEhOVMiuJJZbB62aoYySYsqwSIbcqrLUkEHWAHXz8dU3A2hRrfiztRH3AUe
 Dx9RdpN/Yf6J7uNe9WI9yUCsLrkL+q4aYAeR4xMJju5BBRLUYlAbIPXc7zw0Gsjw7E
 qiTVngjHc3Pk0RnuiTb6xAb+bX2vMKxcy0p8SKAGSzMnsq1ySN5pPCudIfZNHnZRoV
 VyIOuGM5WF7cd+gsBPqEbK3KtGNu8QTrrISacsN/HPuV6hZt5AXh/AjDuTPMx7fKup
 6pTTil7eAppAQ==
Received: by mail.fixingbiz.pl for <linux-riscv@lists.infradead.org>;
 Wed, 20 Apr 2022 07:40:53 GMT
Message-ID: <20220420074501-0.1.1x.6ugk.0.dga58lugv5@fixingbiz.pl>
Date: Wed, 20 Apr 2022 07:40:53 GMT
From: =?UTF-8?Q?"Przemys=C5=82aw_Wr=C3=B3blewski"?=
 <przemyslaw.wroblewski@fixingbiz.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.fixingbiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_004328_462972_CBDA3492 
X-CRM114-Status: UNSURE (   1.64  )
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
