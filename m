Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC1CEEAA52
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 16:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zhemkhs8iWfag2kAJil+RPgbco+PQw/uEmL5PMvglII=; b=UG0Jewo+28WXFW
	DpnX9tAXvWf222Vb/U5o29AX+N+3tf/xKP3f4Mv+HEmkdBD9IjPQLhskdUiDio1kSdAkuKT6eozCd
	tBROrFLtVG1VIpXdZhHOfMi0dz1AfnuJqE5VM+OVlDPAvDMpdWiJDVq7mmdqj6RL200RxL8sF9tjF
	qqaZmOYq/8bfx6rFVvGRGb7TJr4JUJFxHTcv+5SoUFQfIDga/2ioYoRhBuzpPH9OuA01za5BYaTqr
	U2260kb5NL/s7OaDfQIZLWaoFfgu9X4W0oeu60y+IYfJGdwUlQwF/y7QNOYBcMmsCgsn2NiOeO3GZ
	vVxW84sP0ZCO8YyYAaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgomn-008qsU-27;
	Thu, 14 Sep 2023 16:01:45 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgomh-008qpX-2r
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 16:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1694707293;
	bh=BLwVkYfDRtmtpBN6kGDW31k/g2b9DTTOXBHjuDCkrU8=;
	h=From:Subject:Date:To:Cc:From;
	b=JB0OPAsJN2q+I4VRX9/xT/yh1hwn9H5m00pqJUkonCBtDdVYO+NfpplF2Mm8ecUdw
	 ffVwGVJh/FB5/WzSHLXGewXgFRLR04ii7vjqTXRKQGf8HudjEao5emfFSAorWYMUHr
	 3x/9yUdUD5Xl20aVFL+x1Eo66tn3z09kAJiTGKZk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/4] tools/nolibc: cleanups for syscall fallbacks
Date: Thu, 14 Sep 2023 18:01:16 +0200
Message-Id: <20230914-nolibc-syscall-nr-v1-0-e50df410da11@weissschuh.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEwuA2UC/x3MSwqAMAwA0atI1gb8RLBeRVzUGjVQqjQgSvHuF
 pdvMZNAOQorDEWCyJeoHCGjLgtwuw0boyzZ0FRNW5maMBxeZof6qLPeY4hobLd2RK4nQ5C7M/I
 q9/8cp/f9AAWx/81jAAAA
To: Willy Tarreau <w@1wt.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694707292; l=865;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=BLwVkYfDRtmtpBN6kGDW31k/g2b9DTTOXBHjuDCkrU8=;
 b=Leqnx5jr5VxyW77VJxQgkc5h9t7xLORcnxxjwYepzcHghifMXS3GSYDqqQICNz/zyWESoIjgY
 A4Tb5syvPYBCwV4WVu3QTVPegNjBp0b71OoPUDRes1CudcEr8oTCoh5
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_090140_079709_BABC752B 
X-CRM114-Status: UNSURE (   4.92  )
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
LS0KVGhvbWFzIFdlacOfc2NodWggKDQpOgogICAgICBzZWxmdGVzdHMvbm9saWJjOiBhbGxvdyBi
dWlsZGluZyBpMzg2IHdpdGggbXVsdGlhcmNoIGNvbXBpbGVyCiAgICAgIHRvb2xzL25vbGliYzog
YXZvaWQgdW51c2VkIHBhcmFtZXRlciB3YXJuaW5ncyBmb3IgRU5PU1lTIGZhbGxiYWNrcwogICAg
ICB0b29scy9ub2xpYmM6IGRvbid0IGRlZmluZSBuZXcgc3lzY2FsbCBudW1iZXIKICAgICAgdG9v
bHMvbm9saWJjOiBhdXRvbWF0aWNhbGx5IGRldGVjdCBuZWNlc3NpdHkgdG8gdXNlIHBzZWxlY3Q2
CgogdG9vbHMvaW5jbHVkZS9ub2xpYmMvYXJjaC1hYXJjaDY0LmggICAgIHwgIDMgLS0tCiB0b29s
cy9pbmNsdWRlL25vbGliYy9hcmNoLWxvb25nYXJjaC5oICAgfCAgNCArLS0tCiB0b29scy9pbmNs
dWRlL25vbGliYy9hcmNoLXJpc2N2LmggICAgICAgfCAgMyAtLS0KIHRvb2xzL2luY2x1ZGUvbm9s
aWJjL3N5cy5oICAgICAgICAgICAgICB8IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlIHwgIDEgKwogNSBm
aWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKLS0tCmJhc2Ut
Y29tbWl0OiAzZjc5YTU3ODY1YjMzZjQ5ZmRhZTY2NTU1MTBiZDI3YzhlNjYxMGUwCmNoYW5nZS1p
ZDogMjAyMzA5MTQtbm9saWJjLXN5c2NhbGwtbnItOWE1ZjU0NGM4NDk0CgpCZXN0IHJlZ2FyZHMs
Ci0tIApUaG9tYXMgV2Vpw59zY2h1aCA8bGludXhAd2Vpc3NzY2h1aC5uZXQ+CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
