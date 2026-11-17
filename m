Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA58606A33F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 21:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ikxdt3Jh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=HhTZP2CC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yu6tqY3hTPdtXBLaEM3NHLpBugaLvSgqb3o5c4qgWAk=; b=ikxdt3JhY361OA4VUwlsowp8Ba
	Q8KtCeOpW/+J1J1A5bC//WJvdOS4BrKi2IGL2ICBMsKHZwdndupdLT+/YbXNEbugurn8wtdJqF+DF
	kW41FzNF1v21N/1k4LDyG6iq4INWK7mI8vt0X90c3Wn9r5kUZ3vlTP0mRdYoI56wDm5SoX+NuCuSy
	v/FrNa5pV78w1EAuDn+N9wG3QHejW0vSkgly3SKJPN54ofiIXdEv66vavLTfYzXnFyBXheUBZ3Ezd
	yDyxB5fLTY46i9s8bKa0tqwb2D5Jseypg5UyxzjZ/DP1+coquA6mq4jXh8T9/t1tQujPPYXGlaGcM
	KtgMJNCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQIY-00000007437-3h6r;
	Tue, 17 Nov 2026 21:01:02 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQIW-000000073zy-47sj
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 21:01:02 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 63EEA20D531A;
	Tue, 17 Nov 2026 22:00:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 42E0320D4DE5;
	Tue, 17 Nov 2026 22:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 42E0320D4DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794949259;
	bh=79OIXfIsBYtCzhqjtjT5JmD6bsEywr7cWxOeYpj9/3I=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=HhTZP2CCXyGKEnGrVW1AMyoqWRYY4gvuQT0syrcDyOS4V+msempD7LDKU2Xfr2WVO
	 y0tr7vX7DRmqvCuIoo/grWYWTGcrK1SImwcGDT14deyGD4V8cxt+JT4QqnJyRRJFXI
	 WZi3nngoK150nniPAxMBSVCcHvQoaNoAr375TDEgnxW9eC6buIx6ZAUCmtMmKcmrNU
	 58SQZvIZRuUMqerIgcl441wFTrFqc3+/BmCFozU/X9p8tBOeZv70CjTQT4CW49yjLz
	 KrP5BAM/nHizCEH3yuONAL4ulJrW5B/g8EbHxR/T2b1gtncl4RN1UObkriMcoBedUa
	 OgBc96YNQ+S/g==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id Xmq_IYexV-t8; Tue, 17 Nov 2026 22:00:59 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 18EC720D531A;
	Tue, 17 Nov 2026 22:00:58 +0100 (CET)
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
Subject: [PATCH 5/6] riscv: dts: spacemit: k1-bananapi-f3: Add PWM fan
Date: Tue, 17 Nov 2026 21:59:50 +0100
Message-ID: <20261117205951.140146-6-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117205951.140146-1-frederic.mahe@cirad.fr>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_130101_195804_DC68BAD6 
X-CRM114-Status: UNSURE (   9.90  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIGZhbiBoZWFkZXIgKEoyNykgaGFzIGEgUFdNIGxpbmUgZHJpdmVuIGJ5IEdQSU8gNzkgaW4g
aXRzIFJDUFUyClBXTTIgZnVuY3Rpb24uIEFkZCB0aGUgcGluIGdyb3VwLCB0aGUgZmFuIHdpdGgg
dGhlIHZlbmRvcidzIGZvdXIKbGV2ZWxzIGF0IDEwMCBrSHosIGFuZCBhY3RpdmUgdHJpcHMgb24g
dGhlIHBhY2thZ2Ugc2Vuc29yIGF0IDQwLCA1NSwKNzAgYW5kIDg1IEMsIGFzIGluIHRoZSB2ZW5k
b3IgRFQuCgpUZXN0ZWQgb24gYSBCUEktRjM6IEoyNyBwaW4gMyBhdmVyYWdlcyAwLjg2LCAxLjc2
LCAyLjc0IGFuZCA0LjY2IFYKZm9yIDI1LCA1MCwgNzUgYW5kIDEwMCUgZHV0eSAobXVsdGltZXRl
ciwgMC4wNCBWIG9mZiksIGFuZCB0aGUgZmFuCmdvZXMgdG8gbGV2ZWwgMSB3aGVuIHRoZSBwYWNr
YWdlIHJlYWNoZXMgNDAgQyB1bmRlciBsb2FkLgoKV3JpdHRlbiB3aXRoIGhlbHAgZnJvbSBDbGF1
ZGUgKEFudGhyb3BpYyk7IHJldmlld2VkIGFuZCB0ZXN0ZWQgb24gaGFyZHdhcmUuCgpTaWduZWQt
b2ZmLWJ5OiBGcsOpZMOpcmljIE1haMOpIDxmcmVkZXJpYy5tYWhlQGNpcmFkLmZyPgotLS0KIC4u
Li9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMgICAgICB8IDYzICsrKysrKysr
KysrKysrKysrKysKIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtcGluY3RybC5kdHNp
ICB8ICA3ICsrKwogMiBmaWxlcyBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMgYi9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cwppbmRleCA1ODAzNWQ4
ODYuLmU2OTI4OWNjMCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9r
MS1iYW5hbmFwaS1mMy5kdHMKKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1i
YW5hbmFwaS1mMy5kdHMKQEAgLTM3LDYgKzM3LDEzIEBAIGxlZDEgewogCQl9OwogCX07CiAKKwlm
YW46IHB3bS1mYW4geworCQljb21wYXRpYmxlID0gInB3bS1mYW4iOworCQlwd21zID0gPCZycHdt
MiAwIDEwMDAwIDA+OworCQljb29saW5nLWxldmVscyA9IDwwIDY0IDEyOCAxOTIgMjU1PjsKKwkJ
I2Nvb2xpbmctY2VsbHMgPSA8Mj47CisJfTsKKwogCXBjaWVfdmNjXzN2MzogcmVndWxhdG9yLXBj
aWUtdmNjM3YzIHsKIAkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwogCQlyZWd1bGF0
b3ItbmFtZSA9ICJQQ0lFX1ZDQzNWMyI7CkBAIC00MjcsMyArNDM0LDU5IEBAICZzZGhjaTAgewog
CXNkLXVocy1zZHIxMDQ7CiAJc3RhdHVzID0gIm9rYXkiOwogfTsKKworJnJwd20yIHsKKwlwaW5j
dHJsLW5hbWVzID0gImRlZmF1bHQiOworCXBpbmN0cmwtMCA9IDwmcnB3bTJfMF9jZmc+OworCXN0
YXR1cyA9ICJva2F5IjsKK307CisKKyZ7L3RoZXJtYWwtem9uZXMvcGFja2FnZS10aGVybWFsfSB7
CisJdHJpcHMgeworCQlwYWNrYWdlX2ZhbjA6IHBhY2thZ2UtZmFuMCB7CisJCQl0ZW1wZXJhdHVy
ZSA9IDw0MDAwMD47CisJCQloeXN0ZXJlc2lzID0gPDUwMDA+OworCQkJdHlwZSA9ICJhY3RpdmUi
OworCQl9OworCisJCXBhY2thZ2VfZmFuMTogcGFja2FnZS1mYW4xIHsKKwkJCXRlbXBlcmF0dXJl
ID0gPDU1MDAwPjsKKwkJCWh5c3RlcmVzaXMgPSA8NTAwMD47CisJCQl0eXBlID0gImFjdGl2ZSI7
CisJCX07CisKKwkJcGFja2FnZV9mYW4yOiBwYWNrYWdlLWZhbjIgeworCQkJdGVtcGVyYXR1cmUg
PSA8NzAwMDA+OworCQkJaHlzdGVyZXNpcyA9IDw1MDAwPjsKKwkJCXR5cGUgPSAiYWN0aXZlIjsK
KwkJfTsKKworCQlwYWNrYWdlX2ZhbjM6IHBhY2thZ2UtZmFuMyB7CisJCQl0ZW1wZXJhdHVyZSA9
IDw4NTAwMD47CisJCQloeXN0ZXJlc2lzID0gPDUwMDA+OworCQkJdHlwZSA9ICJhY3RpdmUiOwor
CQl9OworCX07CisKKwljb29saW5nLW1hcHMgeworCQltYXAwIHsKKwkJCXRyaXAgPSA8JnBhY2th
Z2VfZmFuMD47CisJCQljb29saW5nLWRldmljZSA9IDwmZmFuIDAgMT47CisJCX07CisKKwkJbWFw
MSB7CisJCQl0cmlwID0gPCZwYWNrYWdlX2ZhbjE+OworCQkJY29vbGluZy1kZXZpY2UgPSA8JmZh
biAxIDI+OworCQl9OworCisJCW1hcDIgeworCQkJdHJpcCA9IDwmcGFja2FnZV9mYW4yPjsKKwkJ
CWNvb2xpbmctZGV2aWNlID0gPCZmYW4gMiAzPjsKKwkJfTsKKworCQltYXAzIHsKKwkJCXRyaXAg
PSA8JnBhY2thZ2VfZmFuMz47CisJCQljb29saW5nLWRldmljZSA9IDwmZmFuIDMgND47CisJCX07
CisJfTsKK307CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLXBp
bmN0cmwuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtcGluY3RybC5kdHNp
CmluZGV4IDhjNTdjYTA1ZC4uMWYzMWYzMTc3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NwYWNlbWl0L2sxLXBpbmN0cmwuZHRzaQorKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nw
YWNlbWl0L2sxLXBpbmN0cmwuZHRzaQpAQCAtNTg3LDYgKzU4NywxMyBAQCBwd20xNC0xLXBpbnMg
ewogCQl9OwogCX07CiAKKwlycHdtMl8wX2NmZzogcnB3bTItMC1jZmcgeworCQlycHdtMi0wLXBp
bnMgeworCQkJcGlubXV4ID0gPEsxX1BBRENPTkYoNzksIDIpPjsKKwkJCWJpYXMtcHVsbC1kb3du
OworCQl9OworCX07CisKIAlzc3AzXzBfY2ZnOiBzc3AzLTAtY2ZnIHsKIAkJc3NwMy0wLXBpbnMg
ewogCQkJcGlubXV4ID0gPEsxX1BBRENPTkYoNzUsIDIpPiwJLyogU0NMSyAqLwotLSAKMi40Ny4z
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
