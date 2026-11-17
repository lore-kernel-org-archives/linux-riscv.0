Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2F5606A333
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 21:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x6SVDE/q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=Svf/8GAU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vqnNTD4S+FHQMS8hISJvFNv1CclukmlfoKJ/ndWKYro=; b=x6SVDE/qebS2qm1i5qolGhIeDk
	iL9hk1bluL0zs92jZcpxucN3mDMpcfStNqWYav/Il3Vb+U4IEh2XMHe9trzzXcI82CQq0OON9oy1b
	B3es2WiVJgW8U7Bw52qWaLLLnqcOnoBKmGS/iOd4Lqw2RLRFQBWHU+scf70/CJk179vhcNjXK6Lpg
	ZbcCGpMfPEc5pKaZFHqe+QSuu7SMCJso/i0b5pOd0ZhhPmeZRyTV8E7ON2YCb83D5NkZh2zCxB2Dc
	UvAUAEPQju68OGZAVjNId2ZM2z94yrPqPNgcKDLYSa7GvU+7PotSCCAdm2yjSb9eaQkionLSUMhGh
	yLYQIKFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQIW-0000000740n-2v8z;
	Tue, 17 Nov 2026 21:01:00 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQIU-000000073yZ-2fBr
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 21:00:59 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 08F3920D5578;
	Tue, 17 Nov 2026 22:00:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id DBDFD20D531A;
	Tue, 17 Nov 2026 22:00:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr DBDFD20D531A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794949256;
	bh=kzHAg5Xh51fP70+LSsatQn4NLaZ7XSs7gxDHYO+Tamc=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=Svf/8GAUvon8ObnHU8kOk8plxxqSCi9mPASh6f0DrVCsJjhiLGHBQ7T3aQtb8uloj
	 polYikkuRbtA1s3T+9iBxISHacSmLuPZIXPVasTd+XlYRbnrbLho6gL8jUgKeoFOBf
	 a1ofuF+Ewy0Iq7EhEqOFRqRWqOxmrjO+Hgk6Pb++XpRXLd2m0ZGAqjF3fLg83JgNV9
	 Kw/mg8jOyq/LLGzj3uoPwjjwXS6/MdgstwQBvnA8Rb3kOq5nUyhphh/+7JZdxMm+8Q
	 5P2k4G6O/YGXAsXv1/ZB6jMkCJfAK6U2I2u3nt8tLTmBFrQ9nqq/eSFtRrfhPoMyas
	 84gvgGS808U4g==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id JqeTOOPlcujr; Tue, 17 Nov 2026 22:00:56 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id B84B420D5578;
	Tue, 17 Nov 2026 22:00:55 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.co>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: [PATCH 3/6] clk: spacemit: k1: Add RCPU2 PWM clocks
