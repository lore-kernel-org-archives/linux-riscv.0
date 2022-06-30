Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7B5C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 07:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6KbnX6Bk/lp/nIiTdOlDllAQ4ic+lBe4pMMGASiRjXI=; b=Ikg0p05XSs3rFA
	y1Oyi9ftQK4Js4MdwTmZJ1VBjUtBIV/38xfKzWShBSgWgfYDtUvJg7m16PPxpE+DE5cQ0SEi8PqRW
	VJmdXQw7SD4fHfM97Bt1fW0/IRwX17GpQMin9J83foEGRkQUUmx2o37y4QCRLFLodxxp9/62GPWRb
	+FCU7hc6baRnbyB/UO4/H1+Lzrk/WgREVsfx3ELfMJ7J9Dppwq7ewiFMF5ffMMxAw/XSVprpou3tX
	Fk3PmlzFQ8Cm/cSwE+BoLMnrZnKR2iDKB1RrFdil3iXBqOVTgugq7iYC6TQAq5U7vMc7LhV/IE6xT
	Dn9Ui8xgy9vpcaMooFLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6oto-00Fp8F-HH; Thu, 30 Jun 2022 07:47:40 +0000
Received: from mail.olerise.pl ([46.183.184.59])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6otl-00Fp2H-HZ
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 07:47:38 +0000
Received: by mail.olerise.pl (Postfix, from userid 1001)
	id B984D20933; Thu, 30 Jun 2022 09:46:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=olerise.pl; s=mail;
	t=1656575229; bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=;
	h=Date:From:To:Subject:From;
	b=CnckfG8pMJElq21sw0xsSywSg8COhrUgBUXUCK9hsXWIEUFkIfmQYqpsRDngH3cEh
	 0uy5AA05E3ooYGr1ZwaGeBxPvyZJfIGhx2Pt4aGreW3QFW+am5z6i8qHLfTRZtnnKZ
	 EQ/T5X8c3mpbz9PcJBsN6i5b9/dQ7tfOnGTD/mnvs8S7xy/130n17u2LaSklnDccJG
	 35G5SUA771XXW8n5XC/yd1H1CIsit5Qs/xCLXytdpxvvHCFNr+lvLSoGrSrztqxBpU
	 p+6A9+dYq1OoLB1gX4XJabAeNNOLVRtM+8vc0qXXEAGpsYYvPEnPRHMWoOe6PtmWnt
	 +ccwluc5/EQpA==
Received: by mail.olerise.pl for <linux-riscv@lists.infradead.org>; Thu, 30 Jun 2022 07:46:17 GMT
Message-ID: <20220630084500-0.1.p.bb9u.0.u849wp887h@olerise.pl>
Date: Thu, 30 Jun 2022 07:46:17 GMT
From: =?UTF-8?Q?"Przemys=C5=82aw_Wr=C3=B3blewski"?= <przemyslaw.wroblewski@olerise.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.olerise.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_004737_830715_6D79F534 
X-CRM114-Status: UNSURE (   0.19  )
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
