Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A69E9B373
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MH+3x4MhBZZRBF55dUATdLOGRkRkJbGxh6R1n/r5Ok4=; b=LyjwTCiC7zzQZn
	ZVaUYkwSD2Vw8HGc9pUe9xwtxWXRarnlKE+IooMYcMT6v/HHtquePAg7hkY5qDS69HXPmHgaRe+QQ
	dwVljt4J5tWgwmeWCKWhBGmaR/E8yOQ15vb2qHtyy+vc9UpvllYzCuAUeVkOvlNEcvTi7NFF44izv
	414t7yGz9eIDVOvGdreWmd8aL3kr+xnmkv34aKxC1XJ2LMaNnXlPYJP6hZFLAD4Qgeo4OE2aQaaeM
	C+Da0nxoOKmYUj4X6iEpK9OGmQ/ejdymblH4wxvUyRC8EW5rjtt6bT/0XJf+hB72U+uWDCKcjmWZR
	9MlOQtc5jjIlATPdnRog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LR-0000000CvvG-28Wz;
	Mon, 02 Mar 2026 12:25:53 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LM-0000000CvpB-0KP9;
	Mon, 02 Mar 2026 12:25:49 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q8M0BzYT+8nDvDRpeOPQrwaX+SE1r8gh99dGV2h1fFk=;
	b=XTq/Qbdsmdrjjgi15d+mbxPv7MA1pmSdTxIgk0x+7gQ1SBn3Qk50BPvaiHTGQy/qTkOET0
	CGc+OMjOeQ/n2dA3JdyCWwjrdxy0uscngADbfRLK8WmqnacdFL6h4HVWXe+3LbMBHdWR9X
	qZ74nUVL9W2j3VLfwuTKczYIjFgmRo5MMH5f83HQtqnIdi+gp6yskGE9pemAt/5epkD38A
	sdonFKgtjJGoOsIGmpIH2kKpN+TtX6hvt/oaC/e+zE3Kp4IcFO+phZTmHZCNcZy7Qe9ryj
	DSBSapJLSRTcmYCf4GVgZP161CF/lM2AnixGVHOK2waHFibtLc9ifGRmcjG1Rw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q8M0BzYT+8nDvDRpeOPQrwaX+SE1r8gh99dGV2h1fFk=;
	b=f3MlQqxsNMwSdSaceDHlFwzKoTlTmrVShpKlZNDhQVk9O7AG1ihqK0Tpn92+Xr2oztP91Z
	NrP6Rmm8D/oDiRBw==
Subject: [PATCH 00/15] exec: Remove AT_VECTOR_SIZE_ARCH from UAPI
Date: Mon, 02 Mar 2026 13:25:24 +0100
Message-Id: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ5AMBBG4avIrE1SXTS4ilhU/WU2yFRESO+us
 fwW772UoIJEffWS4pIk+1bQ1BWF1W8LWOZissY605iO/ckXwrkrJ3nAXsPKDiZadDG2k6NSHoo
 o938dxpw/BDR+BWUAAAA=
X-Change-ID: 20260109-at-vector-size-arch-6e0f2e9ff8b6
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=2953;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=JDTHLUTBRhLdtWzI+cYwcXmhsRHrVsJSh1vwEnoNL54=;
 b=J6CYW4wsSS52A+nGxs9gwUdPdfHUZDIYWEVVGw/G+GXj/VTqu7W4L6C1R+uvBZbzZsf4FisCc
 r+YyP25hcjyC3G9P+jLo1JOj2qTAaURruN7qUwKyoqSA+FQdhvM39MD
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042548_339608_1346B625 
X-CRM114-Status: UNSURE (   7.02  )
X-CRM114-Notice: Please train this message.
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

