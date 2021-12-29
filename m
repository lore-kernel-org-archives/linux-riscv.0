Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3F6C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Dec 2021 08:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QW7HLH0kIj2IFc+tCAGIau/EKSGzr0XA1nCU6799gEQ=; b=gMglc7vVT6VePz
	mR2pf2XuCGyh64Gov8Cqo/BPyak7ffdEz9Ev1tT6y6AedRkITQ9g0B/fyUlTXKjfo5J6zZn8EIfJk
	ESOFNlb57bn3FEH9QbblW+NlB1jtLU5EHvfhYlChGWeO8ByQEu492MvKHsFO5F9OvER4d0OQqObks
	9VX/72GKIBN5TofKzLaP6APwZofOh7IJvsIFkyDBF34L7niQRO28cJGGR8sb+dVWWL7U1+omYUX8P
	eS9UIL2IgYH3OUyvLq81y2LMXE2rfV18NfuvWtd64rePDMJFn94ghPkGPVqMAHlNj1E90ibXxfMxk
	kC8KPjjYO463an9zN5CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Ubk-002UZI-EB; Wed, 29 Dec 2021 08:46:52 +0000
Received: from mail.portyid.pl ([192.36.61.58])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Ubg-002UYQ-LZ
 for linux-riscv@lists.infradead.org; Wed, 29 Dec 2021 08:46:50 +0000
Received: by mail.portyid.pl (Postfix, from userid 1001)
 id 01BAD41191; Wed, 29 Dec 2021 09:45:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=portyid.pl; s=mail;
 t=1640767585; bh=RZjfFpT9KGSFHXuIOzTjcb+Gwkun4EXriv7y2I0PG0A=;
 h=Date:From:To:Subject:From;
 b=JLP6OVtABbpvvy0i483DdyOBEPMRATYg8TMJ9N+qP8FXZ0aXMy4pIu7Sbfe+Yl2NW
 Sy0amylTPaEENsPZccB03rW+7DJm+QaINxyzoOi3syMXTpAbQMKarsyBFHHjUCbWQT
 P5yVfJi3Sa63mZdb6/fQePDiXbagJWUKcXzpci35x6/Fk8+tvOWGpUevXtkCM2ZFHK
 hARQLHwSfiWNwFHiUwnr8ITMKKB/6wSjB2NFzlVHe6zSvdmfUN5sUEIR4ouZK7MhR1
 /VRazpu5IHUJyFxyFI2Q1D10+L84TNskKrVCwTQmraufgW87Fv275JLKVkwxzbN9QF
 7e+dJo1ulZp+w==
Received: by mail.portyid.pl for <linux-riscv@lists.infradead.org>;
 Wed, 29 Dec 2021 08:45:43 GMT
Message-ID: <20211229084500-0.1.w.2ua2.0.247jjl6gum@portyid.pl>
Date: Wed, 29 Dec 2021 08:45:43 GMT
From: =?UTF-8?Q?"Pawe=C5=82_Jasi=C5=84ski"?= <pawel.jasinski@portyid.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.portyid.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_004648_942667_A4A18479 
X-CRM114-Status: UNSURE (   1.74  )
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
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0KUGF3ZcWCIEphc2nF
hHNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
