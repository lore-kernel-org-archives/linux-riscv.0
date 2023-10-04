Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69923E7B5FF
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 12:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Ull5lDyT12znWyM/cxwycx0wCDG5adCpLEjXUoC0NM=; b=4YtG2QYrO1z1MJ
	gJhn3SWD6m3eAdutA+FGxk95nl0xZm6683iMFoO6HaqpQFFrPMVHu5Y6y1KoRO1tHFh909hkgOGIn
	NHjjOlqj7ywgc/16tvGC5zoALLbEEuuw52v5TiW8iMUJ5UDv9U6Ex8bAo7trEC3aLsGHiXdefob7g
	Gj+jfE3qBAIXJG4Y2Ryh2w33lDKWsLlPU4gt5RpKQbX6myYakxAh1jbQqAHxTwt9ongr/PqCaXgIi
	v3duIEOsMy6iwlqb33PZ+GmiNgPkWV8cCxXw9eplNIJDHzCvgi14QogvSpSa0w3vkz/r4uC9/wEsS
	ad/CEmDCg3agJhbCT0iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0f1-00HYnp-1A;
	Wed, 04 Oct 2023 12:07:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0ex-00HYlG-1k
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 12:07:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 273B6B81C0D;
	Wed,  4 Oct 2023 12:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29373C433CB;
	Wed,  4 Oct 2023 12:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696421241;
	bh=FcFliYtfyClr234Bg/rnUbyn6yhoW+Ofj/60M8uTrGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OLUaEbOvU1kBTFb7wZoed/Rv0qLtoGKvSyOsVygiWjcfUAlkint7h1M+DWCNXvjwe
	 NrOjlZcCRicZLfg2m2aFCTHDLXOb1HZmzUloc6WzK2rByf6Y7AXPNgSI6s+hdkR8Uo
	 jK7yKdsGC9NY3PefxgD4iW5Sjdx3HNymiCYr/WU+GEjSkIdjVGakdiM7J+aM41wb+B
	 A0yVL2c+P/TIxuXVK7RkpFjgT68TWPekSQM8B6fRS6RdmxBrAC/kQh3IU01ufgAMTq
	 lPgpZzVbkka4E+2Q3OiyhlmxKCOcuk9ogp2Qm6QHS5D+vHqv8io7C8PWt7WwySB7ZC
	 f1SMAfjxoZ2Dg==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	Pu Lehui <pulehui@huawei.com>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH bpf 1/2] riscv, bpf: Sign-extend return values
