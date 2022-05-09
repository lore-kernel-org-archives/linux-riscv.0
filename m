Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174D7C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 23:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7bCHSJ1aWdsquUndaW5PNul7EX7/+Dlngdr78RZijiQ=; b=nj+GEOCnWYrNAP
	M9cavhiCZVgjq8Rq02IvZcn/tuxgVseBu/XY+isziMkJ2GVEOyAugQmGkedQUxF/tJ2maagqsZ5df
	3sodYK3zIY6vUO+vv43WUcyXXlepPehOLfdi/eFTZwc2rtWbri65+Xbm+10vOAQ0n7wf8Fsb+m0LL
	SgrMIlBG19DlAPv9kyNNeCt1H5F1VRcmNMhIk6v85s4roWrHDWBOWQOvGNYbXPJG2H+O72aRCIuoh
	hmXqSMTvjWoITWlaEf2h7SqhLDj0SphOzGzxCZyXQo9yh81+j3PeWVgjnXJW1PI4a0mXcJad6KVSM
	6DkjNFePRhWw8OL3t8Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noCsM-00Gjls-Sa; Mon, 09 May 2022 23:33:14 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noCsJ-00Gjg8-LT
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 23:33:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 5E2CD1F4195B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652139187;
 bh=fLk9P/8GBXV/gow9gw4QGytkxQFyLU71HSagZYJ8o5I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YhxhnTI9NvbLfj67ZcRhPX86XV8hnVmvB2+NtO95NIqYARKmayRkU9nopvPEQT8Me
 W2nnVXm0D2hSk50qdVKpG+UHHCKbjvMu3DEa3LaZ5ZzUrWUuvj9BT9vVQEbRgMTGth
 m/otgMrFJikr7jdN+Q40cxAuxrylVYKjYtjLq4WIIwC/OBLKnmv6GgSMh0Y+uGoD/L
 1hhg9iEoCH1Pdja7DSW7Pk4PTjR/qfW5ULonIQQvmnkEROj2Q2BUmPpY9d1Q7Ecq17
 xmwMvW1NNWwMi/Qww4oq/Msiaz19CBS0NzvNZDBPy+6YaGpixClw4HeYhLf1899Vzj
 FC16JVNO96lKg==
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
Subject: [PATCH v8 01/27] notifier: Add atomic_notifier_call_chain_is_empty()
Date: Tue, 10 May 2022 02:32:09 +0300
Message-Id: <20220509233235.995021-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_163311_875552_7BED3E9F 
X-CRM114-Status: GOOD (  12.93  )
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