VGhlcmUgaXMgbm90aGluZyB1c2Vyc3BhY2UgY2FuIGRvIHdpdGggdGhpcyB2YWx1ZS4gSW4gdGhl
IGtlcm5lbCBpcwphbHdheXMgY29tYmluZWQgd2l0aCBBVF9WRUNUT1JfU0laRV9CQVNFLCB3aGlj
aCBpcyBub3QgZXhwb3NlZCB0bwp1c2Vyc3BhY2UgYW5kIGFsc28gY2hhbmdlcyBmcm9tIHRpbWUg
dG8gdGltZS4KCk1vdmUgdGhlIHN5bWJvbCB0byBrZXJuZWwtaW50ZXJuYWwgaGVhZGVycy4KCk1l
YW50IHRvIGJlIGFwcGxpZWQgdGhyb3VnaCB0aGUgYXNtLWdlbmVyaWMgdHJlZS4KVGhlIGRlZmF1
bHQgcmVjaXBpZW50IGxpc3Qgd2FzIGh1Z2UuIEkgdHJpbW1lZCBpdCB0byBvbmx5IHRoZQphcmNo
aXRlY3R1cmUgbGlzdHMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFz
LndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tClRob21hcyBXZWnDn3NjaHVoICgxNSk6CiAg
ICAgIE1BSU5UQUlORVJTOiBleGVjOiBBZGQgbW9yZSBhdXh2ZWMuaCB2YXJpYW50cwogICAgICBh
dXh2ZWMuaDogTW92ZSBBVF9WRUNUT1JfU0laRSBkZWZpbml0aW9ucyB0byBsaW51eC9hdXh2ZWMu
aAogICAgICBhc20tZ2VuZXJpYzogYWRkIGFuIGluLWtlcm5lbCBhdXh2ZWMuaCBoZWFkZXIKICAg
ICAgQVJNOiBkcm9wIGN1c3RvbSBhc20vYXV4dmVjLmgKICAgICAgeDg2OiBSZW1vdmUgQVRfVkVD
VE9SX1NJWkVfQVJDSCBmcm9tIFVBUEkKICAgICAgYXJtNjQ6IFJlbW92ZSBBVF9WRUNUT1JfU0la
RV9BUkNIIGZyb20gVUFQSQogICAgICBSSVNDLVY6IFJlbW92ZSBBVF9WRUNUT1JfU0laRV9BUkNI
IGZyb20gVUFQSQogICAgICBMb29uZ0FyY2g6IFJlbW92ZSBBVF9WRUNUT1JfU0laRV9BUkNIIGZy
b20gVUFQSQogICAgICBzMzkwOiBSZW1vdmUgQVRfVkVDVE9SX1NJWkVfQVJDSCBmcm9tIFVBUEkK
ICAgICAgcG93ZXJwYzogUmVtb3ZlIEFUX1ZFQ1RPUl9TSVpFX0FSQ0ggZnJvbSBVQVBJCiAgICAg
IE1JUFM6IFJlbW92ZSBBVF9WRUNUT1JfU0laRV9BUkNIIGZyb20gVUFQSQogICAgICBzcGFyYzog
UmVtb3ZlIEFUX1ZFQ1RPUl9TSVpFX0FSQ0ggZnJvbSBVQVBJCiAgICAgIHNoOiBSZW1vdmUgQVRf
VkVDVE9SX1NJWkVfQVJDSCBmcm9tIFVBUEkKICAgICAgYWxwaGE6IHJlbW92ZSBBVF9WRUNUT1Jf
U0laRV9BUkNIIGZyb20gVUFQSQogICAgICBhdXh2ZWMuaDogRHJvcCBmYWxsYmFjayBBVF9WRUNU
T1JfU0laRV9BUkNICgogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICA1ICsrKysrCiBhcmNoL2FscGhhL2luY2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgICAgIHwgIDcg
KysrKysrKwogYXJjaC9hbHBoYS9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oICAgICB8ICA4ICsr
Ky0tLS0tCiBhcmNoL2FybS9pbmNsdWRlL2FzbS9hdXh2ZWMuaCAgICAgICAgICAgIHwgIDEgLQog
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9hdXh2ZWMuaCAgICAgICAgICB8ICA3ICsrKysrKysKIGFy
Y2gvYXJtNjQvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCAgICAgfCAgNiArKy0tLS0KIGFyY2gv
bG9vbmdhcmNoL2luY2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgfCAxNCArKysrKysrKysrKysrKwog
YXJjaC9sb29uZ2FyY2gvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCB8ICA4ICsrKy0tLS0tCiBh
cmNoL21pcHMvaW5jbHVkZS9hc20vYXV4dmVjLmggICAgICAgICAgIHwgMTcgKysrKysrKysrKysr
KysrKysKIGFyY2gvbWlwcy9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oICAgICAgfCAgOCArKyst
LS0tLQogYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgICB8ICA3ICsrKysr
KysKIGFyY2gvcG93ZXJwYy9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oICAgfCAgNiArKy0tLS0K
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXV4dmVjLmggICAgICAgICAgfCAxMyArKysrKysrKysr
KysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggICAgIHwgIDIgLS0KIGFy
Y2gvczM5MC9pbmNsdWRlL2FzbS9hdXh2ZWMuaCAgICAgICAgICAgfCAgNyArKysrKysrCiBhcmNo
L3MzOTAvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCAgICAgIHwgIDYgKystLS0tCiBhcmNoL3No
L2luY2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgICAgICAgIHwgIDcgKysrKysrKwogYXJjaC9zaC9p
bmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oICAgICAgICB8ICA4ICsrKy0tLS0tCiBhcmNoL3NwYXJj
L2luY2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgICAgIHwgIDYgKysrKysrCiBhcmNoL3NwYXJjL2lu
Y2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggICAgIHwgIDggKysrLS0tLS0KIGFyY2gveDg2L2luY2x1
ZGUvYXNtL2F1eHZlYy5oICAgICAgICAgICAgfCAxMiArKysrKysrKysrKysKIGFyY2gveDg2L2lu
Y2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggICAgICAgfCAxMyArKystLS0tLS0tLS0tCiBpbmNsdWRl
L2FzbS1nZW5lcmljL0tidWlsZCAgICAgICAgICAgICAgIHwgIDEgKwogaW5jbHVkZS9hc20tZ2Vu
ZXJpYy9hdXh2ZWMuaCAgICAgICAgICAgICB8ICA3ICsrKysrKysKIGluY2x1ZGUvbGludXgvYXV4
dmVjLmggICAgICAgICAgICAgICAgICAgfCAgNSArKysrKwogaW5jbHVkZS9saW51eC9tbV90eXBl
cy5oICAgICAgICAgICAgICAgICB8ICA2IC0tLS0tLQogMjYgZmlsZXMgY2hhbmdlZCwgMTM5IGlu
c2VydGlvbnMoKyksIDU2IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IGY2YjNiMGE0Yzg1
ODgyYWQ3NWJjZTNiMDkzMTczMjAzZTNmMzlmMjgKY2hhbmdlLWlkOiAyMDI2MDEwOS1hdC12ZWN0
b3Itc2l6ZS1hcmNoLTZlMGYyZTlmZjhiNgoKQmVzdCByZWdhcmRzLAotLSAKVGhvbWFzIFdlacOf
c2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
