Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7193EC77B7F
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 16:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5BjI53y822gVKxi8N61jhsJdaF8tqmNQmb092LvMYs=; b=aPyIjo/LI+lzp0
	Wg1NKvLEVjZ5fP+K+5Q3oRcgALbbfPSZCU+Olgbm8QqAxt1aRFKbSY7sQuQFU3+6xicjOEW4knowP
	L0JGXH5JLgDeg2ToHRjKP+YF6/ihUiOFQZhcexKQx6/HN7PVIT9XeqyO+Geb20Lje9+RNxxRf0m+C
	loGduQ59ajQbpEoe9ilgQnjrc1FY2m4ExP9iVl2mgMaAAto0DjH7yKJonRi75y0xrOMccX2y3wYBW
	9x7sR1qvqQyH3o/3FBe6AYF7ddCMHAhJViR12pCt5QmDAP1GbbwhjSHjY5jaFCpx5jG+3GWuBUZM0
	N7n/PjHIKcLjCYaKe+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poRIl-00GzAq-1L;
	Mon, 17 Apr 2023 16:01:59 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poRIe-00Gz7W-2x
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 16:01:54 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1681747301;
	bh=iwWW56Gx2lHStfQUQLk6EkDugqDvy/8mdADPIa3bZBc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LAZFEc5+buhv5vFiEgQ4tVfLKtvgMm7K7xdNzjQoLSnVM8ybd6eb/wrr+lb0RMHXG
	 QsJEMZB++ItERXWp2Jv43McibCD0PoMHYbumhEzpJD/vCsWmkRJzDe0Z26dbLBq4yn
	 MUunnPYWPp9wjDuds29Nb9Vh+ozyU1AJbvjmVFv8=
Date: Mon, 17 Apr 2023 18:01:31 +0200
Subject: [PATCH 1/6] selftests/nolibc: reduce syscalls during space padding
MIME-Version: 1.0
Message-Id: <20230408-nolibc-stackprotector-archs-v1-1-271f5c859c71@weissschuh.net>
References: <20230408-nolibc-stackprotector-archs-v1-0-271f5c859c71@weissschuh.net>
In-Reply-To: <20230408-nolibc-stackprotector-archs-v1-0-271f5c859c71@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681747300; l=1322;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=iwWW56Gx2lHStfQUQLk6EkDugqDvy/8mdADPIa3bZBc=;
 b=selfxBdXZN6SyUn9/aMPtG19qHA4hVIr96ooaQSSksgZp/PXoWSXp/QlxzyjnYfomFB9l7tEj
 htoVVvo6yB2DT7K+m+H1w3NCUEcJJj4a20quDM+7bESYELvKgwgdcyo
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_090153_145218_C651AAA2 
X-CRM114-Status: UNSURE (   8.33  )
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

UHJldmlvdXNseSBlYWNoIHNwYWNlIGNoYXJhY3RlciB1c2VkIGZvciBhbGlnbm1lbnQgZHVyaW5n
IHRlc3QgZXhlY3V0aW9uCndhcyB3cml0dGVuIGluIGEgc2luZ2xlIHdyaXRlKCkgY2FsbC4KVGhp
cyB3b3VsZCBtYWtlIHRoZSBvdXRwdXQgZnJvbSBzdHJhY2UgZmFpcmx5IHVucmVhZGFibGUuCkNv
YWxlc2NlIGFsbCBzcGFjZXMgaW50byBhIHNpbmdsZSBjYWxsIHRvIHdyaXRlKCkuCgpTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8bGludXhAd2Vpc3NzY2h1aC5uZXQ+Ci0tLQogdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMgfCAxNSArKysrKysrKysr
Ky0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5j
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMKaW5kZXggNjhl
MjI2MTc2NTFjLi4zNWYyMDM1NTZhMGMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL25vbGliYy9ub2xpYmMtdGVzdC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25v
bGliYy9ub2xpYmMtdGVzdC5jCkBAIC0xMDgsMTkgKzEwOCwyNiBAQCBjb25zdCBjaGFyICplcnJv
cm5hbWUoaW50IGVycikKIAl9CiB9CiAKK3N0YXRpYyB2b2lkIHB1dGNoYXJuKGNoYXIgYywgc2l6
ZV90IG4pCit7CisJY2hhciBidWZbNjRdOworCisJbWVtc2V0KGJ1ZiwgYywgbik7CisJYnVmW25d
ID0gJ1wwJzsKKwlmcHV0cyhidWYsIHN0ZG91dCk7Cit9CisKIHN0YXRpYyBpbnQgcGFkX3NwYyhp
bnQgbGxlbiwgaW50IGNudCwgY29uc3QgY2hhciAqZm10LCAuLi4pCiB7CiAJdmFfbGlzdCBhcmdz
OwotCWludCBsZW47CiAJaW50IHJldDsKIAotCWZvciAobGVuID0gMDsgbGVuIDwgY250IC0gbGxl
bjsgbGVuKyspCi0JCXB1dGNoYXIoJyAnKTsKKwlwdXRjaGFybignICcsIGNudCAtIGxsZW4pOwog
CiAJdmFfc3RhcnQoYXJncywgZm10KTsKIAlyZXQgPSB2ZnByaW50ZihzdGRvdXQsIGZtdCwgYXJn
cyk7CiAJdmFfZW5kKGFyZ3MpOwotCXJldHVybiByZXQgPCAwID8gcmV0IDogcmV0ICsgbGVuOwor
CXJldHVybiByZXQgPCAwID8gcmV0IDogcmV0ICsgY250IC0gbGxlbjsKIH0KIAogLyogVGhlIHRl
c3RzIGJlbG93IGFyZSBpbnRlbmRlZCB0byBiZSB1c2VkIGJ5IHRoZSBtYWNyb2VzLCB3aGljaCBl
dmFsdWF0ZQoKLS0gCjIuNDAuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