QWRkIGF0b21pY19ub3RpZmllcl9jYWxsX2NoYWluX2lzX2VtcHR5KCkgdGhhdCByZXR1cm5zIHRy
dWUgaWYgZ2l2ZW4KYXRvbWljIGNhbGwgY2hhaW4gaXMgZW1wdHkuCgpSZXZpZXdlZC1ieTogTWlj
aGHFgiBNaXJvc8WCYXcgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBsPgpTaWduZWQtb2ZmLWJ5OiBE
bWl0cnkgT3NpcGVua28gPGRtaXRyeS5vc2lwZW5rb0Bjb2xsYWJvcmEuY29tPgotLS0KIGluY2x1
ZGUvbGludXgvbm90aWZpZXIuaCB8ICAyICsrCiBrZXJuZWwvbm90aWZpZXIuYyAgICAgICAgfCAx
MyArKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L25vdGlmaWVyLmggYi9pbmNsdWRlL2xpbnV4L25vdGlmaWVy
LmgKaW5kZXggODcwNjliODQ1OWFmLi45NWUyNDQwMDM3ZGUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
bGludXgvbm90aWZpZXIuaAorKysgYi9pbmNsdWRlL2xpbnV4L25vdGlmaWVyLmgKQEAgLTE3Myw2
ICsxNzMsOCBAQCBleHRlcm4gaW50IGJsb2NraW5nX25vdGlmaWVyX2NhbGxfY2hhaW5fcm9idXN0
KHN0cnVjdCBibG9ja2luZ19ub3RpZmllcl9oZWFkICpuaAogZXh0ZXJuIGludCByYXdfbm90aWZp
ZXJfY2FsbF9jaGFpbl9yb2J1c3Qoc3RydWN0IHJhd19ub3RpZmllcl9oZWFkICpuaCwKIAkJdW5z
aWduZWQgbG9uZyB2YWxfdXAsIHVuc2lnbmVkIGxvbmcgdmFsX2Rvd24sIHZvaWQgKnYpOwogCitl
eHRlcm4gYm9vbCBhdG9taWNfbm90aWZpZXJfY2FsbF9jaGFpbl9pc19lbXB0eShzdHJ1Y3QgYXRv
bWljX25vdGlmaWVyX2hlYWQgKm5oKTsKKwogI2RlZmluZSBOT1RJRllfRE9ORQkJMHgwMDAwCQkv
KiBEb24ndCBjYXJlICovCiAjZGVmaW5lIE5PVElGWV9PSwkJMHgwMDAxCQkvKiBTdWl0cyBtZSAq
LwogI2RlZmluZSBOT1RJRllfU1RPUF9NQVNLCTB4ODAwMAkJLyogRG9uJ3QgY2FsbCBmdXJ0aGVy
ICovCmRpZmYgLS1naXQgYS9rZXJuZWwvbm90aWZpZXIuYyBiL2tlcm5lbC9ub3RpZmllci5jCmlu
ZGV4IGJhMDA1ZWJmNDczMC4uYWFmNWI1NjQ1MmE2IDEwMDY0NAotLS0gYS9rZXJuZWwvbm90aWZp
ZXIuYworKysgYi9rZXJuZWwvbm90aWZpZXIuYwpAQCAtMjA0LDYgKzIwNCwxOSBAQCBpbnQgYXRv
bWljX25vdGlmaWVyX2NhbGxfY2hhaW4oc3RydWN0IGF0b21pY19ub3RpZmllcl9oZWFkICpuaCwK
IEVYUE9SVF9TWU1CT0xfR1BMKGF0b21pY19ub3RpZmllcl9jYWxsX2NoYWluKTsKIE5PS1BST0JF
X1NZTUJPTChhdG9taWNfbm90aWZpZXJfY2FsbF9jaGFpbik7CiAKKy8qKgorICoJYXRvbWljbm90
aWZpZXJfY2FsbF9jaGFpbl9pc19lbXB0eSAtIENoZWNrIHdoZXRoZXIgbm90aWZpZXIgY2hhaW4g
aXMgZW1wdHkKKyAqCUBuaDogUG9pbnRlciB0byBoZWFkIG9mIHRoZSBibG9ja2luZyBub3RpZmll
ciBjaGFpbgorICoKKyAqCUNoZWNrcyB3aGV0aGVyIG5vdGlmaWVyIGNoYWluIGlzIGVtcHR5Lgor
ICoKKyAqCVJldHVybnMgdHJ1ZSBpcyBub3RpZmllciBjaGFpbiBpcyBlbXB0eSwgZmFsc2Ugb3Ro
ZXJ3aXNlLgorICovCitib29sIGF0b21pY19ub3RpZmllcl9jYWxsX2NoYWluX2lzX2VtcHR5KHN0
cnVjdCBhdG9taWNfbm90aWZpZXJfaGVhZCAqbmgpCit7CisJcmV0dXJuICFyY3VfYWNjZXNzX3Bv
aW50ZXIobmgtPmhlYWQpOworfQorCiAvKgogICoJQmxvY2tpbmcgbm90aWZpZXIgY2hhaW4gcm91
dGluZXMuICBBbGwgYWNjZXNzIHRvIHRoZSBjaGFpbiBpcwogICoJc3luY2hyb25pemVkIGJ5IGFu
IHJ3c2VtLgotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
