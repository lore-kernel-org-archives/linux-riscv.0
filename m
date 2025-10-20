Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE4DCCD184
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 02:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntKCV+OzVAIWjvraWoSOksyI2XbHGzU01wp5Q0nzrQc=; b=TmQtb1HSw6mJ2Z
	gNQ//v5NPcIR9nzNNvEDWiPDR1AhBRkRNeWRcww9lYmgIae6PxPwRXDh9urNWsG3aGcMun4X/bZgF
	JQb9pqCdRyzg8LK1L1yNXZDSrM79Aiqw8Qzs1yKJoeywKSU9IEgLFniFGZJAovZPDmn/zp/mFrwxY
	LTCIsAvCfHD5T0JKnh5/HssiBkjKR5tsvAbk/qN3j06QeH3uiDyDrBvggy8dj3kRWCeUXplpJf3Cp
	DU5S93KdDDtlzse5Hlkah6h0Y/hi5O97YQdw7uotoXaA0nqBgEoO8DryZ9ghKZGBx+cCkvgsqWsaR
	u6YQCKtmXN8/c0QkPgOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAfFG-0000000BfVu-2xiY;
	Mon, 20 Oct 2025 02:03:34 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAfFD-0000000BfV9-3nn0
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 02:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760925737;
	bh=tDrZLdBW9vlAha4ObE832pRI4SlMcSGwYcFakX4Jvgg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=FmMMbrKmmKBkFkvp7wnkIfcXn3ZjXoyyj4ETMl6gk4cDjb/k3k69lhncQ30hJP32S
	 NpwHlQaRpKENFDF0MX4CGqE/C/+uKoO7B+uCVhjB36RTsMfnH9EmQwozFEDNFFqLIt
	 SzPCttSEwYXxHChMbF1fImYYhHmLpJ3++3NF/MO4=
X-QQ-mid: esmtpgz14t1760925726tab82be72
X-QQ-Originating-IP: JztUbLLiixmarjYZDA3tn8Rw/nWdOn2trEbtlH9vQgE=
Received: from = ( [14.123.254.135])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 20 Oct 2025 10:02:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14701641022016592372
EX-QQ-RecipientCnt: 14
Date: Mon, 20 Oct 2025 10:02:04 +0800
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
Message-ID: <52A7E982E5B11F53+aPWYHMbImTxJy7pJ@kernel.org>
References: <20251017-k1-musepi-pro-dts-v3-0-40b05491699f@linux.spacemit.com>
 <20251017-k1-musepi-pro-dts-v3-2-40b05491699f@linux.spacemit.com>
 <20251020015204-GYF1506524@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251020015204-GYF1506524@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MWLCkAjnYYm52MwQO1MzuikG0zi5dnWMx7NRP0Pj21LqkNMMOi3FDnk2
	p03ikV/jo/UoZ1V42T7z0ld9ADHS8ZUjbbaHf6NYizd8XCD6UY0/PZHijUccCo8eOHXAWhe
	gSwxYHoNVjSUf32YZ7yHHuf1z0erKOXPn+8zS9A18hS7k62uj1nqZEXoPeZKCvsgAgr9V19
	84i5+Ra+mHUCNGzV44MqJs+uFwtUx2ExRn9fwaQZvtE+4iSP8nGdRF7r71T+D/xH0iZx6nn
	SbGQLDpgtQcZ5N5bnKvxZGE/atcXZFpZguGPjBK549UCibM9RnK59G9FO1KDg+yla3StXsS
	+Px4+L7c25rPnGWve7z2/mzXPfW1ushiR5MEWLFlfzSPxXa0i0US3Z4gFlyABGY/pOHOvah
	A4Q/WFhIKcDLqS9YflvK41lZM31Bgao2Lc0/4EG+chbLCrh2+w5cO6COgJ/WK/KvJWIaHuO
	7vfwun9VYWF0V2wspuX+m9DnQkx6rSb3V8YXRAZTkjtUuJH/RocnC6HTQScWo69kKM6jGeJ
	tEpNMM3IAyQE6+gSOWtOvxtzusNXQlewD/3LNhLAPu8stdPXmWUXhjJmLybj4KXhwwna6nM
	N70HiLsvYM3doYWvmHiQt3LYfOb4rKMRF1HBtm31BvQBmnmFlrlJPWQ7hrnOEgD/CEiAufH
	A3jYgtQOiUf3rkyudjyX++tfPIEwaTZfMNtJDAU/zhxlnyydK/WxKFjqMN+gPOfc7Mu3YCI
	P7RAUnt0MOnMdebfgthvBhXsWKjm047QmxIL9ToJmOMNkn2OS7xaro0Zy/FyY/nkxMDvuHa
	uo1qdMNnH1EIaq79q2K0ghlrBBqHIjtHmQPVMNu1GKjmZHKtQoehu9MsDpGbqoM3JuaLPCr
	tEq0oMCdlMpj6u+s7eM1ah1tEFM3ZgFJnhW9JTohGV+Zaf0+g9ScHjErim3CMwKC8JDqiqa
	yK+Ti/5pTNmimRWcNBVRz7wvZOh0leuDr4DWP1JeL0D0sUIDdsf98RiwsjAP+9YNMcsfjTY
	W/YAHInkzJvLpYq5BitcGOnBJEv2p3OCsjsbu8oxRUKBX2mv9ei9JvKqEPMhhtXUngHta0K
	C7tUiDW4pUA
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_190332_259296_933D5F27 
X-CRM114-Status: GOOD (  22.36  )
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