Date: Wed,  4 Oct 2023 14:07:05 +0200
Message-Id: <20231004120706.52848-2-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004120706.52848-1-bjorn@kernel.org>
References: <20231004120706.52848-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_050723_862732_43A02EC1 
X-CRM114-Status: GOOD (  13.02  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIFJJU0MtViBhcmNo
aXRlY3R1cmUgZG9lcyBub3QgZXhwb3NlIHN1Yi1yZWdpc3RlcnMsIGFuZCBob2xkIGFsbAozMi1i
aXQgdmFsdWVzIGluIGEgc2lnbi1leHRlbmRlZCBmb3JtYXQgWzFdIFsyXToKCiAgfCBUaGUgY29t
cGlsZXIgYW5kIGNhbGxpbmcgY29udmVudGlvbiBtYWludGFpbiBhbiBpbnZhcmlhbnQgdGhhdCBh
bGwKICB8IDMyLWJpdCB2YWx1ZXMgYXJlIGhlbGQgaW4gYSBzaWduLWV4dGVuZGVkIGZvcm1hdCBp
biA2NC1iaXQKICB8IHJlZ2lzdGVycy4gRXZlbiAzMi1iaXQgdW5zaWduZWQgaW50ZWdlcnMgZXh0
ZW5kIGJpdCAzMSBpbnRvIGJpdHMKICB8IDYzIHRocm91Z2ggMzIuIENvbnNlcXVlbnRseSwgY29u
dmVyc2lvbiBiZXR3ZWVuIHVuc2lnbmVkIGFuZAogIHwgc2lnbmVkIDMyLWJpdCBpbnRlZ2VycyBp
cyBhIG5vLW9wLCBhcyBpcyBjb252ZXJzaW9uIGZyb20gYSBzaWduZWQKICB8IDMyLWJpdCBpbnRl
Z2VyIHRvIGEgc2lnbmVkIDY0LWJpdCBpbnRlZ2VyLgoKV2hpbGUgQlBGLCBvbiB0aGUgb3RoZXIg
aGFuZCwgZXhwb3NlcyBzdWItcmVnaXN0ZXJzLCBhbmQgdXNlCnplcm8tZXh0ZW5zaW9uIChzaW1p
bGFyIHRvIGFybTY0L3g4NikuCgpUaGlzIGhhcyBsZWQgdG8gc29tZSBzdWJ0bGUgYnVncywgd2hl
cmUgYSBCUEYgSklUdGVkIHByb2dyYW0gaGFzIG5vdApzaWduLWV4dGVuZGVkIHRoZSBhMCByZWdp
c3RlciAocmV0dXJuIHZhbHVlIGluIFJJU0MtViBsYW5kKSwgcGFzc2VkCnRoZSByZXR1cm4gdmFs
dWUgdXAgdGhlIGtlcm5lbCwgZS5nLjoKCiAgfCBpbnQgZnJvbV9icGYodm9pZCk7CiAgfAogIHwg
bG9uZyBmb28odm9pZCkKICB8IHsKICB8ICAgIHJldHVybiBmcm9tX2JwZigpOwogIHwgfQoKSGVy
ZSwgYTAgd291bGQgYmUgMHhmZmZmX2ZmZmYsIGluc3RlYWQgb2YgdGhlIGV4cGVjdGVkCjB4ZmZm
Zl9mZmZmX2ZmZmZfZmZmZi4KCkludGVybmFsbHksIHRoZSBSSVNDLVYgSklUIHVzZXMgYTUgYXMg
YSBkZWRpY2F0ZWQgcmVnaXN0ZXIgZm9yIEJQRgpyZXR1cm4gdmFsdWVzLgoKS2VlcCBhNSB6ZXJv
LWV4dGVuZGVkLCBidXQgZXhwbGljaXRseSBzaWduLWV4dGVuZCBhMCAod2hpY2ggaXMgdXNlZApv
dXRzaWRlIEJQRiBsYW5kKS4gTm93IHRoYXQgYTAgKFJJU0MtViBBQkkpIGFuZCBhNSAoQlBGIEFC
SSkgZGlmZmVycywKYTAgaXMgb25seSBtb3ZlZCB0byBhNSBmb3Igbm9uLUJQRiBuYXRpdmUgY2Fs
bHMgKEJQRl9QU0VVRE9fQ0FMTCkuCgpMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yvcmlz
Y3YtaXNhLW1hbnVhbC9yZWxlYXNlcy9kb3dubG9hZC9yaXNjdi1pc2EtcmVsZWFzZS0wNTZiNmZm
LTIwMjMtMTAtMDIvdW5wcml2LWlzYS1hc2NpaWRvYy5wZGYgIyBbMl0KTGluazogaHR0cHM6Ly9n
aXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3YtZWxmLXBzYWJpLWRvYy9yZWxlYXNlcy9kb3du
bG9hZC9kcmFmdC0yMDIzMDkyOS1lNWM4MDBlNjYxYTUzZWZlM2MyNjc4ZDcxYTMwNjMyM2I2MGVi
MTNiL3Jpc2N2LWFiaS5wZGYgIyBbMl0KRml4ZXM6IDIzNTNlY2M2ZjkxZiAoImJwZiwgcmlzY3Y6
IGFkZCBCUEYgSklUIGZvciBSVjY0RyIpClNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIHwg
NSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIGIvYXJjaC9yaXNj
di9uZXQvYnBmX2ppdF9jb21wNjQuYwppbmRleCBlY2QzYWU2ZjQxMTYuLmRlNGM5OTU3ZDIyMyAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYworKysgYi9hcmNoL3Jp
c2N2L25ldC9icGZfaml0X2NvbXA2NC5jCkBAIC0yNDUsNyArMjQ1LDcgQEAgc3RhdGljIHZvaWQg
X19idWlsZF9lcGlsb2d1ZShib29sIGlzX3RhaWxfY2FsbCwgc3RydWN0IHJ2X2ppdF9jb250ZXh0
ICpjdHgpCiAJZW1pdF9hZGRpKFJWX1JFR19TUCwgUlZfUkVHX1NQLCBzdGFja19hZGp1c3QsIGN0
eCk7CiAJLyogU2V0IHJldHVybiB2YWx1ZS4gKi8KIAlpZiAoIWlzX3RhaWxfY2FsbCkKLQkJZW1p
dF9tdihSVl9SRUdfQTAsIFJWX1JFR19BNSwgY3R4KTsKKwkJZW1pdF9hZGRpdyhSVl9SRUdfQTAs
IFJWX1JFR19BNSwgMCwgY3R4KTsKIAllbWl0X2phbHIoUlZfUkVHX1pFUk8sIGlzX3RhaWxfY2Fs
bCA/IFJWX1JFR19UMyA6IFJWX1JFR19SQSwKIAkJICBpc190YWlsX2NhbGwgPyAoUlZfRkVOVFJZ
X05JTlNOUyArIDEpICogNCA6IDAsIC8qIHNraXAgcmVzZXJ2ZWQgbm9wcyBhbmQgVENDIGluaXQg
Ki8KIAkJICBjdHgpOwpAQCAtMTUxNSw3ICsxNTE1LDggQEAgaW50IGJwZl9qaXRfZW1pdF9pbnNu
KGNvbnN0IHN0cnVjdCBicGZfaW5zbiAqaW5zbiwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgs
CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OwogCi0JCWVtaXRfbXYoYnBmX3RvX3J2X3JlZyhC
UEZfUkVHXzAsIGN0eCksIFJWX1JFR19BMCwgY3R4KTsKKwkJaWYgKGluc24tPnNyY19yZWcgIT0g
QlBGX1BTRVVET19DQUxMKQorCQkJZW1pdF9tdihicGZfdG9fcnZfcmVnKEJQRl9SRUdfMCwgY3R4
KSwgUlZfUkVHX0EwLCBjdHgpOwogCQlicmVhazsKIAl9CiAJLyogdGFpbCBjYWxsICovCi0tIAoy
LjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
