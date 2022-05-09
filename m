Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E734C43217
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 23:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XHcD6TFCeHF8GxEwdEuoMPZMGsvYcUqXkp3oVJTA0U=; b=H9KFW6XD3CGw+E
	41tHV6gIZ2DedCnlA3P3IxbSoGMNt47yHIgnYgytZhgnR2rtX8HPTyNTPGOrZ2rGpgyWCXiuWzSvF
	VSEWy9wzuvZTPvqxZ5gjJleudkTg657q0gWZ60YkHRi+x5UdI4kP7hSyj63gbHxb3KNHRvV8WnH/H
	9Sq1DTnaZvXyvRbltYDi4EJc491KrR5BPy/R8Acm3wbrfVUp1ucD/7zIU5re9MaOGWrDlw964stqE
	fwUqChytMgIBjAzwhQOx0+1ZZJxia0VLdP5wehkhJr/LN5mH+4lbLCgAXDdDjTuR86jH3TWad9F7X
	bscEYKDQ7G3M+BeORpFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noCta-00Gl52-8I; Mon, 09 May 2022 23:34:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noCtD-00GkcL-2N
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 23:34:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 27D201F441E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652139245;
 bh=UIPgsOrU+7AAtuw/dxUkFlU2eOnuIo9CRihQlVqmebk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fku9vc/2LuyumwlnC4+CCfHyXuo2y9yUU8GPF/ZI7s8OKQFM74txrzVi6nNXLlzUX
 tyRuTLx1n3NoysMf0kVYsv7We+si4accSBbu6VVwIE3dNI64qNCz390xl2MEQBdJgP
 XCk5VY/gacC4aFPizlR8qXmXItj5EltNXSZOhG0q5C/otCou8Y+oeWHt1b7/84FtcJ
 V46TUTlkaRTyV8fgcad20JX4TsWNYb6KjhEurv1g4P603cs1svTnBoGtuJwRNL4fAb
 wRy/NdoI0yfdehGCDv15CZSP4Ye2AgBXXEmNdgpKZ6EiezR2K2vEQfbxIoMMTv1Ho+
 Gs0IHfjDLhj5g==
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
Subject: [PATCH v8 16/27] m68k: Switch to new sys-off handler API
Date: Tue, 10 May 2022 02:32:24 +0300
Message-Id: <20220509233235.995021-17-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_163407_413639_F2F6836E 
X-CRM114-Status: GOOD (  19.57  )
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

