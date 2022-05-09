Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDDCC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 10 May 2022 00:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bY5eKGk1cIyzX1seSRArtTmXY052XsOkE9jYi8QVjeY=; b=392vBM2gj1AqpM
	ESkLzFrrUM2NNNWeJH8QkD+o2scYFKouvHSX9ntOypvuzxLEGlYgrQIUZVH7e8dSYs9X1Srj5VQ0v
	3qWA+dtEn0ZTWShj+GMDHoou7lzNFsmzVOEhz2iHekYsf0YfPA25MZqW5hqi0y7GDirIB9Y5ECt6D
	0GljF/RKRnfYSde/CTe1fWRT80VCkwwpg1/6S5SL3an5mr2SqtsPYmhIcKYWGyrXfX8mbLG1Uy/sE
	xh+N1mhjLjPBTsz9dWBaXTePl9cGV6ws9A09vxAizqpFAG6gRDvQInzFBOMSvYg9SRRyCVHFw3Gwo
	jAodkREciQ5Ihbkaw/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noDjg-00Gr6h-A1; Tue, 10 May 2022 00:28:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noDje-00Gr5T-EZ
 for linux-riscv@bombadil.infradead.org; Tue, 10 May 2022 00:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=tTL4Fq4KJsD10DYYcALVXcU3QcxSFOTGrABeeAr2veE=; b=dTkYa32dTGNUni4mrCTGZxfVZO
 mPRjqDfx0h+6GzwACfUxpOLIHjxe5iOWwcN5nmk+E9ogusIgZI8yodGSEnn3nrRU+NqyrgGgpv70h
 u3hJtfn+Ufg7HawP08tvmQdXOAjcnYxUbjNpf0HJzXfxtnBSww07KALfxjZXZ1iCDbElHXUAdpSTC
 oW+HVemDfd+FSMvsMNyUlekIZi759b5dVXf2WF1pVYycBXOg0aEsd2XcTC3KyWc4q2v2UgoUAvP0Y
 yp9WHlKjp+YaO3aXc6mYlHy7kf/Mip765O69xoD+5o+UbVkzQOs6ooNaxdkdywMT8AfhWFwxz4VKY
 6ifawBgA==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noCtN-00CgWj-I6
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 23:34:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id E7D5B1F441FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652139253;
 bh=i0EpyUpthjBui1PGSfTlV0XdMEaBb9rmJl1vNRe/ntg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cOsU2r2Eblivwj/4cs5M9vQ+EIm4O22kzOvkVpXBwVaGlQQqUaU+9c9J8h2kpjBSt
 GpXjMQQdLCoJJlIHF5IfMSLeGCyJvESoQPCKt3kCPQedCVqLaoeEopcTf+HEY5q1lO
 jJ/uDMUpGaMZkBso16PjrWo29hM7vhwjdcV20pn3IDz86wk5E9pcvm7DLWuJ5eN3xe
 Rv7XJipXyrsWHlwyWVQKKYth00nFChhonNPtOvFo1TEnjkAjXR2JiSFF1yvm2SKeAq
 YVHXAi1edwQHbtnVBglD/8RVeEInLaeMWxknedL6gsMlzSmRogo0SRclXVYd+laLv3
 s6F3Ihd0ore/g==
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
Subject: [PATCH v8 18/27] x86: Use do_kernel_power_off()
Date: Tue, 10 May 2022 02:32:26 +0300
Message-Id: <20220509233235.995021-19-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_003417_956821_8490CA7A 
X-CRM114-Status: GOOD (  15.74  )
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
aXBlbmtvQGNvbGxhYm9yYS5jb20+Ci0tLQogYXJjaC94ODYva2VybmVsL3JlYm9vdC5jIHwgNCAr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9yZWJvb3QuYyBiL2FyY2gveDg2L2tlcm5lbC9yZWJv
b3QuYwppbmRleCBmYTcwMGI0NjU4OGUuLmMzNjM2ZWE0YWE3MSAxMDA2NDQKLS0tIGEvYXJjaC94
ODYva2VybmVsL3JlYm9vdC5jCisrKyBiL2FyY2gveDg2L2tlcm5lbC9yZWJvb3QuYwpAQCAtNzM5
LDEwICs3MzksMTAgQEAgc3RhdGljIHZvaWQgbmF0aXZlX21hY2hpbmVfaGFsdCh2b2lkKQogCiBz
dGF0aWMgdm9pZCBuYXRpdmVfbWFjaGluZV9wb3dlcl9vZmYodm9pZCkKIHsKLQlpZiAocG1fcG93
ZXJfb2ZmKSB7CisJaWYgKGtlcm5lbF9jYW5fcG93ZXJfb2ZmKCkpIHsKIAkJaWYgKCFyZWJvb3Rf
Zm9yY2UpCiAJCQltYWNoaW5lX3NodXRkb3duKCk7Ci0JCXBtX3Bvd2VyX29mZigpOworCQlkb19r
ZXJuZWxfcG93ZXJfb2ZmKCk7CiAJfQogCS8qIEEgZmFsbGJhY2sgaW4gY2FzZSB0aGVyZSBpcyBu
byBQTSBpbmZvIGF2YWlsYWJsZSAqLwogCXRib290X3NodXRkb3duKFRCX1NIVVRET1dOX0hBTFQp
OwotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
