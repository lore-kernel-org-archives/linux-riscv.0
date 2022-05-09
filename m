Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97387C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 23:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/mz2CHB7Ke+j2uuLytnOj2OnVP8wQEs2wnPtURmaLk=; b=eSO/+0zQDZNx0C
	HF2k+kDSLibWSdj7/2wspTVqrpW6cfXVN7ohtn+1+maE//HY0dKUBDLnohCfnmhbYesjb3argb6DF
	QaFa5lSMUjmTxNz6y1oFVUJzF1D7smKQlwzlqmVQBHDemUgHO5tGnU8QKrbG+0759pHNI6L2I9pli
	kBFsRT+82cGDTevZM/+Ln0aO6AZRIPEvOXddrBjoFhHA1/LdnmIxce6+zDicByyYlIgY/2SdIO2ow
	dDC/jtw0NImKyvafHdumJFgTAmXlWkZm3bJhccz9H6Bb2TrJZIsQcQ6yhhKcRyM/qQhs6nZvkJoF5
	rmyJievVNOAQKmDV4Bjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noCtt-00GlMc-Tk; Mon, 09 May 2022 23:34:50 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noCtP-00Gkqg-Pi
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 23:34:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id CD6681F44218
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652139257;
 bh=vRb4DtICDxJaROyEtMW3UwUdcH4tg+twL9gOXYS6wp8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gt4u81G/LFxhoOEWGR2YMg+vhkXhorm0jgFd64YTZTuXmM+7vG7f3q4ZdaFuqYRJS
 tGUmDGjP5E8g3OsXjzvy7rc8/B4hk2wxUh254z6arCFJCq4Zn4nYnOEuMGAFxhhkwc
 FeFBnrORsJSOriC3iEOi3iWo3k8QOf23bj2Nt6IUYGS+Vok5FiMxP+66U31QsS8qsL
 mVpptTyKx3JXLvhtJiVMPU7cAlmSudorXN3MNL4LPBNQ56Fm1aY+u8x67N3P+KtJ22
 6BIPyxJsFkQfhUsOqyWUF/BWHTPKTs8seyIqQEcyu9CdhBsdEQuumAGveCtmifiXNx
 wIYCEzEJi6pLw==
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
Subject: [PATCH v8 19/27] ia64: Use do_kernel_power_off()
Date: Tue, 10 May 2022 02:32:27 +0300
Message-Id: <20220509233235.995021-20-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_163419_988783_DEC997F7 
X-CRM114-Status: GOOD (  15.18  )
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
dyBzeXMtb2ZmIEFQSS4KClJldmlld2VkLWJ5OiBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51
eEByZXJlLnFtcW0ucGw+ClNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZG1pdHJ5Lm9z
aXBlbmtvQGNvbGxhYm9yYS5jb20+Ci0tLQogYXJjaC9pYTY0L2tlcm5lbC9wcm9jZXNzLmMgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC9pYTY0L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL2lhNjQva2VybmVs
L3Byb2Nlc3MuYwppbmRleCAxNjdiMTc2NWJlYTEuLjQxNjMwNWU1NTBlMiAxMDA2NDQKLS0tIGEv
YXJjaC9pYTY0L2tlcm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC9pYTY0L2tlcm5lbC9wcm9jZXNz
LmMKQEAgLTE5LDYgKzE5LDcgQEAKICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRl
IDxsaW51eC9ub3RpZmllci5oPgogI2luY2x1ZGUgPGxpbnV4L3BlcnNvbmFsaXR5Lmg+CisjaW5j
bHVkZSA8bGludXgvcmVib290Lmg+CiAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KICNpbmNsdWRl
IDxsaW51eC9zY2hlZC9kZWJ1Zy5oPgogI2luY2x1ZGUgPGxpbnV4L3NjaGVkL2hvdHBsdWcuaD4K
QEAgLTYwMiw4ICs2MDMsNyBAQCBtYWNoaW5lX2hhbHQgKHZvaWQpCiB2b2lkCiBtYWNoaW5lX3Bv
d2VyX29mZiAodm9pZCkKIHsKLQlpZiAocG1fcG93ZXJfb2ZmKQotCQlwbV9wb3dlcl9vZmYoKTsK
Kwlkb19rZXJuZWxfcG93ZXJfb2ZmKCk7CiAJbWFjaGluZV9oYWx0KCk7CiB9CiAKLS0gCjIuMzUu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
