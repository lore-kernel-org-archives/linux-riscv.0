Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8757C32772
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 12:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1BYLL12UsmeL39KqHjA8C+H2j678aC7/lekSH1v2Ro=; b=25pT+kYgI2nPcb
	Zhk6DXyPTHcw1Lgzc0H5FHKlnfvxGGGdL8BHErXuo9Gzo4vnWy29xPHumBvCU5cZVAbdsyFHV4cnm
	88ZkE1aVLScNA+gnq4Kf54NfMgCvBCDU1l2SHcagMD02wueTRIdZNFIYOFlgfhzsp1NcWdBvZCMoW
	ZjCqlME4cL5mf5fJiDjN0EAYau5DMr9CJINgFSh7EJRseo9Mg3zQQKG92LEBsgRu+uG1wYKZFAkCl
	a5vr13XV6WTe9gZkzZZ4uPsuaZzUhq2yYxhytHY4Jw8eFzHy1vc91OqWwczOIHVAneEA7fbbRgzNc
	C9PyYok01W7ClwuyyqMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ6Z5-0095EJ-8L; Mon, 22 Aug 2022 12:29:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ6Z0-0095Al-Jr
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 12:29:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18C4412FC;
	Mon, 22 Aug 2022 05:29:56 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E94B3F718;
	Mon, 22 Aug 2022 05:29:50 -0700 (PDT)
Date: Mon, 22 Aug 2022 13:29:48 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: <Conor.Dooley@microchip.com>
Cc: <geert@linux-m68k.org>, <devicetree@vger.kernel.org>,
 <aou@eecs.berkeley.edu>, <samuel@sholland.org>,
 <linux-kernel@vger.kernel.org>, <jernej.skrabec@gmail.com>,
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, <wens@csie.org>,
 <robh+dt@kernel.org>, <palmer@dabbelt.com>,
 <krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
 <linux-riscv@lists.infradead.org>, <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
Message-ID: <20220822132948.17f5dc6c@donnerap.cambridge.arm.com>
In-Reply-To: <538ae41e-664f-2efb-f941-9a063b727b6a@microchip.com>
References: <20220815050815.22340-1-samuel@sholland.org>
	<20220815050815.22340-7-samuel@sholland.org>
	<20220815141159.10edeba5@donnerap.cambridge.arm.com>
	<3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com>
	<932aaefd-e2ca-ef26-bf30-e315fb271ec5@sholland.org>
	<ff9e8bd3-c5f7-6319-060e-250151087a8e@microchip.com>
	<c6cba83ea9eea7fc41a9e78d0e45487b21f0f560.camel@icenowy.me>
	<c7599abd-c4cf-9ddd-1e74-e47dec9366d4@microchip.com>
	<CAMuHMdUHVpj9ikE2NxpBSBtTG8K6v92vGdbw3GLmEYUoVzatvg@mail.gmail.com>
	<538ae41e-664f-2efb-f941-9a063b727b6a@microchip.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_052954_817944_8F949C92 
X-CRM114-Status: GOOD (  29.54  )
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

