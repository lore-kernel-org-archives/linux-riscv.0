Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE23C61DD3
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 07:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KFMc8TOs2O4LZEPWrev0Q6a+Rly5Zra9RgORmF7CvmU=; b=RMWeyp8jIWy49Y
	6SiEdZe3YXiicd2vgyv4DzLK8qqcH/x55TYcXiR2R9u/MHz8CtI/LhC3Y45OJUyXEJJYirC7KVs5j
	jl+qrsDNQgSrTx/lgsTczDzwZWBp2Iywb/yeJi4XxnUpflgTziRc7AtMrL1KR2xklS2l8sDhd3JrI
	bvbfV91UbA6shmX2UmzYcs2cWFBXFGBeb23D0gDldxc7UfKbEfQnm2p3LbzwYfNIc8wgPCWRaCcwT
	tLQ1A0aLS9IN8MKWDbu6GxtEeMS1eyQVdQrzQ0EIIKzVd2lLnOMNOnbVwFBt32zsyiVt8hGcELCbQ
	++Qna/bdbEa3S9oQqIAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2250-0000000Gd7b-11HC;
	Thu, 03 Sep 2026 07:41:50 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224m-0000000GckR-1oGZ;
	Thu, 03 Sep 2026 07:41:39 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7w6IVovisCb503Pkoci8pxom1cMDymO/FBqfuq2HGI=;
	b=YUrsKLYpR6VZq3FjSZ0tcH1u/iL3pnEqPkHzaoQflyy4+wMTPZ0gzLpbw3vB+4VDAnG5PH
	cZALG1imAlcNsXtsBsfkzXXtDu4/CILpTvEnECUkH4/6Eymd0VAAx2OHa8vO4HJB9WC50m
	pwxutgnUIdRLMt9P1NVK0ydGcpFQDiUaCW52VKIUOqjDwMcTn5pjVTRZhVUppMT8B99nvz
	MIRuXE5wp91zRf3+wqSlZ56x3BykPmTc2e+RiC/SINOmaTjzLo5hN58eiHfEc8+gpMUebh
	HBcSCjN8rFEv5nUId4u6Gcy7+jfPttRo4pHbHkYZ7T1rTYgSH02AWQdvWf6ZOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7w6IVovisCb503Pkoci8pxom1cMDymO/FBqfuq2HGI=;
	b=aK0JbXjU6gNUAZ7CUfQcDDU1452O226LFxU7OBZ5JiSzeBepGLdhKq3cRUyVBT8BcLiF64
	nYPh4Hh4QgFfyDAw==
Date: Thu, 03 Sep 2026 09:41:21 +0200
Subject: [PATCH v2 06/15] arm64: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260903-at-vector-size-arch-v2-6-5bc32a71e3d8@linutronix.de>
References: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
In-Reply-To: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=1590;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=yzUJPF4+/uSgsYkr+YJKb+Uz3ZiMTGZCOEBRakgLSTw=;
 b=DdZRWT9PaRUgrbKuk0FccoE0UqsO8Wy2gW0MV+ISuIpLSi+dZ054rE9E0nfEX8/hbjKwvu4k3
 XkEx0oppmjkBBuo9UIQSI5eFpWB/CFJrAubMUD+gSbssc81nC2HqkDn
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004136_673812_6E9AE24C 
X-CRM114-Status: GOOD (  11.72  )
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

VGhlcmUgaXMgbm90aGluZyB1c2Vyc3BhY2UgY2FuIGRvIHdpdGggdGhpcyB2YWx1ZS4gSW4gdGhl
IGtlcm5lbCBpcwphbHdheXMgY29tYmluZWQgd2l0aCBBVF9WRUNUT1JfU0laRV9CQVNFLCB3aGlj
aCBpcyBub3QgZXhwb3NlZCB0bwp1c2Vyc3BhY2UgYW5kIGFsc28gY2hhbmdlcyBmcm9tIHRpbWUg
dG8gdGltZS4KCk1vdmUgdGhlIHN5bWJvbCB0byBhIGtlcm5lbC1pbnRlcm5hbCBoZWFkZXIuCgpT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRy
b25peC5kZT4KUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwub3JnPgotLS0KIGFy
Y2gvYXJtNjQvaW5jbHVkZS9hc20vYXV4dmVjLmggICAgICB8IDcgKysrKysrKwogYXJjaC9hcm02
NC9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oIHwgNiArKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
aW5jbHVkZS9hc20vYXV4dmVjLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2F1eHZlYy5oCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZGUyNGVhYWEwNmUyCi0tLSAv
ZGV2L251bGwKKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9hdXh2ZWMuaApAQCAtMCwwICsx
LDcgQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCisjaWZuZGVmIF9f
QVNNX0FVWFZFQ19ICisjZGVmaW5lIF9fQVNNX0FVWFZFQ19ICisKKyNkZWZpbmUgQVRfVkVDVE9S
X1NJWkVfQVJDSCAyIC8qIGVudHJpZXMgaW4gQVJDSF9ETElORk8gKi8KKworI2VuZGlmCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggYi9hcmNoL2FybTY0
L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKaW5kZXggNzQzYzBiODRmZDMwLi5mYjUxZTkwNjgx
M2EgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaAorKysg
Yi9hcmNoL2FybTY0L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKQEAgLTE0LDEzICsxNCwxMSBA
QAogICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UKICAqIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtLiAgSWYgbm90LCBzZWUg
PGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgogICovCi0jaWZuZGVmIF9fQVNNX0FVWFZF
Q19ICi0jZGVmaW5lIF9fQVNNX0FVWFZFQ19ICisjaWZuZGVmIF9fVUFQSV9BU01fQVVYVkVDX0gK
KyNkZWZpbmUgX19VQVBJX0FTTV9BVVhWRUNfSAogCiAvKiB2RFNPIGxvY2F0aW9uICovCiAjZGVm
aW5lIEFUX1NZU0lORk9fRUhEUgkzMwogI2RlZmluZSBBVF9NSU5TSUdTVEtTWgk1MQkvKiBzdGFj
ayBuZWVkZWQgZm9yIHNpZ25hbCBkZWxpdmVyeSAqLwogCi0jZGVmaW5lIEFUX1ZFQ1RPUl9TSVpF
X0FSQ0ggMiAvKiBlbnRyaWVzIGluIEFSQ0hfRExJTkZPICovCi0KICNlbmRpZgoKLS0gCjIuNTUu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
