Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAE5C25B6D
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 08:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jj9cBmInVfm1TWouYmTeIJ3WteVFMku7kV+fJcZnYtk=; b=cE8D4SWjVHx4Ai
	NAcx+AJoAN/SIYLDFqUhSF5LDZOwROJm6u7HG1ycL1lMibXDvan4DnzO+8vuoWOQ5P43EzKOeSK1R
	WteJj+jvoVK6tlvtftrBAkL6Ro1LqkBcuCWUo6GZ7jJhRLt8BNYijR6ZZgPPSqQbBGQeB9e3/kd/B
	CdCDxBvPxFeNlnOyuLh7aG5lZfhYPfHa8kF82w4oIUttNdYVbQQmr9MY0xDRXoZTKl9mJ5HMAqWGN
	Ujt2uQ1gSIttFxKBxQBBN4Blkzc64mWKOblYGvvMB/p64Vxuz6F/vPL8IQeFl7/M02EvkR2wqeknt
	TnAYSqNhu6Is+91NN8iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCVB-0099kQ-1i;
	Tue, 24 Oct 2023 08:11:01 +0000
Received: from mail.citycodes.pl ([158.255.215.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCV8-0099j5-2p
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 08:11:00 +0000
Received: by mail.citycodes.pl (Postfix, from userid 1001)
	id A457921658; Tue, 24 Oct 2023 10:10:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=citycodes.pl; s=mail;
	t=1698135057; bh=fClkhHu/p6gIm8tbpvFwCqGX3kXIMdqjiuDdSiYGEkk=;
	h=Date:From:To:Subject:From;
	b=TNXvdd4tSI6JSw/nsrObU0KgkVsjMCrU8qZvJ43SzvzAgprQ5B4QGE5Iesl9P2Nlm
	 sHW6fe5Ysb2ULZK4XEbHj457d8XvyUEjVlh0vCY8tt2TW2ucjMgsO5tgaS3D5i3mQp
	 /VzMrfphqaJ57OPGNrR/VIqsdaWJo+hYPwUhAexUdWYGt3bAB5hKcEOkuYhg0iCm72
	 mhjmRl7LX1es0NW6l3wGsDLAIxplCa/af1KHfjOHsdlEuOAiGSc9aGW1QeHnX1lSGt
	 Dr/3Ns3jKmTgW86qLkssiWS1ncCPCZclMG/8koVK19heqxETPPKTxSmJ4jpl8AgEL3
	 pEj+nCEyHgIhQ==
Received: by mail.citycodes.pl for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 08:10:35 GMT
Message-ID: <20231024084500-0.1.8a.l8aa.0.9gtlfl7rrq@citycodes.pl>
Date: Tue, 24 Oct 2023 08:10:35 GMT
From: "Kamil Lasek" <kamil.lasek@citycodes.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.citycodes.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_011059_071798_7E74455F 
X-CRM114-Status: UNSURE (   0.54  )
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
eWN6bmVqLgoKQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB3ZXJ5ZmlrYWNqxIUgd3N0
xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCkthbWlsIExhc2VrCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
