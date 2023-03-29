Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11104C761AF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 18:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trCqtiQVkCfVaV01jjJPAzG1OZf4nqaNmIMIre1X94s=; b=UFC/D2BRym9Vl2
	s9fX7F16x8NW/yavvFUnLREYZ8Djdxypd3i6pOev61BQkbCg6y5CQQMhZeLZEyysY4iK99tRD2eY7
	43eWJr+oGRdKCGESwNjVORkrOhPKRWnO/zpz7tDetdk57nXfKMwB7ML7yjEXqG3vUUbRlRrsWpoGL
	pOKEaGlR0ywMdP61BuadmEMoD+kTOYbdDlb75XGqqtClHb9Mrv4O70v39cBQXUWZpfp722Zgz21YF
	dGd+PIfjdftedgTjvFOzU/Zobfd2y0oO+lUnI608swRFrS4oVSP5gE0QwudZJY8EMJiuBJTSP907j
	82WzHiJDys+bGuYlBUxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phaKJ-001R7J-0A;
	Wed, 29 Mar 2023 18:15:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phaKE-001R66-2Z;
	Wed, 29 Mar 2023 18:15:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B965B2F4;
	Wed, 29 Mar 2023 11:15:50 -0700 (PDT)
Received: from bogus (unknown [10.57.52.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F9453F6C4;
	Wed, 29 Mar 2023 11:14:57 -0700 (PDT)
Date: Wed, 29 Mar 2023 19:14:23 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Amit Daniel Kachhap <amit.kachhap@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
	sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 04/19] of: Move CPU node related functions to their own
 file
Message-ID: <20230329181423.6e2z2giwkgdvhshn@bogus>
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
 <20230329-dt-cpu-header-cleanups-v1-4-581e2605fe47@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-4-581e2605fe47@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_111510_881991_65678D71 
X-CRM114-Status: GOOD (  11.63  )
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

T24gV2VkLCBNYXIgMjksIDIwMjMgYXQgMTA6NTI6MDFBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gZHJpdmVycy9vZi9iYXNlLmMgaXMgcXVpdGUgbG9uZyBhbmQgd2UndmUgYWNjdW11bGF0
ZWQgYSBudW1iZXIgb2YgQ1BVCj4gbm9kZSBmdW5jdGlvbnMuIExldCdzIG1vdmUgdGhlbSB0byBh
IG5ldyBmaWxlLCBjcHUuYywgYWxvbmcgd2l0aCB0aGUKPiBsb25lIG9mX2NwdV9kZXZpY2Vfbm9k
ZV9nZXQoKSBpbiBvZl9kZXZpY2UuaC4gTW92aW5nIHRoZSBkZWNsYXJhdGlvbiBoYXMKPiBubyBl
ZmZlY3QgeWV0IGFzIG9mLmggaXMgaW5jbHVkZWQgYnkgb2ZfZGV2aWNlLmguIFRoaXMgc2VydmVz
IGFzCj4gcHJlcGFyYXRpb24gdG8gZGlzZW50YW5nbGUgdGhlIGluY2x1ZGVzIGluIG9mX2Rldmlj
ZS5oIGFuZAo+IG9mX3BsYXRmb3JtLmguCj4KCk1ha2VzIHNlbnNlIHRvIGhhdmUgaXRzIG93biBm
aWxlIGZvciBDUFVzLCBJIGFtIHN1cmUgdGhlcmUgd2lsbCBiZSBtb3JlCmFkZGl0aW9ucyDwn5iJ
LgoKRldJVywKClJldmlld2VkLWJ5OiBTdWRlZXAgSG9sbGEgPHN1ZGVlcC5ob2xsYUBhcm0uY29t
PgoKLS0gClJlZ2FyZHMsClN1ZGVlcAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
