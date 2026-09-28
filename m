Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E7CC9832F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 02:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3/9SuBsDnEvbw/2e1O8tVQSKdyiKQBgQvL1Ya5RncA=; b=Ee1HAfY0KWvmYf
	HwQVZMJQaUWm36XspKAstd05fTgdMDV9oDgfu/S/BZvO3D1vcNLdSZelUuz/PWxHosecVLCMrhMGT
	FiiaCgDdTVmIyIbW8JwQAgiaH+h0GbivLmXhi7hAwuT33ahIyLQyasZwx1Ai6dzcGz0lfuxX8najD
	w/Lu5QgpY9Ot6vrbBIVepylOyvExNCBE2Ct9i1hwhPXu2FGP+L/E0pKqs55EMODtGTFgHW6J+ygXe
	toLLwMo4+N1KXkoZi996yGktezcNWF6p7u+lZVE8LH3xNsFqm5RDAEEtxQY+hCB3lWCQFjfy/3Zha
	N1Xyr8irK/jNSceBgBSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0zy-0000000HAEz-1T7m;
	Mon, 28 Sep 2026 02:21:46 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0zs-0000000HADW-1nUN
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 02:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790562093; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=065VVLUzE02OfjnOXMUOzcbAkEzc2W26yXRo/QM7FkE=;
	b=ln7Lfm6LaSOjn1lBqAM/K8eAyrOVSJKcjMF+Q3bvs5KLcnyGnNgFs28bRJLnuci1/YeLMr8ftO+U7ordxjgG7szxoJvxEeFoiiZxGT17xdyhv5eg2zka+rR4nKLfACqJsAxyA+vedDBLABhJ43gkQ02hGXKxY4b8Ik7555MOb+c=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R691e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBgzgOW_1790562091;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBgzgOW_1790562091 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 28 Sep 2026 10:21:31 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org
Cc: ihor.solodrai@linux.dev,
	eddyz87@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pulehui@huawei.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	shuah@kernel.org,
	guoren@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2 1/2] bpf, riscv: Add support for indirect jumps
Date: Mon, 28 Sep 2026 10:21:08 +0800
Message-ID: <20260928022109.1093-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928022109.1093-1-cp0613@linux.alibaba.com>
References: <20260928022109.1093-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_192141_193770_21E5C2F2 
X-CRM114-Status: GOOD (  15.92  )
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