S2VybmVsIG5vdyBzdXBwb3J0cyBjaGFpbmVkIHBvd2VyLW9mZiBoYW5kbGVycy4gVXNlCnJlZ2lz
dGVyX3Bvd2VyX29mZl9oYW5kbGVyKCkgdGhhdCByZWdpc3RlcnMgcG93ZXItb2ZmIGhhbmRsZXJz
IGFuZApkb19rZXJuZWxfcG93ZXJfb2ZmKCkgdGhhdCBpbnZva2VzIGNoYWluZWQgcG93ZXItb2Zm
IGhhbmRsZXJzLiBMZWdhY3kKcG1fcG93ZXJfb2ZmKCkgd2lsbCBiZSByZW1vdmVkIG9uY2UgYWxs
IGRyaXZlcnMgd2lsbCBiZSBjb252ZXJ0ZWQgdG8KdGhlIG5ldyBzeXMtb2ZmIEFQSS4KCk5vcm1h
bGx5IGFyY2ggY29kZSBzaG91bGQgYWRvcHQgb25seSB0aGUgZG9fa2VybmVsX3Bvd2VyX29mZigp
IGF0IGZpcnN0LApidXQgbTY4ayBpcyBhIHNwZWNpYWwgY2FzZSBiZWNhdXNlIGl0IHVzZXMgcG1f
cG93ZXJfb2ZmKCkgImluc2lkZSBvdXQiLAppLmUuIHBtX3Bvd2VyX29mZigpIGludm9rZXMgbWFj
aGluZV9wb3dlcl9vZmYoKSBbaW4gZmFjdCBpdCBkb2VzIG5vdGhpbmddLAp3aGlsZSBpdCdzIG1h
Y2hpbmVfcG93ZXJfb2ZmKCkgdGhhdCBzaG91bGQgaW52b2tlIHRoZSBwbV9wb3dlcl9vZmYoKSwg
YW5kCnRodXMsIHdlIGNhbid0IGNvbnZlcnQgcGxhdGZvcm1zIHRvIHRoZSBuZXcgQVBJIHNlcGFy
YXRlbHkuIFRoZXJlIGFyZSBvbmx5CnR3byBwbGF0Zm9ybXMgY2hhbmdlZCBoZXJlLCBzbyBpdCdz
IG5vdCBhIGJpZyBkZWFsLgoKQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGlu
dXgtbTY4ay5vcmc+ClJldmlld2VkLWJ5OiBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEBy
ZXJlLnFtcW0ucGw+ClNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBl
bmtvQGNvbGxhYm9yYS5jb20+Ci0tLQogYXJjaC9tNjhrL2VtdS9uYXRmZWF0LmMgICAgICAgICB8
IDMgKystCiBhcmNoL202OGsvaW5jbHVkZS9hc20vbWFjaGRlcC5oIHwgMSAtCiBhcmNoL202OGsv
a2VybmVsL3Byb2Nlc3MuYyAgICAgIHwgNSArKy0tLQogYXJjaC9tNjhrL2tlcm5lbC9zZXR1cF9t
bS5jICAgICB8IDEgLQogYXJjaC9tNjhrL2tlcm5lbC9zZXR1cF9uby5jICAgICB8IDEgLQogYXJj
aC9tNjhrL21hYy9jb25maWcuYyAgICAgICAgICB8IDQgKysrLQogNiBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9tNjhrL2Vt
dS9uYXRmZWF0LmMgYi9hcmNoL202OGsvZW11L25hdGZlYXQuYwppbmRleCA3MWI3OGVjZWU3NWMu
LmIxOWRjMDAwMjZkOSAxMDA2NDQKLS0tIGEvYXJjaC9tNjhrL2VtdS9uYXRmZWF0LmMKKysrIGIv
YXJjaC9tNjhrL2VtdS9uYXRmZWF0LmMKQEAgLTE1LDYgKzE1LDcgQEAKICNpbmNsdWRlIDxsaW51
eC9zdHJpbmcuaD4KICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KICNpbmNsdWRlIDxsaW51eC9t
b2R1bGUuaD4KKyNpbmNsdWRlIDxsaW51eC9yZWJvb3QuaD4KICNpbmNsdWRlIDxsaW51eC9pby5o
PgogI2luY2x1ZGUgPGFzbS9tYWNoZGVwLmg+CiAjaW5jbHVkZSA8YXNtL25hdGZlYXQuaD4KQEAg
LTkwLDUgKzkxLDUgQEAgdm9pZCBfX2luaXQgbmZfaW5pdCh2b2lkKQogCXByX2luZm8oIk5hdEZl
YXRzIGZvdW5kICglcywgJWx1LiVsdSlcbiIsIGJ1ZiwgdmVyc2lvbiA+PiAxNiwKIAkJdmVyc2lv
biAmIDB4ZmZmZik7CiAKLQltYWNoX3Bvd2VyX29mZiA9IG5mX3Bvd2Vyb2ZmOworCXJlZ2lzdGVy
X3BsYXRmb3JtX3Bvd2VyX29mZihuZl9wb3dlcm9mZik7CiB9CmRpZmYgLS1naXQgYS9hcmNoL202
OGsvaW5jbHVkZS9hc20vbWFjaGRlcC5oIGIvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL21hY2hkZXAu
aAppbmRleCA4ZmQ4MGVmMWI3N2UuLjhkOGMzZWUyMDY5ZiAxMDA2NDQKLS0tIGEvYXJjaC9tNjhr
L2luY2x1ZGUvYXNtL21hY2hkZXAuaAorKysgYi9hcmNoL202OGsvaW5jbHVkZS9hc20vbWFjaGRl
cC5oCkBAIC0yNCw3ICsyNCw2IEBAIGV4dGVybiBpbnQgKCptYWNoX2dldF9ydGNfcGxsKShzdHJ1
Y3QgcnRjX3BsbF9pbmZvICopOwogZXh0ZXJuIGludCAoKm1hY2hfc2V0X3J0Y19wbGwpKHN0cnVj
dCBydGNfcGxsX2luZm8gKik7CiBleHRlcm4gdm9pZCAoKm1hY2hfcmVzZXQpKCB2b2lkICk7CiBl
eHRlcm4gdm9pZCAoKm1hY2hfaGFsdCkoIHZvaWQgKTsKLWV4dGVybiB2b2lkICgqbWFjaF9wb3dl
cl9vZmYpKCB2b2lkICk7CiBleHRlcm4gdW5zaWduZWQgbG9uZyAoKm1hY2hfaGRfaW5pdCkgKHVu
c2lnbmVkIGxvbmcsIHVuc2lnbmVkIGxvbmcpOwogZXh0ZXJuIHZvaWQgKCptYWNoX2hkX3NldHVw
KShjaGFyICosIGludCAqKTsKIGV4dGVybiB2b2lkICgqbWFjaF9oZWFydGJlYXQpIChpbnQpOwpk
aWZmIC0tZ2l0IGEvYXJjaC9tNjhrL2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL202OGsva2VybmVs
L3Byb2Nlc3MuYwppbmRleCAyMjFmZWIwMjY5ZjEuLjJjYjRhNjFiY2ZhYyAxMDA2NDQKLS0tIGEv
YXJjaC9tNjhrL2tlcm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC9tNjhrL2tlcm5lbC9wcm9jZXNz
LmMKQEAgLTY3LDEyICs2NywxMSBAQCB2b2lkIG1hY2hpbmVfaGFsdCh2b2lkKQogCiB2b2lkIG1h
Y2hpbmVfcG93ZXJfb2ZmKHZvaWQpCiB7Ci0JaWYgKG1hY2hfcG93ZXJfb2ZmKQotCQltYWNoX3Bv
d2VyX29mZigpOworCWRvX2tlcm5lbF9wb3dlcl9vZmYoKTsKIAlmb3IgKDs7KTsKIH0KIAotdm9p
ZCAoKnBtX3Bvd2VyX29mZikodm9pZCkgPSBtYWNoaW5lX3Bvd2VyX29mZjsKK3ZvaWQgKCpwbV9w
b3dlcl9vZmYpKHZvaWQpOwogRVhQT1JUX1NZTUJPTChwbV9wb3dlcl9vZmYpOwogCiB2b2lkIHNo
b3dfcmVncyhzdHJ1Y3QgcHRfcmVncyAqIHJlZ3MpCmRpZmYgLS1naXQgYS9hcmNoL202OGsva2Vy
bmVsL3NldHVwX21tLmMgYi9hcmNoL202OGsva2VybmVsL3NldHVwX21tLmMKaW5kZXggNzhhYjU2
MmJlYjMxLi40MjY5MWFiY2Q5MDggMTAwNjQ0Ci0tLSBhL2FyY2gvbTY4ay9rZXJuZWwvc2V0dXBf
bW0uYworKysgYi9hcmNoL202OGsva2VybmVsL3NldHVwX21tLmMKQEAgLTk4LDcgKzk4LDYgQEAg
RVhQT1JUX1NZTUJPTChtYWNoX2dldF9ydGNfcGxsKTsKIEVYUE9SVF9TWU1CT0wobWFjaF9zZXRf
cnRjX3BsbCk7CiB2b2lkICgqbWFjaF9yZXNldCkoIHZvaWQgKTsKIHZvaWQgKCptYWNoX2hhbHQp
KCB2b2lkICk7Ci12b2lkICgqbWFjaF9wb3dlcl9vZmYpKCB2b2lkICk7CiAjaWZkZWYgQ09ORklH
X0hFQVJUQkVBVAogdm9pZCAoKm1hY2hfaGVhcnRiZWF0KSAoaW50KTsKIEVYUE9SVF9TWU1CT0wo
bWFjaF9oZWFydGJlYXQpOwpkaWZmIC0tZ2l0IGEvYXJjaC9tNjhrL2tlcm5lbC9zZXR1cF9uby5j
IGIvYXJjaC9tNjhrL2tlcm5lbC9zZXR1cF9uby5jCmluZGV4IDVlNDEwNGYwN2E0NC4uMDBiZjgy
MjU4MjMzIDEwMDY0NAotLS0gYS9hcmNoL202OGsva2VybmVsL3NldHVwX25vLmMKKysrIGIvYXJj
aC9tNjhrL2tlcm5lbC9zZXR1cF9uby5jCkBAIC01NSw3ICs1NSw2IEBAIGludCAoKm1hY2hfaHdj
bGspIChpbnQsIHN0cnVjdCBydGNfdGltZSopOwogLyogbWFjaGluZSBkZXBlbmRlbnQgcmVib290
IGZ1bmN0aW9ucyAqLwogdm9pZCAoKm1hY2hfcmVzZXQpKHZvaWQpOwogdm9pZCAoKm1hY2hfaGFs
dCkodm9pZCk7Ci12b2lkICgqbWFjaF9wb3dlcl9vZmYpKHZvaWQpOwogCiAjaWZkZWYgQ09ORklH
X002ODAwMAogI2lmIGRlZmluZWQoQ09ORklHX002ODMyOCkKZGlmZiAtLWdpdCBhL2FyY2gvbTY4
ay9tYWMvY29uZmlnLmMgYi9hcmNoL202OGsvbWFjL2NvbmZpZy5jCmluZGV4IDY1ZDEyNGVjODBi
Yi4uMzgyZjY1NmMyOWVhIDEwMDY0NAotLS0gYS9hcmNoL202OGsvbWFjL2NvbmZpZy5jCisrKyBi
L2FyY2gvbTY4ay9tYWMvY29uZmlnLmMKQEAgLTEyLDYgKzEyLDcgQEAKIAogI2luY2x1ZGUgPGxp
bnV4L2Vycm5vLmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CisjaW5jbHVkZSA8bGludXgv
cmVib290Lmg+CiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KICNpbmNsdWRlIDxsaW51eC9tbS5o
PgogI2luY2x1ZGUgPGxpbnV4L3R0eS5oPgpAQCAtMTQwLDcgKzE0MSw2IEBAIHZvaWQgX19pbml0
IGNvbmZpZ19tYWModm9pZCkKIAltYWNoX2h3Y2xrID0gbWFjX2h3Y2xrOwogCW1hY2hfcmVzZXQg
PSBtYWNfcmVzZXQ7CiAJbWFjaF9oYWx0ID0gbWFjX3Bvd2Vyb2ZmOwotCW1hY2hfcG93ZXJfb2Zm
ID0gbWFjX3Bvd2Vyb2ZmOwogI2lmIElTX0VOQUJMRUQoQ09ORklHX0lOUFVUX002OEtfQkVFUCkK
IAltYWNoX2JlZXAgPSBtYWNfbWtzb3VuZDsKICNlbmRpZgpAQCAtMTYwLDYgKzE2MCw4IEBAIHZv
aWQgX19pbml0IGNvbmZpZ19tYWModm9pZCkKIAogCWlmIChtYWNpbnRvc2hfY29uZmlnLT5pZGVu
dCA9PSBNQUNfTU9ERUxfSUlDSSkKIAkJbWFjaF9sMl9mbHVzaCA9IHZpYV9sMl9mbHVzaDsKKwor
CXJlZ2lzdGVyX3BsYXRmb3JtX3Bvd2VyX29mZihtYWNfcG93ZXJvZmYpOwogfQogCiAKLS0gCjIu
MzUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
