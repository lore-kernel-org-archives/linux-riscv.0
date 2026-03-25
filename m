Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8CF103A9AC
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 11:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ecXRPw0cEhVObQqVFlVX6gKR1qXRMJI+X+U6gv5HyiQ=; b=4mLne62nAqSy/Q
	TFNUsa9xfOqLYhfu1yEmA9sb/nzBHZGf1xzaO1+bTdrlUCFNaZesvhzROsjcEvIJ/gUPh5Ek4/+sC
	wlKKJ+rMnlJuXy7XsZBTFks7kXkGtXE2iqR+5NSm+4iH1DNtqGCK8cHUL86ALyTFzL9ti/XOgYHVw
	In66a2aVKZvx4mqn2QZ57cMUHtbfOIVJuygSXciE5+WKaRCt6HWGfjv6VKnzsbVQZQHcc9ziBERd3
	L0NqP2ANRbsF0ZTXeWK5TGtlpHL5Xk4YoUdcldyUBTzr/YDlXwWTzMZPX5a6TPI56NeIxX8aM/xEJ
	dh9r/e+HJuaQKdezZ1sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MOh-00000003FsZ-35bg;
	Wed, 25 Mar 2026 11:27:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MOe-00000003FrZ-22Vk;
	Wed, 25 Mar 2026 11:27:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C80143B22;
	Wed, 25 Mar 2026 11:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE08C4CEF7;
	Wed, 25 Mar 2026 11:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774438055;
	bh=aD1JvDIfq0GE0tWPZnEpoteUQl9LKVoUeLp+4KiP+wI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gek2NIF+50ZmqIFXo3Abwewv4G7+nnsW9VSMv0MJSvCqE0QYQCxE0tBmFgJRBRECp
	 Gcc7YZXcn6ZVjnnOFNPWxF9MXqXyhFMV2/rtAU9seEjQdh1t6qZiZ0is2C0JPXPhBn
	 2cYzSNQ+wv0QUFUGa/aTz2gJSJZJA4ed1dMrx9K6NARl0UOWe3qrF1pRaeGcjSPDkw
	 D4ktPFXCkzERe/9x5RNai4KmjZT+sqqQPICvXI7s+TI3/NID3cRU0cs8f4vrDqo6yN
	 THmNV9Nu9oWReHHUKBYPcvAflG6BahJmiGo3mGEaRVmOB4tsJAqcsgQbvaJ4aWQ8Xg
	 08DYkx/Hy2gVA==
Message-ID: <3ec53a2e-a8e1-43d3-abdb-c00433e7675c@kernel.org>
Date: Wed, 25 Mar 2026 12:27:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] arm: configs: remove obsolete assignments to
 SND_SOC_ROCKCHIP
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Gonzalo <alexandre.gonzalo@arm.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-parisc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Mikko Rapeli <mikko.rapeli@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Heiko Stuebner <heiko@sntech.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anna Schumaker <anna.schumaker@oracle.com>, soc@lists.linux.dev
References: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org>
 <20260317-arm_defconf_cleanup-v1-5-8eecb7fdd24d@kernel.org>
 <febd0f7e-59f3-4ba4-8706-53c7353e3fe5@kernel.org>
From: "Vincent Mailhol (Arm)" <mailhol@kernel.org>
Content-Language: en-US
In-Reply-To: <febd0f7e-59f3-4ba4-8706-53c7353e3fe5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_042736_569704_78EEA824 
X-CRM114-Status: GOOD (  17.22  )
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

