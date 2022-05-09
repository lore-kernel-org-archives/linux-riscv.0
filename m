Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3450C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 23:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dznIhhxpGHJ03X+CJOpKhxoOSW52oDICqdPquNcd8wE=; b=jxd04giqdfGLHU
	7vgKUtosdM2ttJLvvyHNh6BSEStL9p62VG2qcoivPvsB2dKlRe8BIifUdkkgFjziHbGARCp+Th/H/
	5CU/ITxoIO14Y0ietRZUV4offu8D7I55MRd0A6GA1um6ufgcPINJkqM5a6bGb4ryftWKjKAHu/oeA
	bL5+aF7huYkGFM+8GjOtMeDK8x3Uh94xRGBXHM6ZEM0d4BpkJkk8tdmKA1PInBCY2H2oGxlGNTZtO
	1icpvDbI48deNL5NVmnZAiYaV8DLI4BM+0714ChzdGjg0FWztLrQI0ZnA8xTkuC4KHQ1Uh6U+rkYS
	mcg/6wBJE7EjVG7UGxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noCss-00GkG7-Rv; Mon, 09 May 2022 23:33:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noCsp-00GkCQ-EO
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 23:33:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 959D61F441CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652139222;
 bh=6s0maqcEZmA2YXgu3K4UCDPu+D53/76G+RW0Zx9hW8k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h4OvUVSAAn8ONu+FqbmPB/ZUg1Qkbk6CMBh2JL9wBLZZNByEx452+sfFnsAzbrW5g
 WobsFtZ/ugKUfeWEuu8gKnblyxG7kr6RGNcK/DuRUjgE7VnPsIPzVT6BWE/ogkwXcM
 ZEa6zQM9Ud51zEudJ43wylNsHR/LBoT0+ycy6T0RzK3M4I3LXqeJ068zrXIUjA3hEU
 FWiFVtYOTuHH+O/MM14WQytKXOng1sNd/DkdhgtmsB0Ohc4IKE/Ry6rNzouXX33NP9
 PLUYHYobr5c/gP/EBTkVk4jNp31Iu2OSNaJdJc28/R7zEnpy6HkG+xlpPc3bqWbG1U
 Qw6/DNrpVeC/A==
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
Subject: [PATCH v8 10/27] csky: Use do_kernel_power_off()
Date: Tue, 10 May 2022 02:32:18 +0300
Message-Id: <20220509233235.995021-11-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_163343_644697_4B97436E 
X-CRM114-Status: GOOD (  13.18  )
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
dyBzeXMtb2ZmIEFQSS4KCkFja2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KUmV2
aWV3ZWQtYnk6IE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJxLWxpbnV4QHJlcmUucW1xbS5wbD4KU2ln
bmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkbWl0cnkub3NpcGVua29AY29sbGFib3JhLmNv
bT4KLS0tCiBhcmNoL2Nza3kva2VybmVsL3Bvd2VyLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2Nz
a3kva2VybmVsL3Bvd2VyLmMgYi9hcmNoL2Nza3kva2VybmVsL3Bvd2VyLmMKaW5kZXggOTIzZWU0
ZTM4MWI4Li44NmVlMjAyOTA2ZjggMTAwNjQ0Ci0tLSBhL2FyY2gvY3NreS9rZXJuZWwvcG93ZXIu
YworKysgYi9hcmNoL2Nza3kva2VybmVsL3Bvd2VyLmMKQEAgLTksMTYgKzksMTQgQEAgRVhQT1JU
X1NZTUJPTChwbV9wb3dlcl9vZmYpOwogdm9pZCBtYWNoaW5lX3Bvd2VyX29mZih2b2lkKQogewog
CWxvY2FsX2lycV9kaXNhYmxlKCk7Ci0JaWYgKHBtX3Bvd2VyX29mZikKLQkJcG1fcG93ZXJfb2Zm
KCk7CisJZG9fa2VybmVsX3Bvd2VyX29mZigpOwogCWFzbSB2b2xhdGlsZSAoImJrcHQiKTsKIH0K
IAogdm9pZCBtYWNoaW5lX2hhbHQodm9pZCkKIHsKIAlsb2NhbF9pcnFfZGlzYWJsZSgpOwotCWlm
IChwbV9wb3dlcl9vZmYpCi0JCXBtX3Bvd2VyX29mZigpOworCWRvX2tlcm5lbF9wb3dlcl9vZmYo
KTsKIAlhc20gdm9sYXRpbGUgKCJia3B0Iik7CiB9CiAKLS0gCjIuMzUuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
