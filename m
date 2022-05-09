Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6925CC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 10 May 2022 00:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=030L2Ydfs2xCj2l+mUuX+c6gNPGx9avUDf+tgd/lILc=; b=uAEj/SCDNM0HZ1
	0ALbZQ1dhvj7zLvSK7NjEagYfc4vfxB4vAnuFeuASdHjF8fANdsRl+CgmqL6WSaTMzEPpT9agcGZl
	Uz/oViF4eJgGgdNR4G3GvKkdlXW7Kg3JaUw8p0yAgv53YRvTauETRS2RJr4ZWle5fVxBF7GCPMZnl
	R/4mF3Y6WofqDbikzckfADpAAKn6LqsRMlyt0uNFxxhQSYWnlKezuR5kab7QVGrlGc9pS8fbc3JIv
	ymC+zOJmTmbNYXELqom0kXEMHDmTGif8+16CnLqYKb4xkUtj6cXrDEiVdHQVy7PrTPND8/yxB13ej
	jAMUT8GjI06pCzXk0YXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noDjh-00Gr71-Pb; Tue, 10 May 2022 00:28:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noDjf-00Gr5T-4p
 for linux-riscv@bombadil.infradead.org; Tue, 10 May 2022 00:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=+bdjQd9k3nWdMl2zDf1IJbU2Azb96SEHJgobsnR3f7Q=; b=ItBgLRoSt2P+NOZKZCUkkU0fgw
 oc/zjSRv8JYS+2g0+w8cBbUl4trun53ozL3jtGIbvLEWwwnaZwTlEse0wmVk5RxqZYbzTMRv9/aee
 8ymAul8zJsAPiBB223NYt4Vc/MNA3+W1IJYNutndyo5vZYUnuMVrGCIqH+0zH1J61IfKV0cga9VvQ
 FgBb/QEAM1Psopt3jx13YiQNm6jj6Tgy+4+b2QmrZDJzMX31HCBNfXAEIqopkB77hDtVHnnSUDdli
 J11haavK58Iw9IEZguX9vmkCfkmgD+lChROp3r59IfxXThLcXZ/pjvl8jHyv53aLWx//LHrJVBTJ+
 JiAG90cw==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noCtX-00CgXf-2g
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 23:34:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id A135D1F44222
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652139265;
 bh=0HjIUgv+906XrAObDigD/ThUSuZMAL8DnPYgjzjpmC0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TWCiuLNt7/xJ8odTWc8GyA2loDND0GGWRmOLSDJZ3/1EOOM46MoO6kcL0XNk3HwPe
 FBPpCFoePNs4rPAAZRKP+rw/ZolMsMxYimmM4SWHpv67kFo+HnqMhIKFI3o9iJnuWS
 vNlcat+YAoNJG0U7fH5nF+xZr/J3ldOvzJraAO0ornmvSG33Iwh+7D/WO9KPdopL/I
 4fstIQm6rGU1cDpxZRjjzwcmAnN/r2ufy/hVwsd2Ga1ZdsJDzAOFQPmAS1qD2fVhxO
 UL54muri0ZQhU7rjF30W/z7G7m5ZKwocnvqA9RnpgcfN4zFZ8kzOBHH30lfBRBp5PE
 p0vvde97M8jrQ==
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
Subject: [PATCH v8 21/27] memory: emif: Use kernel_can_power_off()
Date: Tue, 10 May 2022 02:32:29 +0300
Message-Id: <20220509233235.995021-22-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_003427_772294_E3DC70D6 
X-CRM114-Status: GOOD (  14.90  )
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

UmVwbGFjZSBsZWdhY3kgcG1fcG93ZXJfb2ZmIHdpdGgga2VybmVsX2Nhbl9wb3dlcl9vZmYoKSBo
ZWxwZXIgdGhhdAppcyBhd2FyZSBhYm91dCBjaGFpbmVkIHBvd2VyLW9mZiBoYW5kbGVycy4KCkFj
a2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNh
bC5jb20+ClJldmlld2VkLWJ5OiBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEByZXJlLnFt
cW0ucGw+ClNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNv
bGxhYm9yYS5jb20+Ci0tLQogZHJpdmVycy9tZW1vcnkvZW1pZi5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tZW1vcnkvZW1pZi5jIGIvZHJpdmVycy9tZW1vcnkvZW1pZi5jCmluZGV4IDZjMmE0MjFiODZl
My4uZjMwNTY0MzIwOWYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lbW9yeS9lbWlmLmMKKysrIGIv
ZHJpdmVycy9tZW1vcnkvZW1pZi5jCkBAIC02MzAsNyArNjMwLDcgQEAgc3RhdGljIGlycXJldHVy
bl90IGVtaWZfdGhyZWFkZWRfaXNyKGludCBpcnEsIHZvaWQgKmRldl9pZCkKIAkJZGV2X2VtZXJn
KGVtaWYtPmRldiwgIlNEUkFNIHRlbXBlcmF0dXJlIGV4Y2VlZHMgb3BlcmF0aW5nIGxpbWl0Li4g
TmVlZHMgc2h1dCBkb3duISEhXG4iKTsKIAogCQkvKiBJZiB3ZSBoYXZlIFBvd2VyIE9GRiBhYmls
aXR5LCB1c2UgaXQsIGVsc2UgdHJ5IHJlc3RhcnRpbmcgKi8KLQkJaWYgKHBtX3Bvd2VyX29mZikg
eworCQlpZiAoa2VybmVsX2Nhbl9wb3dlcl9vZmYoKSkgewogCQkJa2VybmVsX3Bvd2VyX29mZigp
OwogCQl9IGVsc2UgewogCQkJV0FSTigxLCAiRklYTUU6IE5PIHBtX3Bvd2VyX29mZiEhISB0cnlp
bmcgcmVzdGFydFxuIik7Ci0tIAoyLjM1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
