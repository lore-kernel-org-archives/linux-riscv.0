Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E05C47DB3
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 18:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QxPXTcxDC0Q0kQFZvv/1PAouPFWO8CuZNIKvl701wmQ=; b=Qf8clZCvY3NHZW
	qTE7NulmxsnhcfJO83EP/bB+odkmjnPNIN2eshBnJAXbXZC5JWnRXw6X9qCpwrdvIgTMB4D5oo8sE
	AmYQNVOTAAmSkda2+9Y9GWKS+d1a7fN1srFuYKx3JwvzII76DK/8K5D0tKJYhjaTU+TKtgpeGxpM7
	Jtr9vi5css7lgJiUs9RpCJwc9fIKFH5m6nKeqFlej5pqcIaxh+jptHIXEPWbpNUTu2TveULb4+EX0
	Do1I1KKjJcurga+6OLp4aAjdpVRPq9sjjwp3dXg9KX4HiPTh7kbGBht+DL4PlUS7sq5juIiPYHCIQ
	uOGlXkiFj20k/nDoeGrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUWTP-0000000DxBO-0QiH;
	Mon, 29 Jan 2024 18:35:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUWTM-0000000Dx99-2WwC
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 18:35:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D9585CE1254;
	Mon, 29 Jan 2024 18:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755CDC433C7;
	Mon, 29 Jan 2024 18:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706553306;
	bh=H2EIKyHNqt/QqyCRuOiVadg27WBq+mf8PQAQyZ6TLnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FZkIbB1N9HObInVhKp21/DeVATaGOy3hrLvC7goSDEwZFWt+fZPu0NxN9b3yZkrVH
	 JfZcs1TQJtvwPVxkqSDVy/pj7PzyGmuqVoGI9AovglyuyKiCUy8yACXb0k4YQFQdzV
	 c3bhA8mSXpOU5ps5o+Y4+159rL8z5o7PMSDFzN3HCg5ZoRMMl1RYgMMomxj3BUmC+j
	 OP9CX57/+amLYkOtIJ6J9Le1WmnF3zc4Kd6OmQnr6CObmLiuxtrWtQyHeHE//qYxAk
	 LFYSRqBEDjFR8ktO0ZUDJptlSrItC3AIXhfR09xn/f9HsIggOhMlxiiypTyPUSaPc/
	 rvqKj4SClNtZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	shuah@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	bjorn@rivosinc.com,
	andy.chiu@sifive.com,
	conor.dooley@microchip.com,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.7 06/12] tools: selftests: riscv: Fix compile warnings in vector tests
Date: Mon, 29 Jan 2024 13:34:15 -0500
Message-ID: <20240129183440.463998-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129183440.463998-1-sashal@kernel.org>
References: <20240129183440.463998-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_103509_025913_70753F49 
X-CRM114-Status: GOOD (  11.21  )
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

RnJvbTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+Cgpb
IFVwc3RyZWFtIGNvbW1pdCBlMWJhZjVlNjhlZDEyOGMxZTIyYmE0M2U1MTkwNTI2ZDg1ZGUzMjNj
IF0KCkdDQyBwcmludHMgYSBjb3VwbGUgb2YgZm9ybWF0IHN0cmluZyB3YXJuaW5ncyB3aGVuIGNv
bXBpbGluZwp0aGUgdmVjdG9yIHRlc3RzLiBMZXQncyBmb2xsb3cgdGhlIHJlY29tbWVuZGF0aW9u
IGluCkRvY3VtZW50YXRpb24vcHJpbnRrLWZvcm1hdHMudHh0IHRvIGZpeCB0aGVzZSB3YXJuaW5n
cy4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVy
QHZydWxsLmV1PgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3Np
bmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNv
bT4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIzMTEyMzE4NTgyMS4yMjcyNTA0
LTUtY2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1ClNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2Fz
aGFsQGtlcm5lbC5vcmc+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9y
L3ZfaW5pdHZhbF9ub2xpYmMuYyB8IDIgKy0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2
L3ZlY3Rvci92c3RhdGVfcHJjdGwuYyAgICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci92X2luaXR2YWxfbm9saWJjLmMgYi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3Ivdl9pbml0dmFsX25vbGliYy5jCmluZGV4IDY2NzY0ZWRi
MGQ1Mi4uMWRkOTQxOTdkYTMwIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9y
aXNjdi92ZWN0b3Ivdl9pbml0dmFsX25vbGliYy5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL3Jpc2N2L3ZlY3Rvci92X2luaXR2YWxfbm9saWJjLmMKQEAgLTI3LDcgKzI3LDcgQEAgaW50
IG1haW4odm9pZCkKIAogCWRhdGFwID0gbWFsbG9jKE1BWF9WU0laRSk7CiAJaWYgKCFkYXRhcCkg
ewotCQlrc2Z0X3Rlc3RfcmVzdWx0X2ZhaWwoImZhaWwgdG8gYWxsb2NhdGUgbWVtb3J5IGZvciBz
aXplID0gJWx1XG4iLCBNQVhfVlNJWkUpOworCQlrc2Z0X3Rlc3RfcmVzdWx0X2ZhaWwoImZhaWwg
dG8gYWxsb2NhdGUgbWVtb3J5IGZvciBzaXplID0gJWRcbiIsIE1BWF9WU0laRSk7CiAJCWV4aXQo
LTEpOwogCX0KIApkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVj
dG9yL3ZzdGF0ZV9wcmN0bC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9y
L3ZzdGF0ZV9wcmN0bC5jCmluZGV4IGIzNDhiNDc1YmU1Ny4uOGFkOTRlMDhmZjRkIDEwMDY0NAot
LS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX3ByY3RsLmMK
KysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yL3ZzdGF0ZV9wcmN0bC5j
CkBAIC02OCw3ICs2OCw3IEBAIGludCB0ZXN0X2FuZF9jb21wYXJlX2NoaWxkKGxvbmcgcHJvdmlk
ZWQsIGxvbmcgZXhwZWN0ZWQsIGludCBpbmhlcml0KQogCX0KIAlyYyA9IGxhdW5jaF90ZXN0KGlu
aGVyaXQpOwogCWlmIChyYyAhPSBleHBlY3RlZCkgewotCQlrc2Z0X3Rlc3RfcmVzdWx0X2ZhaWwo
IlRlc3QgZmFpbGVkLCBjaGVjayAlZCAhPSAlZFxuIiwgcmMsCisJCWtzZnRfdGVzdF9yZXN1bHRf
ZmFpbCgiVGVzdCBmYWlsZWQsIGNoZWNrICVkICE9ICVsZFxuIiwgcmMsCiAJCQkJICAgICAgZXhw
ZWN0ZWQpOwogCQlyZXR1cm4gLTI7CiAJfQpAQCAtODcsNyArODcsNyBAQCBpbnQgbWFpbih2b2lk
KQogCXBhaXIua2V5ID0gUklTQ1ZfSFdQUk9CRV9LRVlfSU1BX0VYVF8wOwogCXJjID0gcmlzY3Zf
aHdwcm9iZSgmcGFpciwgMSwgMCwgTlVMTCwgMCk7CiAJaWYgKHJjIDwgMCkgewotCQlrc2Z0X3Rl
c3RfcmVzdWx0X2ZhaWwoImh3cHJvYmUoKSBmYWlsZWQgd2l0aCAlZFxuIiwgcmMpOworCQlrc2Z0
X3Rlc3RfcmVzdWx0X2ZhaWwoImh3cHJvYmUoKSBmYWlsZWQgd2l0aCAlbGRcbiIsIHJjKTsKIAkJ
cmV0dXJuIC0xOwogCX0KIAotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