K0NDOiBzb2NAbGlzdHMubGludXguZGV2CgpPbiAzLzE3LzI2IDEyOjI4LCBLcnp5c3p0b2YgS296
bG93c2tpIHdyb3RlOgo+IE9uIDE3LzAzLzIwMjYgMTA6MTMsIFZpbmNlbnQgTWFpbGhvbCAoQXJt
KSB3cm90ZToKPj4gQ09ORklHX1NORF9TT0NfUk9DS0NISVAgd2FzIHJlbW92ZWQgaW4gY29tbWl0
IGNhZTNjYzQzNWRiNSAoIkFTb0M6Cj4+IHJvY2tjaGlwOiBTdGFuZGFyZGl6ZSBBU29DIG1lbnUi
KS4gSG93ZXZlciBpdCBpcyBzdGlsbCByZWZlcmVuY2VkIGluCj4+IHNvbWUgZGVmY29uZmlncy4K
Pj4KPj4gUmVtb3ZlIGFueSByZWZlcmVuY2VzIHRvIENPTkZJR19TTkRfU09DX1JPQ0tDSElQLgo+
Pgo+PiBGWUksIHRoZSBzdXBwcmVzc2lvbnMgd2VyZSBkb25lIHVzaW5nOgo+Pgo+PiAgIGdpdCBs
cy1maWxlcyAteiAnYXJjaC8qL2NvbmZpZ3MvKmRlZmNvbmZpZycgfFwKPj4gICAgIHhhcmdzIC0w
IHNlZCAtaSAtRSAnL15DT05GSUdfU05EX1NPQ19ST0NLQ0hJUC9kJwo+Pgo+PiBGaXhlczogY2Fl
M2NjNDM1ZGI1ICgiQVNvQzogcm9ja2NoaXA6IFN0YW5kYXJkaXplIEFTb0MgbWVudSIpCj4+IFNp
Z25lZC1vZmYtYnk6IFZpbmNlbnQgTWFpbGhvbCAoQXJtKSA8bWFpbGhvbEBrZXJuZWwub3JnPgo+
PiAtLS0KPj4gIGFyY2gvYXJtL2NvbmZpZ3MvbXVsdGlfdjdfZGVmY29uZmlnIHwgMSAtCj4+ICBh
cmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnICAgICAgICB8IDEgLQo+IAo+IFRoaXMgd2FzIGFs
cmVhZHkgcG9zdGVkOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDMxMy1yb2Nr
Y2hpcC1zbmQtY2xlYW51cC12MS0xLTc3ZDlhOTUzZmQxYkBzY2hud2FsdGVyLmV1Lwo+IGJ1dCBq
dXN0IGxpa2UgdGhhdCBwYXRjaCB5b3UgZGlkIG5vdCBzZW5kIGl0IHRvIHNvY0AgKGlmIEkgYW0g
bm90Cj4gbWlzdGFrZW4uLi4gQ0MgbGlzdCBpcyBlbm9ybW91cykuCgpPSywgSSB3aWxsIGFkZCBz
b2NAbGlzdHMubGludXguZGV2IHRvIHRoZSByZWNpcGllbnQgbGlzdCBpbiB2Mi4KCj4gSSB0aGlu
ayB5b3UgYXJlIG1peGluZyBoZXJlIGluZGVwZW5kZW50IHdvcmtzLCBsaWtlIGtjb25maWcgYW5k
IHBlci1hcmNoCj4gZGVmY29uZmlnIGNoYW5nZXMuIFBsZWFzZSBzcGxpdCB0aGVzZSBwZXIgYXJj
aCBkZWZjb25maWcgbWFpbnRhaW5lcnMgLQo+IHBhdGNoZXMgYW5kIHBhdGNoc2V0LCBzbyB5b3Ug
d29uJ3QgYmUgQ2MtaW5nIDUwIGFkZHJlc3Nlcy4KClRoZSBjb25maWcgaXNzdWVzIHdoaWNoIEkg
YW0gYWRkcmVzc2luZyBhcmUgdHJhbnN2ZXJzYWwgcHJvYmxlbXMgc28gSQp3YXMgZXhwZWN0aW5n
IHRvIGp1c3QgZ2V0IHRoZSBBY2tlZC1ieSBmcm9tIHRoZSBvdGhlciBhcmNoaXRlY3R1cmUgYW5k
CmhhdmUgYWxsIHRoaXMgZ28gdGhyb3VnaCB0aGUgc2FtZSB0cmVlLgoKQXMgSSBleHBsYWluZWQg
aW4gbXkgY292ZXIgbGV0dGVyLCB0aGlzIGlzIG5vdCBkb2luZyBhbnkgZnVuY3Rpb25hbCBjaGFu
Z2VzLgoKQnV0IGlmIHRoaXMgaXMgbm90IGFjY2VwdGFibGUsIEkgd2lsbCBqdXN0IHJlZHVjZSB0
aGUgc2NvcGUgdG8gYXJtL2FybTY0CnRoZW4uIERvaW5nIGEgcGVyIGFyY2ggc3BsaXQgYXMgeW91
IHN1Z2dlc3RlZCB3b3VsZCBiZSB0b28gbXVjaCBvdmVyaGVhZAoobW9yZSB0aGFuIHdoYXQgScKg
YW0gcmVhZHkgdG8gaW52ZXN0IG9uIHRoaXMgY2xlYW4tdXApLgoKCllvdXJzIHNpbmNlcmVseSwK
VmluY2VudCBNYWlsaG9sCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