SW1wbGVtZW50IEpJVCBzdXBwb3J0IGZvciB0aGUgaW5kaXJlY3QganVtcCBpbnN0cnVjdGlvbiAo
QlBGX0pNUCB8CkJQRl9KQSB8IEJQRl9YKSwgYS5rLmEuIGdvdG94LCB3aGljaCBsZXRzIGEgQlBG
IHByb2dyYW0ganVtcCB0aHJvdWdoIGEKQlBGX01BUF9UWVBFX0lOU05fQVJSQVkganVtcCB0YWJs
ZS4KCkVtaXQgImphbHIgemVybywgcmQsIDAiIGFuZCBoYW5kIHRoZSB4bGF0ZWQgdG8gaml0dGVk
IG9mZnNldHMgdG8KYnBmX3Byb2dfdXBkYXRlX2luc25fcHRycygpLCB3aGljaCBpcyB3aGF0IGZp
bGxzIGluIHRoZSBqdW1wIHRhYmxlCmVudHJpZXM7IHdpdGhvdXQgdGhhdCBjYWxsIHRoZSBsb2Fk
IGZhaWxzIHdpdGggLUVGQVVMVCBpbgpicGZfaW5zbl9hcnJheV9yZWFkeSgpLiBjdHgtPm9mZnNl
dFtdIGhvbGRzIHRoZSBvZmZzZXQgb2YgdGhlIGluc24KKmZvbGxvd2luZyogaW5zbiBpLCBhcyBi
cGZfcHJvZ19maWxsX2ppdGVkX2xpbmZvKCkgZXhwZWN0cywgc28gaXQgaXMKc2hpZnRlZCBieSBv
bmUgYW5kIG9mZnNldFswXSBjb21lcyBmcm9tIHRoZSBwcm9sb2d1ZSBsZW5ndGguIGJ1aWxkX2Jv
ZHkoKQpub3cgcmVjb3JkcyBib3RoIGhhbHZlcyBvZiBhIG11bHRpLWluc24gcmVjb3JkLCBzbyBu
byBzbG90IGtlZXBzIGEKZmFicmljYXRlZCBvZmZzZXQuCgpPbmx5IHRoZSBSVjY0IEpJVCBpcyBj
b3ZlcmVkOyBSVjMyIGtlZXBzIGZhaWxpbmcgdG8gbG9hZCBhcyBiZWZvcmUuCgpTaWduZWQtb2Zm
LWJ5OiBDaGVuIFBlaSA8Y3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tPgpSZXZpZXdlZC1ieTogQmrD
tnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQGtlcm5lbC5vcmc+Ci0tLQoKQ2hhbmdlcyBzaW5jZSB2MToKLSBSZXdvcmQgdGhlIGNvZGUg
Y29tbWVudCB0byBzYXkgInNoaWZ0IGN0eC0+b2Zmc2V0W10gYnkgb25lIi4KCiBhcmNoL3Jpc2N2
L25ldC9icGZfaml0X2NvbXA2NC5jIHwgIDUgKysrKysKIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRf
Y29yZS5jICAgfCAxNiArKysrKysrKysrKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBm
X2ppdF9jb21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKaW5kZXggZWQw
YTZmODcxZGVhLi45ZGUzNzQ5ZmIyNjggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9q
aXRfY29tcDY0LmMKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwpAQCAtMTY5
MSw2ICsxNjkxLDExIEBAIGludCBicGZfaml0X2VtaXRfaW5zbihjb25zdCBzdHJ1Y3QgYnBmX2lu
c24gKmluc24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAogCQkJZW1pdF96ZXh0dyhyZCwg
cmQsIGN0eCk7CiAJCWJyZWFrOwogCisJLyogSlVNUCByZWcgKi8KKwljYXNlIEJQRl9KTVAgfCBC
UEZfSkEgfCBCUEZfWDoKKwkJZW1pdF9qYWxyKFJWX1JFR19aRVJPLCByZCwgMCwgY3R4KTsKKwkJ
YnJlYWs7CisKIAkvKiBKVU1QIG9mZiAqLwogCWNhc2UgQlBGX0pNUCB8IEJQRl9KQToKIAljYXNl
IEJQRl9KTVAzMiB8IEJQRl9KQToKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRf
Y29yZS5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb3JlLmMKaW5kZXggNDcwYTZhY2U1NjYy
Li41MjY1ZGQ1YmQzOWUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29yZS5j
CisrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29yZS5jCkBAIC0yNiwxMCArMjYsMTMgQEAg
c3RhdGljIGludCBidWlsZF9ib2R5KHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LCBib29sIGV4
dHJhX3Bhc3MsIGludCAqb2Zmc2V0KQogCQlpbnQgcmV0OwogCiAJCXJldCA9IGJwZl9qaXRfZW1p
dF9pbnNuKGluc24sIGN0eCwgZXh0cmFfcGFzcyk7Ci0JCWlmIChyZXQgPiAwKQotCQkJaSsrOyAv
KiBza2lwIHRoZSBuZXh0IGluc3RydWN0aW9uICovCiAJCWlmIChvZmZzZXQpCiAJCQlvZmZzZXRb
aV0gPSBjdHgtPm5pbnNuczsKKwkJaWYgKHJldCA+IDApIHsKKwkJCWkrKzsgLyogc2tpcCB0aGUg
bmV4dCBpbnN0cnVjdGlvbiAqLworCQkJaWYgKG9mZnNldCkKKwkJCQlvZmZzZXRbaV0gPSBjdHgt
Pm5pbnNuczsKKwkJfQogCQlpZiAocmV0IDwgMCkKIAkJCXJldHVybiByZXQ7CiAJfQpAQCAtMTc2
LDYgKzE3OSwxNSBAQCBzdHJ1Y3QgYnBmX3Byb2cgKmJwZl9pbnRfaml0X2NvbXBpbGUoc3RydWN0
IGJwZl92ZXJpZmllcl9lbnYgKmVudiwgc3RydWN0IGJwZl9wcgogCQlmb3IgKGkgPSAwOyBpIDwg
cHJvZy0+bGVuOyBpKyspCiAJCQljdHgtPm9mZnNldFtpXSA9IG5pbnNuc19ydm9mZihjdHgtPm9m
ZnNldFtpXSk7CiAJCWJwZl9wcm9nX2ZpbGxfaml0ZWRfbGluZm8ocHJvZywgY3R4LT5vZmZzZXQp
OworCisJCS8qCisJCSAqIGJwZl9wcm9nX3VwZGF0ZV9pbnNuX3B0cnMoKSB3YW50cyB0aGUgc3Rh
cnQgb2YgZWFjaCBpbnNuLCBzbworCQkgKiBzaGlmdCBjdHgtPm9mZnNldFtdIGJ5IG9uZSBhbmQg
Z2V0IGluc24gMCBmcm9tIHRoZSBwcm9sb2d1ZS4KKwkJICovCisJCWZvciAoaSA9IHByb2ctPmxl
biAtIDE7IGkgPiAwOyBpLS0pCisJCQljdHgtPm9mZnNldFtpXSA9IGN0eC0+b2Zmc2V0W2kgLSAx
XTsKKwkJY3R4LT5vZmZzZXRbMF0gPSBuaW5zbnNfcnZvZmYoY3R4LT5wcm9sb2d1ZV9sZW4pOwor
CQlicGZfcHJvZ191cGRhdGVfaW5zbl9wdHJzKHByb2csIGN0eC0+b2Zmc2V0LCBqaXRfZGF0YS0+
cm9faW1hZ2UpOwogb3V0X29mZnNldDoKIAkJa3ZmcmVlKGN0eC0+b2Zmc2V0KTsKIAkJa2ZyZWUo
aml0X2RhdGEpOwotLSAKMi41MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
