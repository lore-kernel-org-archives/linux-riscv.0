Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADCE106B522
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 12:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQWG3CnS/VihY+o5vBgNQtBrB2csmS/a4KOun8Z6Opg=; b=sFYY/bg2tx+e1q
	VwQiZPHcelYN5h5kB6jS1iHiSds1fgjbSiJVsv6XiuRvyyIgnPevcf5NcSexoqwUH4F4eheWb40UL
	JhKaVAAC8f4vQ8YYPf6kjyVWINuM8fWg00DqrBmsqKXS/PJSNOsMKYEVUvKktaksQtxJo+D5xZ9GS
	Ax00EDm92/UqcusXjp/rVhQKirLTzKJgEEUpvk1ccY0YyswNygOtNmNyAACBzM6k/TDsztWqwK04l
	2scXZJHrb96HMCL/XTWMvQVGfdsgWWVHGEja8v1WcfAgwEY5SmGlDNncsCJbGseEiySNAwocATnJm
	NgWvxPdL1Z5aheyXFOBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NZE-00000003OYX-1Unv;
	Wed, 25 Mar 2026 12:42:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NZD-00000003OYN-219q;
	Wed, 25 Mar 2026 12:42:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 986A060121;
	Wed, 25 Mar 2026 12:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E418FC4CEF7;
	Wed, 25 Mar 2026 12:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774442554;
	bh=w7OzwCqt8SyLebOkd0ga04DG/iV8dPT4IUIMUesHAhk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kqEhZy0KWeBErR981dacfREdOZWMmz6qOIxI4/aT7/aolwxv4kqXgQoqF3yfj/NNW
	 qgGHWlfdf7fya7BTe6mmtyKuBxTwb8JRvk8QJK4RagZwcDRCTeDpS43812XcQjA2fE
	 xkWy5aAn2w1MBXjPWyj+48XlvnssAxxrCjCI8ZK1sME1Sq+CNkRXJf+NW4CwA+iLF0
	 4/e+TmLS5G9HIh/K2I27R5Ahbm5eBBLcd4KNdpwhs3CPjw669K1nE6SpkZrWp7/j1C
	 bIjJAauviZ79LmzBEAAEmH1UTErdMS3unexGlTUMbIgrVB90vexkMKwZ7Jc/uAM6lJ
	 pSCoDpRuXkrQQ==
Message-ID: <85818080-c267-4c80-851e-daf050de97a0@kernel.org>
Date: Wed, 25 Mar 2026 13:42:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] arm: configs: remove obsolete assignments to
 SND_SOC_ROCKCHIP
To: "Vincent Mailhol (Arm)" <mailhol@kernel.org>
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
 Anna Schumaker <anna.schumaker@oracle.com>
References: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org>
 <20260317-arm_defconf_cleanup-v1-5-8eecb7fdd24d@kernel.org>
 <febd0f7e-59f3-4ba4-8706-53c7353e3fe5@kernel.org>
 <3ec53a2e-a8e1-43d3-abdb-c00433e7675c@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <3ec53a2e-a8e1-43d3-abdb-c00433e7675c@kernel.org>
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

