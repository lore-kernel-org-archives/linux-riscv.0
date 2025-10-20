Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590C1CCD184
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 02:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=en1UUv1Dj66AUxySs3gZuxOi1yi+YyrRBiDsYdEE3sU=; b=b4Tv8jP+8+KPoT
	GxrS0+6pf9ejgcWgRC4TrOGdeofYsSCYWweA4VwEaGm/uh9nfjWSZiCoL0ojpXf352ev6xeaUTbMx
	iq3wUm7fm3BJXSdi8ZMw163tEzjtRViSojnMQiXCT79KrNqeJHd9WKF6v4xfYSlNtflV1z1xLI+xt
	QPFRo1+LJjTjZ8D6co5aegrqXb+Tqb04KOs5CPvYFMijRauzXUFiqS3VBlXav17Mgrq0p3U+GcKj+
	K7cbmjceCwnwM0ZmKTXeP8f8gBV3o5v1a7QCxSWLzdxoZxzMxcr0Pq/pH8BczZVhsW805vvFzQkR+
	4XWnMis1sMaWwR+Gfehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAfXC-0000000BhSY-0rEM;
	Mon, 20 Oct 2025 02:22:06 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAfX9-0000000BhQw-1PCl
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 02:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760926855;
	bh=bsEnjHoM06iVNxKJujvN5KqKt3gikmfLFHIz5VO2vUY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=q9vXr2nZzwyf1HaUynq2ukl7+FQF4ejUeQm/Ikn7LPDaYw1hxLTEx2YYRTzH71oNo
	 wXfAmaWUOGk6A/FdfymCczElyreI7lGvdPB62BWrm1idhN7j+b//OGgoeCB6kHGFT9
	 LKAKP68ybQMKtuZj1kmF3h/VE9AtxlWLOd/wvawQ=
X-QQ-mid: zesmtpsz4t1760926846tf33a5c17
X-QQ-Originating-IP: 34Afq1jEbXgyQF21XpjRvyPm0b5xHTb1ciTJuNmoGVM=
Received: from = ( [14.123.254.135])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 20 Oct 2025 10:20:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11458405615915761153
EX-QQ-RecipientCnt: 14
Date: Mon, 20 Oct 2025 10:20:44 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] riscv: dts: spacemit: add MusePi Pro board device
 tree
Message-ID: <28DCD6FACACACFCE+aPWcfFSvEsFfw4AD@kernel.org>
References: <20251017-k1-musepi-pro-dts-v3-0-40b05491699f@linux.spacemit.com>
 <20251017-k1-musepi-pro-dts-v3-2-40b05491699f@linux.spacemit.com>
 <20251020015204-GYF1506524@gentoo.org>
 <52A7E982E5B11F53+aPWYHMbImTxJy7pJ@kernel.org>
 <20251020021846-GYG1506524@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251020021846-GYG1506524@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OQhZ3T0tjf0aflwSfNotEEsE5cmD2yfFFm5SnUpoY11nFjNaIhRuFsoY
	zLszG50LpQVw5oNu/r/3opa6eVYYx0V1zGFn96opRDgM5FfEsDWgxFEPZWXCk3+/8mhZu5P
	RCaaJRZ+GEyKLkhw/TW7Wc+VjyxsKN/ONcBo3DL/RWSnFQd/UmejnLsoq4/q4UKNJkI80Xj
	hCyG8rpi3Y13btPU870Z58Q59xOnGf6A2TVfLbKMJvpx/BKXmLhCoySKSU/nhNW6tUyNYZe
	PyEkKveuudMLZ0bSOTExW1llvLMLYa+Ao/Qs8rI5FfaPFSSyyWbW6Nkb6XelNVBZ6+kPvKd
	f3+oiIQT9j2BCO+zCPOGeVL12oPovyxHU/9YcDJf1gqMfG6yadugZxdPHW1zUESRvo08f/X
	lm87ooGlFKtBNp8pvFg0Gooootkg7L4fe79sQ9Kboei8c8Rk5+9Xxe7Se2jPDiJRb8P8I4t
	hw+vbMYrFO+LDToXK+h2HqO5ZF3pqTIkHk9TXvsAN6ZD6NdbFKhy7L6LC0nfZn137MyP4d1
	xN/5LUh3/2o60kVaUMWLXxLk0kcVcqkRBqy9NorWEbzEIkRLizB9b6Zr3eSABgbKwNRPbOr
	RslENobjimSWo3gYYwcSLEBjb++0BzArwyevbHE4G6dCaQyl2wEovPawgbN8ROHXWwozqqo
	JOFSPdg4ANCzYHN6W0xQszuZEmJCQpdXXdTwYwWwJMrrwHjhxYE/uJzIxFeerzdc5Tu9X/G
	3Uqw5bfplLA+eqzOiUHNEGVUH8WUXTPQsuzVZ7TjEb9vxDcxHMd3dRLAQC0X2pVQUgjPrpn
	Q28vbGEoS7Qsm+RNApbhOF5DJuQyhKqMWbASH6rYO6WANkv2ay6b5nWXzoyNyZE7+7QWIG/
	HC00eFzaMdf6+r4jtUG+FAVycdlzMZR7tXna1vGncnblW1rW8GvMvJIn+ez7R6d/04P8+qj
	+YDlPq1LSvLX8xULLu33+vglOa5PErphcCu+C5gAadzpwRQE190EIa3kbo8qvr79QY58+ui
	yPE8ulLwjRn4jtj7hTx2VzlihpWVa5xFGpdmPi40mHHVrTIRQ2n6tAVUJTrR/XusByjtkuc
	KiCgeCcPLORZof4d66Zi64l1O3OzKCsOw==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_192203_934726_A49A1005 
