Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECBDCED274
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 08:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QdIgvFUTWapQjbfhzrMRBtJC84jYl4nDo77G9ENCq1k=; b=Do4trkNAEAPyMM
	jK7VvGtZM+oiSGFKKpNOzzI4vNrAUc03mJ5ENPSjgKGTe3LLQfBvQyWYiTfvfMnZVsBJcChAiT7RJ
	GoOAyk4nDgFrU0rIa5vwGVPfxP9m/Cb2PbzJeGO8BVj+v4NDaMMhWrBXNRSyotU8RhBBz79n52mY0
	EN48jLzH/Hw5CTjeWLzBu7WuaeJrHa+WG4JHi4C7x/QHZUI2mE/UJaaJJFvWDDjnfQArMqisBjHJY
	cnlAY6xA2nQmfRBX74JEFFLasainct7WHBqXi2/nJgijYqxxNgDIlKkCuWCx2H4Z90GatJBl2g6BP
	BgTuXdMNU5oZgpC4hPmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5mH-0000000567C-19xj;
	Tue, 08 Oct 2024 08:41:09 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5da-000000053Oa-1ogq
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 08:32:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=L6hn56+wY3Cptqr18fuXGg+zcOl3Ut65We9gsf4eF8w=;
	b=EfW0N1xJyCUF79glByvifp7jswsQSoJEFybOSsDOy9KVeOAsHSp2EAUBMYHrgk
	KN++s2mCF296fEOgNadLcGWB2bz6LN+fcixWHBp8wNBWFYKYwHvZAOGwlMPKPl5b
	xSysI5nUcDzWBHc4nA/Y1UpYNohA4JYmwHF211cWRcWbg=
Received: from [192.168.31.242] (unknown [27.18.107.81])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBXf4Tn7QRnmf5rBg--.6114S2;
	Tue, 08 Oct 2024 16:31:38 +0800 (CST)
Message-ID: <6a1a3e38-0c6b-4d79-a101-b3292a2ab3be@163.com>
Date: Tue, 8 Oct 2024 16:31:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add initial support for Canaan Kendryte K230
 pinctrl
To: Conor Dooley <conor@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20240926-k230-pinctrl-v2-0-a9a36fba4b34@163.com>
 <CACRpkdYk9aCp7mdWJJTT-1cwNZC4RN_eB6v5rducDY5MGJ_dbg@mail.gmail.com>
 <20241001-stratus-overplay-96266c33ca89@spud>
Content-Language: en-US
From: Ze Huang <18771902331@163.com>
In-Reply-To: <20241001-stratus-overplay-96266c33ca89@spud>
X-CM-TRANSID: _____wBXf4Tn7QRnmf5rBg--.6114S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF1DAF1kJr4UKFWrZF15XFb_yoW8tr43pF
	93KFs0ka1UJw4ayrZ29anFyFn0v3ZYyr90gFs8KryUXF9I9a42qFWxKr4jkF9xCr4Fkr4j
	yrs0qw1xJanrXFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UOzV8UUUUU=
