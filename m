Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AEBC28B30
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 09:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iH5or2kBtfKVFtmgFRx96BklmzjKA+ehbvCesNFx+s8=; b=cXrIqtxWcpJBj1
	5EzEmIBujnc09HZytyzp6RXY2re5p0MAhPRvTQr4dOxq1um+Iv11Axyd9tL3hd1CeH4DrO/k/ASpj
	OlXoKK+NiehCQwwD6sa5TO9tC/1eoYQPMKzCaYSYjPljdjx000FkyVR9RuRvBzdwsn4Dxf/RagjIY
	KNyCGNe+YIGBTfHcsy5o0khZHFpTQLNkEGpGXUYvbccMKLta3Tz4Qv73hoKn1jUqeEx3rDRHIwZYm
	6gmJbI1li45iumIzwtDGylAJc1BIwtbQWSa73mdqxJ6H1SNWwkGQ05klO5yDhctIut8xFkgQUH7Q8
	qM/8U0Q1puPkGf5M3Ovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZKJ-000000023uD-3qgp;
	Mon, 10 Mar 2025 09:21:35 +0000
Received: from mail.commetro.pl ([217.61.16.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZJt-000000023p2-1XOL
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 09:21:10 +0000
Received: by mail.commetro.pl (Postfix, from userid 1002)
	id CBB6283040; Mon, 10 Mar 2025 10:06:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetro.pl; s=mail;
	t=1741597641; bh=COht1CALZmZz8MRkow5xVDQUyVzx29Nu6ozA/Y0jgb4=;
	h=Date:From:To:Subject:From;
	b=G4VW96iQ5yn/TZeDS+BDfNed26z+kzlk1P60bECzuzYf4CKh9lelEYYQGWH4Z7GJ5
	 5w/9EOuKnzBTzUlRIeOjBwrdh5PBh21vEMOEfhy38B1vtFzqcnF4hGQj+/btFvz6eT
	 RrNA5YJG0Oj+mMcVPB04kRWOr5/vUgjGjNqPGh4x1oXb74f4emJ7wjEqXu5vTx3mfL
	 oKfxmp7zLSleN8apEiLBpWdBrb+WRZMxCt/ZBUFLLdanzgByE25a+huTmKAmrfhI+P
	 zIvxRElaicUHS0EBL2tn8D6kxubTvOotXCgk04J69twDjMgEx7NCEJwJ7PIWL1ewSN
	 gWW21ls+RPPLQ==
Received: by mail.commetro.pl for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 09:06:09 GMT
Message-ID: <20250310084500-0.1.1a.fbr4.0.8xk0q4be9h@commetro.pl>
Date: Mon, 10 Mar 2025 09:06:09 GMT
From: =?UTF-8?Q?"Jaros=C5=82aw_Kownacki"?= <jaroslaw.kownacki@commetro.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_ofert=C4=99?=
X-Mailer: mail.commetro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_022109_528956_BCE304FD 
X-CRM114-Status: UNSURE (   1.66  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IHBvdHJ6ZWJ1asSFIFBhxYRzdHdvIGFrdHVhbG5pZSBub3d5Y2gg
a2xpZW50w7N3ID8KClNrdXRlY3puaWUgcG9tYWdhbXkgcm96cG9jenluYcSHIHJvem1vd3kgaGFu
ZGxvd2UgeiBrbGllbnRhbWkgemFpbnRlcmVzb3dhbnltaSBQYcWEc3R3YSBvZmVydMSFLgoKWmFw
cmFzemFtIGRvIGtvbnRha3R1IHp3cm90bmVnby4KCgpQb3pkcmF3aWFtIHNlcmRlY3puaWUKSmFy
b3PFgmF3IEtvd25hY2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
