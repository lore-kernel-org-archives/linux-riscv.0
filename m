Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7A8C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 06:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLmL6a0ILJGL6lHtBlVLvh4UWxCQAQOtsRdMinEbkhE=; b=yKHe0btRGvUJHi
	P2sTMXIRIbCcggUpf5cER1D+u3kjp6qbLItlXZXpolAtV2+33mfv3CnzIIkbhB4TG5KU6K60/iRgl
	2BJtHikXBP1EwDjitqN1OoQ1hQIjRrfKAaLEH9zbR/lS1ux3DQq/E0mdHoEVzZCxBxNjVGxkHrooW
	HD8CE3wCXr3ts1I1mXEdTi4ukmZQs8SQvVGWXReQ+9wZlhUKNlvJCCAXw2IHWYxGoo08GMRUOXN0K
	b/VXS45XcKwpqE/kTApqZJVE9eFQ1jyfy0OYcTyz9DmqfvBf5k0ojZbkVfIVKRkuwm18QmOZQa7oV
	Y9AaD8afyCVJbmMU7Akg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozuVn-006ifA-74; Tue, 29 Nov 2022 06:54:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozuVb-006ibn-V1; Tue, 29 Nov 2022 06:54:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 787D76159A;
	Tue, 29 Nov 2022 06:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34739C433C1;
	Tue, 29 Nov 2022 06:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669704859;
	bh=syhTa4Rv2j2bHLOI/+XB369IkPY+WGcPvONSdA4KJes=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=hid+UV6aNFqn6SxhgLL+EvqQ9o2mgxKmtbFasQQrZQN5DKZ7nAVmZJ45MdsK2ZxT3
	 YmyCvwCldrKbu0c2Arx2OuW6t/dhnZaoEnN7EZ+u1SqgjX/0gj2kQiD4epIhWYg0yS
	 g8mIQemYc8xeKgT7LtqTmKr1k61LHT5pj3gUFx5O6hQK8bltp/86nPvpw7+ZhmnrBt
	 hSifj0E+WvQiyZlF0Sal5DAK6yKTi5AbYWFt+4vO4IIgAXMx06weeIpZ6lICN/7dbh
	 uUb5/qYF3bICSnYZTrminAlS9R7Pww9xYtFF3wfVAHszoMj+xGM77CLl7A7RU+5HOl
	 PaCPXp0Nfn88w==
Date: Tue, 29 Nov 2022 06:54:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
CC: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>,
 Samuel Holland <samuel@sholland.org>, palmer@dabbelt.com,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andre Przywara <andre.przywara@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_12/12=5D_riscv=3A_defconfig=3A_En?= =?US-ASCII?Q?able_the_Allwinner_D1_platform_and_drivers?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20221129064925.kjjqrzmi3fm67akt@kamzik>
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-13-samuel@sholland.org> <Y4JBa52o4Yemv/uj@spud> <11740765.nUPlyArG6x@diego> <6aad3b63-498e-b13a-af49-b5af0d4e721e@kernel.org> <20221129064925.kjjqrzmi3fm67akt@kamzik>
Message-ID: <BBF52D3D-B8D3-4895-B316-33555E22C56B@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_225424_097238_6A7CD1A5 
X-CRM114-Status: GOOD (  23.69  )
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

