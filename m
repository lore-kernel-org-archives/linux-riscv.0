Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D341C43458
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 21:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sJRM8hKf9CGk2/eyHrxgs6i5BWfpW0CTc1oaDo9IjFI=; b=NDwh2nsbiESNOh
	XMxo99/Xb4+11mOrwdPOS+20J0bdIh8LFaocJyJG6I0bi4sGn3259k1UUbRYjYLYBKTj2MNZfT4GY
	uBPq9P8v9NXViVYiKOGQvc/Uy+GVsxGHeR9iDvKAN3Qy9kb4DDuOImn2uIk0bsW6YlWvySgpEOH5q
	J29b6JeLM4TTNCHb4JO8SgTtpkfL8Ix9pqKkUSZAgk6g+MMmO9ffbyzAIM/kTGmmmi7gEhr/4JyCz
	1csqRX4a7p+8q1HTTzqQSQe4rSVe7t3p8WTg3x6lcXiAVekyqDDug1UobxFJgPA3SdKZqKuPS38SE
	ZmBoUuRZVk1cnYNkBydg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdaqV-0000000CmJp-0aNX;
	Sat, 27 Jun 2026 21:45:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdaqS-0000000CmJd-1mlm
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 21:45:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BDF441E52;
	Sat, 27 Jun 2026 21:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85D81F000E9;
	Sat, 27 Jun 2026 21:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782596747;
	bh=hbIDoQbCyu+48Gjf06/wa5e+SiS3vEWCbdZXylWTfw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TWJCahDrcCyZy6Ld4YajnQr3ObTtrwXv54paCbdwkHGVoiL986RIWLDH3z5A2gHA/
	 hw22lHVKi9Rm9qVdXq+5M+PnAUifHeIAulwJoFYi3ccYKngRY4O3kEUs0UOiOrLFgw
	 3oROqrZoW5tCqxyVDYSk8mTkuQRWaHhyb0MUl8vhswZCL5Ls4TObx9KMCM85+7aDzJ
	 PWCt9DWc59aswLUNEbb8McPmIAcaJzrl1ASwByufNk+t78YaGF9Ye6/HSAhsLqtAzq
	 hYlM76Bey3YSGFAaNjftYugXBDGQ3XvHnt1ACu+feeKxeaqQlv3pZN5kbMgH0ya5lG
	 8FK8PrhKO302g==
Date: Sat, 27 Jun 2026 14:45:45 -0700
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [External] [PATCH v2 4/8] riscv_cbqri: Add capacity controller
 probe and allocation device ops
Message-ID: <akBEiXiiSPVnUWXM@x1>
References: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
 <20260624-dfustini-atl-sc-cbqri-dt-v2-4-2f8049fd902b@kernel.org>
 <CAEEQ3w=n6L3ugSL6_LTCQcw0CyUSSxpfEVV0Dp-CpQ_XkLUXPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=n6L3ugSL6_LTCQcw0CyUSSxpfEVV0Dp-CpQ_XkLUXPQ@mail.gmail.com>
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

