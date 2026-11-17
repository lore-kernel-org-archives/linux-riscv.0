Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E207606A335
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 21:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SoQmj3df;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=lT5yxuwr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WGzEJ3BZBn+OTGpKAJNopGpwwIfS4LBTr56qujHPeIk=; b=SoQmj3dfK54Lo3zLT2Y92gx6SD
	9sOOVK29KHm4eDhl7rTHoxs7WJBWzSvxtOwczGz2CcodfBUwsice4+2N84v163czUJGIlJQyRKLmy
	bm3Gu59iUb6m9w54wAtO+ViKyaa2KxfrdgZBlTw06U1Vp4n4iwAFq91NrgBPfLlScZwU0ZdZaR0h2
	hmX5+9BVJgI2bWW/2tubKenYRc1FSKeye3+A5/ET0qauh7jBnuFYEItgu7yPbcsNj0jQbikUuDmsR
	Db9NiWNNTLLNNaajv7iQgLQ40+jK/nvMWp8HpNEqc+e+spEYCXrkyeN4c5F1fDVuUS3WbNxpdmbAk
	q0WwcqfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQIR-000000073yD-2CiW;
	Tue, 17 Nov 2026 21:00:55 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQIP-000000073xK-0kjc
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 21:00:54 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 765FD20D78CF;
	Tue, 17 Nov 2026 22:00:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 4406020D556E;
	Tue, 17 Nov 2026 22:00:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 4406020D556E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794949251;
	bh=cBPXI6LEpLwntDX1+2Poix+I2lZgirJA88Apc29UVrM=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=lT5yxuwrxJSF+u0qlWNXw7HkIMVGehZzeU/Jk3cOgjdxghmXkuOTXmJHD3IZdcQcW
	 JctVOJ72lWTC99ZgGAwQ3MXz3GDK9H0Ez41d/SNfgmfaZAab7RunQZ+F1fffneuh/X
	 Fd4Y6vPGiGM++r4bOqkoTct8GTNW1nU6PBwfMpfaeEhjdn9KgKlCY9FJJH/x6Ndjnr
	 eQQgURlRdpsu6x2R57nRrokhG0tRXComZw/Fm2WfexFuIrHNuX8yjbsZIXP35Cipra
	 6edrQtRmcb1vYhrEupifRPaKitc/vuGR+/M/7JeD3pWI/V3OFicNKuClpciN5vl2cz
	 cgpV8KVFHJu6A==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id b--yicO4KfRK; Tue, 17 Nov 2026 22:00:51 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id D80D720D78CF;
	Tue, 17 Nov 2026 22:00:49 +0100 (CET)
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
Subject: [PATCH 1/6] dt-bindings: clock: spacemit: k1: Add RCPU2 PWM clocks
Date: Tue, 17 Nov 2026 21:59:46 +0100
Message-ID: <20261117205951.140146-2-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117205951.140146-1-frederic.mahe@cirad.fr>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_130053_385928_32641F26 
X-CRM114-Status: UNSURE (   8.26  )
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

QWRkIElEcyBmb3IgdGhlIHRlbiBQV00gY2xvY2tzIG9mIHRoZSBLMSBSQ1BVMiBzeXN0ZW0gY29u
dHJvbGxlci4KCldyaXR0ZW4gd2l0aCBoZWxwIGZyb20gQ2xhdWRlIChBbnRocm9waWMpOyByZXZp
ZXdlZCBhbmQgdGVzdGVkIG9uIGhhcmR3YXJlLgoKU2lnbmVkLW9mZi1ieTogRnLDqWTDqXJpYyBN
YWjDqSA8ZnJlZGVyaWMubWFoZUBjaXJhZC5mcj4KLS0tCiBpbmNsdWRlL2R0LWJpbmRpbmdzL2Ns
b2NrL3NwYWNlbWl0LGsxLXN5c2Nvbi5oIHwgMTIgKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xv
Y2svc3BhY2VtaXQsazEtc3lzY29uLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3NwYWNl
bWl0LGsxLXN5c2Nvbi5oCmluZGV4IDBmOGI1OWQ2Ny4uMjlkNDc4Nzc0IDEwMDY0NAotLS0gYS9p
bmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3NwYWNlbWl0LGsxLXN5c2Nvbi5oCisrKyBiL2luY2x1
ZGUvZHQtYmluZGluZ3MvY2xvY2svc3BhY2VtaXQsazEtc3lzY29uLmgKQEAgLTM3MCw2ICszNzAs
MTggQEAKICNkZWZpbmUgUkVTRVRfUkNQVV9VQVJUMAk1CiAjZGVmaW5lIFJFU0VUX1JDUFVfSERN
SV9BVURJTwk2CiAKKy8qCVJDUFUyIGNsb2NrcwkqLworI2RlZmluZSBDTEtfUkNQVTJfUFdNMAkJ
MAorI2RlZmluZSBDTEtfUkNQVTJfUFdNMQkJMQorI2RlZmluZSBDTEtfUkNQVTJfUFdNMgkJMgor
I2RlZmluZSBDTEtfUkNQVTJfUFdNMwkJMworI2RlZmluZSBDTEtfUkNQVTJfUFdNNAkJNAorI2Rl
ZmluZSBDTEtfUkNQVTJfUFdNNQkJNQorI2RlZmluZSBDTEtfUkNQVTJfUFdNNgkJNgorI2RlZmlu
ZSBDTEtfUkNQVTJfUFdNNwkJNworI2RlZmluZSBDTEtfUkNQVTJfUFdNOAkJOAorI2RlZmluZSBD
TEtfUkNQVTJfUFdNOQkJOQorCiAvKglSQ1BVMiByZXNldHMJKi8KICNkZWZpbmUgUkVTRVRfUkNQ
VTJfUFdNMAkwCiAjZGVmaW5lIFJFU0VUX1JDUFUyX1BXTTEJMQotLSAKMi40Ny4zCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