T24gMjUvMDMvMjAyNiAxMjoyNywgVmluY2VudCBNYWlsaG9sIChBcm0pIHdyb3RlOgo+ICtDQzog
c29jQGxpc3RzLmxpbnV4LmRldgoKUGxlYXNlIGRvbid0LiBUaGlzIGlzIG5vdCBhIHBhdGNoIHJl
dmlldyBtYWlsaW5nIGxpc3QuCgo+IAo+IE9uIDMvMTcvMjYgMTI6MjgsIEtyenlzenRvZiBLb3ps
b3dza2kgd3JvdGU6Cj4+IE9uIDE3LzAzLzIwMjYgMTA6MTMsIFZpbmNlbnQgTWFpbGhvbCAoQXJt
KSB3cm90ZToKPj4+IENPTkZJR19TTkRfU09DX1JPQ0tDSElQIHdhcyByZW1vdmVkIGluIGNvbW1p
dCBjYWUzY2M0MzVkYjUgKCJBU29DOgo+Pj4gcm9ja2NoaXA6IFN0YW5kYXJkaXplIEFTb0MgbWVu
dSIpLiBIb3dldmVyIGl0IGlzIHN0aWxsIHJlZmVyZW5jZWQgaW4KPj4+IHNvbWUgZGVmY29uZmln
cy4KPj4+Cj4+PiBSZW1vdmUgYW55IHJlZmVyZW5jZXMgdG8gQ09ORklHX1NORF9TT0NfUk9DS0NI
SVAuCj4+Pgo+Pj4gRllJLCB0aGUgc3VwcHJlc3Npb25zIHdlcmUgZG9uZSB1c2luZzoKPj4+Cj4+
PiAgIGdpdCBscy1maWxlcyAteiAnYXJjaC8qL2NvbmZpZ3MvKmRlZmNvbmZpZycgfFwKPj4+ICAg
ICB4YXJncyAtMCBzZWQgLWkgLUUgJy9eQ09ORklHX1NORF9TT0NfUk9DS0NISVAvZCcKPj4+Cj4+
PiBGaXhlczogY2FlM2NjNDM1ZGI1ICgiQVNvQzogcm9ja2NoaXA6IFN0YW5kYXJkaXplIEFTb0Mg
bWVudSIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IE1haWxob2wgKEFybSkgPG1haWxob2xA
a2VybmVsLm9yZz4KPj4+IC0tLQo+Pj4gIGFyY2gvYXJtL2NvbmZpZ3MvbXVsdGlfdjdfZGVmY29u
ZmlnIHwgMSAtCj4+PiAgYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZyAgICAgICAgfCAxIC0K
Pj4KPj4gVGhpcyB3YXMgYWxyZWFkeSBwb3N0ZWQ6Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDI2MDMxMy1yb2NrY2hpcC1zbmQtY2xlYW51cC12MS0xLTc3ZDlhOTUzZmQxYkBzY2hu
d2FsdGVyLmV1Lwo+PiBidXQganVzdCBsaWtlIHRoYXQgcGF0Y2ggeW91IGRpZCBub3Qgc2VuZCBp
dCB0byBzb2NAIChpZiBJIGFtIG5vdAo+PiBtaXN0YWtlbi4uLiBDQyBsaXN0IGlzIGVub3Jtb3Vz
KS4KPiAKPiBPSywgSSB3aWxsIGFkZCBzb2NAbGlzdHMubGludXguZGV2IHRvIHRoZSByZWNpcGll
bnQgbGlzdCBpbiB2Mi4KCkNvdWxkIGJlLCBidXQgaXNuJ3QgdGhpcyBzcGVjaWZpYyB0byBnaXZl
biBTb0M/IGRlZmNvbmZpZ3MgZ28gdmlhIFNvQwpwbGF0Zm9ybSB0cmVlcyAobWFpbnRhaW5lciBz
b2MgcHJvZmlsZSkuCgo+IAo+PiBJIHRoaW5rIHlvdSBhcmUgbWl4aW5nIGhlcmUgaW5kZXBlbmRl
bnQgd29ya3MsIGxpa2Uga2NvbmZpZyBhbmQgcGVyLWFyY2gKPj4gZGVmY29uZmlnIGNoYW5nZXMu
IFBsZWFzZSBzcGxpdCB0aGVzZSBwZXIgYXJjaCBkZWZjb25maWcgbWFpbnRhaW5lcnMgLQo+PiBw
YXRjaGVzIGFuZCBwYXRjaHNldCwgc28geW91IHdvbid0IGJlIENjLWluZyA1MCBhZGRyZXNzZXMu
Cj4gCj4gVGhlIGNvbmZpZyBpc3N1ZXMgd2hpY2ggSSBhbSBhZGRyZXNzaW5nIGFyZSB0cmFuc3Zl
cnNhbCBwcm9ibGVtcyBzbyBJCj4gd2FzIGV4cGVjdGluZyB0byBqdXN0IGdldCB0aGUgQWNrZWQt
YnkgZnJvbSB0aGUgb3RoZXIgYXJjaGl0ZWN0dXJlIGFuZAoKV2VsbCwgc3VyZSwgSU1PIHRoaXMg
b25seSBzdGFsbHMgdGhlIHBhdGNoc2V0IGJ1dCBmaW5lIHdpdGggbWUuCgo+IGhhdmUgYWxsIHRo
aXMgZ28gdGhyb3VnaCB0aGUgc2FtZSB0cmVlLgoKQnV0IHdoaWNoIHRyZWU/CgoKPiAKPiBBcyBJ
IGV4cGxhaW5lZCBpbiBteSBjb3ZlciBsZXR0ZXIsIHRoaXMgaXMgbm90IGRvaW5nIGFueSBmdW5j
dGlvbmFsIGNoYW5nZXMuCj4gCj4gQnV0IGlmIHRoaXMgaXMgbm90IGFjY2VwdGFibGUsIEkgd2ls
bCBqdXN0IHJlZHVjZSB0aGUgc2NvcGUgdG8gYXJtL2FybTY0Cj4gdGhlbi4gRG9pbmcgYSBwZXIg
YXJjaCBzcGxpdCBhcyB5b3Ugc3VnZ2VzdGVkIHdvdWxkIGJlIHRvbyBtdWNoIG92ZXJoZWFkCj4g
KG1vcmUgdGhhbiB3aGF0IEnCoGFtIHJlYWR5IHRvIGludmVzdCBvbiB0aGlzIGNsZWFuLXVwKS4K
ClRoZSBmaXJzdCB0aGluZyB5b3VyIGNvdmVyIGxldHRlciBzaG91bGQgZXhwbGFpbiBpcyB0aGUK
bWVyZ2luZy9kZXBlbmRlbmNpZXMgb3Igb3RoZXIgZXhwZWN0YXRpb25zIHlvdSBoYXZlLiBUaGF0
J3MgdGhlIG1vc3QKaW1wb3J0YW50IHRoaW5nIHdoZW4gbWFpbnRhaW5lcnMgZ2l2ZSB5b3VyIHBh
dGNoc2V0IDE1IHNlY29uZHMgaW4gdGhlaXIKbWFpbGJveC4gT3Igd2hlbiB5b3Ugd2FudCB0byBv
cHRpbWl6ZSBtYWludGFpbmVycyBwcm9jZXNzLCBtYWtpbmcgYWxzbwp5b3VyIHBhdGNoc2V0IGVh
c2llciB0byBnZXQgaW4uCgpUaGVyZSBpcyBhIGxvdCBvZiB0ZXh0IGluIHRoZSBjb3ZlciBsZXR0
ZXIgYnV0IG5vdGhpbmcgZXhwbGFpbmluZyB3aGF0CnlvdSB3cm90ZSBoZXJlLgoKQmVzdCByZWdh
cmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
