Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B2FC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 10 May 2022 00:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vCyvqxdu1rwlOzsOnMXE6HOVP2jxopBbjEKRfVidE3o=; b=SmHE4MXW1iUE5U
	bfEqGAONqg2oryaY1UpKI7hS9SCRrjHZbE0/EJwyCXXV9zx0ZTCpKdW1ueaDbn7frnGH0Bo+WAasx
	qPZ9f7eU5fwemkeIrxe3VBiuXbARF8PoM0am5hkDPQFq9XkvtRhEXff1buHAI5VeXAr6ZMuS7Dvsq
	qUWrAC+XFTiE0tzbzWBItfdulwCTnMuCWMzQsZ35fSY3FvW4NMVRPhFLw2FM7OBzhH0Hc7Zh9DUhv
	nf7QrbqvbJ8lkmLNjyhpLJPo+hAYsNfp2oX686UrX13xztn6zH0j4Lvsn6zE41jSMvNpNu6f5fIc3
	Vou6mpxlUVj6ePRc+RCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noDjj-00Gr7B-8m; Tue, 10 May 2022 00:28:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noDjg-00Gr5T-4b
 for linux-riscv@bombadil.infradead.org; Tue, 10 May 2022 00:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=a3yK2T+sGCCnAscNkKI7YaPApC+XE6EEKjXPNWvAX6Y=; b=LgTsctqyapwIVED5KQ+XXWo4np
 zuPnbYH5jRQzJg0bx/k0nGo4f89oEF1+VNjhh0XeOHvaB581oRzvSPPL6scRC8Ul7uqKj91kD/9rh
 uw4gyKWISNodZjtH1m4jxet7/aa/zGvmDuZP0isJdvp2uXuZa5bmZPFvSOOvTIN/YcDvY0jeg3/dS
 IZn8ghYj8lEtEBeu8CSfOQVvmjIY8dgNwvmoGxHDh+S/gLsJvyh/Jmq3+iVlMCzBE96j2p/fBNgUC
 gsMny4BgP/AfyVec2r7stL6FB81iyvz2g5ihixZFgxJAA/86QJqGPphRNewVE3kczHx0t9fLJtMAO
 EuXAS4gQ==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noCtR-00CgXL-UF
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 23:34:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id C06B91F4421D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652139261;
 bh=8v4IT57+mYAUaWHgG2SWPXczQ+re0x8/DMpbbFlIS8M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=isHqVuBEBya3ws/kEg+oG4SY7cz7IlcFyGnrUpkaZVcGOjpZxRhpzSw44LoLfDOJa
 WG+MtxGMzWjlq+wBMlpt+KNs2yTOPSWGcQVJuCZGKQnBwwK5ItMuAZjFF+prk5PVOf
 dbW8U+TBV0uJ/lW7DoEmYBN+dWUUR3JmXsjCQnAoqtd+e/OC4UCPn1dbpDb9NKnPOR
 gwWBLXpkonDuICKTRolr5FU0p5ifDNqvOUcqTMXX1M5CkKwte65fYr/AmYqOdZnoWi
 vrDx1AIDfO9+OLCEpYijEbVExDT6hmoW8p3VzsnPd6npIRWlURULaN5k1zAUbNcY2c
 KQvzdoNzeUO7A==
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
Subject: [PATCH v8 20/27] mips: Use do_kernel_power_off()
Date: Tue, 10 May 2022 02:32:28 +0300
Message-Id: <20220509233235.995021-21-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_003422_437731_6CA2CEC1 
X-CRM114-Status: GOOD (  13.62  )
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
dyBzeXMtb2ZmIEFQSS4KCkFja2VkLWJ5OiBUaG9tYXMgQm9nZW5kb2VyZmVyIDx0c2JvZ2VuZEBh
bHBoYS5mcmFua2VuLmRlPgpSZXZpZXdlZC1ieTogTWljaGHFgiBNaXJvc8WCYXcgPG1pcnEtbGlu
dXhAcmVyZS5xbXFtLnBsPgpTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRtaXRyeS5v
c2lwZW5rb0Bjb2xsYWJvcmEuY29tPgotLS0KIGFyY2gvbWlwcy9rZXJuZWwvcmVzZXQuYyB8IDMg
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9taXBzL2tlcm5lbC9yZXNldC5jIGIvYXJjaC9taXBzL2tlcm5lbC9yZXNl
dC5jCmluZGV4IDYyODg3ODBiNzc5ZS4uZTdjZTA3YjNlNzliIDEwMDY0NAotLS0gYS9hcmNoL21p
cHMva2VybmVsL3Jlc2V0LmMKKysrIGIvYXJjaC9taXBzL2tlcm5lbC9yZXNldC5jCkBAIC0xMTQs
OCArMTE0LDcgQEAgdm9pZCBtYWNoaW5lX2hhbHQodm9pZCkKIAogdm9pZCBtYWNoaW5lX3Bvd2Vy
X29mZih2b2lkKQogewotCWlmIChwbV9wb3dlcl9vZmYpCi0JCXBtX3Bvd2VyX29mZigpOworCWRv
X2tlcm5lbF9wb3dlcl9vZmYoKTsKIAogI2lmZGVmIENPTkZJR19TTVAKIAlwcmVlbXB0X2Rpc2Fi
bGUoKTsKLS0gCjIuMzUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
