Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9486C79FAD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upm/0CpzHHw4PquXRA/x+0MLFTuXoiix81Ex1B3n80g=; b=L3l+kNAx/ySXOb
	bGBp73xzLfHwh5xa6NC53u5mOiPQsDCmnv5MbuXJxatmBp2ecQnIYTzQ2rc/Q96PDgZWBcLyrT0lL
	6D7+BKl5nH5JLZZasz9T+CA/dhaWOhg1OqoiGPr1lzlWu43JfbxwpzoefRayLj+jHK1j/hJ5CcjCt
	AMZSBpx6j02Pfi1IHS8cbSFaHBKDNVi8Ywf4meY1xqnYT9IuZO8vKvsK8PajWmbqqvY17QKdCJNVF
	bTZCcQ2YuKzqA9Sq7Qx+wgoA+XAQK/J2d1xopmas1u/TFxbYVznm+T0zOShmnrd2zaEV/goZwVOlM
	/PTirkoW9Y/IZI8oIjaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E28-0000000BAnX-0Xua;
	Wed, 09 Sep 2026 08:51:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1l-0000000BAG7-33rl;
	Wed, 09 Sep 2026 08:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sC8+6J9OLUakbA4e+Ap2B6uuZE9Tl7PwTVwk0psJD7w=; b=CwJq9ggv9Vd7Krbf8xhoNyufVi
	NGriF9r5HAikkiNzykHuCyarcbl+t0lw4RQ1qDQkSgFcNU3vuLPx/0trwNVRwDCzuES2kyuZw7kot
	eoaCbeuHQmnH/Wk9F7WqtghAXTCQ2zXICtkqRyqEJSP0q8MlzU9QLVu6O+o3VtMQ5iJV3+5Yj+D1S
	//CuLXNQ5jWBeQJ0yWt6ss4SiPzp+AoD29yWswYhyCcBg1zRo4Fp8QCc393j3Kzk4j3kTLvFwrHNF
	qVtuO4P7hjr4s3u4e1voMo1H/kHFjTisr0FpMzNI4rLI/Q1lJRPnOffNVIYnee5vZWZwe8J7hQlJe
	BbdNvuGQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4E1h-00000000wHa-0Pbm;
	Wed, 09 Sep 2026 08:51:32 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sC8+6J9OLUakbA4e+Ap2B6uuZE9Tl7PwTVwk0psJD7w=;
	b=18ypzormw89rOzBf6uIIHYH1wJOPorGI4jxdXBGhkEdBQPZOLIVTm3KlRtbdVDtdGj9VG7
	Dyjho9sIcBEasT5u31Y6tYFz04xKu20FzftA5gy6Id8NhHbhfJut0d0PS+7ZjetZKmijCh
	u/3olgtjrDEgB4C5ITT4CpG3VJZ5DK2VcHCG/wOlxBKI+jSGLQNOi+m8a9Y5OivTRfFyAs
	2pKxnMgQ6QXgcLRV+3MsRlunL77unXFK+hIJ7P2eCY8PBRsZctieqL2rbr4yWOsH/yijps
	0oceS1P/fPh3YWLS+ARzngBQRl6bCpKYgOPJXYvTIYdpTZN4WO39XXP4Yc9OKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sC8+6J9OLUakbA4e+Ap2B6uuZE9Tl7PwTVwk0psJD7w=;
	b=V9tYUFNzgGBunIsna6vZfNbVMtIIjvl+n+kfHtNDv+819iutT7PUqChs4OihB+GRdxuasV
	MJxc+Wzwhfj+biBw==
Date: Wed, 09 Sep 2026 10:51:22 +0200
Subject: [PATCH 09/15] sparc/vdso: Delete asm/vdso/vsyscall.h inclusion
MIME-Version: 1.0
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-9-63ae856cc659@linutronix.de>
References: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
In-Reply-To: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=516;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=p+b8xoqSRp+BaXpuv6UkhI9jSr9haopNWgF+UmEOVQk=;
 b=M4PnWWjB8PtId1XPU1zVCslJBTDHYh9V/L0XSbIVM9OptHzq+tq0jklWaWwKlEoUCNwkyM6tW
 rJ+WK8pnGurDoAd2fM6SfaNEA6DETxYOyV8t6MVuFm8YlCVyu8Tziow
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_095129_359481_86509C9B 
X-CRM114-Status: UNSURE (   7.11  )
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

VGhlIGluY2x1c2lvbiBpcyB1bm5lY2Vzc2FyeSwgcmVtb3ZlIGl0LgoKU2lnbmVkLW9mZi1ieTog
VGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQog
YXJjaC9zcGFyYy92ZHNvL3ZtYS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvc3BhcmMvdmRzby92bWEuYyBiL2FyY2gvc3BhcmMvdmRzby92
bWEuYwppbmRleCA2MDAyOWQ2MGY0ZDMuLmFiNjYyNmMxZWU2MSAxMDA2NDQKLS0tIGEvYXJjaC9z
cGFyYy92ZHNvL3ZtYS5jCisrKyBiL2FyY2gvc3BhcmMvdmRzby92bWEuYwpAQCAtMjMsNyArMjMs
NiBAQAogI2luY2x1ZGUgPGFzbS9wYWdlLmg+CiAKICNpbmNsdWRlIDx2ZHNvL2RhdGFwYWdlLmg+
Ci0jaW5jbHVkZSA8YXNtL3Zkc28vdnN5c2NhbGwuaD4KIAogdW5zaWduZWQgaW50IF9fcmVhZF9t
b3N0bHkgdmRzb19lbmFibGVkID0gMTsKIAoKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
