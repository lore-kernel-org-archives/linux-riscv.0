Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083E8C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 23:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dR9NfGFO3IO5WhpvJnLoAsxBcgCUsp1W9b0sv4s4g0=; b=gy6q0iep0BUOHp
	JGFsdI7vAa0IGIwR1wuCsAeHpcoAHW/aTEsGU+DBnJN6Ua9k7K5j79BRcPMzh1EuDgHJ8Rz6wXKTl
	NBda+qwYxAXawcm40Nbl20i2Xe5XA/046ZpWI6e8L7fYL2VSrjcfYAbUHXoUWQKsm7BN7P8fw4BAP
	OabDqsEcZ7SpnjAHgyTLJD5PD/XV3/rxcYzuDfDzA37NsK48BA0vwX8s3FV9/TZ5vIwgaSwR/Ux7P
	BMJgX7veCN5iCcGCl/xbf0r7gJYNz9aux3ysVcTTwmQNXiABklGRfvKxInvDNvCaMpvjgW4IPbG35
	wKUwNeMKrSO7MndElwYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noCtR-00GkvP-WE; Mon, 09 May 2022 23:34:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noCt9-00GkXF-3r
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 23:34:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 45B061F441E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652139242;
 bh=BNiJLGjWIzGOPAZM2z9DxroGBpHA3jtv2OqTTX3KfaQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MmRFtkxF0t/0s1mqVHp01wCQk0mHdGbFnJOLd8QQOIiCDNKQBR758oQ+y5MhaYpyf
 Vy0KMBI+NogV4y1/lztnyP+eWOumRqyH/7Ud9zokUK3YMWpbn23Wfky/48H0Ts7zw/
 LCGnhPuXyGu+uCO0m//ObCybeeRvhsNMjOPEqXyRR4OPYBnLFRbLOegI5pqM7s690n
 5ToJOQerGy3mdVzfhdHyV6ukfnLe4tSg+adT21ugi4lX7Uump+8xi7Rl2MDO9ayAQi
 9kS2NkEPO6JPciRSBzlS4TWGKPWFABJNEIrYzWa+p9T3AxEnGi+vCuMmKT1EaAokkK
 XUhEqjDRDlmfg==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v8 15/27] powerpc: Use do_kernel_power_off()
Date: Tue, 10 May 2022 02:32:23 +0300
Message-Id: <20220509233235.995021-16-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_163403_339558_84FB6A66 
X-CRM114-Status: GOOD (  15.79  )
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

S2VybmVsIG5vdyBzdXBwb3J0cyBjaGFpbmVkIHBvd2VyLW9mZiBoYW5kbGVycy4gVXNlIGRvX2tl
cm5lbF9wb3dlcl9vZmYoKQp0aGF0IGludm9rZXMgY2hhaW5lZCBwb3dlci1vZmYgaGFuZGxlcnMu
IEl0IGFsc28gaW52b2tlcyBsZWdhY3kKcG1fcG93ZXJfb2ZmKCkgZm9yIG5vdywgd2hpY2ggd2ls
bCBiZSByZW1vdmVkIG9uY2UgYWxsIGRyaXZlcnMgd2lsbApiZSBjb252ZXJ0ZWQgdG8gdGhlIG5l
dyBzeXMtb2ZmIEFQSS4KCkFja2VkLWJ5OiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4u
aWQuYXU+ClJldmlld2VkLWJ5OiBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEByZXJlLnFt
cW0ucGw+ClNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNv
bGxhYm9yYS5jb20+Ci0tLQogYXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1cC1jb21tb24uYyB8IDQg
Ky0tLQogYXJjaC9wb3dlcnBjL3htb24veG1vbi5jICAgICAgICAgICB8IDMgKy0tCiAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMva2VybmVsL3NldHVwLWNvbW1vbi5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9z
ZXR1cC1jb21tb24uYwppbmRleCA1MThhZTVhYTk0MTAuLjFiNTg2NTc3ZTc1YiAxMDA2NDQKLS0t
IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1cC1jb21tb24uYworKysgYi9hcmNoL3Bvd2VycGMv
a2VybmVsL3NldHVwLWNvbW1vbi5jCkBAIC0xNjEsOSArMTYxLDcgQEAgdm9pZCBtYWNoaW5lX3Jl
c3RhcnQoY2hhciAqY21kKQogdm9pZCBtYWNoaW5lX3Bvd2VyX29mZih2b2lkKQogewogCW1hY2hp
bmVfc2h1dGRvd24oKTsKLQlpZiAocG1fcG93ZXJfb2ZmKQotCQlwbV9wb3dlcl9vZmYoKTsKLQor
CWRvX2tlcm5lbF9wb3dlcl9vZmYoKTsKIAlzbXBfc2VuZF9zdG9wKCk7CiAJbWFjaGluZV9oYW5n
KCk7CiB9CmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMveG1vbi94bW9uLmMgYi9hcmNoL3Bvd2Vy
cGMveG1vbi94bW9uLmMKaW5kZXggYjQyMzgxMmU5NGUwLi4wMzAwYmRmYTIwZDUgMTAwNjQ0Ci0t
LSBhL2FyY2gvcG93ZXJwYy94bW9uL3htb24uYworKysgYi9hcmNoL3Bvd2VycGMveG1vbi94bW9u
LmMKQEAgLTEyNDMsOCArMTI0Myw3IEBAIHN0YXRpYyB2b2lkIGJvb3RjbWRzKHZvaWQpCiAJfSBl
bHNlIGlmIChjbWQgPT0gJ2gnKSB7CiAJCXBwY19tZC5oYWx0KCk7CiAJfSBlbHNlIGlmIChjbWQg
PT0gJ3AnKSB7Ci0JCWlmIChwbV9wb3dlcl9vZmYpCi0JCQlwbV9wb3dlcl9vZmYoKTsKKwkJZG9f
a2VybmVsX3Bvd2VyX29mZigpOwogCX0KIH0KIAotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
