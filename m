Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E962CC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 23:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pengjCj/6BJWFOT8UtEdC9ybpAmCHXoYN0hojCGUUyw=; b=MnRB4+diy+rn90
	KBiQvB6l206mVEpowdPKz5+EbGI4j91ij8zjnDMfZnTrNH1M1NhBVkchY4HYS4pPq5smstIlWCEb4
	gjjK/sgLHiNRPzmxnz6eFv//QQV0UvVPI+ofFP10JyEgiWfsFGgByj065JzEkrzOep+Nk7otkffWD
	tJ9ymJ+r0sfX3PE7c6AVEjETLfztl0+/fn2RtYUC+3tjRP7e96GF4VBuTtm6IkE5HI+93YXnsnk+4
	DZJf89Yq0rTZKD+QDkEDUt6vMZZg1RxRk83GZk0qZufI9Uffgf3s2cU5Ofd1Q2OE9DFn8ILDlHZsG
	smcFeMcCLvDbD60zUDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noCtI-00Gkjt-5Y; Mon, 09 May 2022 23:34:12 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noCt8-00GkWc-Cj
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 23:34:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 6209F1F441DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652139238;
 bh=UUAJJ/IBIhNY6NA1AxJmIDD0rKb6vfi9bj1ZHogZ1sk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TkUASExCPh+FoXzL2OnCGIIu2Z2HXaBISDFgR7ixWfN1WdyIfCSpaUflnD7rWGxDG
 vQCzwQpQuFj71TlHQA9DCAV9sF+sdQH9hcN7lAC3LqA9C4TbZrGN3bNuc1ngng/O7i
 rySb86VyOpMwBjDX/TS735BJig4rEchyEIwVD9KJ+d21dHQBFQDukdAhgeiYB28NSu
 ynWq6arqtBNX91H7sywe74sjkSSFI7BlaiTD+aG/xhTaRyK3ZGoePGigvGG/rQBHkh
 cCEmV1YRV999ye8BFKhlDYmcEURuTzQcgUzY2QPWWaOq0izK+9ObffwREMFkcbNPRX
 aXMbf/7L3uBQA==
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
Subject: [PATCH v8 14/27] xen/x86: Use do_kernel_power_off()
Date: Tue, 10 May 2022 02:32:22 +0300
Message-Id: <20220509233235.995021-15-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_163402_596329_4172278E 
X-CRM114-Status: GOOD (  15.62  )
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
dyBzeXMtb2ZmIEFQSS4KCkFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
ClJldmlld2VkLWJ5OiBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEByZXJlLnFtcW0ucGw+
ClNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9y
YS5jb20+Ci0tLQogYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jIHwgNCArKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwpp
bmRleCA1MDM4ZWRiNzlhZDUuLmFmMWY2ZTg4NjIyNSAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVu
L2VubGlnaHRlbl9wdi5jCisrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwpAQCAtMzEs
NiArMzEsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2dmcC5oPgogI2luY2x1ZGUgPGxpbnV4L2VkZC5o
PgogI2luY2x1ZGUgPGxpbnV4L29ianRvb2wuaD4KKyNpbmNsdWRlIDxsaW51eC9yZWJvb3QuaD4K
IAogI2luY2x1ZGUgPHhlbi94ZW4uaD4KICNpbmNsdWRlIDx4ZW4vZXZlbnRzLmg+CkBAIC0xMDcx
LDggKzEwNzIsNyBAQCBzdGF0aWMgdm9pZCB4ZW5fbWFjaGluZV9oYWx0KHZvaWQpCiAKIHN0YXRp
YyB2b2lkIHhlbl9tYWNoaW5lX3Bvd2VyX29mZih2b2lkKQogewotCWlmIChwbV9wb3dlcl9vZmYp
Ci0JCXBtX3Bvd2VyX29mZigpOworCWRvX2tlcm5lbF9wb3dlcl9vZmYoKTsKIAl4ZW5fcmVib290
KFNIVVRET1dOX3Bvd2Vyb2ZmKTsKIH0KIAotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
