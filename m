Return-Path: <SRS0=3S6Q=XG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29D3ECDE27
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2019 07:07:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 861C8222BF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2019 07:07:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IblG3q3k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aurabindo.in header.i=@aurabindo.in header.b="B1ngaLX5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 861C8222BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=aurabindo.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:Reply-To:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Type:MIME-Version:Message-ID:Subject:From:To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=QD5JFi3HOa+glEWGy6WySsERmh9GRQd9mXgDIEr1dJM=; b=Ibl
	G3q3kKa0FEyBSkMQjr+WTiD6WxvRgAUFZc+4Jui7ZnKIdydkBze9C3tIXnnHjOSnmADaQGoHNyYEE
	NKdOX1T9S+iNF16J3ys5lKCOpApW0AEAE6grdkFCdkdMcsnAiLsGGDGsKnNp39bb5vZ99MclEf+5A
	1y8vonqN3kLghaC6o0eMt0uDYL5+bQvea+X30cFw3e+IXF+WE2vm1WpzYOVLsE/pXDdrAK0cYLPp4
	Hwzi3/DMfXmQItFMezm4eY97yF0wPIT0W2LtrcYglH6i2I2BrosiMz7crHDwazUdHRLiXV3s77TMc
	jzEOSAYzNFxeVAfYVNYsBtViiAfk4Xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7wiv-0003b8-WD; Wed, 11 Sep 2019 07:07:30 +0000
Received: from mail2.protonmail.ch ([185.70.40.22])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7wis-0003Zy-D5
 for linux-riscv@lists.infradead.org; Wed, 11 Sep 2019 07:07:27 +0000
Date: Wed, 11 Sep 2019 07:07:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurabindo.in;
 s=protonmail; t=1568185634;
 bh=o1L+8KhqsX2u25XHVsCqbScSrZDVm6VBVGwx2oUNrkc=;
 h=Date:To:From:Cc:Reply-To:Subject:Feedback-ID:From;
 b=B1ngaLX5Wd0vi0NHSp7skQKh8dYy4lezL9ofvPLKxXliM72y9PJF4LOxBEYH7uFZC
 Z++rLaVCEzu2lnHJ/qIXYW5ltoyhKg1aOg/UTULTuX3epfAqsBxEgfx1+viO2SlrCP
 wUAMOlolarO3wnMNqjqWJ5w30HjId+EtZmFEOyv0=
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
From: Aurabindo Jayamohanan <mail@aurabindo.in>
Subject: [RFC] buildtar: add case for riscv architecture
Message-ID: <NwVOGH2ZdDQaDK35QUy7y8GS__G8IYSIUUIBAJsimZq5BgvI3SzLS3uY6fV7Pgppq-RTRHzpT-8KrsLjDN74CPWwHTCWoSgHkGbeJNvyS30=@aurabindo.in>
Feedback-ID: D1Wwva8zb0UdpJtanaReRLGO3iCsewpGmDn8ZDKmpao-Gnxd2qXPmwwrSQ99r5Q15lmK-D8x6vKzqhUKCgzweA==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="b1_8aa5ac17d5a37d2299526ba3f06c3a3e"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190911_000726_599710_C4B40D06 
X-CRM114-Status: UNSURE (   9.31  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.

--b1_8aa5ac17d5a37d2299526ba3f06c3a3e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I would like to know if something extra needs to be done other than copying=
 compressed kernel image, when making tar package for riscv architecture. P=
lease see the attached patch.

--

Thanks and Regards,
Aurabindo Jayamohanan

--b1_8aa5ac17d5a37d2299526ba3f06c3a3e
Content-Type: text/x-patch; name="0001-buildtar-add-riscv-case.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=0001-buildtar-add-riscv-case.patch

RnJvbSA4NmZlYjkzYzYyZGFhNjEzMTRkZjBiYmUxYTExMjcyYzIzYjFlYWRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBdXJhYmluZG8gSmF5YW1vaGFuYW4gPG1haWxAYXVyYWJpbmRv
LmluPgpEYXRlOiBUaHUsIDUgU2VwIDIwMTkgMTI6NTI6NDUgKzA1MzAKU3ViamVjdDogW1BBVENI
XSBidWlsZHRhcjogYWRkIHJpc2N2IGNhc2UKCkNvcHkgY29tcHJlc3NlZCBrZXJuZWwgaW1hZ2Ug
aW50byB0YXJiYWxsIHJvb3QuIFNpbWlsYXIKYWN0aW9uIGZvciBib3RoIGFybTY0IGFuZCByaXNj
diBhcmNoaXRlY3R1cmVzLgoKU2lnbmVkLW9mZi1ieTogQXVyYWJpbmRvIEpheWFtb2hhbmFuIDxt
YWlsQGF1cmFiaW5kby5pbj4KLS0tCiBzY3JpcHRzL3BhY2thZ2UvYnVpbGR0YXIgfCA2ICsrKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9zY3JpcHRzL3BhY2thZ2UvYnVpbGR0YXIgYi9zY3JpcHRzL3BhY2thZ2UvYnVpbGR0
YXIKaW5kZXggMmY2NmM4MWU0MDIxLi4zODhkMGZjYmU4YzIgMTAwNzU1Ci0tLSBhL3NjcmlwdHMv
cGFja2FnZS9idWlsZHRhcgorKysgYi9zY3JpcHRzL3BhY2thZ2UvYnVpbGR0YXIKQEAgLTEwNSwx
MCArMTA1LDEwIEBAIGNhc2UgIiR7QVJDSH0iIGluCiAJCQljcCAtdiAtLSAiJHtvYmp0cmVlfS92
bWxpbnV4IiAiJHt0bXBkaXJ9L2Jvb3Qvdm1saW51eC0ke0tFUk5FTFJFTEVBU0V9IgogCQlmaQog
CQk7OwotCWFybTY0KQorCWFybTY0fHJpc2N2KQogCQlmb3IgaSBpbiBJbWFnZS5iejIgSW1hZ2Uu
Z3ogSW1hZ2UubHo0IEltYWdlLmx6bWEgSW1hZ2UubHpvIDsgZG8KLQkJCWlmIFsgLWYgIiR7b2Jq
dHJlZX0vYXJjaC9hcm02NC9ib290LyR7aX0iIF0gOyB0aGVuCi0JCQkJY3AgLXYgLS0gIiR7b2Jq
dHJlZX0vYXJjaC9hcm02NC9ib290LyR7aX0iICIke3RtcGRpcn0vYm9vdC92bWxpbnV6LSR7S0VS
TkVMUkVMRUFTRX0iCisJCQlpZiBbIC1mICIke29ianRyZWV9L2FyY2gvJHtBUkNIfS9ib290LyR7
aX0iIF0gOyB0aGVuCisJCQkJY3AgLXYgLS0gIiR7b2JqdHJlZX0vYXJjaC8ke0FSQ0h9L2Jvb3Qv
JHtpfSIgIiR7dG1wZGlyfS9ib290L3ZtbGludXotJHtLRVJORUxSRUxFQVNFfSIKIAkJCQlicmVh
awogCQkJZmkKIAkJZG9uZQotLSAKMi4yMy4wCgo=


--b1_8aa5ac17d5a37d2299526ba3f06c3a3e
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--b1_8aa5ac17d5a37d2299526ba3f06c3a3e--


