Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB58BC83010
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CkpoSFD5xB5J3A/bUPY8S7ADnSb3+wc66xs893H18Fw=; b=3L2BnwuNu+qbDk
	2DSj0QT9vZH2js/tsb8zUIBXVKIhZDf8yFgxreOLY/pbsgZqX2iKrZzKDV+cyZIZjOScxVBAAcmEM
	t8AH9M7CeqfQQGwxclvXHtYzyd57y/5nMKuVUC19MVMDCFaERhvEd9He00ITtArCTbFFJP9MXvkxz
	G/pPaUylywv8JL7pAYZGxJIDU7zVgkN1h6fwBwD50pWw3NHT04X4RxMESU/XFxveTWyBLKtBqJZcm
	JFI7QNBR9wuYqoKWFMK1vzeIi85OlZYOXEXaDqP6CbuNBFYQO2tM+zOKsyJ9LpyhF38HnwZsbP7w+
	gXOsyfCZQY72XYZTpS3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUrk-00000009ZJW-2fZH;
	Wed, 25 Jun 2025 18:29:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQzl-00000008wX4-0lLc
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 14:21:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 66B1CA52AC4;
	Wed, 25 Jun 2025 14:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8E3FC4CEF6;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750861259;
	bh=IdkAyRPazTQAAsOxhm5SnUrAbQOii+a0gCXU9wFfUG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rvOjBZOBmfMmqRPKiOAKQTC0hFb3FygpSI3wKZzzWuUPNcuPyxBvyLmaLFmJ0wq1e
	 hwY5kZeBIFiNWQFr+mtws+j2Mk1Y54XtLsT8aTzPZ9f0GtK43oKE/mwRta7C2QPfWv
	 4KjJZouymgDF0lGn3wmbEjPUn14IVz8POE1S2+E1THqdoHnY49hn2RObIi8FzJUF0w
	 8g4woFZT/ybEtLgnazg5DPWtvfX9VpJs6vzak420MYf3G4lBoXZzlRBbvq2wzie+l/
	 d3l+GVrte1OvnWUlHUIvTqiB2nHXn6Ts5uVCd4ZC+RDYs+urCAPpb/cXcBgbdB5Krb
	 +qRErtRMfcaow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977B3C7EE30;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 25 Jun 2025 16:20:58 +0200
Subject: [PATCH v4 3/7] riscv: Add xmipsexectl PAUSE instruction
MIME-Version: 1.0
Message-Id: <20250625-p8700-pause-v4-3-6c7dd7f85756@htecgroup.com>
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
In-Reply-To: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750861257; l=1045;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=H0DxxoGpB6+hFMlnoBCgKy/YEJN661bNeg8dzqTTc9Y=;
 b=j7mQ6M5PdjVnNF0Zd2eESw6UiAPu59p74ZSfKVOFi6F9oGfE+2+5A6EVzEf/XaS+NC9vhT0Du
 XMLyI4dbDM9AoC8vs7d+rXKvwQOcX3466I12/JDG/c8n/dmgsVwKKJ/
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_072101_326539_A184AC09 
X-CRM114-Status: UNSURE (   7.10  )
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
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQWxla3NhIFBhdW5vdmljIDxhbGVrc2EucGF1bm92aWNAaHRlY2dyb3VwLmNvbT4KCkFk
ZCBNSVBTLlBBVVNFIGluc3RydWN0aW9uIG9wY29kZS4gVGhpcyBpbnN0cnVjdGlvbiBpcyBhIHBh
cnQgb2YgdGhlCnhtaXBzZXhlY3RsIHZlbmRvciBleHRlbnNpb24uCgpTaWduZWQtb2ZmLWJ5OiBB
bGVrc2EgUGF1bm92aWMgPGFsZWtzYS5wYXVub3ZpY0BodGVjZ3JvdXAuY29tPgotLS0KIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vdmVuZG9yX2V4dGVuc2lvbnMvbWlwcy5oIHwgNyArKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS92ZW5kb3JfZXh0ZW5zaW9ucy9taXBzLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3ZlbmRvcl9leHRlbnNpb25zL21pcHMuaAppbmRleCA3NTdjOTQxY2ZkODZlOWZjZWQ2MTY5
YjFhODIyMDBlNmJiNWM2MTMyLi5mOGVjYTBiY2Y1M2UyZGUxYmJkYzY2ODIxZmU5NTk4NzEwNWVk
ODVhIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlbmRvcl9leHRlbnNpb25z
L21pcHMuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlbmRvcl9leHRlbnNpb25zL21p
cHMuaApAQCAtMTMsNCArMTMsMTEgQEAKIAogZXh0ZXJuIHN0cnVjdCByaXNjdl9pc2FfdmVuZG9y
X2V4dF9kYXRhX2xpc3QgcmlzY3ZfaXNhX3ZlbmRvcl9leHRfbGlzdF9taXBzOwogCisvKiBNSVBT
LlBBVVNFIGlzIGFuIGFsdGVybmF0aXZlIG9wY29kZSB3aGljaCBpcyBpbXBsZW1lbnRlZCB0byBo
YXZlIHRoZSAqLworLyogc2FtZSBiZWhhdmlvciBhcyBQQVVTRSBvbiBzb21lIE1JUFMgUklTQ1Yg
Y29yZXMuICovCisvKiBJdCBpcyBhIOKAmGhpbnTigJkgZW5jb2Rpbmcgb2YgdGhlIFNMTEkgaW5z
dHJ1Y3Rpb24sICovCisvKiB3aXRoIHJkID0gMCwgcnMxID0gMCBhbmQgaW1tID0gNS4gKi8KKwor
I2RlZmluZSBNSVBTX1BBVVNFCSIuNGJ5dGUgMHgwMDUwMTAxM1xuXHQiCisKICNlbmRpZiAvLyBf
QVNNX1JJU0NWX1ZFTkRPUl9FWFRFTlNJT05TX01JUFNfSAoKLS0gCjIuMzQuMQoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
