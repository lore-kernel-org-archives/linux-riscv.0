Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34D1C77B7C
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 09:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8bLoHLaXaar8GSKjhQnilcoEKTmepRC48e1gzUrpZik=; b=oeJ2zKUokhfKWt
	6lRS12oXx1EGdL7IxPbSIK2zk+tO5GIvC7tyQQ+cxR11ruvJ9kauWcHlSoR6BRTUdSeMP7ZmOAVPQ
	zZBhFDOvAzp6K4efFDAao4j0+t3sS4oaHPTit8Ly/ZVDwTPPDPq9BTmTr7igsVj9RdrUymbJWW1ko
	eiJneTrPEB4FVJng5ZodjwtBCTiLJ58KslrhpXxSs2Vb4yJw7iW1Gnkvree0olzxvECY4p3gQtZJ+
	YCOBS+n3Hv0ILrzgEV6pV5ag1UB+oatjASF4V3VA62CfjQPxaIskh2ryUK7uMcOhBvIgB4MuOGBu5
	hyWDXb0MZ7aTD0J8ZQ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fUs-003VdD-0y;
	Sun, 21 May 2023 09:37:02 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fUn-003VaC-0k
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 09:36:59 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1684661803;
	bh=LZiWAVpExLBqMgeJqjse39jIjxB9mRmhb4XKNlxTTGk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aKPzR6j+3huZtpSLF6YDH0fFJla9wIq7qHOrQgL4kdykhoBWitzclVVYMTjGIXhRY
	 YEKn2pRpmzaX5O0q1ghuQU1KLWWBq3Wyp6KM4a3KVPPSviZSSyWLWA65gBFhBV+eWA
	 gWQLFyPVd6E2w2q7BGEJP+igoKeNHubZX97EpE1Y=
Date: Sun, 21 May 2023 11:36:31 +0200
Subject: [PATCH 3/7] tools/nolibc: ensure stack protector guard is never
 zero
MIME-Version: 1.0
Message-Id: <20230521-nolibc-automatic-stack-protector-v1-3-dad6c80c51c1@weissschuh.net>
References: <20230521-nolibc-automatic-stack-protector-v1-0-dad6c80c51c1@weissschuh.net>
In-Reply-To: <20230521-nolibc-automatic-stack-protector-v1-0-dad6c80c51c1@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684661802; l=1200;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=LZiWAVpExLBqMgeJqjse39jIjxB9mRmhb4XKNlxTTGk=;
 b=sO8HDPN/K4znD0QaY3SiD7iD6F2CEv31bBVfF6lPq1g8WZhC0+3FhV31SKjCcBcefvKdmKPMR
 u0UkQrt0A7sCyn8icIX+chE7SpWFl/tZHzoxx5uxcXyRtJCO35gOzf4
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_023657_772776_ADD517C9 
X-CRM114-Status: UNSURE (   9.82  )
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

VGhlIGFsbC16ZXJvIHBhdHRlcm4gaXMgb25lIG9mIHRoZSBtb3JlIHByb2JhYmxlIG91dC1vZi1i
b3VuZCB3cml0ZXMgc28KYWRkIGEgc3BlY2lhbCBjYXNlIHRvIG5vdCBhY2NpZGVudGFsbHkgYWNj
ZXB0IGl0LgoKQWxzbyBpdCBlbmFibGVzIHRoZSByZWxpYWJsZSBkZXRlY3Rpb24gb2Ygc3RhY2sg
cHJvdGVjdG9yIGluaXRpYWxpemF0aW9uCmR1cmluZyB0ZXN0aW5nLgoKU2lnbmVkLW9mZi1ieTog
VGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0PgotLS0KIHRvb2xzL2luY2x1
ZGUvbm9saWJjL3N0YWNrcHJvdGVjdG9yLmggfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUv
bm9saWJjL3N0YWNrcHJvdGVjdG9yLmggYi90b29scy9pbmNsdWRlL25vbGliYy9zdGFja3Byb3Rl
Y3Rvci5oCmluZGV4IDc3ZTUyNTFjNDQ5MC4uYjAxNTZmYzA3N2EwIDEwMDY0NAotLS0gYS90b29s
cy9pbmNsdWRlL25vbGliYy9zdGFja3Byb3RlY3Rvci5oCisrKyBiL3Rvb2xzL2luY2x1ZGUvbm9s
aWJjL3N0YWNrcHJvdGVjdG9yLmgKQEAgLTQ1LDggKzQ1LDkgQEAgX19hdHRyaWJ1dGVfXygod2Vh
ayxub19zdGFja19wcm90ZWN0b3Isc2VjdGlvbigiLnRleHQubm9saWJjX3N0YWNrX2NoayIpKSkK
IHZvaWQgX19zdGFja19jaGtfaW5pdCh2b2lkKQogewogCW15X3N5c2NhbGwzKF9fTlJfZ2V0cmFu
ZG9tLCAmX19zdGFja19jaGtfZ3VhcmQsIHNpemVvZihfX3N0YWNrX2Noa19ndWFyZCksIDApOwot
CS8qIGEgYml0IG1vcmUgcmFuZG9tbmVzcyBpbiBjYXNlIGdldHJhbmRvbSgpIGZhaWxzICovCi0J
X19zdGFja19jaGtfZ3VhcmQgXj0gKHVpbnRwdHJfdCkgJl9fc3RhY2tfY2hrX2d1YXJkOworCS8q
IGEgYml0IG1vcmUgcmFuZG9tbmVzcyBpbiBjYXNlIGdldHJhbmRvbSgpIGZhaWxzLCBlbnN1cmUg
dGhlIGd1YXJkIGlzIG5ldmVyIDAgKi8KKwlpZiAoX19zdGFja19jaGtfZ3VhcmQgIT0gKHVpbnRw
dHJfdCkgJl9fc3RhY2tfY2hrX2d1YXJkKQorCQlfX3N0YWNrX2Noa19ndWFyZCBePSAodWludHB0
cl90KSAmX19zdGFja19jaGtfZ3VhcmQ7CiB9CiAjZW5kaWYgLyogZGVmaW5lZChOT0xJQkNfU1RB
Q0tQUk9URUNUT1IpICovCiAKCi0tIAoyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
