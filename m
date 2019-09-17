Return-Path: <SRS0=Dbhb=XM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCF5C4CECD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2019 17:13:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69E1C214AF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2019 17:13:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oYzQ+BLq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aurabindo.in header.i=@aurabindo.in header.b="o9fbnOFe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69E1C214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=aurabindo.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:From:To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aVQFp1XvnhhQvbzUI9FvONlM+zsaWt+OYJyG7WXKM9A=; b=oYzQ+BLqXyVQvH
	H+oL4sPOSmXSyXY4w1FSx3mYimNeXr7ILpNvSrroVNTDfLqwInIHHJD8AhtMiTRfr7dALWnwoDuUP
	dD8Xu2Y6wbaH45j7sTgEufnWsg4a1amBLOh1EG82JQQmtTX2rqSAIbAdMOxn8ivGufJTaXzxrj9Dx
	Oz4O9MEKtZTnLkaQNMNKcPs5X+k2KYnyZOW8ZTNQr9jDQiU3dmTZtQg/DedU2RLZRm0NxMpyWN4lK
	+AcO+I7ItLwNV68f4FHAtXiGJoL0n5sE6+5QJRw+xY/Z6XYabMBLRwZNPpsJFQWFfMKLPdZjokhk/
	wsyPGmup3+ctXqGk2L9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAH2y-0006RN-BS; Tue, 17 Sep 2019 17:13:48 +0000
Received: from mail-40132.protonmail.ch ([185.70.40.132])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAH2t-0006QU-Ne
 for linux-riscv@lists.infradead.org; Tue, 17 Sep 2019 17:13:45 +0000
Date: Tue, 17 Sep 2019 17:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurabindo.in;
 s=protonmail; t=1568740418;
 bh=zbLTKg65FRGbaAMZXqIWuQw8Y6E7IYfG4i4H6e4pYWs=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=o9fbnOFerI9SjR7jDV8Tosglhcbs4IieOWKlLYD28UptUeuC+RN6KbitIpnA3nJPx
 q4ywL9lJhMcQmeYQPkdLjP39SQ3vqL96n9phf95xKwmcYwBBnJIsxkHsiAoexoBjjO
 dDOg4FBCWNIjam0Qf2arYyyu26JtymIryY2VbHmI=
To: Paul Walmsley <paul.walmsley@sifive.com>
From: Aurabindo Jayamohanan <mail@aurabindo.in>
Subject: Re: [PATCH] spi: sifive: check return value for
 platform_get_resource()
Message-ID: <KINCBM4noQrzRVzR5KPbVAIlCxDi1_pLvCu6FYZT3Alj83dH1Q6Aspaph78A1c17AxxG1vSVuW-vdPSka8Cr-zdaGJbEZPQg4Q14gax4-H0=@aurabindo.in>
In-Reply-To: <alpine.DEB.2.21.9999.1909170820470.21451@viisi.sifive.com>
References: <20190917085627.4562-1-mail@aurabindo.in>
 <CAMz4kuJczzjTPSohQ=kbZ0Pr7U_9-hzXk-jPgKk79PENOM1-dA@mail.gmail.com>
 <alpine.DEB.2.21.9999.1909170514130.11980@viisi.sifive.com>
 <ij_UksEXUomr_L7KQam02lHBryAppgwKDjG90VbVcRRUeXlKU8TAiBWc3aU8vt20Wvlwt_6NDgz5fuMSwwP1mm-1eP6GYWoR1Kbr0y0ElRk=@aurabindo.in>
 <alpine.DEB.2.21.9999.1909170709070.8198@viisi.sifive.com>
 <alpine.DEB.2.21.9999.1909170820470.21451@viisi.sifive.com>
Feedback-ID: D1Wwva8zb0UdpJtanaReRLGO3iCsewpGmDn8ZDKmpao-Gnxd2qXPmwwrSQ99r5Q15lmK-D8x6vKzqhUKCgzweA==:Ext:ProtonMail
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190917_101343_935568_F9B8D3BC 
X-CRM114-Status: UNSURE (   4.54  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: Aurabindo Jayamohanan <mail@aurabindo.in>
Cc: Baolin Wang <baolin.wang@linaro.org>,
 "palmer@sifive.com" <palmer@sifive.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGF1bCwKCuKAkOKAkOKAkOKAkOKAkOKAkOKAkCBPcmlnaW5hbCBNZXNzYWdlIOKAkOKAkOKA
kOKAkOKAkOKAkOKAkApPbiBUdWVzZGF5LCBTZXB0ZW1iZXIgMTcsIDIwMTkgODo1MSBQTSwgUGF1
bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPiB3cm90ZToKCj4KPgo+IEkganVz
dCByZWNhbGxlZCB0aGF0IFl1ZUhhaWJpbmcgYWxyZWFkeSBwb3N0ZWQgYSBwYXRjaCB0byBkbyB0
aGlzOgo+Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvYWxwaW5lLkRFQi4y
LjIxLjk5OTkuMTkwOTA0MTUyMDEzMC4xMzUwMkB2aWlzaS5zaWZpdmUuY29tLwo+CgpBaCwgc29y
cnkgZm9yIHRoZSBub2lzZS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
