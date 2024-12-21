Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FF1E77190
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Dec 2024 14:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9cGpj7Rd8lXLpeH4nQXShbPJ84HhbwjhsQxiNZqUMng=; b=093St8JQUnncxZ
	xC8MI/rK4HBU1t5kt47cZqf3v+t4Y0LZf+vD0hjQZZSuA71GyjpqRAv+pcT9+8iaF2S3IsWSkxbLn
	OZt+gF4R8Ns4wJm7Z5Cu0qmB4OHJwcgDC9SRTsvWMJ4885RWSZlJXQOuQB+9AsgN7tTCwvJV/lDrZ
	uM+0XhvIUtS/fTlUFqEuUTtl90RWEJuwAThCm7Hvpv7KvWePehHa+0LsRMHTrqnit6Q2mLIfYEFWP
	Y7AlNycOI8BSjetx6wiR+CVGEVGX+MLh7Sdm9W2v1FHv5UgHceaux9HOvkCF3+4PjFnG+CUR+xQ1x
	tSaJGuPbiOKu7cb+sZMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP0il-000000074nm-0lTQ;
	Sat, 21 Dec 2024 14:44:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP0ik-000000074nI-3Hv3
	for linux-riscv@bombadil.infradead.org;
	Sat, 21 Dec 2024 14:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MbkpemYKsYI+P+k7bprHXlgeWVbZNSQvd+OguGAwZIY=; b=dnVwkBGrrMZNquvXsobk9hxs2V
	qxyPOJtfRQHkQ4VHPDetHI4pBlpMIpDsR1JQvTCCxNAs8+ydP23yyXZ2FC8Cw76Cp1fDk5woQfRWA
	vBQCIgwkqnbmvhASNT2UNJtydOkn4wRvtlrLBVA1YO9Kkn8L4TEWwfn89dg8T2F3pX6gEGqO6dAnb
	Cci763+oY0Q0w83XuZ1B1U+5FHEMklFZnNHhVL735XffCC0k+DYiKZnZn1hfOGOzX1y33Xk8JC0EG
	JPl6lA6t6VapVhSmg71SbaOEWGg6NQjA1iqpjLEUxW6WjNBRc35AdH4RZiNJ7EeTi5di4UzkUsjV9
	2OqylqUA==;
Received: from todd.t-8ch.de ([159.69.126.157])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP0ig-00000005uwl-3d46
	for linux-riscv@lists.infradead.org;
	Sat, 21 Dec 2024 14:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734792273;
	bh=aeC+A4pV2HWdlsm6EkBuWMFp7lqNtxjQtDsfDD7yt+U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DVfvFFAxN0lAeJgPVZ4fb4kJ1yCtViQZBydzRkTUY9RCVepnz7eL7u1gGHf9QeWPN
	 CYTbtFkj1O7ZnXDAcYUqkeHTtKhYxmDgSMe7646IHIZ4Is4IYyZlLxtbcdSAleEK77
	 it8JQE1CjE1rHNNzDwHM2r+ogpqAUA9wDsdKSiQA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 21 Dec 2024 15:44:32 +0100
Subject: [PATCH 5/6] selftests/nolibc: rename riscv to riscv64
MIME-Version: 1.0
Message-Id: <20241221-nolibc-rv32-v1-5-d9ef6dab7c63@weissschuh.net>
References: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
In-Reply-To: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Zhangjin Wu <falcon@tinylab.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734792271; l=3677;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=aeC+A4pV2HWdlsm6EkBuWMFp7lqNtxjQtDsfDD7yt+U=;
 b=kwEIY97BM65Wh57NezW76D9+hJKaHBZIqYvFW90fQ3JhDgz4M4S6HUudIF0hm56vsibeeWwN4
 LT6zf6mEOkECwkSneF/AI1lblToMpbJR1Ko5fkodxDy3yPU3yhng7sr
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_144443_300340_6BF1042A 
X-CRM114-Status: UNSURE (   8.59  )
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

