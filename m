Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFF9606A33C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3s/MkGEY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=S9JdeNcu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BlW6hGUJq9b4ePGswJrsjihtCv/5b34Rgq6SLqEY4Po=; b=3s/MkGEY91HfHvuAPcuYHxiofY
	C/rdnZdIVFKTweLy9dweUNrptL6b0GtCDCIssjHPeZ+17Yt6QRUO+kGMjeRfzNGt9q1TA3fXnx43A
	IOmS7RQDK0p9Dq5tpWZ+ZAdacRegmN7LcU6N/JgbULwFcIBFSre1v8Lf6zwVcbezEMNjgPCqAXwcC
	LdxGq+QrBZPb5QLnU/TfJpFqhW4D48HluxckP+EXkT4WflIzQLskWDD1byiO9+92cujaZ8SI+NwcF
	DlE2VhMfL+HRcFJrhPWVajxkpRwRlTrJIGFDJB79xgXGn9QCFQSDJYaf5Jdhxq1Gqs/Ig9fGmTYsG
	W1y0MVXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4ul-00000006Ejl-0sX7;
	Wed, 11 Nov 2026 09:46:47 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4uh-00000006Eib-1gZw
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 09:46:44 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id D023320D7CFC;
	Wed, 11 Nov 2026 10:46:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id A5A2320D7CF6;
	Wed, 11 Nov 2026 10:46:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr A5A2320D7CF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794390401;
	bh=fctwqUuDVlumK1xq9MaroNVF6hgHu7zzWTPoB/suOs0=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=S9JdeNcuU6OXTxj/PjBi+PHA6zGmsdQ4CGrsUQWb284zyxKHUBRendE/UtRTpMSX5
	 8RA66tAy2K1KO7ASgT3hyvCRxoSSc0H1S62Na8542AT60F7F7kz/j2zwAuKeqf+5dM
	 S0X1WV0LBtt4VAmVoaoLJ8ge1AKjlqxEvPr6G0qTBeuHzPuxJ8dwWD8XMWHQpxPt1Z
	 t0Mj1sfUohF3c7IztBYhdQxmSPsuyOniYnZH85yzpxXavSFwdqtg373KwgN9df9Ndg
	 STLFnz3cdQ/VhDntyC/FaWcwqlP0H7m8X7PLHdoIb1Su4yXAQVrkTusjtjkb626fWb
	 +3Jl9F9fk4f/w==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id vI7VFCsI6kH7; Wed, 11 Nov 2026 10:46:41 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id B9E8420D7CFC;
	Wed, 11 Nov 2026 10:46:40 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: [PATCH v2 2/2] riscv: dts: spacemit: enable Bluetooth on BPI-F3
Date: Wed, 11 Nov 2026 10:45:57 +0100
Message-ID: <20261111094557.443481-3-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111094557.443481-1-frederic.mahe@cirad.fr>
References: <20261111094557.443481-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_014643_631043_0249DCE8 
X-CRM114-Status: UNSURE (   8.66  )
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

VGhlIEJQSS1GMyBoYXMgYW4gUlRMODg1MkJTIG1vZHVsZSB3aG9zZSBCbHVldG9vdGggcGFydCBp
cyBvbiBVQVJUMiwKd2l0aCBoYXJkd2FyZSBmbG93IGNvbnRyb2wuIEdQSU8gNjMgcG93ZXJzIEJs
dWV0b290aCBvbiBhbmQgR1BJTyA2NAppcyB0aGUgZGV2aWNlIHdha2UgbGluZS4KClRoZSBmaXJt
d2FyZSBjb25maWcgc3dpdGNoZXMgdGhlIFVBUlQgdG8gMS41IE1iYXVkLCBzbyB0YWtlIHRoZSBV
QVJUMgpjbG9jayBmcm9tIHNsb3dfdWFydDIsIHNldCB0byA0OCBNSHouCgpUZXN0ZWQgd2l0aCBh
IGxhcHRvcDogc2NhbiwgcGFpcmluZywgYW5kIGwycGluZyBpbiBib3RoIGRpcmVjdGlvbnMsCmlu
Y2x1ZGluZyBpbmNvbWluZyBjb25uZWN0aW9ucyB3aGlsZSB0aGUgVUFSVCBpcyBydW50aW1lIHN1
c3BlbmRlZC4KQW4gOC1ob3VyIHNvYWsgKGFuIEhDSSBjb21tYW5kIGV2ZXJ5IDIwIHMpIHNob3dl
ZCBubyBlcnJvcnMuCgpUaGlzIHBhdGNoIHdhcyBwcmVwYXJlZCB3aXRoIHRoZSBoZWxwIG9mIGFu
IEFJIGFzc2lzdGFudCAoQ2xhdWRlKSwKd2hpY2ggYWxzbyByYW4gdGhlIHRlc3RzLgoKU2lnbmVk
LW9mZi1ieTogRnLDqWTDqXJpYyBNYWjDqSA8ZnJlZGVyaWMubWFoZUBjaXJhZC5mcj4KLS0tCiBh
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cyB8IDE3ICsrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzIGIvYXJj
aC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMKaW5kZXggNTgwMzVk
ODg2Li5lZDZkNGI3ZjQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQv
azEtYmFuYW5hcGktZjMuZHRzCisrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEt
YmFuYW5hcGktZjMuZHRzCkBAIC0zODMsNiArMzgzLDIzIEBAICZ1YXJ0MCB7CiAJc3RhdHVzID0g
Im9rYXkiOwogfTsKIAorJnVhcnQyIHsKKwlhc3NpZ25lZC1jbG9ja3MgPSA8JnN5c2Nvbl9hcGJj
IENMS19VQVJUMj4sCisJCQkgIDwmc3lzY29uX21wbXUgQ0xLX1NMT1dfVUFSVDI+OworCWFzc2ln
bmVkLWNsb2NrLXBhcmVudHMgPSA8JnN5c2Nvbl9tcG11IENMS19TTE9XX1VBUlQyPjsKKwlhc3Np
Z25lZC1jbG9jay1yYXRlcyA9IDwwPiwgPDQ4MDAwMDAwPjsKKwlwaW5jdHJsLW5hbWVzID0gImRl
ZmF1bHQiOworCXBpbmN0cmwtMCA9IDwmdWFydDJfMF9jZmc+LCA8JnVhcnQyXzBfY3RzX3J0c19j
Zmc+OworCXVhcnQtaGFzLXJ0c2N0czsKKwlzdGF0dXMgPSAib2theSI7CisKKwlibHVldG9vdGgg
eworCQljb21wYXRpYmxlID0gInJlYWx0ZWsscnRsODg1MmJzLWJ0IiwgInJlYWx0ZWsscnRsODgy
MmNzLWJ0IjsKKwkJZW5hYmxlLWdwaW9zID0gPCZncGlvIEsxX0dQSU8oNjMpIEdQSU9fQUNUSVZF
X0hJR0g+OworCQlkZXZpY2Utd2FrZS1ncGlvcyA9IDwmZ3BpbyBLMV9HUElPKDY0KSBHUElPX0FD
VElWRV9ISUdIPjsKKwl9OworfTsKKwogJnVzYnBoeTIgewogCXN0YXR1cyA9ICJva2F5IjsKIH07
Ci0tIAoyLjQ3LjMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
