Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A00EEAA53
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 16:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oEHTtM+pHg7fYgyQNlJw2YSgzz78InThR14sFvEtnj8=; b=LwLkHGW0OYn4bC
	A7xkAdF2t1nBxCupN/PcoWTwPeDPtcigBee3b1sIkliXiZZKngzn5vydE6I8Jq2GRznc+48pRsA9+
	p7xRC6kXpoOauLC4Y9JTtiNWOHrVMmhxrlXztPkSmWy3bNE4ldgozWfRY/4NAUsjW3hjGmF1bQKDk
	C9aj4NRfXOmgg1IS4S1D9p/vvZDlNmVzneWQ4V6aU7PqmSNl7/f5bGjov1DtGBevb01ghMrgECAV9
	Xl6Q9OOZ/9tj/Z4eeaFIJ23nRwj76lZHNxkYvdPYdvRXyCzkdCiIY211X9msXbDd/n9fshrPHiLmi
	m6EQHs76G1PRWaARxQNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgomo-008qtW-2a;
	Thu, 14 Sep 2023 16:01:46 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgomh-008qpY-2w
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 16:01:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1694707293;
	bh=rklkaKmuEop2mkqsY9+prLbWDx4KQ6pug1wWbwN/pUU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l0Q201ayEAQrclQ0up4pYQXtSYdkzEK6uNrRoR2Ydz94iDRpFdRko733hWRKljKnX
	 ek6mnVsHkN6wTlz9/mww7YXQUCAYev+O1cs3rkGQ/+0U4BHjqbkFa6enJpUr0UJXSr
	 m4iTLUZQUUJE93+vAqr0qmdRE9D8GGyIxx+th+Tc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 14 Sep 2023 18:01:18 +0200
Subject: [PATCH 2/4] tools/nolibc: avoid unused parameter warnings for
 ENOSYS fallbacks
MIME-Version: 1.0
Message-Id: <20230914-nolibc-syscall-nr-v1-2-e50df410da11@weissschuh.net>
References: <20230914-nolibc-syscall-nr-v1-0-e50df410da11@weissschuh.net>
In-Reply-To: <20230914-nolibc-syscall-nr-v1-0-e50df410da11@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694707292; l=3290;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=rklkaKmuEop2mkqsY9+prLbWDx4KQ6pug1wWbwN/pUU=;
 b=3ASFNj+C1ZmK459CmYHIr9/+BQymJpv0Mz8eFVb1MBFyHEdV/HJa8qwuKaUDzvCrAjBT06SAh
 2EY0avaf7rvCgBGFJj+0E3x0xKlFz9hy/NC6XYAJ7QBGapHZ5vh9TUM
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_090140_129481_413DD9F6 
X-CRM114-Status: UNSURE (   5.75  )
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

