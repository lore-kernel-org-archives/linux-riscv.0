Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A191EEAA52
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 16:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rh0dy/B/WNpJS4GDWU0oh8QjA6VOrWCOIaIL1mKxsCU=; b=K88RjUUSTsfy73
	wteNpjpSB2O46xCJxJVGhpnB+ukvrIPAxviIdN63ZQSQrpshmYHSbpOSEKgBH8+orCOZcuTO4b66C
	JHcJTTtBSMuJxWa0xb00Ajz+pzmG5d8pDFdkhiFlcN0ZRdtxqHsUG9deZvcyrQS9iHdPKlvpkKT6/
	vS3ZIh5OSgjG5ewtUz81rtrlO17If8NhtaLGTZmezLpjC8H9U19suWKaqBOgfUFGDJHjmbi8tveSK
	tYw9gZNSEqLHsJeQCWeRw2+Rw5miIvguHQir21ZZdo12MStE+dCYEgv0L8KYGRJUcalJ8qVSyKJ+8
	ugCQw2SRUFg528LTbr/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgomk-008qr6-1Q;
	Thu, 14 Sep 2023 16:01:42 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgomh-008qpa-2n
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 16:01:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1694707293;
	bh=Cu53Z9oyo5nGu95h1+MArmP5k33gYn4AQCWOgwsV/Ac=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nJXJ1xXHesT1KczhMwLWfm4v2NTSTPtV6KAFS2C4/pVvhrkdw5iJnNuZPfzcNH81X
	 EtTjjm+ZcV9Z7OFkbIZxH8hQi/WlF1z44FUARs5NxJ4SAmGq+cjERWC0zZPVi655jx
	 B+V7D+nxIi6ovzre3715c/cC7TfgIxPeombwOIp4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 14 Sep 2023 18:01:19 +0200
Subject: [PATCH 3/4] tools/nolibc: don't define new syscall number
MIME-Version: 1.0
Message-Id: <20230914-nolibc-syscall-nr-v1-3-e50df410da11@weissschuh.net>
References: <20230914-nolibc-syscall-nr-v1-0-e50df410da11@weissschuh.net>
In-Reply-To: <20230914-nolibc-syscall-nr-v1-0-e50df410da11@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694707292; l=1227;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Cu53Z9oyo5nGu95h1+MArmP5k33gYn4AQCWOgwsV/Ac=;
 b=gJVRysrB+1Fm++kEZkA6QvwJaFYmt27QWy1msKjd+eJjR2FaQgck9iIwYB4bxpA6by3xzT2p2
 PzfnrKof6pvBVVTgIWWtMX9cfqisWMmTH2n3Am9bIT64PWNQbOqeho2
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_090140_076378_F58CA295 
X-CRM114-Status: UNSURE (   7.23  )
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
IGNvZGUgaXMgZWFzaWVyIHRvIHVuZGVyc3RhbmQuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vp
w59zY2h1aCA8bGludXhAd2Vpc3NzY2h1aC5uZXQ+Ci0tLQogdG9vbHMvaW5jbHVkZS9ub2xpYmMv
c3lzLmggfCA3ICsrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvaW5jbHVkZS9ub2xpYmMvc3lzLmggYi90b29s
cy9pbmNsdWRlL25vbGliYy9zeXMuaAppbmRleCBiYzU2MzEwYzZiZGYuLmQ5NmYyYWE3ZDk4NyAx
MDA2NDQKLS0tIGEvdG9vbHMvaW5jbHVkZS9ub2xpYmMvc3lzLmgKKysrIGIvdG9vbHMvaW5jbHVk
ZS9ub2xpYmMvc3lzLmgKQEAgLTk1NCwxMSArOTU0LDEwIEBAIGludCBzeXNfc2VsZWN0KGludCBu
ZmRzLCBmZF9zZXQgKnJmZHMsIGZkX3NldCAqd2ZkcywgZmRfc2V0ICplZmRzLCBzdHJ1Y3QgdGlt
ZXZhCiAJCXQudHZfbnNlYyA9IHRpbWVvdXQtPnR2X3VzZWMgKiAxMDAwOwogCX0KIAlyZXR1cm4g
bXlfc3lzY2FsbDYoX19OUl9wc2VsZWN0NiwgbmZkcywgcmZkcywgd2ZkcywgZWZkcywgdGltZW91
dCA/ICZ0IDogTlVMTCwgTlVMTCk7Ci0jZWxpZiBkZWZpbmVkKF9fTlJfX25ld3NlbGVjdCkgfHwg
ZGVmaW5lZChfX05SX3NlbGVjdCkKLSNpZm5kZWYgX19OUl9fbmV3c2VsZWN0Ci0jZGVmaW5lIF9f
TlJfX25ld3NlbGVjdCBfX05SX3NlbGVjdAotI2VuZGlmCisjZWxpZiBkZWZpbmVkKF9fTlJfX25l
d3NlbGVjdCkKIAlyZXR1cm4gbXlfc3lzY2FsbDUoX19OUl9fbmV3c2VsZWN0LCBuZmRzLCByZmRz
LCB3ZmRzLCBlZmRzLCB0aW1lb3V0KTsKKyNlbGlmIGRlZmluZWQoX19OUl9zZWxlY3QpCisJcmV0
dXJuIG15X3N5c2NhbGw1KF9fTlJfc2VsZWN0LCBuZmRzLCByZmRzLCB3ZmRzLCBlZmRzLCB0aW1l
b3V0KTsKICNlbHNlCiAJKHZvaWQpbmZkczsKIAkodm9pZClyZmRzOwoKLS0gCjIuNDIuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