CgpPbiAyOSBOb3ZlbWJlciAyMDIyIDA2OjQ5OjI1IEdNVCwgQW5kcmV3IEpvbmVzIDxham9uZXNA
dmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj5PbiBNb24sIE5vdiAyOCwgMjAyMiBhdCAwOToxNzoz
OFBNICswMDAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+IE9uIDI4LzExLzIwMjIgMjE6MTEsIEhl
aWtvIFN0w7xibmVyIHdyb3RlOgo+PiA+IEFtIFNhbXN0YWcsIDI2LiBOb3ZlbWJlciAyMDIyLCAx
Nzo0MDoxMSBDRVQgc2NocmllYiBDb25vciBEb29sZXk6Cj4+ID4+IE9uIEZyaSwgTm92IDI1LCAy
MDIyIGF0IDA1OjQ2OjU2UE0gLTA2MDAsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+PiA+Pj4gTm93
IHRoYXQgc2V2ZXJhbCBEMS1iYXNlZCBib2FyZHMgYXJlIHN1cHBvcnRlZCwgZW5hYmxlIHRoZSBw
bGF0Zm9ybSBpbgo+PiA+Pj4gb3VyIGRlZmNvbmZpZy4gQnVpbGQgaW4gdGhlIGRyaXZlcnMgd2hp
Y2ggYXJlIG5lY2Vzc2FyeSB0byBib290LCBzdWNoIGFzCj4+ID4+PiB0aGUgcGluY3RybCwgTU1D
LCBSVEMgKHdoaWNoIHByb3ZpZGVzIGNyaXRpY2FsIGNsb2NrcyksIFNQSSAoZm9yIGZsYXNoKSwK
Pj4gPj4+IGFuZCB3YXRjaGRvZyAod2hpY2ggbWF5IGJlIGxlZnQgZW5hYmxlZCBieSB0aGUgYm9v
dGxvYWRlcikuCj4+ID4+Cj4+ID4+IEFsbCBvZiB0aGF0IGxvb2tzIGdvb2QuCj4+ID4+Cj4+ID4+
PiBPdGhlciBjb21tb24KPj4gPj4+IG9uYm9hcmQgcGVyaXBoZXJhbHMgYXJlIGVuYWJsZWQgYXMg
bW9kdWxlcy4KPj4gPj4KPj4gPj4gVGhpcyBJIGFtIG5vdCBzdXJlIGFib3V0IHRob3VnaC4gSSds
bCBsZWF2ZSB0aGF0IHRvIFBhbG1lciBzaW5jZSBJJ20KPj4gPj4gcHJldHR5IHN1cmUgaXQgd2Fz
IGhpbSB0aGF0IHNhaWQgaXQsIGJ1dCBJIHRob3VnaHQgdGhlIHBsYW4gd2FzIG9ubHkKPj4gPj4g
dHVybmluZyBvbiBzdHVmZiByZXF1aXJlZCB0byBib290IHRvIGEgY29uc29sZSAmIHRoaW5ncyB0
aGF0IGFyZQo+PiA+PiBnZW5lcmFsbHkgdXNlZnVsIHJhdGhlciB0aGFuIGVuYWJsaW5nIG1vZHVs
ZXMgZm9yIGV2ZXJ5b25lJ3MgInJhbmRvbSIKPj4gPj4gZHJpdmVycy4gUGFsbWVyPwo+PiA+IAo+
PiA+IElzbid0IHRoZSBkZWZjb25maWcgbWVhbnQgYXMgYSBzdGFydGluZyBwb2ludCB0byBnZXQg
d29ya2luZyBzeXN0ZW1zCj4+ID4gd2l0aCBtaW5pbWFsIGNvbmZpZyBlZmZvcnQ/IEF0IGxlYXN0
IHRoYXQgd2FzIGFsd2F5cyB0aGUgd2F5IHRvIGdvIG9uIGFybQo+PiA+IHNvIGZhciA6LSkgLgo+
PiA+IAo+PiA+IFNvIGhhdmluZyBib290LXJlcXVpcmVkIGRyaXZlcnMgYnVpbHQtaW4gd2l0aCB0
aGUgcmVzdCBlbmFibGVkIGFzIG1vZHVsZXMKPj4gPiBmb3Igc3VwcG9ydGVkIGJvYXJkcyB3aWxs
IGFsbG93IHBlb3BsZSB0byBib290IHRoZWlycyB3aXRob3V0IGhlYWRhY2hlcy4KPj4gPiAKPj4g
PiBEaXNhYmxpbmcgdW5uZWVkZWQgZHJpdmVycyBpZiB5b3UncmUgc3RhcnZlZCBmb3Igc3RvcmFn
ZSBzcGFjZSBpbiBhIHNwZWNpYWwKPj4gPiBwcm9qZWN0IGlzIGFsd2F5cyBlYXNpZXIgdGhhbiBo
dW50aW5nIGRvd24gYWxsIHRoZSBkcml2ZXJzIHRvIGVuYWJsZSBmb3IgYQo+PiA+IHNwZWNpZmlj
IGJvYXJkLiAKPj4gCj4+IEkgd291bGRuJ3QgbWluZCBiZWluZyBhYmxlIHRvIHR1cm4gb24gYWxs
IHRoZSBQb2xhckZpcmUgU29DIHN0dWZmIGFuZAo+PiB5ZWFoLCB0aGF0IHdvdWxkIGJlIHRoZSB3
YXkgdGhhdCBhcm02NCBkb2VzIGl0LiBCdXQgSSBkbyByZWNhbGwgaGVhcmluZwo+PiB0aGF0IEkg
c2hvdWxkIG5vdCB0dXJuIHN0dWZmIG9uIHRoaXMgd2F5LCB3aGVuIEkgaW5pdGlhbGx5IHRyaWVk
IHRvCj4+IHR1cm4gc3R1ZmYgb24gdmlhIHNlbGVjdHMsIGdvdCBhIG5hY2sgYW5kIGFza2VkIGlm
IEkgY291bGQgZG8gdGhpcyBpbnN0ZWFkLgo+PiAKPj4gQnV0IGl0IG1heSBiZSB0aGF0IEkgbWlz
cmVtZW1iZXIsIHdoaWNoIGlzIHdoeSBJIGFwcGVhbGVkIHRvIHRoZSBIaWdoZXIKPj4gUG93ZXJz
IGZvciBjbGFyaWZpY2F0aW9uIDopCj4KPkZXSVcsIEkgZG9uJ3Qgd29ycnkgdG9vIG11Y2ggYWJv
dXQgbW9kdWxlcyBpbiBkZWZjb25maWcgYmVjYXVzZSBJIGFsd2F5cwo+aW1tZWRpYXRlbHkgYXBw
bHkgYSAnTFNNT0Q9JFBXRC9MIGxvY2FsbW9kY29uZmlnJyB0byBpdCwgd2hlcmUgdGhlIEwKPmZp
bGUgaXMgYW4gbHNtb2Qgb3V0cHV0IHdoaWNoIG9ubHkgaW5jbHVkZXMgbW9kdWxlcyBJIG5lZWQu
CgppZGssIGRlZmNvbmZpZyB0byBtZSBpcyBub3QgYWJvdXQgeW91IG9yIEksIGl0J3MgYWJvdXQg
QSBEZXZlbG9wZXIgdGhhdCBnZXRzIGFuIFNCQyBvciBhIGRldmtpdCBhbmQgdGhlaXIgZXhwZXJp
ZW5jZS4KT3IgYWx0ZXJuYXRpdmVseSwgc29tZW9uZSdzIENJIDspCkknZCBsaWtlIHRvIHB1dCBl
dmVyeXRoaW5nIGluLCBidXQgSSByZWNhbGwgdGhhdCBiZWluZyBzaG90IGRvd24sIHRoYXQncyBh
bGwuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
