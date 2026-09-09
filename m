Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386A8C79FB8
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=viIbtf7dwRVwmUdjKoEfH+qKdzpcSPmcP79NYl3Fe+I=; b=NMOu0maRGmUOxH
	4EXW2au/ihZVtpqAETTIdope2vXyrDlOp81hzTfHT8j5rwzypwCzaPz/NL6NIuB3wkjpvGaaaKdfj
	2P1SftSDo/EDefDsWmWfbVDn8+BSgtWYPFGI/KJe56z01wtJkaKHGGnIgvD3zru+W9+eiE6xkUy3g
	ZJu+Blsr589+1NJRYxkSG9Zj5YaoYmgITH1KXCgHeaRi6CxmBQY71PWkNb+SVju8Ei1DSsNfO5i74
	y81Gx2MPQbFRTSgZZAFeme/znwkAOocwpAxKZMJlnb4BCjmqahGut9GUXpEt0JVOCwwRzFHsswLrK
	qCi8dhOTXrioZrN1Q4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1h-0000000BADB-0z9O;
	Wed, 09 Sep 2026 08:51:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1d-0000000BAAZ-2yji;
	Wed, 09 Sep 2026 08:51:27 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qBxNGRr7V0cZXnwM00gER/wx3P+kfpLfgDvX2l6pq3g=;
	b=k9vEQJ8wTctywsO8hI1YZ6um9M/lNjs1S0m1fgpc08NdgIYbZov0Zkofq1AxPdfblwLPa7
	4KmfcHeu6b2Yr+01ivvZ6xjUcjoYm3eAQ5TgjEPS7CKlSdWg/JDCIFLH8782o31SLgz6gd
	OtPuQq0Sjy9sgdW0sWOoMBh3I8RgTIUi6zxLRszOk905I462f6xWyvSyMqAO006ybGNQdu
	SGKHJOBw038XIG0FBCvj4tz2gBcwNTvJjmEFGFYE/BwAJM7xynzmQllAr8cj2jRLAhO1yH
	cjh8vmeAx20BKowGWdN/9sqWAOfZypcjYsZemxfmare/Lp1o32YdrpkitPZpLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qBxNGRr7V0cZXnwM00gER/wx3P+kfpLfgDvX2l6pq3g=;
	b=1FCn8GUQNiHI5qLn1sTrlANzuUZEkf5xuKf+VYLZdOJYxtaWZpt+V7r7Urvulh09pavhRF
	dsm/084ewNnqYqDw==
Subject: [PATCH 00/15] vdso: Clean up the vsyscall.h headers
Date: Wed, 09 Sep 2026 10:51:13 +0200
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBswIamuEi1ExxooCwekkO6et
 HyL/wsIJSaBqSmQKLPwGSu6tgG32bgSsq8GrbRRQ6cxeznRyoErxZo6zPKIs/uOG6pgTKB+tL5
 3UA9XosD3f5+X9/0APF61mm0AAAA=
X-Change-ID: 20260812-vdso-asm-generic-vsyscall-h-0f66fe59ad5c
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=3678;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=7BLVTFBp0ZEd00ydpjlDQmwAhB/KSP4xZMVY9pc9HOs=;
 b=uTe2i40O4/xeVZQd1jNjZ2OlErGJqBh1xMapRWODGY5Dal9y4CKYI8NBfBpyMTHddnVSWXGD4
 N0TrnT9R60lBMxCVhZtCvdvXAnyBBfInKOtzLXA0tNQZs9VfRNj5zYY
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_015125_982068_C2A7BFA8 
X-CRM114-Status: UNSURE (   8.16  )
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