X-CRM114-Status: GOOD (  14.81  )
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgMTA6MTg6NDZBTSArMDgwMCwgWWl4dW4gTGFuIHdyb3Rl
Ogo+IEhpIFRyb3ksCj4gT24gMTA6MDIgTW9uIDIwIE9jdCAgICAgLCBUcm95IE1pdGNoZWxsIHdy
b3RlOgo+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtbXVzZXBp
LXByby5kdHMKPiA+ID4gPiBAQCAtMCwwICsxLDc4IEBACj4gPiA+ID4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBNSVQpCj4gPiA+ID4gKy8qCj4gPiA+ID4gKyAqIENv
cHlyaWdodCAoQykgMjAyNCBZYW5neXUgQ2hlbiA8Y3l5QGN5eXNlbGYubmFtZT4KPiA+ID4gLi4K
PiA+ID4gPiArICogQ29weXJpZ2h0IChDKSAyMDI1IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hl
bGxAbGludXguc3BhY2VtaXQuY29tPgo+ID4gPiB0aGlzIGlzbid0IGEgYmlnIHByb2JsZW0sIGJ1
dCBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byB1c2UgU3BhY2VtaVQKPiA+ID4gQ29ycCdz
IENvcHlyaWdodCwgdG8gcmVmbGVjdCB5b3UncmUgbm90IGRvaW5nIGFzIGluZGl2aWR1YWwgY29u
dHJpYnV0b3IuLgo+ID4gSSB1bmRlcnN0YW5kLiBTaW5jZSBJIG9yaWdpbmFsbHkgd3JvdGUgYW5k
IG5vdyBtYWludGFpbiB0aGlzIERUUywKPiAuLgo+ID4gd291bGQgaXQgc3RpbGwgYmUgYWNjZXB0
YWJsZSB0byBpbmNsdWRlIG15IG93biBjb3B5cmlnaHQgbGluZSBhbG9uZyB3aXRoIFNwYWNlbWlU
4oCZcz8KPiBJIHRoaW5rIHRoaXMgaXMgZ29vZApUaGFua3MgZm9yIHlvdXIgY29uZmlybWF0aW9p
bi4gSSB3aWxsIHVwZGF0ZSB0aGUgY29weXJpZ2h0IGxpbmUuCgogICAgICAgICAgICAgICAgICAg
IC0gVHJveQo+IAo+IC0tIAo+IFlpeHVuIExhbiAoZGxhbikKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
