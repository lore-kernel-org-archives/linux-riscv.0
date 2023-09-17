Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDA6CD13D1
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Sep 2023 15:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9KdOaz6eURazfdLw5/U+fqdjhUh9t9I1W2NbGPYN+UQ=; b=OhtLfI8/+ZIdz3
	/t9wKglvXsv9DotPuHlsOPoaHkATQxaHMKfMMjwFZpMhw8rgoCUmno39oToYr19Q7PiArIGXUWDOk
	so192Sczs2VaxbnXs6WRrngOXFDyTHjvUryt7VMKfFVyIbN0LhtYZJnkfg7nPY/9Aq+qulqm/UfLK
	mVpJxO92XrvHhbv7SgN7TXjPmYo1B+U3fAmMEqGGf4n8XdsA0p+D04JI4oSL840Bxcty6/1vPIZfN
	861UH4GhLXIsdcitxjCzKaaIKiZ3oshDFuwMgVHnWPld8d5MC6RixEPvtIwZ9eLQsH7XFzow0DhN4
	WXR5vBzPPgxtjgRxaxuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhtp3-00DmVw-2Y;
	Sun, 17 Sep 2023 15:36:33 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhtp0-00DmUk-0y
	for linux-riscv@lists.infradead.org;
	Sun, 17 Sep 2023 15:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1694964988;
	bh=1NF2q2upNDj9/vMoCeQiX+AUEvsHPwNOqql4WRWM0Oo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PDYejELIHl1QbGAiIMk2tjDMYzW5D/26ieLRdJoDq4IaTyoVPh1QrNKnygwKUNiyQ
	 Jyq+SfmCXjK1lWJGagf0A1MIMPRtCVraCZ4msErQL5i0VSvBxSvi3l0V196nHbXq8R
	 /DTqZOqSbTaMg3kxexEOJoRNXkEGRbzQK9KDv0pA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 17 Sep 2023 17:36:18 +0200
Subject: [PATCH v2 3/4] tools/nolibc: don't define new syscall number
MIME-Version: 1.0
Message-Id: <20230917-nolibc-syscall-nr-v2-3-03863d509b9a@weissschuh.net>
References: <20230917-nolibc-syscall-nr-v2-0-03863d509b9a@weissschuh.net>
In-Reply-To: <20230917-nolibc-syscall-nr-v2-0-03863d509b9a@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694964977; l=1312;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=1NF2q2upNDj9/vMoCeQiX+AUEvsHPwNOqql4WRWM0Oo=;
 b=HyWIKvOvEBDaT6rG3/p9D3aiZMZ5Ewl218rM+RUJeFdyJLTOV1Ab2odZNX32VYVmiMtWLk1w/
 htVnUFszqpVBrAyuiLAygf5fExGiweKx2+F3qUtWHRT8SHuTrjU4bcw
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_083630_492143_6A880DB4 
X-CRM114-Status: UNSURE (   6.68  )
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

QWxsIHN5bWJvbHMgY3JlYXRlZCBieSBub2xpYmMgYXJlIGFsc28gdmlzaWJsZSB0byB1c2VyIGNv
ZGUuClN5c2NhbGwgY29uc3RhbnRzIGFyZSBleHBlY3RlZCB0byBjb21lIGZyb20gdGhlIGtlcm5l
bCBoZWFkZXJzIGFuZApzaG91bGQgbm90IGJlIG1hZGUgdXAgYnkgbm9saWJjLgoKUmVmYWN0b3Ig
dGhlIGxvZ2ljIHRvIGF2b2lkIGRlZmluaW5nIHN5c2NhbGwgbnVtYmVycy4KQWxzbyB0aGUgbmV3
IGNvZGUgaXMgZWFzaWVyIHRvIHVuZGVyc3RhbmQuCgpBY2tlZC1ieTogV2lsbHkgVGFycmVhdSA8
d0Axd3QuZXU+ClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3Nj
aHVoLm5ldD4KLS0tCiB0b29scy9pbmNsdWRlL25vbGliYy9zeXMuaCB8IDcgKysrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS90b29scy9pbmNsdWRlL25vbGliYy9zeXMuaCBiL3Rvb2xzL2luY2x1ZGUvbm9saWJjL3N5cy5o
CmluZGV4IDgzODk4MjBlMTkyOC4uZjA1MTQ0ZTQ2YjY3IDEwMDY0NAotLS0gYS90b29scy9pbmNs
dWRlL25vbGliYy9zeXMuaAorKysgYi90b29scy9pbmNsdWRlL25vbGliYy9zeXMuaApAQCAtOTM4
LDExICs5MzgsMTAgQEAgaW50IHN5c19zZWxlY3QoaW50IG5mZHMsIGZkX3NldCAqcmZkcywgZmRf
c2V0ICp3ZmRzLCBmZF9zZXQgKmVmZHMsIHN0cnVjdCB0aW1ldmEKIAkJdC50dl9uc2VjID0gdGlt
ZW91dC0+dHZfdXNlYyAqIDEwMDA7CiAJfQogCXJldHVybiBteV9zeXNjYWxsNihfX05SX3BzZWxl
Y3Q2LCBuZmRzLCByZmRzLCB3ZmRzLCBlZmRzLCB0aW1lb3V0ID8gJnQgOiBOVUxMLCBOVUxMKTsK
LSNlbGlmIGRlZmluZWQoX19OUl9fbmV3c2VsZWN0KSB8fCBkZWZpbmVkKF9fTlJfc2VsZWN0KQot
I2lmbmRlZiBfX05SX19uZXdzZWxlY3QKLSNkZWZpbmUgX19OUl9fbmV3c2VsZWN0IF9fTlJfc2Vs
ZWN0Ci0jZW5kaWYKKyNlbGlmIGRlZmluZWQoX19OUl9fbmV3c2VsZWN0KQogCXJldHVybiBteV9z
eXNjYWxsNShfX05SX19uZXdzZWxlY3QsIG5mZHMsIHJmZHMsIHdmZHMsIGVmZHMsIHRpbWVvdXQp
OworI2VsaWYgZGVmaW5lZChfX05SX3NlbGVjdCkKKwlyZXR1cm4gbXlfc3lzY2FsbDUoX19OUl9z
ZWxlY3QsIG5mZHMsIHJmZHMsIHdmZHMsIGVmZHMsIHRpbWVvdXQpOwogI2Vsc2UKIAlyZXR1cm4g
X19ub2xpYmNfZW5vc3lzKF9fZnVuY19fLCBuZmRzLCByZmRzLCB3ZmRzLCBlZmRzLCB0aW1lb3V0
KTsKICNlbmRpZgoKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
