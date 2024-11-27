Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D421AD609CC
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 10:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6lRWMFTxTdtlWVDBRJm8GRlgZPjvMAjgsArJwjzVP40=; b=xnZMdy1fW3dPJp
	KlblnFJibEo+Lfb1ntYOZ0RK9fcjHuNXIfENjHcWKoWPN9QhAomke3win2RPVnFg57nbU30bkY/uS
	HY3yoBEszoyhW5Zj3PFIx9DkW03ags5jogHT57z2QNfckzvF6I0dhERtinDzDj6GzW+xVsAHL9kr0
	ziHWgY/XwWyyTuwgN4KYZaJBp4In1V34kwgQHjUT7BVskJ+tpHH5BBTqjcAwzzbfH9KCYrRdueFzS
	Ah04Aywpd2oHQ5EI4aefbpnMMW2Gv5f1RZvIj99tTlrscR3ilD4eufNwCOzqttOs7dK1r+Ab6Irms
	/93OwhDbqhWH2alUU5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGF9e-0000000CpBH-2w8l;
	Wed, 27 Nov 2024 10:20:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGF7T-0000000Cooi-2DXy
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 10:18:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BE405C5972;
	Wed, 27 Nov 2024 10:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6599EC4CECC;
	Wed, 27 Nov 2024 10:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732702682;
	bh=D3cgGvnrdPxZeZ3kksJOk9iv4alQOS4qpqxciK9Y+b0=;
	h=From:To:Cc:Subject:Date:From;
	b=VoGE+gOZqDu7IiKN5xke6GUIgqivy6zpdKiN189F0MFZ7/u3udStYsgUHM2oIW9cl
	 sfa8gYh7MlCVl7k0ZP6wWAFbk2BqH6T+mxumBMqoNDZGoDXDJ5Mi5mff1rZ8Zn7D0T
	 vRlWn/TTw4PEq0KHVmtVedfKAJCyA5/hv/O20yYJjEtiHvzRzZ0QNaHAT07BBq2Elc
	 gCjX7r8T0B6eGiQSI28ljBgajzPNFoCEHqguW3fxjamwo5hWXIs3aNk/1VghxMJTOZ
	 bjHMzb6OJAUvGD6MxtT3ZSTuEgxL6NLUhUj7e7qZfWzFSQdNrm60nNiuaXbi5oFkl/
	 XoxYqLf9PaovA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Quentin Monnet <qmo@kernel.org>,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Abdurachmanov <davidlt@rivosinc.com>,
	"Namhyung Kim" <namhyung@kernel.org>
