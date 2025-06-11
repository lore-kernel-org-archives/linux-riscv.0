Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6B0C71134
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zxlY5bTVhRbd/Gy4KQ+mKv00CO1mmVCaZECKIEVA6nI=; b=kkhBjdZQVvc66H
	UhYk3AEfyK7ILVlvTnys12+/V7rc/tDEKhchh8co2nXLp7AB1phQY/Jlj0+84hHf06dXT7nol41pi
	BhFr10ZoERfgtNWgyCn9tQJWQ1e9jPxrdv+wf3okRetqOkV0qxJm2fGYlq7509Omq9MVBokS5E2Av
	BXS2qUEmN9k2n9k1vKQneLk2JfepUFRxSK5QTBI2Ui+HurTXNRNg/48/ggh0Wqs9LwmWoU0HZ5olQ
	OlxKAmNtHGqN+ymwW0bTBvl0amEbfFlrUPTeGfsasJLLPMxlUfjNGg0JfeitIKyDhqp4iknrW4zqw
	2o2hg/IC1tXVqDw0ZgUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGQE-00000009Bm3-1x4L;
	Wed, 11 Jun 2025 08:02:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2u-000000097tL-1ZsF
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 07:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vdek1izyzsKO1yVmEA7bKNhgQcuaR13nn+u8f6WyIHk=; b=AYSbgNDnRvzyiTmcp3C0Tk1/pd
	biPBX9QXbgtEsGAMyCbUrY2PR7mshzp6AsiNOAlM2PqGQhFb1LjlhBI/AaCajfvr2hvRXZ37/oIBj
	LuRstVUg8XuaxeIw6tQqjHqR5thJxeCFPImGx4zLakQ8eQHqt5crCuRYV0R+kwlV7/WX9msYZvpaQ
	7+CPYKDm3izlWUeVsSPuDur1YxjG5Y4x6kmtcR8pW8ckTBdqcA+a7bbceIHwH9W5PYImDdZpM4YhK
	2rnSkcDLbgvONr7xfLoWpmQdX368fiG1YKhuaRA/IoSIyftrW3vXc1rpYkV47w3QqCvEpXL4ehKnw
	2oR2wT6Q==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2r-00000002AC9-2qrN
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:38:52 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749627515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vdek1izyzsKO1yVmEA7bKNhgQcuaR13nn+u8f6WyIHk=;
	b=geerNP5rxOPVeqffu3dQrtqo4+vGzQHyBJQQ2gTbXnsNbGfcYqeRI3eH+7kl6d6Q8ZOWM8
	cZSaPjHv0bETgi/Bu0OA082S6U3pF8SYOBGgIoUdEfQogLVPazY5apgW8s9qmYKVeeLzdw
	OCwgF8qiNtMuxHTMARdglws33NZPZq4vzZ+xqwydlaF501Hh73VXlsVXlkf/eqVBCew8ok
	3Osi+tEr7cfaW6b6Nv/gXUhZzz2/ny4Je2CcdrJo3ntBV0XT5e8wKWgU6vgAjHAKy1C6lq
	KGZndSVn2ldurZLYZmIK/8Q1/P4AN0fVimsOA3H6tux+iV7E5yDn5vV1QjiydQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749627515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vdek1izyzsKO1yVmEA7bKNhgQcuaR13nn+u8f6WyIHk=;
	b=qtPNzx5NePI7G6dwBvU7pzFKpSbdK0NPlWYBDIrCPoSjEKR4g6RLBmdNNUOn4hLiKepuEb
	bo6Y19/By7QYsoAw==
Date: Wed, 11 Jun 2025 09:38:16 +0200
Subject: [PATCH v3 10/16] kunit: tool: Parse skipped tests from kselftest.h
MIME-Version: 1.0
Message-Id: <20250611-kunit-kselftests-v3-10-55e3d148cbc6@linutronix.de>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
In-Reply-To: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 workflows@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749627510; l=2785;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=jBKSdQACvBBwcM6WzYQQQ4hGpXONRfQDjnNvXZvxW6A=;
 b=bjaPIZjodgAcgTvHsoZuoYuCJ+8/113ovz1oTBu/1LlrHK/MHWKqy2KqNxuYAG05G3hLbAykW
 UvyjivABt0VD8uvoFsDEry57lSwU0Hn9WKM/N0eHfz2aN/PQpcmR7uG
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_083849_999354_E596BED2 
X-CRM114-Status: UNSURE (   8.80  )
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

