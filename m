Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F29DC001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S2aaSmEe/+9zQQT4QzniuIcRohK6F/komIlS/PR/Dwc=; b=DaY9OSs2vQuS/8
	h0TF640JHDcpFOgQpBFzCAe0cv+P74Hs2tf55i/aydrR8QdF4I2hBe8ThG/KO7OVvMdD0AJlecFyn
	56oJvTNdoUPxviKlkR4if7GTlldBi5pLglBRv2Ia8VJ3eHoV8oSHri6OPN31Jvh3pD6aLecPt+27z
	htWAdy8nwiWgd4Iw5GzPTQM9parIfrXd0OzTw9aBp+OUGC6D5En70+tgktDVkhpnkMnKn3vAasTiB
	Jdo0dY39XHsYNEPtb2hU/TqPDjlleP7psuQ/hDL2T3qhvEkD8yTgddgObkzam2keyRTOL6snn1WjN
	7Ixg6FHlKhrMl3OMpvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEuQS-001WOU-1E;
	Thu, 29 Jun 2023 16:23:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEuQN-001WMS-31
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 16:23:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7B39D61572;
	Thu, 29 Jun 2023 16:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17D3C433CA;
	Thu, 29 Jun 2023 16:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688055794;
	bh=XKHVV9536ZEIq0lSPWe7Ma20H9zvrB69ScTYKRNgSug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M6kZoAurVeEfkpLZfC9kxcAJWpzl/UUi+VNi5k1i3Dndk9Pb9ABQQu6Vuhx4/V8Ym
	 eYeawEma6ZTO9P034Brnv+y+iANOqT7owHEUXd79yDDf0EE8zQV1kg/E+13nQfIehy
	 bi2qq9G/sfCXcpXVSG8tsSx3dd5zLBJmJSYNixYZ0JRhsNYKQ1jnxQoBwfzM4lNxHs
	 XLxAFCeETZrWAqGnxg/3yTeN0voW/UL/EQ+m1SxkxBivGz2Q16XKHs34qfHrcfA1nh
	 qjGGdKBBR6AiJjCflcdzAfy8xLzozEfx/hq89IOm3E6G8GxRGM7Qjgvb2HRl/t4C0H
	 XezKnlpSIying==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Alexey Dobriyan <adobriyan@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 1/2] selftests/openat2: Run-time check for -fsanitize=undefined
Date: Thu, 29 Jun 2023 18:22:59 +0200
Message-Id: <20230629162301.1234157-2-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230629162301.1234157-1-bjorn@kernel.org>
References: <20230629162301.1234157-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_092316_016566_8E92AC0D 
X-CRM114-Status: UNSURE (   8.84  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKU29tZSBhcmNoaXRlY3R1
cmVzLCBlLmcuIHJpc2N2LCBkb2VzIG5vdCBoYXZlIHN1cHBvcnQgZm9yIHRoZSBHQ0MKb3B0aW9u
ICctZnNhbml0aXplPXVuZGVmaW5lZCcuCgpDaGVjayBmb3IgJy1mc2FuaXRpemU9dW5kZWZpbmVk
JyBzdXBwb3J0LCBhbmQgb25seSBhZGQgaXQgdG8gQ0ZMQUdTIGlmCnN1cHBvcnRlZC4KClNpZ25l
ZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCiB0b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9vcGVuYXQyL01ha2VmaWxlIHwgOSArKysrKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9vcGVuYXQyL01ha2VmaWxlIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvb3BlbmF0Mi9NYWtlZmlsZQppbmRleCA4NDNiYTU2ZDhlNDkuLmYxM2FkMDJhMThlYSAx
MDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvb3BlbmF0Mi9NYWtlZmlsZQorKysg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9vcGVuYXQyL01ha2VmaWxlCkBAIC0xLDYgKzEsMTMg
QEAKICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKIAotQ0ZMQUdT
ICs9IC1XYWxsIC1PMiAtZyAtZnNhbml0aXplPWFkZHJlc3MgLWZzYW5pdGl6ZT11bmRlZmluZWQK
KyMgV2UgbmVlZCB0aGlzIGZvciB0aGUgInRyeS1ydW4iIG1hY3JvLgoraW5jbHVkZSAuLi8uLi8u
Li9idWlsZC9CdWlsZC5pbmNsdWRlCisKK0NGTEFHUyArPSAtV2FsbCAtTzIgLWcgLWZzYW5pdGl6
ZT1hZGRyZXNzCitDRkxBR1MgKz0gJChjYWxsIHRyeS1ydW4sIFwKKwllY2hvICdpbnQgbWFpbigp
IHt9JyB8ICQoQ0MpIC1mc2FuaXRpemU9dW5kZWZpbmVkIC14IGMgLSAtbyAvZGV2L251bGwsIFwK
KwktZnNhbml0aXplPXVuZGVmaW5lZCwpCisKIFRFU1RfR0VOX1BST0dTIDo9IG9wZW5hdDJfdGVz
dCByZXNvbHZlX3Rlc3QgcmVuYW1lX2F0dGFja190ZXN0CiAKIGluY2x1ZGUgLi4vbGliLm1rCi0t
IAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