Subject: [PATCH bpf v2] tools: Override makefile ARCH variable if defined, but empty
Date: Wed, 27 Nov 2024 11:17:46 +0100
Message-ID: <20241127101748.165693-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_021803_607673_9AE8C75B 
X-CRM114-Status: GOOD (  13.15  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlcmUgYXJlIGEgbnVt
YmVyIG9mIHRvb2xzIChicGZ0b29sLCBzZWxmdGVzdHMpLCB0aGF0IHJlcXVpcmUgYQoiYm9vdHN0
cmFwIiBidWlsZC4gSGVyZSwgYSBib290c3RyYXAgYnVpbGQgaXMgYSBidWlsZCBob3N0IHZhcmlh
bnQgb2YKYSB0YXJnZXQuIEUuZy4sIGFzc3VtZSB0aGF0IHlvdSdyZSBwZXJmb3JtaW5nIGEgYnBm
dG9vbCBjcm9zcy1idWlsZCBvbgp4ODYgdG8gcmlzY3YsIGEgYm9vdHN0cmFwIGJ1aWxkIHdvdWxk
IHRoZW4gYmUgYW4geDg2IHZhcmlhbnQgb2YKYnBmdG9vbC4gVGhlIHR5cGljYWwgd2F5IHRvIHBl
cmZvcm0gdGhlIGhvc3QgYnVpbGQgdmFyaWFudCwgaXMgdG8gcGFzcwoiQVJDSD0iIGluIGEgc3Vi
LW1ha2UuIEhvd2V2ZXIsIGlmIGEgdmFyaWFibGUgaGFzIGJlZW4gc2V0IHdpdGggYQpjb21tYW5k
IGFyZ3VtZW50LCB0aGVuIG9yZGluYXJ5IGFzc2lnbm1lbnRzIGluIHRoZSBtYWtlZmlsZSBhcmUK
aWdub3JlZC4KClRoaXMgc2lkZS1lZmZlY3QgcmVzdWx0cyBpbiB0aGF0IEFSQ0gsIGFuZCB2YXJp
YWJsZXMgZGVwZW5kaW5nIG9uIEFSQ0gKYXJlIG5vdCBzZXQuCgpXb3JrYXJvdW5kIGJ5IG92ZXJy
aWRpbmcgQVJDSCB0byB0aGUgaG9zdCBhcmNoLCBpZiBBUkNIIGlzIGVtcHR5LgoKRml4ZXM6IDg4
NTliMGRhNWFhYyAoInRvb2xzL2JwZnRvb2w6IEZpeCBjcm9zcy1idWlsZCIpClJldmlld2VkLWJ5
OiBKZWFuLVBoaWxpcHBlIEJydWNrZXIgPGplYW4tcGhpbGlwcGVAbGluYXJvLm9yZz4KVGVzdGVk
LWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5
OiBOYW1oeXVuZyBLaW0gPG5hbWh5dW5nQGtlcm5lbC5vcmc+CkFja2VkLWJ5OiBRdWVudGluIE1v
bm5ldCA8cW1vQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3Ju
QHJpdm9zaW5jLmNvbT4KLS0tCnYyOiBQcm9wZXIgdHJlZSB0YWcgImJwZiIuCiAgICBDb2xsZWN0
ZWQgKi1ieSB0YWdzLgoKQW5kcmlpLAoKQXBvbG9naWVzIGZvciBtaXNzaW5nIG91dCB0aGUgdHJl
ZSB0YWcgaW4gdGhlIHBhdGNoLiBIZXJlJ3MgYSByZXNwaW4sCmFuZCB0aGFua3MgZm9yIHJvdXRp
bmcgaXQgdmlhIHRoZSBCUEYgdHJlZS4KCgpCasO2cm4KCi0tLQogdG9vbHMvc2NyaXB0cy9NYWtl
ZmlsZS5hcmNoIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3NjcmlwdHMvTWFrZWZpbGUuYXJjaCBiL3Rv
b2xzL3NjcmlwdHMvTWFrZWZpbGUuYXJjaAppbmRleCBmNmE1MGYwNmRmYzQuLmVhYmZlOWY0MTFk
OSAxMDA2NDQKLS0tIGEvdG9vbHMvc2NyaXB0cy9NYWtlZmlsZS5hcmNoCisrKyBiL3Rvb2xzL3Nj
cmlwdHMvTWFrZWZpbGUuYXJjaApAQCAtNyw4ICs3LDggQEAgSE9TVEFSQ0ggOj0gJChzaGVsbCB1
bmFtZSAtbSB8IHNlZCAtZSBzL2kuODYveDg2LyAtZSBzL3g4Nl82NC94ODYvIFwKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtZSBzL3NoWzIzNF0uKi9zaC8gLWUgcy9hYXJjaDY0
LiovYXJtNjQvIFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtZSBzL3Jpc2N2
LiovcmlzY3YvIC1lIHMvbG9vbmdhcmNoLiovbG9vbmdhcmNoLykKIAotaWZuZGVmIEFSQ0gKLUFS
Q0ggOj0gJChIT1NUQVJDSCkKK2lmZXEgKCQoc3RyaXAgJChBUkNIKSksKQorb3ZlcnJpZGUgQVJD
SCA6PSAkKEhPU1RBUkNIKQogZW5kaWYKIAogU1JDQVJDSCA6PSAkKEFSQ0gpCgpiYXNlLWNvbW1p
dDogMzQ0OGFkMjNiMzRlNDNhMjUyNmJkMGY5ZTEyMjFlOGRlODc2YWRlYwotLSAKMi40NS4yCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
