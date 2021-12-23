Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60096C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Dec 2021 08:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sgpk/U5u9bb/+M+eKufxz9GvAgU9NGSoML+9TChagys=; b=YSxKGye/mXKES6
	iImiedDIZzf9okRSY6FKaWL+hSQyszGkhVzqi3YxUmYbU5g/WyYYiXeLzsdEjdIbBRvIDwdnG5g9p
	tcErfn/wXuKuwbf/lsoYUhPiyH9SwLX2LfEdM7Zj+0U7DxVoqgwS5o+aMEbsxXlpI8bkwEO0p0r2x
	82pLIyZVvM5Qd8uGpxFolcb6pGiT1f5IBwIVwJ2HoQAkKs1vSyU7WtghsneOUPLETaaYYJWbn2TgX
	qzW3p/9EZ/0wZBZ0nbuum1U7Ret15TFTXZnU4nPj+XAZ1UyeQmycwYjmUySfLwBH1SwLMMV10165f
	e0ctxtDDCt9yJQUeHPkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0JUg-00CFx4-Eu; Thu, 23 Dec 2021 08:30:34 +0000
Received: from mail.betterbiz.pl ([45.86.209.138])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0Irm-00C1OH-P6
 for linux-riscv@lists.infradead.org; Thu, 23 Dec 2021 07:50:24 +0000
Received: by mail.betterbiz.pl (Postfix, from userid 1001)
 id 495A983058; Thu, 23 Dec 2021 02:45:46 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=betterbiz.pl; s=mail;
 t=1640245822; bh=07NAgW1e0WiNB9zqagiM2BnwZfWBCpNa2E4+ccxBPgw=;
 h=Date:From:To:Subject:From;
 b=fx2KuHhxLEE/rzukaSyc2kcHMnBzHl0hVh3ng2NlgnBwF4c3Mfck30/eBJJM++0mx
 OLR1YDQqjsd11XrKkqobjDr7ksa56SmrhLxyFSs+yZuBOFm7pd8tSr+QvYC2IDNvy6
 AJEOLuvIJf8CbDDe79zDKuUaICSlWSFTIJugMX9N15/XjkovxU0ME8tTbgLcZB5/EW
 AcdKdCEwbK8gE7OxNiXHVni4ReOG7JB5nGo71h1yJ8o4WZV3m2cKdjbwkBP8lipDmH
 1yQZHP1NvH7smRqCMsjBDvKeQk+D5VhBiBRYvaejlGpDOJLNhLcEtEtwVeceJIU3U3
 4B8fySqI6b8rw==
Received: by mail.betterbiz.pl for <linux-riscv@lists.infradead.org>;
 Thu, 23 Dec 2021 07:45:46 GMT
Message-ID: <20211223024500-0.1.f.zhl.0.1w3qb3hila@betterbiz.pl>
Date: Thu, 23 Dec 2021 07:45:46 GMT
From: "Jakub Daroch" <jakub.daroch@betterbiz.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.betterbiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_235022_872973_5B26155C 
X-CRM114-Status: UNSURE (   0.57  )
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
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCkpha3ViIERhcm9j
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
