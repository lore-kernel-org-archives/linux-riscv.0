Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9025DC43217
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 23:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9W2ZCr97au/DyIWtr0Mi84oNcdTV6BGxav1PV8/mKo=; b=pt8zGEN1ofOohK
	+TSe0WYc1Bic1PCELBw6fFuftAveswP0zD5dLjaLnsNsOvJdBg04vRpjilvDkyGyJMmU3STI79D2v
	yT067joViriHwiSJQWNru8aRNoQb6nASQkboW+x5x+K3ZMba3V0RCx6R4GYgZFQ+Ku5oz0w8HPrHf
	BjMkXwMtYZQBWTbwOYVPGtXwAT1r+6/48PYkGO7ZY3OGG5EJsNRCOjtmIAZhrB6+EU9O3UekLvdYR
	+nZi3Ntg5Lnp+X4y5L0g08SL9cUxWT9pAyfM/NsmueywSyelge41s99rEvbuKisqtdSF37Yb694qd
	hnZXvfE6ceaBzv7A+5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noCt8-00GkY5-TV; Mon, 09 May 2022 23:34:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noCt1-00GkOy-BJ
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 23:33:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 777391F441DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652139234;
 bh=CZQ7QwYyjXyLiPmx1jEp6oFdo06Stqavz0Fvz+iublM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SDwxSlJbQCiHJPQR1lFxat/dNwe8Cw95mO18xUWrblUCwDvptuIvvEihxQgGpz5lE
 v2+pPQDPfEo3nnjLdmECYiEfCheycMmmwveoEMSaWwJXDRf8e887FYh72xXKEegajp
 QaQcT3OCtuH2kjObn8s3MAYD2oH9anmXSqs9c04hn+AcRFQ/mX1WKGwRGep7JOFA4H
 C4Kw1/Eunfbvp/ckKUJxjBvsJXFMHtbcJothUCcVahPvTLvth5UGn5EftS+9NNh38M
 HjrUmzlEFiFFJMInbk7G2giz3tbBsMgkXr4iYVpbDdzeOedK37AnhRRRKckmNr0O4x
 VvnSrMrlH5ppw==
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
Subject: [PATCH v8 13/27] parisc: Use do_kernel_power_off()
Date: Tue, 10 May 2022 02:32:21 +0300
Message-Id: <20220509233235.995021-14-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_163355_558138_49FFD690 
X-CRM114-Status: GOOD (  16.93  )
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
dyBzeXMtb2ZmIEFQSS4KCkFja2VkLWJ5OiBIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+ICMg
cGFyaXNjClJldmlld2VkLWJ5OiBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEByZXJlLnFt
cW0ucGw+ClNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNv
bGxhYm9yYS5jb20+Ci0tLQogYXJjaC9wYXJpc2Mva2VybmVsL3Byb2Nlc3MuYyB8IDQgKystLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL3BhcmlzYy9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9wYXJpc2Mva2VybmVsL3By
b2Nlc3MuYwppbmRleCBhNmEyYTU1OGZjNWIuLjdjMzdlMDljOTJkYSAxMDA2NDQKLS0tIGEvYXJj
aC9wYXJpc2Mva2VybmVsL3Byb2Nlc3MuYworKysgYi9hcmNoL3BhcmlzYy9rZXJuZWwvcHJvY2Vz
cy5jCkBAIC0yNiw2ICsyNiw3IEBACiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVk
ZSA8bGludXgvcGVyc29uYWxpdHkuaD4KICNpbmNsdWRlIDxsaW51eC9wdHJhY2UuaD4KKyNpbmNs
dWRlIDxsaW51eC9yZWJvb3QuaD4KICNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgogI2luY2x1ZGUg
PGxpbnV4L3NjaGVkL2RlYnVnLmg+CiAjaW5jbHVkZSA8bGludXgvc2NoZWQvdGFzay5oPgpAQCAt
MTE2LDggKzExNyw3IEBAIHZvaWQgbWFjaGluZV9wb3dlcl9vZmYodm9pZCkKIAlwZGNfY2hhc3Np
c19zZW5kX3N0YXR1cyhQRENfQ0hBU1NJU19ESVJFQ1RfU0hVVERPV04pOwogCiAJLyogaXBtaV9w
b3dlcm9mZiBtYXkgaGF2ZSBiZWVuIGluc3RhbGxlZC4gKi8KLQlpZiAocG1fcG93ZXJfb2ZmKQot
CQlwbV9wb3dlcl9vZmYoKTsKKwlkb19rZXJuZWxfcG93ZXJfb2ZmKCk7CiAJCQogCS8qIEl0IHNl
ZW1zIHdlIGhhdmUgbm8gd2F5IHRvIHBvd2VyIHRoZSBzeXN0ZW0gb2ZmIHZpYQogCSAqIHNvZnR3
YXJlLiBUaGUgdXNlciBoYXMgdG8gcHJlc3MgdGhlIGJ1dHRvbiBoaW1zZWxmLiAqLwotLSAKMi4z
NS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
