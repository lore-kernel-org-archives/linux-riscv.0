Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22164E7718E
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Dec 2024 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/35MfDozCZcQ0TwW5QYE66xQLEMasgyuWnGV9laf1pE=; b=rHuRUxPvmTocmx
	kadXUr6YWXGXDiAA3/D/DV0Tz+ySejvNnPl5XFOKRcnOIMR4mhWMROmeXQ/0Bcdz+FKjqifCZwsS8
	/XpH38ZMjSbTWQcFlvqTKAXLQxMS56qXaqAs6u87QPTrq4fzg7WtFFtotPcl2mUZt3EFpeU7tL1dD
	LOtb6hRJp/HiwLGIJHMowbDJeSro782xFXpe/kmHITUJiz957m7zNCf2lYlTSOfd9Nu9zj8CxM+Oz
	3k8fwyA46y7sw/VWc0eHr345U3lkkEHi6Cm7ngTqwXaFk5Sda1EtlGONaAoDWUMmFzZhf9oWVoP6l
	+9Nb9SiYclb4YPD61CAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP0ih-000000074lo-3h6p;
	Sat, 21 Dec 2024 14:44:43 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP0ib-000000074gS-3anT
	for linux-riscv@lists.infradead.org;
	Sat, 21 Dec 2024 14:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734792272;
	bh=bg5UlBq3THh05UiKb+gXkEUVzYOv1u5Ao6jXpQiecuk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZS7EZHAA6phWrr5kKUxHD0QIEi+utM+nEXN9V49sJb7AL7HkSQuy925253MyE62Bu
	 SzGsioEPcGROh9PuN0FY16lEKw+LynhgetjhQCetRVY4zlLU8R43poWaR6hzWhi0Yx
	 MdeeGOeJrRT5/84EYKMB3XyWZ8L7dwvZP+x4guUM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 21 Dec 2024 15:44:31 +0100
Subject: [PATCH 4/6] selftests/nolibc: skip tests for unimplemented
 syscalls
MIME-Version: 1.0
Message-Id: <20241221-nolibc-rv32-v1-4-d9ef6dab7c63@weissschuh.net>
References: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
In-Reply-To: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Zhangjin Wu <falcon@tinylab.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734792271; l=1803;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=bg5UlBq3THh05UiKb+gXkEUVzYOv1u5Ao6jXpQiecuk=;
 b=Z4n3QT+/74DaRTLgeQKACFugaghlokDmCaupwH84G5FyZGHX+NZ4Uz+1ctl44mrhDCNV8YixA
 BvDcB8OBSPOBSkOpcX8RvSpqpZNk+Dg4E09ySvywOLmZOSFr/t1kgZI
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_064438_041626_BB593EBB 
X-CRM114-Status: UNSURE (   8.69  )
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

VGhlIHJpc2N2MzIgYXJjaGl0ZWN0dXJlIGlzIG1pc3NpbmcgbWFueSBvZiB0aGUgb2xkZXIgc3lz
Y2FsbHMuCkluc3RlYWQgb2YgcHJvdmlkaW5nIHdyYXBwZXJzIGZvciBldmVyeXRoaW5nIGF0IG9u
Y2UsIGludHJvZHVjaW5nIGEgbG90Cm9mIGNvbXBsZXhpdHksIHNraXAgdGhlIHRlc3RzIGZvciB0
aG9zZSBzeXNjYWxscyBmb3Igbm93LgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWgg
PGxpbnV4QHdlaXNzc2NodWgubmV0PgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGli
Yy9ub2xpYmMtdGVzdC5jIHwgMTQgKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
bm9saWJjL25vbGliYy10ZXN0LmMKaW5kZXggMzY4NWMxM2E5YTZiOGZkNTExMDcxNWI5NWZmMzIz
Y2RjYjI5NDgxYS4uMGUwZTNiNDhhOGMzYTY4MDJjNjk4OTk1NGI2ZjNhN2M3MjU4ZGI0MyAxMDA2
NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMKKysr
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMKQEAgLTMwMiw3
ICszMDIsMTAgQEAgaW50IGV4cGVjdF9zeXN6cihpbnQgZXhwciwgaW50IGxsZW4pCiB7CiAJaW50
IHJldCA9IDA7CiAKLQlpZiAoZXhwcikgeworCWlmIChlcnJubyA9PSBFTk9TWVMpIHsKKwkJbGxl
biArPSBwcmludGYoIiA9IEVOT1NZUyIpOworCQlyZXN1bHQobGxlbiwgU0tJUFBFRCk7CisJfSBl
bHNlIGlmIChleHByKSB7CiAJCXJldCA9IDE7CiAJCWxsZW4gKz0gcHJpbnRmKCIgPSAlZCAlcyAi
LCBleHByLCBlcnJvcm5hbWUoZXJybm8pKTsKIAkJcmVzdWx0KGxsZW4sIEZBSUwpOwpAQCAtMzQy
LDcgKzM0NSwxMCBAQCBpbnQgZXhwZWN0X3N5c25lKGludCBleHByLCBpbnQgbGxlbiwgaW50IHZh
bCkKIHsKIAlpbnQgcmV0ID0gMDsKIAotCWlmIChleHByID09IHZhbCkgeworCWlmIChlcnJubyA9
PSBFTk9TWVMpIHsKKwkJbGxlbiArPSBwcmludGYoIiA9IEVOT1NZUyIpOworCQlyZXN1bHQobGxl
biwgU0tJUFBFRCk7CisJfSBlbHNlIGlmIChleHByID09IHZhbCkgewogCQlyZXQgPSAxOwogCQls
bGVuICs9IHByaW50ZigiID0gJWQgJXMgIiwgZXhwciwgZXJyb3JuYW1lKGVycm5vKSk7CiAJCXJl
c3VsdChsbGVuLCBGQUlMKTsKQEAgLTM2Nyw3ICszNzMsOSBAQCBpbnQgZXhwZWN0X3N5c2VycjIo
aW50IGV4cHIsIGludCBleHByZXQsIGludCBleHBlcnIxLCBpbnQgZXhwZXJyMiwgaW50IGxsZW4p
CiAJaW50IF9lcnJubyA9IGVycm5vOwogCiAJbGxlbiArPSBwcmludGYoIiA9ICVkICVzICIsIGV4
cHIsIGVycm9ybmFtZShfZXJybm8pKTsKLQlpZiAoZXhwciAhPSBleHByZXQgfHwgKF9lcnJubyAh
PSBleHBlcnIxICYmIF9lcnJubyAhPSBleHBlcnIyKSkgeworCWlmIChlcnJubyA9PSBFTk9TWVMp
IHsKKwkJcmVzdWx0KGxsZW4sIFNLSVBQRUQpOworCX0gZWxzZSBpZiAoZXhwciAhPSBleHByZXQg
fHwgKF9lcnJubyAhPSBleHBlcnIxICYmIF9lcnJubyAhPSBleHBlcnIyKSkgewogCQlyZXQgPSAx
OwogCQlpZiAoZXhwZXJyMiA9PSAwKQogCQkJbGxlbiArPSBwcmludGYoIiAhPSAoJWQgJXMpICIs
IGV4cHJldCwgZXJyb3JuYW1lKGV4cGVycjEpKTsKCi0tIAoyLjQ3LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
