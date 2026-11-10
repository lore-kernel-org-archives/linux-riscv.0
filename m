Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D21F606A338
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 12:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2B1E2kc7;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WkBWW6mI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=z9A+0/N9I1kxz1juJL6RfouOjOccsKEAvYa7BVTLW74=; b=2B1E2kc7jpD9J2ou1uy+UvQIDn
	43xTnb1/VsiUF6NDX5PbLoKDC2X966M36Am17giPqE56nSGjGkc4PBKAns86lZQBcnplb+iNI8/+G
	oQO/MiPlJxfeZAYh4jfsp8TCrEOEzRK5ZLUZzgshDdgQ0V7faZnaYLsL+FXRHVaO38l3do0PYRixp
	vI/iSK8Of7zdG1WRPgoSt4OpFSCJnBxmiMIuc9Y/8+P/+eyBRElTMRcrfn9MOXWdj+WJ+sGe6lVV7
	rzq3W+ti+kpYZnmixWfPLAqiYkW8hQJc6+22weoASBoc/aPnQpCEOFdAxYpXbbm+rqcVj393RfroX
	Ovk15Icg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkce-00000003k1o-0lUQ;
	Tue, 10 Nov 2026 12:06:44 +0000
Received: from out-73.mta0.migadu.com ([2001:41d0:1004:224b::49] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkca-00000003k1C-0foI
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 12:06:42 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=zq6T5FEiS/ooPwkdYAcpw4I0eAME7DtKjoHVyZoL4Dw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794312397; v=1; x=1794917197;
 b=WkBWW6mIvo3sbw4OZbi9wfE9APdcOJ3h+mokN82+D13u/meX8gKwTlJotKXe8f5Xcaj0xK2P
 J4NRVbXW4pNFnTCJ/RQFvpBGib0xRAIdgvOJeNvuiBQq7zUziEq7rhrdY+WThaxxdG0osfP5jh0
 kAMEgogEq8egTEdGqlMUgahQ=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id 4570ccddd39c8d0b;
	Tue, 10 Nov 2026 12:06:37 +0000
X-Mizu-Trace-ID: 4570ccddd39c8d0b
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Subject: [PATCH v2 0/2] irqchip/riscv-aplic: Use trigger specific flow
 handlers in MSI mode
Date: Tue, 10 Nov 2026 12:06:28 +0000
Message-Id: <20261110-aplic-affinity-fix-v2-0-6c143b8b4e8c@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6DIBREr2L+ujQgatVV79G4QPjW3xg0oERjv
 HvRbrt8k5l5O3h0hB7qZAeHgTyNNkJ6S0D3yr6RkYkMKU8LXvGKqWkgzVTXkaV5Yx2trOQqayV
 vDZcIcTg5jPF1+mp+7Jf2g3o+n85GT34e3XZZgzh7l0AInv0TBMEEw1yW2jwKzAv5HMgu691gg
 OY4ji8Nck1RxgAAAA==
X-Change-ID: 20260909-aplic-affinity-fix-80a4b30bd03e
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1846;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=zq6T5FEiS/ooPwkdYAcpw4I0eAME7DtKjoHVyZoL4Dw=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmfOY5fYdw65e9kjZ7/a1z8NxsmVd4vXzx72ctHogJPb
 vH4CMwQ6ChlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZgIz3mG/34R7aIH+3Nfrt09
 nUNfM1KRZWrB6zx3v/uCLdK7fnV11zMyLE79rSb25s3p7XPM/CZ2aP1UkNHPKSju/+D4vGalwLc
 WBgA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_040640_406579_464B198C 
X-CRM114-Status: UNSURE (   9.07  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SW4gTVNJIG1vZGUgdGhlIEFQTElDIGhhbmRsZXMgYWxsIHNvdXJjZXMgd2l0aCBoYW5kbGVfZmFz
dGVvaV9pcnEoKS4KRm9yIGVkZ2UtdHJpZ2dlcmVkIHNvdXJjZXMgdGhpcyBsb3NlcyBhbiBpbnRl
cnJ1cHQgd2hpY2ggYXJyaXZlcyBvbgp0aGUgbmV3IENQVSB3aGlsZSB0aGUgcHJldmlvdXMgb25l
IGlzIHN0aWxsIGJlaW5nIGhhbmRsZWQgYWZ0ZXIgYW4KYWZmaW5pdHkgY2hhbmdlLiBUaGUgZmFz
dGVvaSBmbG93IGFsc28gbmV2ZXIgY2FsbHMgaXJxX2FjaygpLCB3aGVyZQpJTVNJQyBhcHBsaWVz
IGFuIGFmZmluaXR5IGNoYW5nZSBkZWZlcnJlZCB3aGlsZSBhIHByZXZpb3VzIHZlY3RvciBtb3Zl
CndhcyBpbiBmbGlnaHQuIFN1Y2ggYSBjaGFuZ2Ugc3RheXMgcGVuZGluZywgYW5kIGxhdGVyIGFm
ZmluaXR5IGNoYW5nZXMKb2YgdGhlIGludGVycnVwdCBvbmx5IHVwZGF0ZSB0aGUgcGVuZGluZyBt
YXNrLgoKVXNlIGhhbmRsZV9lZGdlX2lycSgpIGZvciBlZGdlLXRyaWdnZXJlZCBzb3VyY2VzIGFu
ZApoYW5kbGVfZmFzdGVvaV9hY2tfaXJxKCkgZm9yIGxldmVsLXRyaWdnZXJlZCBzb3VyY2VzLgoK
LS0tCkNoYW5nZXMgaW4gdjI6Ci0gVXNlIGhhbmRsZV9lZGdlX2lycSgpIGZvciBlZGdlLXRyaWdn
ZXJlZCBzb3VyY2VzIGluc3RlYWQgb2YgY2FsbGluZwogIHRoZSBwYXJlbnQgYWNrIGZyb20gdGhl
IEVPSSBjYWxsYmFjawotIFVzZSBoYW5kbGVfZmFzdGVvaV9hY2tfaXJxKCkgZm9yIGxldmVsLXRy
aWdnZXJlZCBzb3VyY2VzCi0gU3BsaXQgaW50byB0d28gcGF0Y2hlcwotIExpbmsgdG8gdjE6IGh0
dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MTEwNC1hcGxpYy1hZmZpbml0eS1maXgtdjEtMS1l
NTM4Y2Q3NmU1NjNAbGludXguZGV2CgpUbzogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KVG86IFRob21hcyBHbGVpeG5lciA8dGdseEBrZXJuZWwub3JnPgpUbzogUmFkdSBSZW5kZWMg
PHJhZHVAcmVuZGVjLm5ldD4KVG86IFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPgpUbzog
UGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KVG86IEFsYmVydCBPdSA8YW91QGVl
Y3MuYmVya2VsZXkuZWR1PgpUbzogQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPgpUbzog
QmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgpDYzogQW51cCBQYXRlbCA8YXBhdGVs
QHZlbnRhbmFtaWNyby5jb20+CkNjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCkNj
OiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCgotLS0KVHJveSBNaXRjaGVsbCAoMik6CiAg
ICAgIGlycWNoaXAvcmlzY3YtYXBsaWM6IFVzZSBoYW5kbGVfZWRnZV9pcnEoKSBmb3IgZWRnZS10
cmlnZ2VyZWQgTVNJIHNvdXJjZXMKICAgICAgaXJxY2hpcC9yaXNjdi1hcGxpYzogQXBwbHkgcGVu
ZGluZyBhZmZpbml0eSBjaGFuZ2VzIGZvciBsZXZlbCBNU0kgc291cmNlcwoKIGRyaXZlcnMvaXJx
Y2hpcC9LY29uZmlnICAgICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2lycWNoaXAvaXJxLXJp
c2N2LWFwbGljLW1zaS5jIHwgMTkgKysrKysrKysrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2Vk
LCAxOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCi0tLQpiYXNlLWNvbW1pdDogNjYyOGU3
ZDRjNmIyNWM4ZDE4ZjEzNDVlM2EyMGQyMTgyOWFhZTdlNApjaGFuZ2UtaWQ6IDIwMjYwOTA5LWFw
bGljLWFmZmluaXR5LWZpeC04MGE0YjMwYmQwM2UKCkJlc3QgcmVnYXJkcywKLS0gIApUcm95IE1p
dGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LmRldj4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