VGhlIEVOT1NZUyBmYWxsYmFjayBjb2RlIGRvZXMgbm90IHVzZSBpdHMgZnVuY3Rpb25zIHBhcmFt
ZXRlcnMuClRoaXMgY2FuIGxlYWQgdG8gY29tcGlsZXIgd2FybmluZ3MgYWJvdXQgdW51c2VkIHBh
cmFtZXRlcnMuCgpFeHBsaWNpdGx5IGF2b2lkIHRoZXNlIHdhcm5pbmdzLgoKU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0PgotLS0KIHRvb2xzL2lu
Y2x1ZGUvbm9saWJjL3N5cy5oIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9pbmNs
dWRlL25vbGliYy9zeXMuaCBiL3Rvb2xzL2luY2x1ZGUvbm9saWJjL3N5cy5oCmluZGV4IGI0Nzg3
NTBjOTAwNC4uYmM1NjMxMGM2YmRmIDEwMDY0NAotLS0gYS90b29scy9pbmNsdWRlL25vbGliYy9z
eXMuaAorKysgYi90b29scy9pbmNsdWRlL25vbGliYy9zeXMuaApAQCAtMTMzLDYgKzEzMyw4IEBA
IGludCBzeXNfY2htb2QoY29uc3QgY2hhciAqcGF0aCwgbW9kZV90IG1vZGUpCiAjZWxpZiBkZWZp
bmVkKF9fTlJfY2htb2QpCiAJcmV0dXJuIG15X3N5c2NhbGwyKF9fTlJfY2htb2QsIHBhdGgsIG1v
ZGUpOwogI2Vsc2UKKwkodm9pZClwYXRoOworCSh2b2lkKW1vZGU7CiAJcmV0dXJuIC1FTk9TWVM7
CiAjZW5kaWYKIH0KQEAgLTE1Niw2ICsxNTgsOSBAQCBpbnQgc3lzX2Nob3duKGNvbnN0IGNoYXIg
KnBhdGgsIHVpZF90IG93bmVyLCBnaWRfdCBncm91cCkKICNlbGlmIGRlZmluZWQoX19OUl9jaG93
bikKIAlyZXR1cm4gbXlfc3lzY2FsbDMoX19OUl9jaG93biwgcGF0aCwgb3duZXIsIGdyb3VwKTsK
ICNlbHNlCisJKHZvaWQpcGF0aDsKKwkodm9pZClvd25lcjsKKwkodm9pZClncm91cDsKIAlyZXR1
cm4gLUVOT1NZUzsKICNlbmRpZgogfQpAQCAtMjMwLDYgKzIzNSw4IEBAIGludCBzeXNfZHVwMihp
bnQgb2xkLCBpbnQgbmV3KQogI2VsaWYgZGVmaW5lZChfX05SX2R1cDIpCiAJcmV0dXJuIG15X3N5
c2NhbGwyKF9fTlJfZHVwMiwgb2xkLCBuZXcpOwogI2Vsc2UKKwkodm9pZClvbGQ7CisJKHZvaWQp
bmV3OwogCXJldHVybiAtRU5PU1lTOwogI2VuZGlmCiB9CkBAIC00ODYsNiArNDkzLDggQEAgaW50
IHN5c19nZXR0aW1lb2ZkYXkoc3RydWN0IHRpbWV2YWwgKnR2LCBzdHJ1Y3QgdGltZXpvbmUgKnR6
KQogI2lmZGVmIF9fTlJfZ2V0dGltZW9mZGF5CiAJcmV0dXJuIG15X3N5c2NhbGwyKF9fTlJfZ2V0
dGltZW9mZGF5LCB0diwgdHopOwogI2Vsc2UKKwkodm9pZCl0djsKKwkodm9pZCl0ejsKIAlyZXR1
cm4gLUVOT1NZUzsKICNlbmRpZgogfQpAQCAtNTYzLDYgKzU3Miw4IEBAIGludCBzeXNfbGluayhj
b25zdCBjaGFyICpvbGQsIGNvbnN0IGNoYXIgKm5ldykKICNlbGlmIGRlZmluZWQoX19OUl9saW5r
KQogCXJldHVybiBteV9zeXNjYWxsMihfX05SX2xpbmssIG9sZCwgbmV3KTsKICNlbHNlCisJKHZv
aWQpb2xkOworCSh2b2lkKW5ldzsKIAlyZXR1cm4gLUVOT1NZUzsKICNlbmRpZgogfQpAQCAtNTg0
LDYgKzU5NSw5IEBAIG9mZl90IHN5c19sc2VlayhpbnQgZmQsIG9mZl90IG9mZnNldCwgaW50IHdo
ZW5jZSkKICNpZmRlZiBfX05SX2xzZWVrCiAJcmV0dXJuIG15X3N5c2NhbGwzKF9fTlJfbHNlZWss
IGZkLCBvZmZzZXQsIHdoZW5jZSk7CiAjZWxzZQorCSh2b2lkKWZkOworCSh2b2lkKW9mZnNldDsK
Kwkodm9pZCl3aGVuY2U7CiAJcmV0dXJuIC1FTk9TWVM7CiAjZW5kaWYKIH0KQEAgLTYwNyw2ICs2
MjEsOCBAQCBpbnQgc3lzX21rZGlyKGNvbnN0IGNoYXIgKnBhdGgsIG1vZGVfdCBtb2RlKQogI2Vs
aWYgZGVmaW5lZChfX05SX21rZGlyKQogCXJldHVybiBteV9zeXNjYWxsMihfX05SX21rZGlyLCBw
YXRoLCBtb2RlKTsKICNlbHNlCisJKHZvaWQpcGF0aDsKKwkodm9pZCltb2RlOwogCXJldHVybiAt
RU5PU1lTOwogI2VuZGlmCiB9CkBAIC02MjksNiArNjQ1LDcgQEAgaW50IHN5c19ybWRpcihjb25z
dCBjaGFyICpwYXRoKQogI2VsaWYgZGVmaW5lZChfX05SX3VubGlua2F0KQogCXJldHVybiBteV9z
eXNjYWxsMyhfX05SX3VubGlua2F0LCBBVF9GRENXRCwgcGF0aCwgQVRfUkVNT1ZFRElSKTsKICNl
bHNlCisJKHZvaWQpcGF0aDsKIAlyZXR1cm4gLUVOT1NZUzsKICNlbmRpZgogfQpAQCAtNjUyLDYg
KzY2OSw5IEBAIGxvbmcgc3lzX21rbm9kKGNvbnN0IGNoYXIgKnBhdGgsIG1vZGVfdCBtb2RlLCBk
ZXZfdCBkZXYpCiAjZWxpZiBkZWZpbmVkKF9fTlJfbWtub2QpCiAJcmV0dXJuIG15X3N5c2NhbGwz
KF9fTlJfbWtub2QsIHBhdGgsIG1vZGUsIGRldik7CiAjZWxzZQorCSh2b2lkKXBhdGg7CisJKHZv
aWQpbW9kZTsKKwkodm9pZClkZXY7CiAJcmV0dXJuIC1FTk9TWVM7CiAjZW5kaWYKIH0KQEAgLTc0
Miw2ICs3NjIsOSBAQCBpbnQgc3lzX29wZW4oY29uc3QgY2hhciAqcGF0aCwgaW50IGZsYWdzLCBt
b2RlX3QgbW9kZSkKICNlbGlmIGRlZmluZWQoX19OUl9vcGVuKQogCXJldHVybiBteV9zeXNjYWxs
MyhfX05SX29wZW4sIHBhdGgsIGZsYWdzLCBtb2RlKTsKICNlbHNlCisJKHZvaWQpcGF0aDsKKwko
dm9pZClmbGFnczsKKwkodm9pZCltb2RlOwogCXJldHVybiAtRU5PU1lTOwogI2VuZGlmCiB9CkBA
IC04NDIsNiArODY1LDkgQEAgaW50IHN5c19wb2xsKHN0cnVjdCBwb2xsZmQgKmZkcywgaW50IG5m
ZHMsIGludCB0aW1lb3V0KQogI2VsaWYgZGVmaW5lZChfX05SX3BvbGwpCiAJcmV0dXJuIG15X3N5
c2NhbGwzKF9fTlJfcG9sbCwgZmRzLCBuZmRzLCB0aW1lb3V0KTsKICNlbHNlCisJKHZvaWQpZmRz
OworCSh2b2lkKW5mZHM7CisJKHZvaWQpdGltZW91dDsKIAlyZXR1cm4gLUVOT1NZUzsKICNlbmRp
ZgogfQpAQCAtOTM0LDYgKzk2MCwxMSBAQCBpbnQgc3lzX3NlbGVjdChpbnQgbmZkcywgZmRfc2V0
ICpyZmRzLCBmZF9zZXQgKndmZHMsIGZkX3NldCAqZWZkcywgc3RydWN0IHRpbWV2YQogI2VuZGlm
CiAJcmV0dXJuIG15X3N5c2NhbGw1KF9fTlJfX25ld3NlbGVjdCwgbmZkcywgcmZkcywgd2Zkcywg
ZWZkcywgdGltZW91dCk7CiAjZWxzZQorCSh2b2lkKW5mZHM7CisJKHZvaWQpcmZkczsKKwkodm9p
ZCl3ZmRzOworCSh2b2lkKWVmZHM7CisJKHZvaWQpdGltZW91dDsKIAlyZXR1cm4gLUVOT1NZUzsK
ICNlbmRpZgogfQoKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
