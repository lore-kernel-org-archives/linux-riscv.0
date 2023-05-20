Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A78C77B7A
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 09:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Va1Bx1RD1Gij5bgiAyXkSruSJS4aag4eJ4uA2TOVq+s=; b=zkN8kYsK5aitUc
	SPMW/bymEe0ECalUhKUUnal8b5VEZR8yO2ztF+pfbg2SyVLnVuovwA76AlXvPi8PC6w6oDf8lJpHj
	oGJxLb/4DLozhqa1xHHbgJOF6mUCuKnscPpUfUIs4McNgbUUbMS/cO//F408Cry95mlc6z9qIihH0
	qvMQ1PUNREq/gn9Si8YFX9h+3FkQgrAe4ntxtS+qxYIv0AXcavXD9j7iE5Lf38PquHsqrIfE42Q6f
	jWuBpSRIsDuWXP3E2qtmAy+nZ0o6khQ4RThlU0BMiPj78PKh8CA7lHC+Ri07pLm6vSgsbFB/LKgGb
	0ihk5auVr940+05H+DPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0JHW-001Ber-2B;
	Sat, 20 May 2023 09:53:46 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0JHS-001BdX-2K
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 09:53:44 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1684576417;
	bh=4DgNOA9MxUdAC/1KBzMGa1BMYIwEibXuZWjLGIR+M4Y=;
	h=From:Date:Subject:To:Cc:From;
	b=YdfF2wHQeAHvxYdN3D90MRXKyn0mgq3yjtd06cnIPS30c+UHNOpY0Lj6zZCG2aRXE
	 R3QCC5C3DuZP8v/hq++VOyLpswTKYYc9s3tHXxLOevzairZCj9bJW3LQdXD9XaENgI
	 qhXdmBA7ft2J/LwOQV2IfASy1Mv/MaELdY/A94OY=
Date: Sat, 20 May 2023 11:53:35 +0200
Subject: [PATCH] tools/nolibc: riscv: add stackprotector support
MIME-Version: 1.0
Message-Id: <20230520-nolibc-stackprotector-riscv-v1-1-d8912012a034@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAJ6YaGQC/x2NQQrCMBAAv1L27EIaiaJfEQ/JdmsXQ1J2YxFK/
 27wOHOY2cFYhQ3uww7Km5jU0mE8DUBLLC9GmTqDd/7sgndYapZEaC3Se9XamFpVVDHacLw4Srd
 wnWkK0AspGmPSWGjpjfLJuctVeZbvf/l4HscP8js5B4IAAAA=
To: Willy Tarreau <w@1wt.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>
Cc: Zhangjin Wu <falcon@tinylab.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684576416; l=2523;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=4DgNOA9MxUdAC/1KBzMGa1BMYIwEibXuZWjLGIR+M4Y=;
 b=AQlACYthYxoszOZiNGyDJMnuc12eS8SCPgKc8+mKUU7vddLmVS/v0wGmHcxVJhTuTp1cUe+dP
 BrnOmwubpxDBV9w9hmNLbAtIpQb+KGH8KbEZLwivhPgdcHNYJRXZvp4
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_025342_913595_822CD139 
X-CRM114-Status: UNSURE (   7.84  )
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