Date: Tue, 17 Nov 2026 21:59:48 +0100
Message-ID: <20261117205951.140146-4-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117205951.140146-1-frederic.mahe@cirad.fr>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_130058_851797_D527E9F3 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIHRlbiBSQ1BVMiBQV01zIGVhY2ggaGF2ZSBhIG11eC9kaXZpZGVyL2dhdGUgY2xvY2sgaW4g
dGhlIFJDUFUyCnN5c3RlbSBjb250cm9sbGVyLCBmZWQgYnkgcGxsMV9hdWRfMjRwNSBvciBwbGwx
X2F1ZF8yNDVwNy4gUmVnaXN0ZXIKbGF5b3V0IGZyb20gdGhlIHZlbmRvciBrZXJuZWwuCgpXcml0
dGVuIHdpdGggaGVscCBmcm9tIENsYXVkZSAoQW50aHJvcGljKTsgcmV2aWV3ZWQgYW5kIHRlc3Rl
ZCBvbiBoYXJkd2FyZS4KClNpZ25lZC1vZmYtYnk6IEZyw6lkw6lyaWMgTWFow6kgPGZyZWRlcmlj
Lm1haGVAY2lyYWQuZnI+Ci0tLQogZHJpdmVycy9jbGsvc3BhY2VtaXQvY2N1LWsxLmMgfCA0MiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9zcGFjZW1pdC9jY3UtazEuYyBi
L2RyaXZlcnMvY2xrL3NwYWNlbWl0L2NjdS1rMS5jCmluZGV4IDM2NDM4OGZmOC4uMjViZTMzNWVi
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9zcGFjZW1pdC9jY3UtazEuYworKysgYi9kcml2ZXJz
L2Nsay9zcGFjZW1pdC9jY3UtazEuYwpAQCAtNzA1LDYgKzcwNSwzMyBAQCBDQ1VfR0FURV9ERUZJ
TkUoZW1hYzFfcHRwX2NsaywgQ0NVX1BBUkVOVF9IVyhwbGwyX2Q2KSwgQVBNVV9FTUFDMV9DTEtf
UkVTX0NUUkwsCiBDQ1VfR0FURV9ERUZJTkUoZW1tY19idXNfY2xrLCBDQ1VfUEFSRU5UX0hXKHBt
dWFfYWNsayksIEFQTVVfUE1VQV9FTV9DTEtfUkVTX0NUUkwsIEJJVCgzKSwgMCk7CiAvKiBBUE1V
IGNsb2NrcyBlbmQgKi8KIAorLyogUkNQVTIgY2xvY2tzIHN0YXJ0ICovCitzdGF0aWMgY29uc3Qg
c3RydWN0IGNsa19wYXJlbnRfZGF0YSByY3B1Ml9wd21fcGFyZW50c1tdID0geworCUNDVV9QQVJF
TlRfSFcocGxsMV9hdWRfMjRwNSksCisJQ0NVX1BBUkVOVF9IVyhwbGwxX2F1ZF8yNDVwNyksCit9
OworQ0NVX01VWF9ESVZfR0FURV9ERUZJTkUocmNwdTJfcHdtMF9jbGssIHJjcHUyX3B3bV9wYXJl
bnRzLCBSQ1BVMl9QV00wX0NMS19SU1QsIDgsIDExLCA0LCAyLAorCQkJQklUKDEpLCAwKTsKK0ND
VV9NVVhfRElWX0dBVEVfREVGSU5FKHJjcHUyX3B3bTFfY2xrLCByY3B1Ml9wd21fcGFyZW50cywg
UkNQVTJfUFdNMV9DTEtfUlNULCA4LCAxMSwgNCwgMiwKKwkJCUJJVCgxKSwgMCk7CitDQ1VfTVVY
X0RJVl9HQVRFX0RFRklORShyY3B1Ml9wd20yX2NsaywgcmNwdTJfcHdtX3BhcmVudHMsIFJDUFUy
X1BXTTJfQ0xLX1JTVCwgOCwgMTEsIDQsIDIsCisJCQlCSVQoMSksIDApOworQ0NVX01VWF9ESVZf
R0FURV9ERUZJTkUocmNwdTJfcHdtM19jbGssIHJjcHUyX3B3bV9wYXJlbnRzLCBSQ1BVMl9QV00z
X0NMS19SU1QsIDgsIDExLCA0LCAyLAorCQkJQklUKDEpLCAwKTsKK0NDVV9NVVhfRElWX0dBVEVf
REVGSU5FKHJjcHUyX3B3bTRfY2xrLCByY3B1Ml9wd21fcGFyZW50cywgUkNQVTJfUFdNNF9DTEtf
UlNULCA4LCAxMSwgNCwgMiwKKwkJCUJJVCgxKSwgMCk7CitDQ1VfTVVYX0RJVl9HQVRFX0RFRklO
RShyY3B1Ml9wd201X2NsaywgcmNwdTJfcHdtX3BhcmVudHMsIFJDUFUyX1BXTTVfQ0xLX1JTVCwg
OCwgMTEsIDQsIDIsCisJCQlCSVQoMSksIDApOworQ0NVX01VWF9ESVZfR0FURV9ERUZJTkUocmNw
dTJfcHdtNl9jbGssIHJjcHUyX3B3bV9wYXJlbnRzLCBSQ1BVMl9QV002X0NMS19SU1QsIDgsIDEx
LCA0LCAyLAorCQkJQklUKDEpLCAwKTsKK0NDVV9NVVhfRElWX0dBVEVfREVGSU5FKHJjcHUyX3B3
bTdfY2xrLCByY3B1Ml9wd21fcGFyZW50cywgUkNQVTJfUFdNN19DTEtfUlNULCA4LCAxMSwgNCwg
MiwKKwkJCUJJVCgxKSwgMCk7CitDQ1VfTVVYX0RJVl9HQVRFX0RFRklORShyY3B1Ml9wd204X2Ns
aywgcmNwdTJfcHdtX3BhcmVudHMsIFJDUFUyX1BXTThfQ0xLX1JTVCwgOCwgMTEsIDQsIDIsCisJ
CQlCSVQoMSksIDApOworQ0NVX01VWF9ESVZfR0FURV9ERUZJTkUocmNwdTJfcHdtOV9jbGssIHJj
cHUyX3B3bV9wYXJlbnRzLCBSQ1BVMl9QV005X0NMS19SU1QsIDgsIDExLCA0LCAyLAorCQkJQklU
KDEpLCAwKTsKKy8qIFJDUFUyIGNsb2NrcyBlbmQgKi8KKwogc3RhdGljIHN0cnVjdCBjbGtfaHcg
KmsxX2NjdV9wbGxfaHdzW10gPSB7CiAJW0NMS19QTEwxXQkJPSAmcGxsMS5jb21tb24uaHcsCiAJ
W0NMS19QTEwyXQkJPSAmcGxsMi5jb21tb24uaHcsCkBAIC05ODEsOCArMTAwOCwyMyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHNwYWNlbWl0X2NjdV9kYXRhIGsxX2NjdV9yY3B1X2RhdGEgPSB7CiAJ
LnJlc2V0X25hbWUJPSAiazEtcmNwdS1yZXNldCIsCiB9OwogCitzdGF0aWMgc3RydWN0IGNsa19o
dyAqazFfY2N1X3JjcHUyX2h3c1tdID0geworCVtDTEtfUkNQVTJfUFdNMF0JPSAmcmNwdTJfcHdt
MF9jbGsuY29tbW9uLmh3LAorCVtDTEtfUkNQVTJfUFdNMV0JPSAmcmNwdTJfcHdtMV9jbGsuY29t
bW9uLmh3LAorCVtDTEtfUkNQVTJfUFdNMl0JPSAmcmNwdTJfcHdtMl9jbGsuY29tbW9uLmh3LAor
CVtDTEtfUkNQVTJfUFdNM10JPSAmcmNwdTJfcHdtM19jbGsuY29tbW9uLmh3LAorCVtDTEtfUkNQ
VTJfUFdNNF0JPSAmcmNwdTJfcHdtNF9jbGsuY29tbW9uLmh3LAorCVtDTEtfUkNQVTJfUFdNNV0J
PSAmcmNwdTJfcHdtNV9jbGsuY29tbW9uLmh3LAorCVtDTEtfUkNQVTJfUFdNNl0JPSAmcmNwdTJf
cHdtNl9jbGsuY29tbW9uLmh3LAorCVtDTEtfUkNQVTJfUFdNN10JPSAmcmNwdTJfcHdtN19jbGsu
Y29tbW9uLmh3LAorCVtDTEtfUkNQVTJfUFdNOF0JPSAmcmNwdTJfcHdtOF9jbGsuY29tbW9uLmh3
LAorCVtDTEtfUkNQVTJfUFdNOV0JPSAmcmNwdTJfcHdtOV9jbGsuY29tbW9uLmh3LAorfTsKKwog
c3RhdGljIGNvbnN0IHN0cnVjdCBzcGFjZW1pdF9jY3VfZGF0YSBrMV9jY3VfcmNwdTJfZGF0YSA9
IHsKIAkucmVzZXRfbmFtZQk9ICJrMS1yY3B1Mi1yZXNldCIsCisJLmh3cwkJPSBrMV9jY3VfcmNw
dTJfaHdzLAorCS5udW0JCT0gQVJSQVlfU0laRShrMV9jY3VfcmNwdTJfaHdzKSwKIH07CiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgc3BhY2VtaXRfY2N1X2RhdGEgazFfY2N1X2FwYmMyX2RhdGEgPSB7
Ci0tIAoyLjQ3LjMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