U2tpcHBlZCB0ZXN0cyByZXBvcnRlZCBieSBrc2VsZnRlc3QuaCB1c2UgYSBkaWZmZXJlbnQgZm9y
bWF0IHRoYW4gS1RBUCwKdGhlcmUgaXMgbm8gZXhwbGljaXQgdGVzdCBuYW1lLiBOb3JtYWxseSB0
aGUgdGVzdCBuYW1lIGlzIHBhcnQgb2YgdGhlCmZyZWUtZm9ybSBzdHJpbmcgYWZ0ZXIgdGhlIFNL
SVAga2V5d29yZDoKCglvayAzICMgU0tJUCB0ZXN0OiBzb21lIHJlYXNvbgoKRXh0ZW5kIHRoZSBw
YXJzZXIgdG8gaGFuZGxlIHRob3NlIGNvcnJlY3RseS4gVXNlIHRoZSBmcmVlLWZvcm0gc3RyaW5n
IGFzCnRlc3QgbmFtZSBpbnN0ZWFkLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWgg
PHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogdG9vbHMvdGVzdGluZy9rdW5p
dC9rdW5pdF9wYXJzZXIucHkgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgOCArKysrKy0t
LQogdG9vbHMvdGVzdGluZy9rdW5pdC90ZXN0X2RhdGEvdGVzdF9pc190ZXN0X3Bhc3NlZC1rc2Vs
ZnRlc3QubG9nIHwgMyArKy0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcva3VuaXQva3VuaXRfcGFyc2Vy
LnB5IGIvdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdF9wYXJzZXIucHkKaW5kZXggMjQ3OGJlYjI4
ZmMzZGI4MjU4NTVhZDQ2MjAwMzQwZTg4NGRhN2RmMS4uNDU5OWQyM2M3OWI3OWYwZTIxOWQ2NTVj
NzA1M2M4YzNiMzRmODE1MiAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdF9w
YXJzZXIucHkKKysrIGIvdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdF9wYXJzZXIucHkKQEAgLTM1
Miw5ICszNTIsOSBAQCBkZWYgcGFyc2VfdGVzdF9wbGFuKGxpbmVzOiBMaW5lU3RyZWFtLCB0ZXN0
OiBUZXN0KSAtPiBib29sOgogCWxpbmVzLnBvcCgpCiAJcmV0dXJuIFRydWUKIAotVEVTVF9SRVNV
TFQgPSByZS5jb21waWxlKHInXlxzKihva3xub3Qgb2spIChbMC05XSspICgtICk/KFteI10qKSgg
IyAuKik/JCcpCitURVNUX1JFU1VMVCA9IHJlLmNvbXBpbGUocideXHMqKG9rfG5vdCBvaykgKFsw
LTldKyk/ID8oLSApPyhbXiNdKikoICMgLiopPyQnKQogCi1URVNUX1JFU1VMVF9TS0lQID0gcmUu
Y29tcGlsZShyJ15ccyoob2t8bm90IG9rKSAoWzAtOV0rKSAoLSApPyguKikgIyBTS0lQKC4qKSQn
KQorVEVTVF9SRVNVTFRfU0tJUCA9IHJlLmNvbXBpbGUocideXHMqKG9rfG5vdCBvaykgKFswLTld
Kyk/ID8oLSApPyguKikgIyBTS0lQID8oLiopJCcpCiAKIGRlZiBwZWVrX3Rlc3RfbmFtZV9tYXRj
aChsaW5lczogTGluZVN0cmVhbSwgdGVzdDogVGVzdCkgLT4gYm9vbDoKIAkiIiIKQEAgLTM3OSw2
ICszNzksOCBAQCBkZWYgcGVla190ZXN0X25hbWVfbWF0Y2gobGluZXM6IExpbmVTdHJlYW0sIHRl
c3Q6IFRlc3QpIC0+IGJvb2w6CiAJaWYgbm90IG1hdGNoOgogCQlyZXR1cm4gRmFsc2UKIAluYW1l
ID0gbWF0Y2guZ3JvdXAoNCkKKwlpZiBub3QgbmFtZToKKwkJcmV0dXJuIEZhbHNlCiAJcmV0dXJu
IG5hbWUgPT0gdGVzdC5uYW1lCiAKIGRlZiBwYXJzZV90ZXN0X3Jlc3VsdChsaW5lczogTGluZVN0
cmVhbSwgdGVzdDogVGVzdCwKQEAgLTQxNiw3ICs0MTgsNyBAQCBkZWYgcGFyc2VfdGVzdF9yZXN1
bHQobGluZXM6IExpbmVTdHJlYW0sIHRlc3Q6IFRlc3QsCiAKIAkjIFNldCBuYW1lIG9mIHRlc3Qg
b2JqZWN0CiAJaWYgc2tpcF9tYXRjaDoKLQkJdGVzdC5uYW1lID0gc2tpcF9tYXRjaC5ncm91cCg0
KQorCQl0ZXN0Lm5hbWUgPSBza2lwX21hdGNoLmdyb3VwKDQpIG9yIHNraXBfbWF0Y2guZ3JvdXAo
NSkKIAllbHNlOgogCQl0ZXN0Lm5hbWUgPSBtYXRjaC5ncm91cCg0KQogCmRpZmYgLS1naXQgYS90
b29scy90ZXN0aW5nL2t1bml0L3Rlc3RfZGF0YS90ZXN0X2lzX3Rlc3RfcGFzc2VkLWtzZWxmdGVz
dC5sb2cgYi90b29scy90ZXN0aW5nL2t1bml0L3Rlc3RfZGF0YS90ZXN0X2lzX3Rlc3RfcGFzc2Vk
LWtzZWxmdGVzdC5sb2cKaW5kZXggNjVkM2YyN2ZlYWYyMmEzZjQ3ZWQ4MzFjNGMyNGY2ZjExYzYy
NWE5Mi4uMzBkOWVmMThiY2VjMTc3MDY3Mjg4ZDUyNDI3NzEyMzZmMjliN2Q1NiAxMDA2NDQKLS0t
IGEvdG9vbHMvdGVzdGluZy9rdW5pdC90ZXN0X2RhdGEvdGVzdF9pc190ZXN0X3Bhc3NlZC1rc2Vs
ZnRlc3QubG9nCisrKyBiL3Rvb2xzL3Rlc3Rpbmcva3VuaXQvdGVzdF9kYXRhL3Rlc3RfaXNfdGVz
dF9wYXNzZWQta3NlbGZ0ZXN0LmxvZwpAQCAtMSw1ICsxLDUgQEAKIFRBUCB2ZXJzaW9uIDEzCi0x
Li4yCisxLi4zCiAjIHNlbGZ0ZXN0czogbWVtYmFycmllcjogbWVtYmFycmllcl90ZXN0X3Npbmds
ZV90aHJlYWQKICMgVEFQIHZlcnNpb24gMTMKICMgMS4uMgpAQCAtMTIsMyArMTIsNCBAQCBvayAx
IHNlbGZ0ZXN0czogbWVtYmFycmllcjogbWVtYmFycmllcl90ZXN0X3NpbmdsZV90aHJlYWQKICMg
b2sgMSBzeXNfbWVtYmFycmllciBhdmFpbGFibGUKICMgb2sgMiBzeXMgbWVtYmFycmllciBpbnZh
bGlkIGNvbW1hbmQgdGVzdDogY29tbWFuZCA9IC0xLCBmbGFncyA9IDAsIGVycm5vID0gMjIuIEZh
aWxlZCBhcyBleHBlY3RlZAogb2sgMiBzZWxmdGVzdHM6IG1lbWJhcnJpZXI6IG1lbWJhcnJpZXJf
dGVzdF9tdWx0aV90aHJlYWQKK29rIDMgIyBTS0lQIHNlbGZ0ZXN0czogbWVtYmFycmllcjogbWVt
YmFycmllcl90ZXN0X211bHRpX3RocmVhZAoKLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
