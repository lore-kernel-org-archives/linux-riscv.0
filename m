Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06B6C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 07:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ArF4oaXRb4CmTEbp5BdgWOV+vMzkl9LjZ5PPrGDvF+4=; b=Q8gg73ejXi+URx
	b39mjibHisq1sKVJ34kO4pkuiu4fdxOV94Dr/mVtQdVNGn2Gr9p4y89FA6huRyA3hOoaSwmvF+/O8
	80ljAuu0n+IM6ZZTij4VoZZhAXr4uDvBqhZwWuclWyViS3XlHy+fPiur37SFDTT1aJpJFI6UZnpJN
	TVo6rokMi6pNfnLpzqf6QHwu6e/NhKDF2wOtXfP/wBDoObVa8E3ijr+tXbbJhqjFPWL9LUCu662wt
	mVaCqSDb7WKMroKdUBCvIFi9v2kH9uCTZIDlLl0q/qt5cmVMfxlsqCEXYW8NsDyGzhMnuotEoE+oR
	x8VBqk8t3jO7flEcqzhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3yJ-00000000BKi-4Ajd;
	Wed, 31 Jul 2024 07:42:07 +0000
Received: from mail.tradeharmony.pl ([5.196.29.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3yF-00000000BIj-1f4A
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 07:42:06 +0000
Received: by mail.tradeharmony.pl (Postfix, from userid 1002)
	id 1CD9D258E5; Wed, 31 Jul 2024 09:41:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tradeharmony.pl;
	s=mail; t=1722411717;
	bh=niuXEqqR8RnV+jmqddfR0pqtgAFtRJIUEsYODsA2d0w=;
	h=Date:From:To:Subject:From;
	b=j/Mriy3yXsMxyDKhjWYRkHU/73qCEmwy/WSw4sAXnMpTwOKCTlKL4uReLjkqw009D
	 NHgF0gaQ/ulWS/a3gj36Yh5qFCGQ6JJgjGUiKlur0cINirTehZer6/rxHbJtzoeRXm
	 Z688SMTKKkAtRMLu4jCCG8nOVHuTw1jOP3wwB51Bt36kzo67TeImk9vQy3N7uRjpet
	 aNWecNjLrv1AkSV6EJrQ8eebWXNhBTgd4WlQ8z8vOj11Y2v+2zGfTdwfwQS/TDP3qT
	 TLRjSwXFTTHGy0UrijEmW9H78tYeOp3FHpiXvHUA1SfNq4Zrz0BlZj9sB3+Ax/Vq+z
	 4IvIEazHO0aNQ==
Received: by mail.tradeharmony.pl for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 07:41:24 GMT
Message-ID: <20240731084500-0.1.7s.2sccc.0.byawc58eww@tradeharmony.pl>
Date: Wed, 31 Jul 2024 07:41:24 GMT
From: "Karol Michun" <karol.michun@tradeharmony.pl>
To: <linux-riscv@lists.infradead.org>
Subject: W sprawie samochodu 
X-Mailer: mail.tradeharmony.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_004204_157812_848BA55C 
X-CRM114-Status: UNSURE (   0.33  )
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

RHppZcWEIGRvYnJ5LAoKY2hjaWVsaWJ5xZtteSB6YXBld25pxIcgUGHFhHN0d3Uga29tcGxla3Nv
d2Ugcm96d2nEhXphbmlhLCBqZcWbbGkgY2hvZHppIG8gc3lzdGVtIG1vbml0b3Jpbmd1IEdQUy4K
ClByZWN5enlqbmUgbW9uaXRvcm93YW5pZSBwb2phemTDs3cgbmEgbWFwYWNoIGN5ZnJvd3ljaCwg
xZtsZWR6ZW5pZSBpY2ggcGFyYW1ldHLDs3cgZWtzcGxvYXRhY3lqbnljaCB3IGN6YXNpZSByemVj
enl3aXN0eW0gb3JheiBrb250cm9sYSBwYWxpd2EgdG8ga2x1Y3pvd2UgZnVua2Nqb25hbG5vxZtj
aSBuYXN6ZWdvIHN5c3RlbXUuIAoKT3JnYW5pem93YW5pZSBwcmFjeSBwcmFjb3duaWvDs3cgamVz
dCBkemnEmWtpIHRlbXUgcHJvc3RzemUgaSBiYXJkemllaiBlZmVrdHl3bmUsIGEgb3N6Y3rEmWRu
b8WbY2kgaSBvcHR5bWFsaXphY2phIHcgemFrcmVzaWUgcG9ub3N6b255Y2gga29zenTDs3csIG1h
asSFIGRsYSBrYcW8ZGVnbyBwcnplZHNpxJliaW9yY3kgb2dyb21uZSB6bmFjemVuaWUuCgpEb3Bh
c3VqZW15IG5hc3rEhSBvZmVydMSZIGRvIFBhxYRzdHdhIG9jemVraXdhxYQgaSBwb3RyemViIG9y
Z2FuaXphY2ppLiBDenkgbW9nbGliecWbbXkgcG9yb3ptYXdpYcSHIG8gbmFzemVqIHByb3Bvenlj
amk/IAoKClBvemRyYXdpYW0KS2Fyb2wgTWljaHVuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
