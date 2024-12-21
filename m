Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C31E7718D
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Dec 2024 14:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2qvVlmEG8QDrbc8/4LMqWup4TS+JaEtxYh3chaacrQ=; b=knqH1qQiKDbrAj
	/Hj17KXuf/yxcv398wSuKJkoKfDBhyA3gYdNubqDW1/BM8RouUtauS8ygpwOTKc6pfRGG0S8SXKGX
	86sVzmuk920wkKUHcaf+F7fzNTxBgbiKpZAjmKceIBO+U0nqSKBdzeosjU3ZJtmNk63ol8vIRmwlR
	HlKDiOPvz37NAStFaU29GlvYM+p70U67E57ZGH7avMReZvXE/RGkkOFOGocoX5Y0cLDbMpwSVnje/
	bhTqY/5ZuN6gF2JLVtt8BdDct+ZgF0cQPvqJHy0XY1iYGBdqmMOvFJOA8COrN+v5NjhhxQIhHzV3y
	F6e3FE/eAvkprqmVdtHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP0ie-000000074j6-32Lr;
	Sat, 21 Dec 2024 14:44:40 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP0ib-000000074gP-2gpH
	for linux-riscv@lists.infradead.org;
	Sat, 21 Dec 2024 14:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734792272;
	bh=frLR13FDv9wGOaLeaaK7JPvRthh2lmgaUpvebzfmFKY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m4YGyeh0O8c7q7qd3hllODqv1NEk/dSEeN2KiOzWopTqJT8c88iccwJ+z3pGXSR95
	 l0DAaGgpyQ/i6lja6MWKOd9M76sw8LGZRGHywfokjuY5fUxDPwmM4rQluWr/OBTbqt
	 4BjfvjY2u7lvXw+UICfki3qgYFG4OxkikAsViNjE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 21 Dec 2024 15:44:30 +0100
Subject: [PATCH 3/6] selftests/nolibc: use a pipe to in vfprintf tests
MIME-Version: 1.0
Message-Id: <20241221-nolibc-rv32-v1-3-d9ef6dab7c63@weissschuh.net>
References: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
In-Reply-To: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Zhangjin Wu <falcon@tinylab.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734792271; l=1746;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=frLR13FDv9wGOaLeaaK7JPvRthh2lmgaUpvebzfmFKY=;
 b=gs7amVw+s5LZnTCX6MU6wJ0JxnVhWUnmJJklLIlAuqsF2BBtLDWPmuYdOZ7rs4I2iqnCfdCrk
 ngZv2FnmjTaDmNBrchU3eQTkK2kVmj4kdS8KwMiUq03Giv9QM2uxWum
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_064437_827447_BEF62C0D 
X-CRM114-Status: UNSURE (   9.58  )
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

Tm90IGFsbCBhcmNoaXRlY3R1cmVzIGltcGxlbWVudCBsc2VlaygpLCBmb3IgZXhhbXBsZSByaXNj
djMyIG9ubHkKaW1wbGVtZW50cyBsbHNlZWsoKSB3aGljaCBpcyBub3QgZXF1aXZhbGVudCB0byBu
b3JtYWwgbHNlZWsoKS4KUmVtb3ZlIHRoZSBuZWVkIGZvciBsc2VlaygpIGJ5IHVzaW5nIGEgcGlw
ZSBpbnN0ZWFkLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNz
c2NodWgubmV0PgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVz
dC5jIHwgMjAgKysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL25vbGliYy9ub2xpYmMtdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJj
L25vbGliYy10ZXN0LmMKaW5kZXggNjBjNTA5NjhkMzYzMGU0OTA5YTVlY2IyNDAwNzcwYmFhZjdj
MmFkZC4uMzY4NWMxM2E5YTZiOGZkNTExMDcxNWI5NWZmMzIzY2RjYjI5NDgxYSAxMDA2NDQKLS0t
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMKKysrIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMKQEAgLTEyMjksMTkgKzEy
MjksMjAgQEAgaW50IHJ1bl9zdGRsaWIoaW50IG1pbiwgaW50IG1heCkKIAogc3RhdGljIGludCBl
eHBlY3RfdmZwcmludGYoaW50IGxsZW4sIGludCBjLCBjb25zdCBjaGFyICpleHBlY3RlZCwgY29u
c3QgY2hhciAqZm10LCAuLi4pCiB7Ci0JaW50IHJldCwgZmQ7CisJaW50IHJldCwgcGlwZWZkWzJd
OwogCXNzaXplX3QgdywgcjsKIAljaGFyIGJ1ZlsxMDBdOwogCUZJTEUgKm1lbWZpbGU7CiAJdmFf
bGlzdCBhcmdzOwogCi0JZmQgPSBvcGVuKCIvdG1wIiwgT19UTVBGSUxFIHwgT19FWENMIHwgT19S
RFdSLCAwNjAwKTsKLQlpZiAoZmQgPT0gLTEpIHsKLQkJcmVzdWx0KGxsZW4sIFNLSVBQRUQpOwot
CQlyZXR1cm4gMDsKKwlyZXQgPSBwaXBlKHBpcGVmZCk7CisJaWYgKHJldCA9PSAtMSkgeworCQls
bGVuICs9IHByaW50ZigiIHBpcGUoKSAhPSAlcyIsIHN0cmVycm9yKGVycm5vKSk7CisJCXJlc3Vs
dChsbGVuLCBGQUlMKTsKKwkJcmV0dXJuIDE7CiAJfQogCi0JbWVtZmlsZSA9IGZkb3BlbihmZCwg
IncrIik7CisJbWVtZmlsZSA9IGZkb3BlbihwaXBlZmRbMV0sICJ3Iik7CiAJaWYgKCFtZW1maWxl
KSB7CiAJCXJlc3VsdChsbGVuLCBGQUlMKTsKIAkJcmV0dXJuIDE7CkBAIC0xMjU3LDEzICsxMjU4
LDEwIEBAIHN0YXRpYyBpbnQgZXhwZWN0X3ZmcHJpbnRmKGludCBsbGVuLCBpbnQgYywgY29uc3Qg
Y2hhciAqZXhwZWN0ZWQsIGNvbnN0IGNoYXIgKmZtCiAJCXJldHVybiAxOwogCX0KIAotCWZmbHVz
aChtZW1maWxlKTsKLQlsc2VlayhmZCwgMCwgU0VFS19TRVQpOwotCi0JciA9IHJlYWQoZmQsIGJ1
Ziwgc2l6ZW9mKGJ1ZikgLSAxKTsKLQogCWZjbG9zZShtZW1maWxlKTsKIAorCXIgPSByZWFkKHBp
cGVmZFswXSwgYnVmLCBzaXplb2YoYnVmKSAtIDEpOworCiAJaWYgKHIgIT0gdykgewogCQlsbGVu
ICs9IHByaW50ZigiIHdyaXR0ZW4oJWQpICE9IHJlYWQoJWQpIiwgKGludCl3LCAoaW50KXIpOwog
CQlyZXN1bHQobGxlbiwgRkFJTCk7CgotLSAKMi40Ny4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
