Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEEDCD3427
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 06:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p35noPR3N1VGDHFw2BjH2VllzgmvdxzuKRuSFL43tns=; b=0XMo/sroGbEbax
	rE5K1dHp44LNL246Vus8dwbj34mUiO/YFpnCtwjWMR7oKoC4+FWs3VT51jma/7cv6fhHXIYxqmUKr
	PZpLV/PaKKvD/JZvwNg51yb1t7OnHbtlQQACOESJkImDOUZzUPnlDbHYiAs1fx8CLEWRg7UCEoCfO
	wrrKy3uwt8Rh9DVw6iLcPML0/a4f5PtQzy0njSG7lIP8uDJhL36+4vQqPSRW82BMLzFKoZASJ9tNN
	xmETAkxI/fS7PS8jKrb4uYPGBphm7x3mXSsanKARyGVKRLTLOrUylPip8omq3E4JQly2pRKSu8/48
	lYNgoFXHaxHoZ0QdoYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJmpZ-0000000CVi4-3kI7;
	Mon, 04 May 2026 06:31:01 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJmpV-0000000CVf9-3KBF
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 06:31:00 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777876254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RKchW4RD6tdsnYFxHaOToD998yGVT9C9zWr8sRBK/VY=;
	b=rNDXXHfuwWCL2tvNY/gJEosIP/cieM22xE/nHpXULWsfmAXk4K/WO3WDLtV+bBN27Y8wzk
	xOT4OO63S1SjolHV5VUkIGkn7kgw5uK8rorY+KhTvRIuAzVlICjPfVGASBH+lej7dFK73x
	nOHIniONEJHkg3qsLxiWT0Sy7vudRTBqgXPbP6vIHSVTobCGLrdUL1Xj1DlKJBRtnBtkNh
	i3rvmOk6CPi7AEN0skxG1coBir3xwROTS3yBCmf4EV8VM/pSQRe9mrLMdE2O6/3FgnRv2z
	BLt++3FF9EV9GCifphJaOt5yufI3q2i36GZ+aoXXfsNGQckVMKnpEarCyMaBZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777876254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RKchW4RD6tdsnYFxHaOToD998yGVT9C9zWr8sRBK/VY=;
	b=lIUDwsWh/05A04lbEgbojqgIoxnjWMhEGbFXSGmHbrX7qAXsBiEgJqW3CBFTvMO9R8uwmv
	jlaVeSk9HII4MUAg==
Date: Mon, 04 May 2026 08:30:52 +0200
Subject: [PATCH 3/4] riscv: alternative: Pass vDSO start as parameter to
 apply_vdso_alternatives()
MIME-Version: 1.0
Message-Id: <20260504-riscv-cfi-vdso-alternative-v1-3-bcdf3d37f62e@linutronix.de>
References: <20260504-riscv-cfi-vdso-alternative-v1-0-bcdf3d37f62e@linutronix.de>
In-Reply-To: <20260504-riscv-cfi-vdso-alternative-v1-0-bcdf3d37f62e@linutronix.de>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Deepak Gupta <debug@rivosinc.com>, Charles Mirabile <cmirabil@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777876252; l=1261;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=NkHskHfcD+h8kwIJGRZUJM+Hef1z+xA5FI6fINNrnuQ=;
 b=QXzEBgNd1H7lfBdviP7HUi7cChf3oa03Huh2/VKmG8aGTfM1rzEsWce+apoTyrbqEXpdL6hhI
 lMIfJL1GArjAEEE2573JdFzPtLHZvgekT4copplefox7ROkitBgXFs3
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_233058_017865_062D37B7 
X-CRM114-Status: UNSURE (   8.31  )
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

VGhlIGRlZGljYXRlZCB2RFNPIHdpdGggQ0ZJIHNob3VsZCBhbHNvIGJlIHBhdGNoZWQgaW4gdGhl
IHNhbWUgd2F5LgpUbyBwcmVwYXJlIGZvciB0aGF0IG1vdmUgdGhlIGN1cnJlbnRseSBoYXJkY29k
ZWQgdkRTTyBzdGFydCBzeW1ib2wKaW50byBhIHBhcmFtZXRlci4KClNpZ25lZC1vZmYtYnk6IFRo
b21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGFy
Y2gvcmlzY3Yva2VybmVsL2FsdGVybmF0aXZlLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9hbHRlcm5hdGl2ZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvYWx0ZXJuYXRpdmUuYwpp
bmRleCA1OTk5MTkyMmE1ZGMuLjg5YzI4M2E1Y2VjNyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvYWx0ZXJuYXRpdmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9hbHRlcm5hdGl2ZS5j
CkBAIC0xNzMsMTQgKzE3MywxNCBAQCBzdGF0aWMgdm9pZCBfX2luaXRfb3JfbW9kdWxlIF9hcHBs
eV9hbHRlcm5hdGl2ZXMoc3RydWN0IGFsdF9lbnRyeSAqYmVnaW4sCiAJCQkJc3RhZ2UpOwogfQog
Ci1zdGF0aWMgdm9pZCBfX2luaXQgYXBwbHlfdmRzb19hbHRlcm5hdGl2ZXModm9pZCkKK3N0YXRp
YyB2b2lkIF9faW5pdCBhcHBseV92ZHNvX2FsdGVybmF0aXZlcyh2b2lkICpzdGFydCkKIHsKIAlj
b25zdCBFbGZfRWhkciAqaGRyOwogCWNvbnN0IEVsZl9TaGRyICpzaGRyOwogCWNvbnN0IEVsZl9T
aGRyICphbHQ7CiAJc3RydWN0IGFsdF9lbnRyeSAqYmVnaW4sICplbmQ7CiAKLQloZHIgPSAoRWxm
X0VoZHIgKil2ZHNvX3N0YXJ0OworCWhkciA9IChFbGZfRWhkciAqKXN0YXJ0OwogCXNoZHIgPSAo
dm9pZCAqKWhkciArIGhkci0+ZV9zaG9mZjsKIAlhbHQgPSBmaW5kX3NlY3Rpb24oaGRyLCBzaGRy
LCAiLmFsdGVybmF0aXZlIik7CiAJaWYgKCFhbHQpCkBAIC0yMDQsNyArMjA0LDcgQEAgdm9pZCBf
X2luaXQgYXBwbHlfYm9vdF9hbHRlcm5hdGl2ZXModm9pZCkKIAkJCSAgICBSSVNDVl9BTFRFUk5B
VElWRVNfQk9PVCk7CiAKIAlpZiAoSVNfRU5BQkxFRChDT05GSUdfTU1VKSkKLQkJYXBwbHlfdmRz
b19hbHRlcm5hdGl2ZXMoKTsKKwkJYXBwbHlfdmRzb19hbHRlcm5hdGl2ZXModmRzb19zdGFydCk7
CiB9CiAKIC8qCgotLSAKMi41My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