SGkgWWl4dW4sIHRoYW5rcyBmb3IgeW91ciByZXZpZXcuCgpPbiBNb24sIE9jdCAyMCwgMjAyNSBh
dCAwOTo1MjowNEFNICswODAwLCBZaXh1biBMYW4gd3JvdGU6Cj4gSGkgVHJveSwKPiAKPiBPbiAx
Mzo1MiBGcmkgMTcgT2N0ICAgICAsIFRyb3kgTWl0Y2hlbGwgd3JvdGU6Cj4gPiBBZGQgaW5pdGlh
bCBkZXZpY2UgdHJlZSBzdXBwb3J0IGZvciB0aGUgTXVzZVBpIFBybyBib2FyZCBbMV0uCj4gPiBU
aGUgYm9hcmQgaXMgdXNpbmcgdGhlIFNwYWNlbWlUIEsxL00xIFNvQy4KPiA+IAo+ID4gVGhlIGRl
dmljZSB0cmVlIGlzIGFkYXB0ZWQgZnJvbSB0aGUgU3BhY2VtaVQgdmVuZG9yIHRyZWUgWzJdLgo+
ID4gCj4gPiBIZXJlJ3MgYSByZWZpbmVkIGxpc3Qgb2YgaXRzIGNvcmUgZmVhdHVyZXMgZm9yIGNv
bnNpZGVyYXRpb246Cj4gPiAgIC0gU29DOiBTcGFjZW1pVCBNMS9LMSwgOC1jb3JlIDY0LWJpdCBS
SVNDLVYgd2l0aCAyLjAgVE9QUyBBSSBwb3dlci4KPiA+ICAgICAgICAgIFRoaXMgc3VnZ2VzdHMg
cG90ZW50aWFsIGZvciBsaWdodCBBSS9NTCB3b3JrbG9hZHMgb24tZGV2aWNlLgo+ID4gICAtIE1l
bW9yeTogTFBERFI0WCBAIDI0MDBNVC9zLCBhdmFpbGFibGUgaW4gOEdCICYgMTZHQiBvcHRpb25z
Lgo+ID4gICAgICAgICAgICAgU3VmZmljaWVudCBmb3IgdmFyaW91cyB3b3JrbG9hZHMuCj4gPiAg
IC0gU3RvcmFnZTogT25ib2FyZCBlTU1DIDUuMSAoNjRHQi8xMjhHQiBvcHRpb25zKS4gTS4yIE0t
S2V5IGZvciBOVk1lCj4gPiAgICAgICAgICAgICAgU1NEICgyMjMwIHNpemUpLCBhbmQgYSBtaWNy
b1NEIHNsb3QgKFVIUy1JSSkgZm9yIGV4cGFuc2lvbi4KPiA+ICAgICAgICAgICAgICBHb29kIHZh
cmlldHkgZm9yIGJvb3QgYW5kIGRhdGEuCj4gPiAgIC0gRGlzcGxheTogSERNSSAxLjQgKDEwODBQ
QDYwSHopIGFuZCAyLWxhbmUgTUlQSSBEU0kgRlBDICgxMDgwUEA2MEh6KS4KPiA+ICAgICAgICAg
ICAgICBTdGFuZGFyZCBkaXNwbGF5IG9wdGlvbnMuCj4gPiAgIC0gQ29ubmVjdGl2aXR5OiBPbmJv
YXJkIFdpLUZpIDYgJiBCbHVldG9vdGggNS4yLiBBIHNpbmdsZSBHaWdhYml0Cj4gPiAgICAgICAg
ICAgICAgICAgICBFdGhlcm5ldCBwb3J0IChSSjQ1KS4gR2l2ZW4gdGhlIHN0YXRlZCBtYXJrZXRz
LAo+ID4gICAgICAgICAgICAgICAgICAgdGhpcyBzaG91bGQgY292ZXIgYmFzaWMgbmV0d29ya2lu
Zy4KPiA+ICAgLSBVU0I6IDR4IFVTQiAzLjAgVHlwZS1BIChob3N0KSBhbmQgMXggVVNCIDIuMCBU
eXBlLUMgKGRldmljZS9PVEcpLgo+ID4gICAgICAgICAgRGVjZW50IGhvc3QgY2FwYWJpbGl0aWVz
Lgo+ID4gICAtIEV4cGFuc2lvbjogRnVsbC1zaXplIG1pbmlQQ0llIHNsb3QgZm9yIGFzc29ydGVk
IG1vZHVsZXMKPiA+ICAgICAgICAgICAgICAgICg0Ry81Rywgd2lyZWxlc3MgZXRjLikuIEEgc2Vj
b25kIE0uMiBNLUtleSAoMjIzMCkgZm9yIG1vcmUKPiA+ICAgICAgICAgICAgICAgIGdlbmVyYWwg
UENJZSBkZXZpY2VzIChTU0QsIFBDSWUtdG8tU0FUQSwgY29tbSBib2FyZHMpLgo+ID4gICAtIEdQ
SU86IFN0YW5kYXJkIDQwLXBpbiBHUElPIGludGVyZmFjZSwgYXMgZXhwZWN0ZWQgZm9yIGFuIFNC
Qy4KPiA+ICAgLSBNSVBJOiBJbmNsdWRlcyAxeCA0LWxhbmUgTUlQSSBDU0kgRlBDIGFuZCAyeCBN
SVBJIERTSSBGUEMgaW50ZXJmYWNlcwo+ID4gICAgICAgICAgIGZvciBjYW1lcmFzIGFuZCBkaXNw
bGF5cy4KPiA+ICAgLSBDbG9jazogT25ib2FyZCBSVEMgd2l0aCBiYXR0ZXJ5IHN1cHBvcnQuCj4g
SSB0aGluayB5b3UndmUgYWxyZWFkeSBnYXZlIGFuIG92ZXJhbGwgZGVzY3JpcHRpb24gZm9yIE11
c2VQaSBib2FyZCBpbgo+IHBhdGNoIFsxLzJdIHdoaWNoIGlzIHN1ZmZpY2llbnQsIGluIHRoaXMg
cGF0Y2ggeW91IGNvdWxkIGJldHRlciBmb2N1cyBvbgo+IHdoYXQgaXQgYWN0dWFsbHkgZG9uZSBo
ZXJlPyBlbmFibGluZyBtbWMsIGV0aGVybmV0LCBsZWQsIHBkbWEsIHVhcnQuLgpZZXMsIEknbGwg
cmVtb3ZlIHRoZXNlLgoKPiAKPiA+IAo+ID4gVGhpcyBtaW5pbWFsIGRldmljZSB0cmVlIGVuYWJs
ZXMgYm9vdGluZyBpbnRvIGEgc2VyaWFsIGNvbnNvbGUgd2l0aCBVQVJUCj4gPiBvdXRwdXQgYW5k
IGEgYmxpbmtpbmcgTEVELgo+ID4gCj4gPiBMaW5rOiBodHRwczovL2RldmVsb3Blci5zcGFjZW1p
dC5jb20vZG9jdW1lbnRhdGlvbj90b2tlbj1ZSnRkd252dlZpUFZjbWtvUERwY3Z3ZlZucmgmdHlw
ZT1wZGYgWzFdCj4gPiBMaW5rOiBodHRwczovL2dpdGVlLmNvbS9iaWFuYnUtbGludXgvbGludXgt
Ni42L2Jsb2IvazEtYmwtdjIuMi55L2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEteF9N
VVNFLVBpLVByby5kdHMgWzJdCj4gPiAKPiBkaXR0bwo+ID4gU2lnbmVkLW9mZi1ieTogVHJveSBN
aXRjaGVsbCA8dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+ClsuLi5dCj4gPiArKysg
Yi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLW11c2VwaS1wcm8uZHRzCj4gPiBAQCAt
MCwwICsxLDc4IEBACj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9S
IE1JVCkKPiA+ICsvKgo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyNCBZYW5neXUgQ2hlbiA8Y3l5
QGN5eXNlbGYubmFtZT4KPiAuLgo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyNSBUcm95IE1pdGNo
ZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4KPiB0aGlzIGlzbid0IGEgYmln
IHByb2JsZW0sIGJ1dCBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byB1c2UgU3BhY2VtaVQK
PiBDb3JwJ3MgQ29weXJpZ2h0LCB0byByZWZsZWN0IHlvdSdyZSBub3QgZG9pbmcgYXMgaW5kaXZp
ZHVhbCBjb250cmlidXRvci4uCkkgdW5kZXJzdGFuZC4gU2luY2UgSSBvcmlnaW5hbGx5IHdyb3Rl
IGFuZCBub3cgbWFpbnRhaW4gdGhpcyBEVFMsCndvdWxkIGl0IHN0aWxsIGJlIGFjY2VwdGFibGUg
dG8gaW5jbHVkZSBteSBvd24gY29weXJpZ2h0IGxpbmUgYWxvbmcgd2l0aCBTcGFjZW1pVOKAmXM/
Ck9yIGNvbXBhbnktb25seT8KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0gVHJveQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