VGhlIHZzeXNjYWxsLmggaGVhZGVycyBhcmUgYSBtZXNzLiBTb21lIG9mIHRoYXQgd2FzIG5lY2Vz
c2FyeSBiYWNrIHdoZW4Kc29tZSBhcmNoaXRlY3R1cmVzIHdoZXJlIG5vdCB1c2luZyB0aGUgZ2Vu
ZXJpYyB2RFNPIGluZnJhc3RydWN0dXJlLgpOb3cgdGhhdCB0aGlzIGlzIG5vdCBuZWNlc3Nhcnkg
YW55bW9yZSwgdGhlIGhlYWRlcnMgY2FuIGJlIGNsZWFuZWQgdXAKYW5kIG1hbnkgb2YgdGhlIGNh
biBiZSBkZWxldGVkIGFsdG9nZXRoZXIuCgpUaGUgcmVjaXBpZW50IGxpc3QgaXMgdHJpbW1lZCB0
byBvbmx5IHRoZSB2RFNPIG1haW50YWluZXJzIGFuZCB0aGUKYXJjaGl0ZWN0dXJlIGxpc3RzLgoK
U2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0
cm9uaXguZGU+Ci0tLQpUaG9tYXMgV2Vpw59zY2h1aCAoMTUpOgogICAgICB2ZHNvOiBNb3ZlIHRo
ZSBrZXJuZWwtc2lkZSB0aW1lIHVwZGF0ZSBoZWxwZXJzIHRvIGEgbmV3IGhlYWRlcgogICAgICB2
ZHNvL2dldHRpbWVvZmRheTogRGVmaW5lIGZhbGxiYWNrIF9fYXJjaF9nZXRfdmRzb191X3RpbWVf
ZGF0YSgpIGluIGdldHRpbWVvZmRheS5jCiAgICAgIHZkc28vZ2V0cmFuZG9tOiBEZWZpbmUgZmFs
bGJhY2sgX19hcmNoX2dldF92ZHNvX3Vfcm5nX2RhdGEoKSBpbiBnZXRyYW5kb20uYwogICAgICB2
ZHNvL3ZzeXNjYWxsOiBEZWZpbmUgZmFsbGJhY2sgdGltZSBzeW5jaHJvbml6YXRpb24gZnVuY3Rp
b25zIGluIHZzeXNjYWxsLmMKICAgICAgdmRzbzogRGVsZXRlIGFzbS1nZW5lcmljL3Zkc28vdnN5
c2NhbGwuaAogICAgICB4ODYvdmRzbzogTW92ZSB2RFNPIHBhZ2UgZGVmaW5pdGlvbnMgdG8gYXNt
L3Zkc28uaAogICAgICBzcGFyYy92ZHNvOiBNb3ZlIF9fVkRTT19QQUdFUyB0byBhc20vdmRzby5o
CiAgICAgIHMzOTAvdmRzbzogRGVsZXRlIGFzbS92ZHNvL3ZzeXNjYWxsLmggaW5jbHVzaW9ucwog
ICAgICBzcGFyYy92ZHNvOiBEZWxldGUgYXNtL3Zkc28vdnN5c2NhbGwuaCBpbmNsdXNpb24KICAg
ICAgeDg2L3Zkc286IERlbGV0ZSBhc20vdmRzby92c3lzY2FsbC5oIGluY2x1c2lvbnMKICAgICAg
YXJtNjQvdmRzbzogRGVsZXRlIGFzbS92ZHNvL3ZzeXNjYWxsLmggaW5jbHVzaW9ucwogICAgICBy
aXNjdi9od3Byb2JlOiBJbmNsdWRlIHZkc28vZGF0YXBhZ2UuaAogICAgICB2ZHNvOiBSZW1vdmUg
dW5uZWNlc3NhcnkgdmRzby92c3lzY2FsbC5oIGluY2x1ZGVzCiAgICAgIHZkc286IEFkZCBhc20t
Z2VuZXJpYy92ZHNvL3ZzeXNjYWxsLmgKICAgICAgdmRzbzogUmVtb3ZlIF9fQVNTRU1CTEVSX18g
Z3VhcmRzIGZyb20gdnN5c2NhbGwuaAoKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0KIGFyY2gvYXJtL2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwu
aCAgICAgICAgIHwgIDcgLS0tLS0tCiBhcmNoL2FybS9rZXJuZWwvdmRzby5jICAgICAgICAgICAg
ICAgICAgICAgICB8ICAxIC0KIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdmRzby9nZXRyYW5kb20u
aCAgICAgIHwgIDEgLQogYXJjaC9hcm02NC9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmggICAg
ICAgfCAgNyAtLS0tLS0KIGFyY2gvYXJtNjQva2VybmVsL3Zkc28uYyAgICAgICAgICAgICAgICAg
ICAgIHwgIDEgLQogYXJjaC9hcm02NC9rZXJuZWwvdmRzby92ZHNvLmxkcy5TICAgICAgICAgICAg
fCAgMSAtCiBhcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmggICB8IDE0
IC0tLS0tLS0tLS0tCiBhcmNoL2xvb25nYXJjaC9rZXJuZWwvdmRzby5jICAgICAgICAgICAgICAg
ICB8ICAxIC0KIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmggICAgICAgIHwg
MTYgLS0tLS0tLS0tLS0tLQogYXJjaC9taXBzL2tlcm5lbC92ZHNvLmMgICAgICAgICAgICAgICAg
ICAgICAgfCAgMSAtCiBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oICAg
ICB8IDE0IC0tLS0tLS0tLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwu
aCAgICAgICB8IDE0IC0tLS0tLS0tLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5j
ICAgICAgICAgICAgICB8ICAyICstCiBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMgICAgICAgICAg
ICAgICAgICAgICB8ICAxIC0KIGFyY2gvczM5MC9pbmNsdWRlL2FzbS92ZHNvL2dldHJhbmRvbS5o
ICAgICAgIHwgIDEgLQogYXJjaC9zMzkwL2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaCAgICAg
ICAgfCAxNiAtLS0tLS0tLS0tLS0tCiBhcmNoL3MzOTAva2VybmVsL3RpbWUuYyAgICAgICAgICAg
ICAgICAgICAgICB8ICA2ICsrLS0tCiBhcmNoL3MzOTAva2VybmVsL3Zkc28uYyAgICAgICAgICAg
ICAgICAgICAgICB8ICAxIC0KIGFyY2gvczM5MC9rZXJuZWwvdmRzby92ZHNvLmxkcy5TICAgICAg
ICAgICAgIHwgIDEgLQogYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS92ZHNvLmggICAgICAgICAgICAg
ICAgfCAgNiArKysrKwogYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmggICAg
ICAgfCAxMCAtLS0tLS0tLQogYXJjaC9zcGFyYy92ZHNvL3Zkc28tbGF5b3V0Lmxkcy5TICAgICAg
ICAgICAgfCAgMiArLQogYXJjaC9zcGFyYy92ZHNvL3ZtYS5jICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMSAtCiBhcmNoL3g4Ni9lbnRyeS92ZHNvL2NvbW1vbi92ZHNvLWxheW91dC5sZHMuUyB8
ICAxIC0KIGFyY2gveDg2L2VudHJ5L3Zkc28vdm1hLmMgICAgICAgICAgICAgICAgICAgIHwgIDEg
LQogYXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby5oICAgICAgICAgICAgICAgICAgfCAgNyArKysr
KysKIGFyY2gveDg2L2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaCAgICAgICAgIHwgMjIgLS0t
LS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvYXNtLWdlbmVyaWMvS2J1aWxkICAgICAgICAgICAgICAg
ICAgIHwgIDEgKwogaW5jbHVkZS9hc20tZ2VuZXJpYy92ZHNvL3ZzeXNjYWxsLmggICAgICAgICAg
fCAzNSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBpbmNsdWRlL2xpbnV4L3Zkc29fdGlt
ZS5oICAgICAgICAgICAgICAgICAgICB8ICA4ICsrKysrKysKIGluY2x1ZGUvdmRzby92c3lzY2Fs
bC5oICAgICAgICAgICAgICAgICAgICAgIHwgIDcgLS0tLS0tCiBrZXJuZWwvdGltZS92c3lzY2Fs
bC5jICAgICAgICAgICAgICAgICAgICAgICB8IDI1ICsrKysrKysrKysrKysrKy0tLS0tCiBsaWIv
dmRzby9nZXRyYW5kb20uYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICA4ICsrKysrLS0KIGxp
Yi92ZHNvL2dldHRpbWVvZmRheS5jICAgICAgICAgICAgICAgICAgICAgIHwgMTAgKysrKystLS0K
IDM1IGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyksIDE5MiBkZWxldGlvbnMoLSkKLS0t
CmJhc2UtY29tbWl0OiAxYzJhOWY5ZDg5MDUwY2Q5ZjJiMjI4MDA2MGE5NDQyMzM4YTFlNmZlCmNo
YW5nZS1pZDogMjAyNjA4MTItdmRzby1hc20tZ2VuZXJpYy12c3lzY2FsbC1oLTBmNjZmZTU5YWQ1
YwoKQmVzdCByZWdhcmRzLAotLSAgClRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1
aEBsaW51dHJvbml4LmRlPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
