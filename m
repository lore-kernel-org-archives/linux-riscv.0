Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A215DCD342F
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 06:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5gNBWfyzXnOdzjDWyKDqoD+w1rpHHLzWQoZUZouxVA=; b=eJzFOXiCAoS8Im
	vs3Lgkbm/ZoQ3QQ6UKKTbUCa7rGI87/KgDREPgIh+4MPZQf7KpeWIw6se+OzxzgHZzAbvcBMP89ts
	weRZw7DQHL1zMMxT2Q85FEQZkENwf9nYmJk0GRspyD7f1EyUwz88MeKbHqpy1HP8pX1K9Jyi1coBq
	aM7z/VzyyD5c1HuPmN42p++S10iRF8B+6xHW0wZG5NgsrDCju5P7H2yZNQ9QwUo9MdyTPmND6HyWI
	+Ci1xD8yj/sz1SRKaxt6bPN7JXqXDC9xJ1HM+5X33KsSKW/M6owzDBF2BUDiFg+4E+gIUebkJ5h0C
	0l3PCoEpSW/vyhA3xwxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJmpY-0000000CVhJ-49ge;
	Mon, 04 May 2026 06:31:01 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJmpV-0000000CVf4-3KDw
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 06:30:59 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777876253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rM5HDftepo4kXxhHSXZ92H6di30GeM3aO/jbh6miHc4=;
	b=AGzFisOqGXEmf7uSwvmZCUgmZfhT/LUMDwf3BG1oocH+FLGdxEQqfyMa9N32xPQePmoJuy
	8Vt1GlslDQJJ97XuqlEtUFUnB/RNBJRo9F23VLU2P28GxTZdpd7pqx/Z/FNWdhaVjTNGCP
	7odv2NLoStzLA/zGaRWdZLWpV9JHzsqSQoLWonD2cMADm579u/NSsA+7T3ir+GLqzfNbet
	f1fAZBfHmRl/lXjw1N3vSfjl4wWsdbctN5K+Gsjvh8BJXrNlPLAKwdDIKzimOX/vFu3Udp
	4N0WkObh9GlqgCg3uEaoWgTxMMQd7NYEv2JTIwOX09OYjyS9K87lyBFLjQdDrQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777876253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rM5HDftepo4kXxhHSXZ92H6di30GeM3aO/jbh6miHc4=;
	b=LCqwB8r54TSG1K6DmPYt38JI1IN/kXhk3gI3FUAQ4dZK8eguNzRePA635Jzk/P96r89NvO
	z/if1dfT5C50LEDw==
Date: Mon, 04 May 2026 08:30:50 +0200
Subject: [PATCH 1/4] riscv: vdso: Always declare vdso_start symbols
MIME-Version: 1.0
Message-Id: <20260504-riscv-cfi-vdso-alternative-v1-1-bcdf3d37f62e@linutronix.de>
References: <20260504-riscv-cfi-vdso-alternative-v1-0-bcdf3d37f62e@linutronix.de>
In-Reply-To: <20260504-riscv-cfi-vdso-alternative-v1-0-bcdf3d37f62e@linutronix.de>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Deepak Gupta <debug@rivosinc.com>, Charles Mirabile <cmirabil@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777876252; l=1436;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=htyRRoioe7Aoq1pGRxfhfTU6MI/RNQ7IjDr/3IUj8fs=;
 b=tH3IO57JItOobgL9kkBG6D2wncyWpa11AXMYzCzRFJ5FGltmlUF824HpRMK3/abE/F3kKEkh4
 eMaHJqLO9bTC3gHdYuV+GIBuXHefxABFL4XGxY20kFen+PUtmEmkPoE
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_233058_019472_E9ED7F1B 
X-CRM114-Status: UNSURE (   8.39  )
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

TWFrZSB0aGUgZGVjbGFyYXRpb25zIG9mIHZkc29fc3RhcnQgYW5kIGl0cyByZWxhdGVkIHN5bWJv
bHMgYWx3YXlzCnZpc2libGUuIFdpdGggdGhhdCB0aGVpciB1c2VycyBkb24ndCBoYXZlIHRvIHVz
ZSBpZmRlZmZlcnkgYnV0IGNhbgp1c2UgdGhlIGJldHRlciBJU19FTkFCTEVEKCkgY29tcGlsZS10
aW1lIGNoZWNrcy4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vp
c3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby5o
IHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28uaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby5oCmluZGV4IDM1YmY4MzBhNTU3Ni4uZjc5OThkOWFk
OWIyIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28uaAorKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28uaApAQCAtMTIsMTIgKzEyLDE1IEBACiAgKiBBbGwgc3lz
dGVtcyB3aXRoIGFuIE1NVSBoYXZlIGEgVkRTTywgYnV0IHN5c3RlbXMgd2l0aG91dCBhbiBNTVUg
ZG9uJ3QKICAqIHN1cHBvcnQgc2hhcmVkIGxpYnJhcmllcyBhbmQgdGhlcmVmb3JlIGRvbid0IGhh
dmUgb25lLgogICovCi0jaWZkZWYgQ09ORklHX01NVQogCiAjZGVmaW5lIF9fVkRTT19QQUdFUyAg
ICA0CiAKICNpZm5kZWYgX19BU1NFTUJMRVJfXworCisjaWZkZWYgQ09ORklHX01NVQogI2luY2x1
ZGUgPGdlbmVyYXRlZC92ZHNvLW9mZnNldHMuaD4KKyNlbmRpZgorCiAjaWZkZWYgQ09ORklHX1JJ
U0NWX1VTRVJfQ0ZJCiAjaW5jbHVkZSA8Z2VuZXJhdGVkL3Zkc28tY2ZpLW9mZnNldHMuaD4KICNl
bmRpZgpAQCAtMzgsMTUgKzQxLDEyIEBACiAjZGVmaW5lIENPTVBBVF9WRFNPX1NZTUJPTChiYXNl
LCBuYW1lKQkJCQkJCVwKIAkodm9pZCBfX3VzZXIgKikoKHVuc2lnbmVkIGxvbmcpKGJhc2UpICsg
Y29tcGF0X192ZHNvXyMjbmFtZSMjX29mZnNldCkKIAotZXh0ZXJuIGNoYXIgY29tcGF0X3Zkc29f
c3RhcnRbXSwgY29tcGF0X3Zkc29fZW5kW107Ci0KICNlbmRpZiAvKiBDT05GSUdfQ09NUEFUICov
CiAKIGV4dGVybiBjaGFyIHZkc29fc3RhcnRbXSwgdmRzb19lbmRbXTsKIGV4dGVybiBjaGFyIHZk
c29fY2ZpX3N0YXJ0W10sIHZkc29fY2ZpX2VuZFtdOworZXh0ZXJuIGNoYXIgY29tcGF0X3Zkc29f
c3RhcnRbXSwgY29tcGF0X3Zkc29fZW5kW107CiAKICNlbmRpZiAvKiAhX19BU1NFTUJMRVJfXyAq
LwogCi0jZW5kaWYgLyogQ09ORklHX01NVSAqLwotCiAjZW5kaWYgLyogX0FTTV9SSVNDVl9WRFNP
X0ggKi8KCi0tIAoyLjUzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