U2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0Pgot
LS0KClRoaXMgd2FzIHNwbGl0IG91dCBmcm9tIHRoZSBnZW5lcmFsIHN0YWNrcHJvdGVjdG9yIHNl
cmllc1swXSB0byBiZQpyZWJhc2VkIG9uIHRoZSBub2xpYmMgcnYzMiB3b3JrIGZyb20gWmhhbmdq
aW4uCgpUaGlzIHdhcyBvbmx5IHRlc3RlZCBmb3IgcnY2NCBhcyB0aGUgbm9saWJjIHJ2MzIgcG9y
dCBpcyBub3QgeWV0CmZ1bmN0aW9uYWwuCgpCYXNlZCBvbiB0aGUgbm9saWJjLzIwMjMwNTIwLW5v
bGliYy1ydjMyK3N0a3AgYnJhbmNoLgoKWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwv
MjAyMzA0MDgtbm9saWJjLXN0YWNrcHJvdGVjdG9yLWFyY2hzLXYxLTAtMjcxZjVjODU5YzcxQHdl
aXNzc2NodWgubmV0LwotLS0KIHRvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2gtcmlzY3YuaCAgICAg
ICB8IDcgKysrKysrLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlIHwg
MSArCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2gtcmlzY3YuaCBiL3Rvb2xzL2luY2x1
ZGUvbm9saWJjL2FyY2gtcmlzY3YuaAppbmRleCA5OTJhMTczOWRkOWMuLmQwNDM5MjQ5YzljOSAx
MDA2NDQKLS0tIGEvdG9vbHMvaW5jbHVkZS9ub2xpYmMvYXJjaC1yaXNjdi5oCisrKyBiL3Rvb2xz
L2luY2x1ZGUvbm9saWJjL2FyY2gtcmlzY3YuaApAQCAtMTc3LDE0ICsxNzcsMTkgQEAgc3RydWN0
IHN5c19zdGF0X3N0cnVjdCB7CiBjaGFyICoqZW52aXJvbiBfX2F0dHJpYnV0ZV9fKCh3ZWFrKSk7
CiBjb25zdCB1bnNpZ25lZCBsb25nICpfYXV4diBfX2F0dHJpYnV0ZV9fKCh3ZWFrKSk7CiAKKyNk
ZWZpbmUgX19BUkNIX1NVUFBPUlRTX1NUQUNLX1BST1RFQ1RPUgorCiAvKiBzdGFydHVwIGNvZGUg
Ki8KLXZvaWQgX19hdHRyaWJ1dGVfXygod2Vhayxub3JldHVybixvcHRpbWl6ZSgib21pdC1mcmFt
ZS1wb2ludGVyIikpKSBfc3RhcnQodm9pZCkKK3ZvaWQgX19hdHRyaWJ1dGVfXygod2Vhayxub3Jl
dHVybixvcHRpbWl6ZSgib21pdC1mcmFtZS1wb2ludGVyIiksbm9fc3RhY2tfcHJvdGVjdG9yKSkg
X3N0YXJ0KHZvaWQpCiB7CiAJX19hc21fXyB2b2xhdGlsZSAoCiAJCSIub3B0aW9uIHB1c2hcbiIK
IAkJIi5vcHRpb24gbm9yZWxheFxuIgogCQkibGxhICAgZ3AsIF9fZ2xvYmFsX3BvaW50ZXIkXG4i
CiAJCSIub3B0aW9uIHBvcFxuIgorI2lmZGVmIE5PTElCQ19TVEFDS1BST1RFQ1RPUgorCQkiY2Fs
bCBfX3N0YWNrX2Noa19pbml0XG4iICAgIC8qIGluaXRpYWxpemUgc3RhY2sgcHJvdGVjdG9yICAg
ICAgICAgICAgICAgICAgICAgICAgICAqLworI2VuZGlmCiAJCVJFR19MIiBhMCwgMChzcClcbiIg
ICAgICAgICAgLyogYXJnYyAoYTApIHdhcyBpbiB0aGUgc3RhY2sgICAgICAgICAgICAgICAgICAg
ICAgICAgICovCiAJCSJhZGQgICBhMSwgc3AsICJTWlJFRyJcbiIgICAgLyogYXJndiAoYTEpID0g
c3AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCiAJCSJzbGxpICBhMiwg
YTAsICJQVFJMT0ciXG4iICAgLyogZW52cCAoYTIpID0gU1pSRUcqYXJnYyAuLi4gICAgICAgICAg
ICAgICAgICAgICAgICAgICovCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9u
b2xpYmMvTWFrZWZpbGUgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvTWFrZWZpbGUK
aW5kZXggNmQ2NjBkOTIyMjQwLi5iZDQxMTAyZWEyOTkgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL25vbGliYy9NYWtlZmlsZQorKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9ub2xpYmMvTWFrZWZpbGUKQEAgLTg1LDYgKzg1LDcgQEAgQ0ZMQUdTX1NUS1BfeDg2ID0gJChD
RkxBR1NfU1RBQ0tQUk9URUNUT1IpCiBDRkxBR1NfU1RLUF9hcm02NCA9ICQoQ0ZMQUdTX1NUQUNL
UFJPVEVDVE9SKQogQ0ZMQUdTX1NUS1BfYXJtID0gJChDRkxBR1NfU1RBQ0tQUk9URUNUT1IpCiBD
RkxBR1NfU1RLUF9taXBzID0gJChDRkxBR1NfU1RBQ0tQUk9URUNUT1IpCitDRkxBR1NfU1RLUF9y
aXNjdiA9ICQoQ0ZMQUdTX1NUQUNLUFJPVEVDVE9SKQogQ0ZMQUdTX1NUS1BfbG9vbmdhcmNoID0g
JChDRkxBR1NfU1RBQ0tQUk9URUNUT1IpCiBDRkxBR1NfczM5MCA9IC1tNjQKIENGTEFHUyAgPz0g
LU9zIC1mbm8taWRlbnQgLWZuby1hc3luY2hyb25vdXMtdW53aW5kLXRhYmxlcyAtc3RkPWM4OSBc
CgotLS0KYmFzZS1jb21taXQ6IDZhMWY3MzJlMGQ3NTNhNjkxZTllNzg3NjE1YjlhMGRkOTJlMWYz
ZjQKY2hhbmdlLWlkOiAyMDIzMDUyMC1ub2xpYmMtc3RhY2twcm90ZWN0b3ItcmlzY3YtMTYwY2I5
NTdmY2Q1CgpCZXN0IHJlZ2FyZHMsCi0tIApUaG9tYXMgV2Vpw59zY2h1aCA8bGludXhAd2Vpc3Nz
Y2h1aC5uZXQ+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