cmlzY3YzMiBzdXBwb3J0IGlzIGFib3V0IHRoZSBiZSBhZGRlZC4gVG8ga2VlcCB0aGUgbmFtaW5n
IGNsZWFyIGFuZApjb25zaXN0ZW50IHdpdGggb3RoZXIgYXJjaGl0ZWN0dXJlcyByZW5hbWUgcmlz
Y3YgdG8gcmlzY3Y2NCwgYXMgdGhhdCBpcwp3aGF0IGl0IGFjdHVhbGx5IHJlcHJlc2VudHMuCgpT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8bGludXhAd2Vpc3NzY2h1aC5uZXQ+Ci0t
LQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlICAgICB8IDYgKysrKysr
CiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvcnVuLXRlc3RzLnNoIHwgMiArLQogMiBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvTWFrZWZpbGUgYi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9ub2xpYmMvTWFrZWZpbGUKaW5kZXggZTkyZTBiODg1ODYxMTEwNzJhMGUwNDNj
YjE1ZjNiNTljZjQyYzNhNi4uNzhmNDdlODViMzg5YWMyMjlhYzEzZjNlN2M4Mjk5ZmIzZWM5MjE5
NyAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlCisr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9NYWtlZmlsZQpAQCAtNDMsNiArNDMs
NyBAQCBjYy1vcHRpb24gPSAkKGNhbGwgX19jYy1vcHRpb24sICQoQ0MpLCQoQ0xBTkdfQ1JPU1Nf
RkxBR1MpLCQoMSksJCgyKSkKICMgY29uZmlndXJlIGRlZmF1bHQgdmFyaWFudHMgZm9yIHRhcmdl
dCBrZXJuZWwgc3VwcG9ydGVkIGFyY2hpdGVjdHVyZXMKIFhBUkNIX3Bvd2VycGMgICAgPSBwcGMK
IFhBUkNIX21pcHMgICAgICAgPSBtaXBzMzJsZQorWEFSQ0hfcmlzY3YgICAgICA9IHJpc2N2NjQK
IFhBUkNIICAgICAgICAgICAgPSAkKG9yICQoWEFSQ0hfJChBUkNIKSksJChBUkNIKSkKIAogIyBt
YXAgZnJvbSB1c2VyIGlucHV0IHZhcmlhbnRzIHRvIHRoZWlyIGtlcm5lbCBzdXBwb3J0ZWQgYXJj
aGl0ZWN0dXJlcwpAQCAtNTEsNiArNTIsNyBAQCBBUkNIX3BwYzY0ICAgICAgID0gcG93ZXJwYwog
QVJDSF9wcGM2NGxlICAgICA9IHBvd2VycGMKIEFSQ0hfbWlwczMybGUgICAgPSBtaXBzCiBBUkNI
X21pcHMzMmJlICAgID0gbWlwcworQVJDSF9yaXNjdjY0ICAgICA9IHJpc2N2CiBBUkNIICAgICAg
ICAgICAgOj0gJChvciAkKEFSQ0hfJChYQVJDSCkpLCQoWEFSQ0gpKQogCiAjIGtlcm5lbCBpbWFn
ZSBuYW1lcyBieSBhcmNoaXRlY3R1cmUKQEAgLTY1LDYgKzY3LDcgQEAgSU1BR0VfcHBjICAgICAg
ICA9IHZtbGludXgKIElNQUdFX3BwYzY0ICAgICAgPSB2bWxpbnV4CiBJTUFHRV9wcGM2NGxlICAg
ID0gYXJjaC9wb3dlcnBjL2Jvb3QvekltYWdlCiBJTUFHRV9yaXNjdiAgICAgID0gYXJjaC9yaXNj
di9ib290L0ltYWdlCitJTUFHRV9yaXNjdjY0ICAgID0gYXJjaC9yaXNjdi9ib290L0ltYWdlCiBJ
TUFHRV9zMzkwICAgICAgID0gYXJjaC9zMzkwL2Jvb3QvYnpJbWFnZQogSU1BR0VfbG9vbmdhcmNo
ICA9IGFyY2gvbG9vbmdhcmNoL2Jvb3Qvdm1saW51ei5lZmkKIElNQUdFICAgICAgICAgICAgPSAk
KG9ianRyZWUpLyQoSU1BR0VfJChYQVJDSCkpCkBAIC04Miw2ICs4NSw3IEBAIERFRkNPTkZJR19w
cGMgICAgICAgID0gcG1hYzMyX2RlZmNvbmZpZwogREVGQ09ORklHX3BwYzY0ICAgICAgPSBwb3dl
cm52X2JlX2RlZmNvbmZpZwogREVGQ09ORklHX3BwYzY0bGUgICAgPSBwb3dlcm52X2RlZmNvbmZp
ZwogREVGQ09ORklHX3Jpc2N2ICAgICAgPSBkZWZjb25maWcKK0RFRkNPTkZJR19yaXNjdjY0ICAg
ID0gZGVmY29uZmlnCiBERUZDT05GSUdfczM5MCAgICAgICA9IGRlZmNvbmZpZwogREVGQ09ORklH
X2xvb25nYXJjaCAgPSBkZWZjb25maWcKIERFRkNPTkZJRyAgICAgICAgICAgID0gJChERUZDT05G
SUdfJChYQVJDSCkpCkBAIC0xMDQsNiArMTA4LDcgQEAgUUVNVV9BUkNIX3BwYyAgICAgICAgPSBw
cGMKIFFFTVVfQVJDSF9wcGM2NCAgICAgID0gcHBjNjQKIFFFTVVfQVJDSF9wcGM2NGxlICAgID0g
cHBjNjQKIFFFTVVfQVJDSF9yaXNjdiAgICAgID0gcmlzY3Y2NAorUUVNVV9BUkNIX3Jpc2N2NjQg
ICAgPSByaXNjdjY0CiBRRU1VX0FSQ0hfczM5MCAgICAgICA9IHMzOTB4CiBRRU1VX0FSQ0hfbG9v
bmdhcmNoICA9IGxvb25nYXJjaDY0CiBRRU1VX0FSQ0ggICAgICAgICAgICA9ICQoUUVNVV9BUkNI
XyQoWEFSQ0gpKQpAQCAtMTMwLDYgKzEzNSw3IEBAIFFFTVVfQVJHU19wcGMgICAgICAgID0gLU0g
ZzNiZWlnZSAtYXBwZW5kICJjb25zb2xlPXR0eVMwIHBhbmljPS0xICQoVEVTVDolPU5PTElCCiBR
RU1VX0FSR1NfcHBjNjQgICAgICA9IC1NIHBvd2VybnYgLWFwcGVuZCAiY29uc29sZT1odmMwIHBh
bmljPS0xICQoVEVTVDolPU5PTElCQ19URVNUPSUpIgogUUVNVV9BUkdTX3BwYzY0bGUgICAgPSAt
TSBwb3dlcm52IC1hcHBlbmQgImNvbnNvbGU9aHZjMCBwYW5pYz0tMSAkKFRFU1Q6JT1OT0xJQkNf
VEVTVD0lKSIKIFFFTVVfQVJHU19yaXNjdiAgICAgID0gLU0gdmlydCAtYXBwZW5kICJjb25zb2xl
PXR0eVMwIHBhbmljPS0xICQoVEVTVDolPU5PTElCQ19URVNUPSUpIgorUUVNVV9BUkdTX3Jpc2N2
NjQgICAgPSAtTSB2aXJ0IC1hcHBlbmQgImNvbnNvbGU9dHR5UzAgcGFuaWM9LTEgJChURVNUOiU9
Tk9MSUJDX1RFU1Q9JSkiCiBRRU1VX0FSR1NfczM5MCAgICAgICA9IC1NIHMzOTAtY2N3LXZpcnRp
byAtYXBwZW5kICJjb25zb2xlPXR0eVMwIHBhbmljPS0xICQoVEVTVDolPU5PTElCQ19URVNUPSUp
IgogUUVNVV9BUkdTX2xvb25nYXJjaCAgPSAtTSB2aXJ0IC1hcHBlbmQgImNvbnNvbGU9dHR5UzAs
MTE1MjAwIHBhbmljPS0xICQoVEVTVDolPU5PTElCQ19URVNUPSUpIgogUUVNVV9BUkdTICAgICAg
ICAgICAgPSAtbSAxRyAkKFFFTVVfQVJHU18kKFhBUkNIKSkgJChRRU1VX0FSR1NfQklPUykgJChR
RU1VX0FSR1NfRVhUUkEpCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xp
YmMvcnVuLXRlc3RzLnNoIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL3J1bi10ZXN0
cy5zaAppbmRleCBlN2VjZGE0YWU3OTZmYmYwZDM4OWYyMDE0NDUxMWU2NmNlNGYwYjMwLi5jYWEx
YWU0MGZlOWEyZmFmODkzMWMyOTlhYWNkMTk3MTYyMjdlMmI4IDEwMDc1NQotLS0gYS90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvcnVuLXRlc3RzLnNoCisrKyBiL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL25vbGliYy9ydW4tdGVzdHMuc2gKQEAgLTE3LDcgKzE3LDcgQEAgcGVyZm9ybV9k
b3dubG9hZD0wCiB0ZXN0X21vZGU9c3lzdGVtCiB3ZXJyb3I9MQogbGx2bT0KLWFyY2hzPSJpMzg2
IHg4Nl82NCBhcm02NCBhcm0gbWlwczMybGUgbWlwczMyYmUgcHBjIHBwYzY0IHBwYzY0bGUgcmlz
Y3YgczM5MCBsb29uZ2FyY2giCithcmNocz0iaTM4NiB4ODZfNjQgYXJtNjQgYXJtIG1pcHMzMmxl
IG1pcHMzMmJlIHBwYyBwcGM2NCBwcGM2NGxlIHJpc2N2NjQgczM5MCBsb29uZ2FyY2giCiAKIFRF
TVA9JChnZXRvcHQgLW8gJ2o6ZDpjOmI6YTptOnBlbGgnIC1uICIkMCIgLS0gIiRAIikKIAoKLS0g
CjIuNDcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