X-Originating-IP: [27.18.107.81]
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiJxlyomcEoY7FgAACsl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_013210_970975_CE45C7F2 
X-CRM114-Status: GOOD (  18.16  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTAvMS8yNCA4OjMyIFBNLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVHVlLCBPY3QgMDEs
IDIwMjQgYXQgMDI6Mjc6MjVQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3cm90ZToKPj4gT24gVGh1
LCBTZXAgMjYsIDIwMjQgYXQgNTo1OOKAr1BNIFplIEh1YW5nIDwxODc3MTkwMjMzMUAxNjMuY29t
PiB3cm90ZToKPj4KPj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGludHJvZHVjZXMgc3VwcG9ydCBmb3Ig
dGhlIHBpbmN0cmwgZHJpdmVyIG9mIHRoZSBDYW5hYW4KPj4+IEsyMzAgU29DLiBUaGUgSzIzMCBT
b0MgZmVhdHVyZXMgNjQgSU8gcGlucywgZWFjaCBvZiB3aGljaCBjYW4gYmUgY29uZmlndXJlZAo+
Pj4gZm9yIHVwIHRvIGZpdmUgZGlmZmVyZW50IGZ1bmN0aW9ucy4KPj4+Cj4+PiBUaGUgY29udHJv
bGxlciBtYW5hZ2VzIHRoZSBlbnRpcmUgcGluIGNvbmZpZ3VyYXRpb24gYW5kIG11bHRpcGxleGlu
Zwo+Pj4gdGhyb3VnaCBhIHNpbmdsZSByZWdpc3Rlciwgd2hpY2ggY29udHJvbCBmZWF0dXJlcyBz
dWNoIGFzIHNjaG1pdHQgdHJpZ2dlciwKPj4+IGRyaXZlIHN0cmVuZ3RoLCBiaWFzIHB1bGwtdXAv
ZG93biwgaW5wdXQvb3V0cHV0IGVuYWJsZSwgcG93ZXIgc291cmNlLCBhbmQKPj4+IG11eCBtb2Rl
Lgo+Pj4KPj4+IFRoZSBjaGFuZ2VzIGhhdmUgYmVlbiB0ZXN0ZWQgb24gQ2FuTVYtSzIzMC1WMS4x
IGJvYXJkLgo+Pj4KPj4+IFRoZSBwaW4gZnVuY3Rpb24gZGVmaW5pdGlvbiBjYW4gYmUgZm91bmQg
aGVyZSBbMV0sIGFuZCBtb3N0IG9mIHRoZSBEVFMgZGF0YQo+Pj4gd2FzIGNvbnZlcnRlZCBmcm9t
IHRoZSB2ZW5kb3IncyBjb2RlIFsyXS4KPj4gQmluZGluZ3MgQUNLZWQgYW5kIHBhdGNoZXMgbG9v
ayBnb29kIHRvIEkgYXBwbGllZCBwYXRjaAo+PiAxICYgMiB0byB0aGUgcGluIGNvbnRyb2wgdHJl
ZS4KPj4KPj4gUGxlYXNlIGZ1bm5lbCBwYXRjaCAzIHRocm91Z2ggdGhlIFNvQyB0cmVlLgo+Pgo+
Pj4gcHJlcmVxdWlzaXRlLW1lc3NhZ2UtaWQ6IDx0ZW5jZW50XzIyQkEwNDI1QjRERjFDQTE3MTNC
NjJFNDQyM0MxQkZCRjgwOUBxcS5jb20+Cj4+PiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDcwNGVm
YzZlNzY4MTRlMTg3Nzc0ODk1OWQ3MzE5ZDU1OGM4Mzg2YzEKPj4+IHByZXJlcXVpc2l0ZS1wYXRj
aC1pZDogYzIxNDRjZjQ2OGM1N2I4NTY4MzBhNjE2MTViYTZiYTUwMWU4ZWM1OAo+Pj4gcHJlcmVx
dWlzaXRlLXBhdGNoLWlkOiBjZWQ0YTAxY2NkOGRkYWIyZmQzMDhkNTQzZGRmNDdiZDE2NDE1MThh
Cj4+PiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGY4Yjk4M2IzMDFkMGMxNGYxNDQ4YjllNGMzMjEy
NjJhNTA5ZTA2MWUKPj4+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogODM0YjY1YjZhMmIwMzdkYWVk
NWNmZmM2YTQxOTYzNjIyNTY4ZGM5Ywo+Pj4gcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiAyNDAxNzAz
YjU3NDQ4YzllYTJjM2RjNzY1MGI0NTAyNDkxYTI4OTQ0Cj4+IEkgZG9uJ3Qga25vdyBhYm91dCBh
bGwgdGhpcyBzdHVmZiBidXQgbmVpdGhlciBiaW5kaW5ncyBvciBjb2RlIHNlZW1zCj4+IHRvIGNv
bnRhaW4gYW55dGhpbmcgdGhhdCB3b24ndCBjb21waWxlIHNvIEkganVzdCBhc3N1bWUgdGhhdCBh
bnkgb2YgdGhlc2UKPj4gZGVwZW5kZW5jaWVzIGFyZSBwdXJlbHkgZm9yIHBhdGNoIDMvMyBhbmQg
SSBub3RoaW5nIGJsb2NrcyBtZQo+PiBtZXJnaW5nIHBhdGNoZXMgMSAmIDIgc28gSSBqdXN0IHdl
bnQgYWhlYWQgd2l0aCB0aGF0Lgo+IFlhaCwgdGhpcyBzaG91bGQgYWxsIGJlIGNvcyBJIGhhdmVu
J3QgeWV0IGFwcGxpZWQKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvdGVuY2VudF8yMkJB
MDQyNUI0REYxQ0ExNzEzQjYyRTQ0MjNDMUJGQkY4MDlAcXEuY29tLwo+IGFzIEkgYW0gd2FpdGlu
ZyBmb3IgYSBjbG9jayBkcml2ZXIgdG8gYmUgc29ydGVkIG91dC4KClRoYW5rIHlvdSB2ZXJ5IG11
Y2ggZm9yIHlvdXIgdGltZSBpbiByZXZpZXdpbmcgYW5kIGhlbHBpbmcgZml4IHRoZSBidWchCklu
ZGVlZCwgb25seSBwYXRjaCAzIHJlYWxseSBkZXBlbmRzIG9uIHRoZSBwcmV2aW91cyBwYXRjaGVz
LiBXZSBhcmUgbm93Cndvcmtpbmcgb24gY2xvY2sgZHJpdmVyLiBTaG91bGQgd2UgZGVhbCB3aXRo
IHBhdGNoIDMgYWZ0ZXIgdGhhdD8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