T24gU2F0LCBKdW4gMjcsIDIwMjYgYXQgMDU6MTk6NDRQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBEcmV3LAo+IAo+IE9uIFRodSwgSnVuIDI1LCAyMDI2IGF0IDk6NDHigK9BTSBEcmV3
IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gQWRkIHN1cHBvcnQg
Zm9yIHRoZSBSSVNDLVYgQ0JRUkkgY2FwYWNpdHkgY29udHJvbGxlci4gQSBwbGF0Zm9ybSBkcml2
ZXIKPiA+IHBhc3NlcyBhIGNicXJpX2NvbnRyb2xsZXJfaW5mbyBkZXNjcmlwdG9yIHRvZ2V0aGVy
IHdpdGggdGhlIGNhY2hlIGxldmVsCj4gPiB0byByaXNjdl9jYnFyaV9yZWdpc3Rlcl9jY19kdCgp
LCB3aGljaCBwcm9iZXMgdGhlIGNvbnRyb2xsZXIgYW5kIGFkZHMgaXQKPiA+IHRvIHRoZSBjb250
cm9sbGVyIGxpc3QuCj4gPgo+ID4gQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LTcK
PiA+IENvLWRldmVsb3BlZC1ieTogQWRyaWVuIFJpY2NpYXJkaSA8YXJpY2NpYXJkaUBiYXlsaWJy
ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBZHJpZW4gUmljY2lhcmRpIDxhcmljY2lhcmRpQGJh
eWxpYnJlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJu
ZWwub3JnPgo+ID4gLS0tCj4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgfCAg
IDMgKwo+ID4gIGRyaXZlcnMvcmVzY3RybC9LY29uZmlnICAgICAgICAgIHwgIDEzICsKPiA+ICBk
cml2ZXJzL3Jlc2N0cmwvTWFrZWZpbGUgICAgICAgICB8ICAgMyArCj4gPiAgZHJpdmVycy9yZXNj
dHJsL2NicXJpX2RldmljZXMuYyAgfCA1MjAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4gPiAgZHJpdmVycy9yZXNjdHJsL2NicXJpX2ludGVybmFsLmggfCAxMDcgKysr
KysrKysKPiA+ICBpbmNsdWRlL2xpbnV4L3Jpc2N2X2NicXJpLmggICAgICB8ICA0NyArKysrCj4g
PiAgNiBmaWxlcyBjaGFuZ2VkLCA2OTMgaW5zZXJ0aW9ucygrKQpbLi5dCj4gPiAraW50IGNicXJp
X2FwcGx5X2NhY2hlX2NvbmZpZyhzdHJ1Y3QgY2JxcmlfY29udHJvbGxlciAqY3RybCwgdTMyIGNs
b3NpZCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGNicXJp
X2NjX2NvbmZpZyAqY2ZnKQo+ID4gK3sKWy4uXQo+ID4gKwo+ID4gKyAgICAgICAvKiBTZXQgY2Fw
YWNpdHkgYmxvY2sgbWFzayAoY2NfYmxvY2tfbWFzaykgKi8KPiA+ICsgICAgICAgY2Jxcmlfc2V0
X2NibShjdHJsLCBjZmctPmNibSk7Cj4gPiArCj4gPiArICAgICAgIC8qIENhcGFjaXR5IGNvbmZp
ZyBsaW1pdCBvcGVyYXRpb24gZm9yIHRoZSBBVCBoYWxmIGltcGxpZWQgYnkgY2ZnLT5hdCAqLwo+
ID4gKyAgICAgICBlcnIgPSBjYnFyaV9jY19hbGxvY19vcChjdHJsLCBDQlFSSV9DQ19BTExPQ19D
VExfT1BfQ09ORklHX0xJTUlULAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
bG9zaWQsIGNmZy0+YXQpOwo+ID4gKyAgICAgICBpZiAoZXJyIDwgMCkKPiA+ICsgICAgICAgICAg
ICAgICBnb3RvIG91dDsKPiAKPiBXaGVuIENVTklUUz0xLCBDT05GSUdfTElNSVQgYWxzbyBjb25z
dW1lcyBjY19jdW5pdHMuIElmIHJlc2N0cmwgZG9lcyBub3QKPiBleHBvc2UgdW5pdCBsaW1pdHMs
IHRoZSBkcml2ZXIgc2hvdWxkIHN0aWxsIHdyaXRlIGNjX2N1bml0cz0wIGJlZm9yZQo+IENPTkZJ
R19MSU1JVCB0byBhdm9pZCBhIGhpZGRlbiBzdGFsZS9pbXBsZW1lbnRhdGlvbi1kZWZpbmVkIHVu
aXQgbGltaXQuCj4gCj4gU2hvdWxkIHdlIGhhbmRsZSBjY19jdW5pdHMgaGVyZT8KClRoYXQgaXMg
YSBnb29kIHRoYXQgY2NfdW5pdHMgc2hvdWxkIGJlIGhhbmRsZWQgZXZlbiB0aG91Z2ggd2UgY2Fu
J3QgeWV0CmV4cG9zZSBpdCB0byByZXNjdHJsLiBJIHdpbGwgY2hhbmdlIHRoZSBjb2RlIHRvIHNl
dCBjY19jdW5pdHMgdG8gMApiZWZvcmUgYSBjb25maWcgbGltaXQgb3BlcmF0aW9uIG9uIGNvbnRy
b2xsZXJzIHRoYXQgc3VwcG9ydCBjYXBhY2l0eQp1bml0cywgc28gYSBzdGFsZSB1bml0IGxpbWl0
IGRvZXMgbm90IGNvbnN0cmFpbiBibG9jay1tYXNrIGFsbG9jYXRpb24uCgpUaGFua3MsCkRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
