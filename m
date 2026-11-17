Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B11606A330
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 21:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nEty0XMg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=L1hcJN3x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oJQHnpBOC0I6oOxBhXqbbCesrueBcRkqScyy4deLMJo=; b=nEty0XMg3HF/wt/sFYOeByE4Z6
	T9FB1VHtNLDnsw5aHpTJadzYVSf2CE5G3xrYhWebw9kxdLwNV4IAbpODSqBVEAzinMF7OLzp8sAdH
	QLpCOcNuB9hxNfY6iK/udyp41u17RTqxm1oHqe7h5pYa18l1VbwWeZzIn1i9Cm2VwCrlBi3vOxRFF
	2xHElNaaFE1+v/jP1l5lElaZooraE23IDhOmM6dp68rIRqMhO4RGMcV75VWp1JaD2M5vBl3Vhetgf
	+t5gOIhfytzDNMNpZr26kFx2elb8l9BFqIuGZWapt6OSvg7HHikXR8g3ercHg8cfRptgMLq2/k+e7
	GjpO3i8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQIc-0000000746M-482S;
	Tue, 17 Nov 2026 21:01:06 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQIY-0000000741I-1AlM
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 21:01:03 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id A77C220D4EBD;
	Tue, 17 Nov 2026 22:01:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 8684D20D4D62;
	Tue, 17 Nov 2026 22:01:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 8684D20D4D62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794949260;
	bh=4G4OsBpiP4ESq1H97D1AsDisbDduik4VQ3HIzmTyFjc=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=L1hcJN3xIte0izs4ee+2ObDPkGJIxTFTV1AMtVdEOqHoc3XmPfGcRA6z05YXVjEpi
	 eTBvRjVOWM2AVvt829Z1G7Q8NlDzDRQx+Igd7/h9DsGOwdkUCnKDe17t0b299qvS5C
	 6CApAEDNhkpvedT3VhIXvhV7WCkrPBMjQipsyqA3VO4R09vC51moPajad5kRToScY/
	 YTv9lEkMtLLFQMDNkhjjnfXIRuMAd+5wFKekdwrXJ0+ww7ZhurrOW17lZppAPh96a8
	 mW3M++c63XLWloL90qGL5m2l8QXQ2aYIrj3uhX3lwdjxizkLVGuVpfuuVz71Iyyt0W
	 92QSz5LRaIX3w==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id bGhBTA95vChK; Tue, 17 Nov 2026 22:01:00 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 3FE5020D4EBD;
	Tue, 17 Nov 2026 22:00:59 +0100 (CET)
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
Subject: [PATCH 6/6] riscv: defconfig: Enable PWM fan support
Date: Tue, 17 Nov 2026 21:59:51 +0100
Message-ID: <20261117205951.140146-7-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117205951.140146-1-frederic.mahe@cirad.fr>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_130102_469942_98033B01 
X-CRM114-Status: UNSURE (   7.54  )
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

QnVpbGQgcHdtLWZhbiBhcyBhIG1vZHVsZSwgdXNlZCBieSB0aGUgQmFuYW5hIFBpIEJQSS1GMyBm
YW4uCgpXcml0dGVuIHdpdGggaGVscCBmcm9tIENsYXVkZSAoQW50aHJvcGljKTsgcmV2aWV3ZWQg
YW5kIHRlc3RlZCBvbiBoYXJkd2FyZS4KClNpZ25lZC1vZmYtYnk6IEZyw6lkw6lyaWMgTWFow6kg
PGZyZWRlcmljLm1haGVAY2lyYWQuZnI+Ci0tLQogYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZp
ZyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZyBiL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcK
aW5kZXggMDRhZTMwNWQ1Li5kMjQ0ZTgwNmYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvY29uZmln
cy9kZWZjb25maWcKKysrIGIvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZwpAQCAtMTc4LDYg
KzE3OCw3IEBAIENPTkZJR19HUElPX1NQQUNFTUlUX0sxPXkKIENPTkZJR19HUElPX1BDQTk1M1g9
bQogQ09ORklHX0dQSU9fUENBOTUzWF9JUlE9eQogQ09ORklHX1BPV0VSX1JFU0VUX0dQSU9fUkVT
VEFSVD15CitDT05GSUdfU0VOU09SU19QV01fRkFOPW0KIENPTkZJR19TRU5TT1JTX1NGQ1RFTVA9
bQogQ09ORklHX0NQVV9USEVSTUFMPXkKIENPTkZJR19ERVZGUkVRX1RIRVJNQUw9eQotLSAKMi40
Ny4zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