T24gTW9uLCAyMiBBdWcgMjAyMiAxMjoxMzo0MiArMDAwMAo8Q29ub3IuRG9vbGV5QG1pY3JvY2hp
cC5jb20+IHdyb3RlOgoKSGksCgo+IE9uIDIyLzA4LzIwMjIgMTI6NDYsIEdlZXJ0IFV5dHRlcmhv
ZXZlbiB3cm90ZToKPiA+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQo+ID4gCj4g
PiBIaSBDb25vciwgQW5kcmUsCj4gPiAKPiA+IE9uIFN1biwgQXVnIDIxLCAyMDIyIGF0IDEyOjA3
IFBNIDxDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6ICAKPiA+PiBPbiAyMS8wOC8y
MDIyIDA3OjQ1LCBJY2Vub3d5IFpoZW5nIHdyb3RlOiAgCj4gPj4+IOWcqCAyMDIyLTA4LTIw5pif
5pyf5YWt55qEIDE3OjI5ICswMDAw77yMQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb23lhpnpgZPv
vJogIAo+ID4+Pj4gT24gMjAvMDgvMjAyMiAxODoyNCwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6ICAK
PiAKPiA+Pj4+PiBUaGlzIGlzIG5vdCBmZWFzaWJsZSwgZHVlIHRvIHRoZSBkaWZmZXJlbnQgI2lu
dGVycnVwdC1jZWxscy4gU2VlCj4gPj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvQ0FNdUhNZFhIU01jclZPSCt2Y3JkUlJGK2kyVGtNY0Zpc0d4SE1CUFVFYThuVE1GcHp3
QG1haWwuZ21haWwuY29tLwo+ID4+Pj4+Cj4gPj4+Pj4gRXZlbiBpZiB3ZSBzaGFyZSBzb21lIGZp
bGUgYWNyb3NzIGFyY2hpdGVjdHVyZXMsIHlvdSBzdGlsbCBoYXZlIHRvCj4gPj4+Pj4gdXBkYXRl
IGZpbGVzCj4gPj4+Pj4gaW4gYm90aCBwbGFjZXMgdG8gZ2V0IHRoZSBpbnRlcnJ1cHRzIHByb3Bl
cnRpZXMgY29ycmVjdC4KPiA+Pj4+Pgo+ID4+Pj4+IEkgZ2V0IHRoZSBkZXNpcmUgdG8gZGVkdXBs
aWNhdGUgdGhpbmdzLCBidXQgd2UgYWxyZWFkeSBkZWFsIHdpdGgKPiA+Pj4+PiB1cGRhdGluZyB0
aGUKPiA+Pj4+PiBzYW1lL3NpbWlsYXIgbm9kZXMgYWNyb3NzIHNldmVyYWwgU29Dcywgc28gdGhh
dCBpcyBub3RoaW5nIG5ldy4gSQo+ID4+Pj4+IHRoaW5rIGl0IHdvdWxkCj4gPj4+Pj4gYmUgbW9y
ZSBjb25mdXNpbmcvY29tcGxpY2F0ZWQgdG8gaGF2ZSBhbGwgb2YgdGhlIGludGVycnVwdHMKPiA+
Pj4+PiBwcm9wZXJ0aWVzCj4gPj4+Pj4gb3ZlcnJpZGRlbiBpbiBhIHNlcGFyYXRlIGZpbGUuICAK
PiA+Pj4+Cj4gPj4+PiBZZWFoLCBzaG91bGQgbWF5YmUgaGF2ZSBjaXJjbGVkIGJhY2sgYWZ0ZXIg
dGhhdCBjb252ZXJzYXRpb24sIHdvdWxkCj4gPj4+PiBoYXZlIGJlZW4KPiA+Pj4+IG5pY2UgYnV0
IGlmIHRoZSBEVEMgY2FuJ3QgZG8gaXQgbmljZWx5IHRoZW4gdy9lLiAgCj4gPj4+Cj4gPj4+IFdl
bGwsIG1heWJlIHdlIGNhbiBvdmVydXNlIHRoZSBmYWNpbGl0eSBvZiBDIHByZXByb2Nlc3Nvcj8K
PiA+Pj4KPiA+Pj4gZS5nLgo+ID4+Pgo+ID4+PiBgYGAKPiA+Pj4gLy8gRm9yIEFSTQo+ID4+PiAj
ZGVmaW5lIFNPQ19QRVJJUEhFUkFMX0lSUShuKSBHSUNfU1BJIG4KPiA+Pj4gLy8gRm9yIFJJU0Mt
Vgo+ID4+PiAjZGVmaW5lIFNPQ19QRVJJUEhFUkFMX0lSUShuKSBuCj4gPj4+IGBgYAo+ID4+PiAg
Cj4gPj4KPiA+PiBHZWVydCBwb2ludGVkIG91dCB0aGF0IHRoaXMgaXMgbm90IHBvc3NpYmxlIChh
dCBsZWFzdCBvbiB0aGUgUmVuZXNhcwo+ID4+IHN0dWZmKSBiZWNhdXNlIHRoZSBHSUMgaW50ZXJy
dXB0IG51bWJlcnMgYXJlIG5vdCB0aGUgc2FtZSBhcyB0aGUKPiA+PiBQTElDJ3MgJiB0aGUgRFRD
IGlzIG5vdCBhYmxlIHRvIGhhbmRsZSB0aGUgYWRkaXRpb246Cj4gPj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtcmlzY3YvQ0FNdUhNZFhIU01jclZPSCt2Y3JkUlJGK2kyVGtNY0Zpc0d4
SE1CUFVFYThuVE1GcHp3QG1haWwuZ21haWwuY29tLyAgCj4gPiAKPiA+IFdpdGhvdXQgdGhlIGFi
aWxpdHkgdG8gZG8gYWRkaXRpb25zIGluIERUQywgd2UgY291bGQgZS5nLiBsaXN0IGJvdGgKPiA+
IGludGVycnVwdHMgaW4gdGhlIG1hY3JvLCBsaWtlOgo+ID4gCj4gPiAgICAgIC8vIEZvciBBUk0K
PiA+ICAgICAgI2RlZmluZSBTT0NfUEVSSVBIRVJBTF9JUlEobmEsIG5yKSBHSUNfU1BJIG5hCj4g
PiAgICAgIC8vIEZvciBSSVNDLVYKPiA+ICAgICAgI2RlZmluZSBTT0NfUEVSSVBIRVJBTF9JUlEo
bmEsIG5yKSBuciAgCj4gCj4gRG8geW91IHRoaW5rIHRoaXMgaXMgd29ydGggZG9pbmc/IE9yIGFy
ZSB5b3UganVzdCBwcm92aWRpbmcgYW4KPiBleGFtcGxlIG9mIHdoYXQgY291bGQgYmUgZG9uZT8K
PiAKPiBXaGVyZSB3b3VsZCB5b3UgZW52aXNhZ2UgcHV0dGluZyB0aGVzZSBtYWNyb3M/IEkgZm9y
Z2V0IHRoZSBvcmRlcgo+IG9mIHRoZSBDUFAgb3BlcmF0aW9ucyB0aGF0IGFyZSBkb25lLCBjYW4g
dGhleSBiZSBwdXQgaW4gdGhlIGR0cz8KPiAKPiA+IAo+ID4gT24gTW9uLCBBdWcgMjIsIDIwMjIg
YXQgMTI6NTIgUE0gQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnByenl3YXJhQGFybS5jb20+IHdyb3Rl
OiAgCj4gPj4gVGhlcmUgYXJlIGludGVycnVwdC1tYXBzIGZvciB0aGF0Ogo+ID4+IHN1bjhpLXI1
MjguZHRzaToKPiA+PiAgICAgICAgICBzb2Mgewo+ID4+ICAgICAgICAgICAgICAgICAgI2ludGVy
cnVwdC1jZWxscyA9IDwxPjsKPiA+PiAgICAgICAgICAgICAgICAgIGludGVycnVwdC1tYXAgPSA8
MCAgMTggJmdpYyBHSUNfU1BJICAyIElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+ID4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDwwICAxOSAmZ2ljIEdJQ19TUEkgIDMgSVJRX1RZUEVf
TEVWRUxfSElHSD4sCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLi4uLgo+
ID4+Cj4gPj4gc3VuMjBpLWQxLmR0c2k6Cj4gPj4gICAgICAgICAgc29jIHsKPiA+PiAgICAgICAg
ICAgICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47Cj4gPj4gICAgICAgICAgICAgICAgICBp
bnRlcnJ1cHQtbWFwID0gPDAgIDE4ICZwbGljICAxOCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPiA+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MCAgMTkgJnBsaWMgIDE5IElSUV9U
WVBFX0xFVkVMX0hJR0g+LAo+ID4+Cj4gPj4gdGhlbiwgaW4gdGhlIHNoYXJlZCAuZHRzaToKPiA+
PiAgICAgICAgICAgICAgICAgIHVhcnQwOiBzZXJpYWxAMjUwMDAwMCB7Cj4gPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic25wcyxkdy1hcGItdWFydCI7Cj4gPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgIC4uLgo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICBp
bnRlcnJ1cHRzID0gPDE4PjsgIAo+ID4gCj4gPiBOaWNlISBCdXQgaXQncyBnb25uYSBiZSBhIHZl
cnkgbGFyZ2UgaW50ZXJydXB0LW1hcC4gIAo+IAo+IEkgcXVpdGUgbGlrZSB0aGUgaWRlYSBvZiBu
b3QgZHVwbGljYXRpbmcgZmlsZXMgYWNyb3NzIHRoZSBhcmNocwo+IGlmIGl0IGNhbiBiZSBoZWxw
ZWQsIGJ1dCBub3QgYXQgdGhlIGV4cGVuc2Ugb2YgbWFraW5nIHRoZW0gaGFyZCB0bwo+IHVuZGVy
c3RhbmQgJiBJIGZlZWwgbGlrZSB1bmZvcnR1bmF0ZWx5IHRoZSBsYXJnZSBpbnRlcnJ1cHQgbWFw
IGlzCj4gaW4gdGhhdCB0ZXJyaXRvcnkuCgpXZWxsLCBJIGRvbid0IGtub3cgYWJvdXQgdGhlIFJl
bmVzYXMgY2FzZSwgYnV0IGFzIGZhciBhcyB3ZSBrbm93IHRoZQpBbGx3aW5uZXIgRDEgYW5kIFI1
MjggYXJlIHVzaW5nIHRoZSBleGFjdCBzYW1lIGRpZSwganVzdCBmdXNlZCBkaWZmZXJlbnRseS4K
U28gZXhwcmVzc2luZyB0aGlzIGluIGEgY29tbW9uIC5kdHNpIHNvdW5kcyB2ZXJ5IGRlc2lyYWJs
ZSwgZXNwZWNpYWxseQpzaW5jZSBhIGRldmljZXRyZWUgaXMgYW4gYXJjaGl0ZWN0dXJlIGFnbm9z
dGljIGRhdGEgc3RydWN0dXJlLgoKQW5kIHdoaWxlIGl0J3MgdHJ1ZSB0aGF0IGEgRFQgaW50ZXJy
dXB0LW1hcCBpcyBub3QgZm9yIHRoZSBmYWludCBvZiBoZWFydCwKSSB0aGluayBldmVuIHRoZSBj
YXN1YWwgcmVhZGVyIGdldHMgdGhlIGlkZWEgcXVpY2tseSBieSBsb29raW5nIGF0Cml0LCBwb3Nz
aWJseSBndWlkZWQgYnkgYSBjb21tZW50LgpBbmQgaXQgZG9lc24ndCBuZWVkIHRvIGJlIHZlcnkg
bGFyZ2UuIGdyZXAgY291bnRlZCAzMiBnZW51aW5lIGludGVycnVwdHMKaW4gdGhlIGN1cnJlbnQg
LmR0c2kgZmlsZSwgc28gSSBqdXN0IHB1dCB0aG9zZSBvbmVzIG5lZWRlZCBpbi4gSWYgd2UgbmVl
ZAptb3JlIElSUXMgbGF0ZXIgKHF1aXRlIGxpa2VseSksIHRoZXkgYXJlIGVhc2lseSBhZGRlZCwg
dXNpbmcgY29weSZwYXN0ZS4KCkNoZWVycywKQW5kcmUKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
