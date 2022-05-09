Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54CFC41535
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 23:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ytCmelJLxsBXDv5F5JG/cVoK60txgaF1X4T+hVTnPfM=; b=zJsr52r/sDtU/r
	/x9h8q8elALyQ10FIYmcSA25nCc7TY1nuMqOmf8TvDmp9qVDE2FSEGoWFCBy/pucqc2RquoAMVb97
	U2gNhLrTX2bo+h31Hk44e0zay39y7aTy4qIwj9YSqYRTyeoQNmLMykrNNYmaFN3BKtLYAYK+zA956
	l1lSVUaTY5bsRuhzHMnv/sGpuBHCmePZpnJ5wEoUprB/+Wm83Ce0QjOl4cG7xY2U7e33X+IUVqzxz
	4sz5yyNT6xkU3TW8/pTLUXR/TnhOx4N2lPbA5dhQqQdu0Dg8yvDP8CpCqldpWQ99bP/L1ZRtRzM/0
	kXSX8erE/hZA2N391+Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noCt2-00GkRW-LJ; Mon, 09 May 2022 23:33:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noCsy-00GkKr-EW
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 23:33:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 6D3491F441D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652139230;
 bh=qKcEaaqMIJ4u5Ci+7b2uBSMlhy7r7OU77hT8ObUoKho=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YmHmlZT4yyO6cWM3Bz5JftChowVg/M2fXvwFMhRS4e+Wuq4sD1q3OkohJJlDsPPL2
 j5kr4/JUymIkLlQMnmeGWx/oL/gzhnBQuKsL8jB4iuv6hwrbHMcsw3LuhebKodzWFk
 rmnjBC0+wPIYX6c0ORsexWKd3U+jCsIpfbjSiclXE3M9LeCXBn+ESKjT58ePCxxTWV
 Zl82L0X/fkIGQBuqIcNG6Jl9nhzo3I5HfMrX4c7iNnVoa+PkQdE4O3elLjDQsPpn1Q
 MEclW34sJqJsqXbvF7sjn3ufyEIcH1MhP4YeSXnfNNyguaVxY5pj3bnr/70Q51dzF8
 7fEmC00bkHk/g==
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
Subject: [PATCH v8 12/27] arm64: Use do_kernel_power_off()
Date: Tue, 10 May 2022 02:32:20 +0300
Message-Id: <20220509233235.995021-13-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_163352_648743_A00049BD 
X-CRM114-Status: GOOD (  13.65  )
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
dyBzeXMtb2ZmIEFQSS4KCkFja2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5h
c0Bhcm0uY29tPgpSZXZpZXdlZC1ieTogTWljaGHFgiBNaXJvc8WCYXcgPG1pcnEtbGludXhAcmVy
ZS5xbXFtLnBsPgpTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRtaXRyeS5vc2lwZW5r
b0Bjb2xsYWJvcmEuY29tPgotLS0KIGFyY2gvYXJtNjQva2VybmVsL3Byb2Nlc3MuYyB8IDMgKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9hcm02NC9rZXJuZWwvcHJv
Y2Vzcy5jCmluZGV4IDE0MmE1MTI1NjY2OS4uOTJiY2MxNzY4ZjBiIDEwMDY0NAotLS0gYS9hcmNo
L2FybTY0L2tlcm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvcHJvY2Vzcy5j
CkBAIC0xMTEsOCArMTExLDcgQEAgdm9pZCBtYWNoaW5lX3Bvd2VyX29mZih2b2lkKQogewogCWxv
Y2FsX2lycV9kaXNhYmxlKCk7CiAJc21wX3NlbmRfc3RvcCgpOwotCWlmIChwbV9wb3dlcl9vZmYp
Ci0JCXBtX3Bvd2VyX29mZigpOworCWRvX2tlcm5lbF9wb3dlcl9vZmYoKTsKIH0KIAogLyoKLS0g
CjIuMzUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
