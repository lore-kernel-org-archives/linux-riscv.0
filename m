Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B26C63797
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 14:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKiWDcJdr6f5kxVAslb0BQ2jA/xPP6f/lfWAqqmDRvc=; b=TearzFs28K3T1O
	SiOtDV5Yct45GJvmAyBpg+WndBP+9NCA2h0FWQws9+QIjQFDklax6tkdalqV24p+FcFF7565ldNj+
	oTg3VdDN+KsUDxqtvSu0RkhnX5ij0cgZz+/HWz60FuxJ8/Kx58wr10hyvdBGTNyB+7A2+XSGnuMZK
	9+z+kVxgssgjTcETKrCmZ5svtDvf0IFC0EeIy3W1/ala8fJQCRLuin/GL3P/kA00gtKtvgxoHxRwQ
	UsPo4EKTAPZD/4UYlDz7lmLq/pSjW3FMvsbcaRZTmM06KNn0BwbEtAfeWyb+ph56JnmY8Cs3RCKhW
	3IY3qRhmJHKr9rwfyXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHmoU-00EaeZ-V0; Tue, 17 Jan 2023 14:19:46 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHmoN-00Ead0-VS
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 14:19:45 +0000
X-QQ-mid: bizesmtp76t1673965119t9zr0wdk
Received: from smtpclient.apple ( [111.201.151.239])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Jan 2023 22:18:36 +0800 (CST)
X-QQ-SSF: 00000000002000709000B00A0000000
X-QQ-FEAT: RmDZc/K2LPFQH6D7eKdHnbXxF7Vo/tbHt61zYTk7DKeN1f41LFpjGOvDKBns/
	+T7SJ92kEMs1xcyrYX8g385fCNFIfoYhsE1jNG8gMJdrx4D3GrnycxYY6C21ljUxNVK8wcs
	cXEkHhVcWvzvG7p16YUzNV5Hl8O7GvxPkYVNjiKsETG8+iEKIacpwSEjbAFc63EjYqG//ZB
	5M9OWuVOTAQmmaWhcY77xsU34OFFZBbmomJFzvXbReXc+iIVRHA1mQIG+zYh9cpJe82TcAa
	VZdPB43TeK72QsD/0REWsOzRX6ztT/izpNGcydzOAXhVkhyqZi6djBNd605qJ5idzJNNFhT
	Babc02Esvm4dXThABvioD35UiiaBJrpzwKh1ceuZxpGmLTS3wAfYi66D8POS/Xyt98cCmcm
X-QQ-GoodBg: 0
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
From: Tonghao Zhang <tong@infragraf.org>
In-Reply-To: <0792068b-9aff-d658-5c7d-086e6d394c6c@csgroup.eu>
Date: Tue, 17 Jan 2023 22:18:36 +0800
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.or" <linux-arm-kernel@lists.infradead.or>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Hao Luo <haoluo@google.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>,
 Song Liu <song@kernel.org>,
 Stanislav Fomichev <sdf@google.com>,
 Jiri Olsa <jolsa@kernel.org>,
 Hou Tao <houtao1@huawei.com>,
 KP Singh <kpsingh@kernel.org>,
 Yonghong Song <yhs@fb.com>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Message-Id: <C811FC00-CE38-4227-B2E8-4CD8989D8B94@infragraf.org>
References: <20230105030614.26842-1-tong@infragraf.org>
 <ea7673e1-40ec-18be-af89-5f4fd0f71742@csgroup.eu>
 <71c83f39-f85f-d990-95b7-ab6068839e6c@iogearbox.net>
 <5836b464-290e-203f-00f2-fc6632c9f570@csgroup.eu>
 <147A796D-12C0-482F-B48A-16E67120622B@infragraf.org>
 <0b46b813-05f2-5083-9f2e-82d72970dae2@csgroup.eu>
 <0792068b-9aff-d658-5c7d-086e6d394c6c@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:infragraf.org:qybglogicsvr:qybglogicsvr5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_061940_341378_722C6F30 
X-CRM114-Status: GOOD (  22.96  )
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

Cgo+IE9uIEphbiAxNywgMjAyMywgYXQgNzozNiBQTSwgQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0
b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToKPiAKPiAKPiAKPiBMZSAxNy8wMS8yMDIzIMOg
IDA4OjMwLCBDaHJpc3RvcGhlIExlcm95IGEgw6ljcml0IDoKPj4gCj4+IAo+PiBMZSAxNy8wMS8y
MDIzIMOgIDA2OjMwLCBUb25naGFvIFpoYW5nIGEgw6ljcml0IDoKPj4+IAo+Pj4gCj4+Pj4gT24g
SmFuIDksIDIwMjMsIGF0IDQ6MTUgUE0sIENocmlzdG9waGUgTGVyb3kgCj4+Pj4gPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6Cj4+Pj4gCj4+Pj4gCj4+Pj4gCj4+Pj4gTGUgMDYv
MDEvMjAyMyDDoCAxNjozNywgRGFuaWVsIEJvcmttYW5uIGEgw6ljcml0IDoKPj4+Pj4gT24gMS81
LzIzIDY6NTMgUE0sIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Pj4+PiBMZSAwNS8wMS8yMDIz
IMOgIDA0OjA2LCB0b25nQGluZnJhZ3JhZi5vcmcgYSDDqWNyaXQgOgo+Pj4+Pj4+IEZyb206IFRv
bmdoYW8gWmhhbmcgPHRvbmdAaW5mcmFncmFmLm9yZz4KPj4+Pj4+PiAKPj4+Pj4+PiBUaGUgeDg2
XzY0IGNhbid0IGR1bXAgdGhlIHZhbGlkIGluc24gaW4gdGhpcyB3YXkuIEEgdGVzdCBCUEYgcHJv
Zwo+Pj4+Pj4+IHdoaWNoIGluY2x1ZGUgc3VicHJvZzoKPj4+Pj4+PiAKPj4+Pj4+PiAkIGxsdm0t
b2JqZHVtcCAtZCBzdWJwcm9nLm8KPj4+Pj4+PiBEaXNhc3NlbWJseSBvZiBzZWN0aW9uIC50ZXh0
Ogo+Pj4+Pj4+IDAwMDAwMDAwMDAwMDAwMDAgPHN1YnByb2c+Ogo+Pj4+Pj4+ICAgICAgICAgICAw
OiAgICAgICAxOCAwMSAwMCAwMCA3MyA3NSA2MiA3MCAwMCAwMCAwMCAwMCA3MiA2ZiA2NyAwMCBy
MQo+Pj4+Pj4+ID0gMjkxMTQ0NTk5MDM2NTMyMzUgbGwKPj4+Pj4+PiAgICAgICAgICAgMjogICAg
ICAgN2IgMWEgZjggZmYgMDAgMDAgMDAgMDAgKih1NjQgKikocjEwIC0gOCkgPSByMQo+Pj4+Pj4+
ICAgICAgICAgICAzOiAgICAgICBiZiBhMSAwMCAwMCAwMCAwMCAwMCAwMCByMSA9IHIxMAo+Pj4+
Pj4+ICAgICAgICAgICA0OiAgICAgICAwNyAwMSAwMCAwMCBmOCBmZiBmZiBmZiByMSArPSAtOAo+
Pj4+Pj4+ICAgICAgICAgICA1OiAgICAgICBiNyAwMiAwMCAwMCAwOCAwMCAwMCAwMCByMiA9IDgK
Pj4+Pj4+PiAgICAgICAgICAgNjogICAgICAgODUgMDAgMDAgMDAgMDYgMDAgMDAgMDAgY2FsbCA2
Cj4+Pj4+Pj4gICAgICAgICAgIDc6ICAgICAgIDk1IDAwIDAwIDAwIDAwIDAwIDAwIDAwIGV4aXQK
Pj4+Pj4+PiBEaXNhc3NlbWJseSBvZiBzZWN0aW9uIHJhd190cC9zeXNfZW50ZXI6Cj4+Pj4+Pj4g
MDAwMDAwMDAwMDAwMDAwMCA8ZW50cnk+Ogo+Pj4+Pj4+ICAgICAgICAgICAwOiAgICAgICA4NSAx
MCAwMCAwMCBmZiBmZiBmZiBmZiBjYWxsIC0xCj4+Pj4+Pj4gICAgICAgICAgIDE6ICAgICAgIGI3
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIHIwID0gMAo+Pj4+Pj4+ICAgICAgICAgICAyOiAgICAgICA5
NSAwMCAwMCAwMCAwMCAwMCAwMCAwMCBleGl0Cj4+Pj4+Pj4gCj4+Pj4+Pj4ga2VybmVsIHByaW50
IG1lc3NhZ2U6Cj4+Pj4+Pj4gWyAgNTgwLjc3NTM4N10gZmxlbj04IHByb2dsZW49NTEgcGFzcz0z
IGltYWdlPWZmZmZmZmZmYTAwMGMyMGMKPj4+Pj4+PiBmcm9tPWtwcm9iZS1sb2FkIHBpZD0xNjQz
Cj4+Pj4+Pj4gWyAgNTgwLjc3NzIzNl0gSklUIGNvZGU6IDAwMDAwMDAwOiBjYyBjYyBjYyBjYyBj
YyBjYyBjYyBjYyBjYyBjYyBjYwo+Pj4+Pj4+IGNjIGNjIGNjIGNjIGNjCj4+Pj4+Pj4gWyAgNTgw
Ljc3OTAzN10gSklUIGNvZGU6IDAwMDAwMDEwOiBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBj
YyBjYwo+Pj4+Pj4+IGNjIGNjIGNjIGNjIGNjCj4+Pj4+Pj4gWyAgNTgwLjc4MDc2N10gSklUIGNv
ZGU6IDAwMDAwMDIwOiBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYwo+Pj4+Pj4+IGNj
IGNjIGNjIGNjIGNjCj4+Pj4+Pj4gWyAgNTgwLjc4MjU2OF0gSklUIGNvZGU6IDAwMDAwMDMwOiBj
YyBjYyBjYwo+Pj4+Pj4+IAo+Pj4+Pj4+ICQgYnBmX2ppdF9kaXNhc20KPj4+Pj4+PiA1MSBieXRl
cyBlbWl0dGVkIGZyb20gSklUIGNvbXBpbGVyIChwYXNzOjMsIGZsZW46OCkKPj4+Pj4+PiBmZmZm
ZmZmZmEwMDBjMjBjICsgPHg+Ogo+Pj4+Pj4+ICAgICAgIDA6ICAgaW50Mwo+Pj4+Pj4+ICAgICAg
IDE6ICAgaW50Mwo+Pj4+Pj4+ICAgICAgIDI6ICAgaW50Mwo+Pj4+Pj4+ICAgICAgIDM6ICAgaW50
Mwo+Pj4+Pj4+ICAgICAgIDQ6ICAgaW50Mwo+Pj4+Pj4+ICAgICAgIDU6ICAgaW50Mwo+Pj4+Pj4+
ICAgICAgIC4uLgo+Pj4+Pj4+IAo+Pj4+Pj4+IFVudGlsIGJwZl9qaXRfYmluYXJ5X3BhY2tfZmlu
YWxpemUgaXMgaW52b2tlZCwgd2UgY29weSByd19oZWFkZXIgdG8KPj4+Pj4+PiBoZWFkZXIKPj4+
Pj4+PiBhbmQgdGhlbiBpbWFnZS9pbnNuIGlzIHZhbGlkLiBCVFcsIHdlIGNhbiB1c2UgdGhlICJi
cGZ0b29sIHByb2cgZHVtcCIKPj4+Pj4+PiBKSVRlZCBpbnN0cnVjdGlvbnMuCj4+Pj4+PiAKPj4+
Pj4+IE5BQ0suCj4+Pj4+PiAKPj4+Pj4+IEJlY2F1c2UgdGhlIGZlYXR1cmUgaXMgYnVnZ3kgb24g
eDg2XzY0LCB5b3UgcmVtb3ZlIGl0IGZvciBhbGwKPj4+Pj4+IGFyY2hpdGVjdHVyZXMgPwo+Pj4+
Pj4gCj4+Pj4+PiBPbiBwb3dlcnBjIGJwZl9qaXRfZW5hYmxlID09IDIgd29ya3MgYW5kIGlzIHZl
cnkgdXNlZnVsbC4KPj4+Pj4+IAo+Pj4+Pj4gTGFzdCB0aW1lIEkgdHJpZWQgdG8gdXNlIGJwZnRv
b2wgb24gcG93ZXJwYy8zMiBpdCBkaWRuJ3Qgd29yay4gSSBkb24ndAo+Pj4+Pj4gcmVtZW1iZXIg
dGhlIGRldGFpbHMsIEkgdGhpbmsgaXQgd2FzIGFuIGlzc3VlIHdpdGggZW5kaWFuZXNzLiBNYXli
ZSBpdAo+Pj4+Pj4gaXMgZml4ZWQgbm93LCBidXQgaXQgbmVlZHMgdG8gYmUgdmVyaWZpZWQuCj4+
Pj4+PiAKPj4+Pj4+IFNvIHBsZWFzZSwgYmVmb3JlIHJlbW92aW5nIGEgd29ya2luZyBhbmQgdXNl
ZnVsbCBmZWF0dXJlLCBtYWtlIHN1cmUKPj4+Pj4+IHRoZXJlIGlzIGFuIGFsdGVybmF0aXZlIGF2
YWlsYWJsZSB0byBpdCBmb3IgYWxsIGFyY2hpdGVjdHVyZXMgaW4gYWxsCj4+Pj4+PiBjb25maWd1
cmF0aW9ucy4KPj4+Pj4+IAo+Pj4+Pj4gQWxzbywgSSBkb24ndCB0aGluayBicGZ0b29sIGlzIHVz
YWJsZSB0byBkdW1wIGtlcm5lbCBCUEYgc2VsZnRlc3RzLgo+Pj4+Pj4gVGhhdCdzIHZpdGFsIHdo
ZW4gYSBzZWxmdGVzdCBmYWlscyBpZiB5b3Ugd2FudCB0byBoYXZlIGEgY2hhbmNlIHRvCj4+Pj4+
PiB1bmRlcnN0YW5kIHdoeSBpdCBmYWlscy4KPj4+Pj4gCj4+Pj4+IElmIHRoaXMgaXMgYWN0aXZl
bHkgdXNlZCBieSBKSVQgZGV2ZWxvcGVycyBhbmQgY29uc2lkZXJlZCB1c2VmdWwsIAo+Pj4+PiBJ
J2QgYmUKPj4+Pj4gb2sgdG8gbGVhdmUgaXQgZm9yIHRoZSB0aW1lIGJlaW5nLiBPdmVyYWxsIGdv
YWwgaXMgdG8gcmVhY2ggZmVhdHVyZSAKPj4+Pj4gcGFyaXR5Cj4+Pj4+IGFtb25nIChhdCBsZWFz
dCBtYWpvciBhcmNoKSBKSVRzIGFuZCBub3QganVzdCBoYXZlIG1vc3QgCj4+Pj4+IGZ1bmN0aW9u
YWxpdHkgb25seQo+Pj4+PiBhdmFpbGFibGUgb24geDg2LTY0IEpJVC4gQ291bGQgeW91IGhvd2V2
ZXIgY2hlY2sgd2hhdCBpcyBub3Qgd29ya2luZyAKPj4+Pj4gd2l0aAo+Pj4+PiBicGZ0b29sIG9u
IHBvd2VycGMvMzI/IFBlcmhhcHMgaXQncyBub3QgdG9vIG11Y2ggZWZmb3J0IHRvIGp1c3QgZml4
IGl0LAo+Pj4+PiBidXQgZGV0YWlscyB3b3VsZCBiZSB1c2VmdWwgb3RoZXJ3aXNlICdpdCBkaWRu
J3Qgd29yaycgaXMgdG9vIGZ1enp5Lgo+Pj4+IAo+Pj4+IFN1cmUgSSB3aWxsIHRyeSB0byB0ZXN0
IGJwZnRvb2wgYWdhaW4gaW4gdGhlIGNvbWluZyBkYXlzLgo+Pj4+IAo+Pj4+IFByZXZpb3VzIGRp
c2N1c3Npb24gYWJvdXQgdGhhdCBzdWJqZWN0IGlzIGhlcmU6Cj4+Pj4gaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjEwNDE1MDkzMjUwLjMz
OTEyNTctMS1KaWFubGluLkx2QGFybS5jb20vIzI0MTc2ODQ3PQo+Pj4gSGkgQ2hyaXN0b3BoZQo+
Pj4gQW55IHByb2dyZXNzPyBXZSBkaXNjdXNzIHRvIGRlcHJlY2F0ZSB0aGUgYnBmX2ppdF9lbmFi
bGUgPT0gMiBpbiAyMDIxLCAKPj4+IGJ1dCBicGZ0b29sIGNhbiBub3QgcnVuIG9uIHBvd2VycGMu
Cj4+PiBOb3cgY2FuIHdlIGZpeCB0aGlzIGlzc3VlPwo+PiAKPj4gSGkgVG9uZywKPj4gCj4+IEkg
aGF2ZSBzdGFydGVkIHRvIGxvb2sgYXQgaXQgYnV0IEkgZG9uJ3QgaGF2ZSBhbnkgZnJ1aXRmdWxs
IGZlZWRiYWNrIHlldC4KPiAKPiBIaSBBZ2FpbiwKPiAKPiBJIHRlc3RlZCBhZ2FpbiwgdGhlIHBy
b2JsZW0gaXMgc3RpbGwgdGhlIHNhbWUgYXMgb25lIHllYXIgYWdvOgo+IAo+IHJvb3RAdmdvaXA6
fiMgLi9icGZ0b29sIHByb2cKPiBsaWJicGY6IGVsZjogZW5kaWFubmVzcyBtaXNtYXRjaCBpbiBw
aWRfaXRlcl9icGYuCkl0IHNlZW0gdG8gYmUgbm90IHJpZ2h0IGVoZHItPmVfaWRlbnRbRUlfREFU
QV0uIERvIHdlIGNhbiBwcmludCB0aGUgcmVhbCB2YWx1ZT8KLyoKICogZV9pZGVudFtFSV9EQVRB
XQogKi8KI2RlZmluZSBFTEZEQVRBTk9ORSAgICAgMAojZGVmaW5lIEVMRkRBVEEyTFNCICAgICAx
CiNkZWZpbmUgRUxGREFUQTJNU0IgICAgIDIKI2RlZmluZSBFTEZEQVRBTlVNICAgICAgMwoKYnBm
X29iamVjdF9fZWxmX2luaXQ6Cm9iai0+ZWZpbGUuZWhkciA9IGVoZHIgPSBlbGY2NF9nZXRlaGRy
KGVsZik7Cgo+IGxpYmJwZjogZmFpbGVkIHRvIGluaXRpYWxpemUgc2tlbGV0b24gQlBGIG9iamVj
dCAncGlkX2l0ZXJfYnBmJzogLTQwMDMKPiBFcnJvcjogZmFpbGVkIHRvIG9wZW4gUElEIGl0ZXJh
dG9yIHNrZWxldG9uCj4gCj4gcm9vdEB2Z29pcDp+IyB1bmFtZSAtYQo+IExpbnV4IHZnb2lwIDYu
Mi4wLXJjMy0wMjU5Ni1nMWMyYzljMTNlMjU2ICMyNDIgUFJFRU1QVCBUdWUgSmFuIDE3IAo+IDA5
OjM2OjA4IENFVCAyMDIzIHBwYyBHTlUvTGludXgKT24gbXkgcGMsIGVsZiBpcyBsaXR0bGUgZW5k
aWFuLgojIHJlYWRlbGYgLWggdG9vbHMvYnBmL2JwZnRvb2wvcGlkX2l0ZXIuYnBmLm8KRUxGIEhl
YWRlcjoKICBNYWdpYzogICA3ZiA0NSA0YyA0NiAwMiAwMSAwMSAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMAogIENsYXNzOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRUxGNjQKICBEYXRh
OiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDIncyBjb21wbGVtZW50LCBsaXR0bGUgZW5k
aWFuICMgeDg2XzY0CiAgVmVyc2lvbjogICAgICAgICAgICAgICAgICAgICAgICAgICAxIChjdXJy
ZW50KQogIE9TL0FCSTogICAgICAgICAgICAgICAgICAgICAgICAgICAgVU5JWCAtIFN5c3RlbSBW
CiAgQUJJIFZlcnNpb246ICAgICAgICAgICAgICAgICAgICAgICAwCiAgVHlwZTogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBSRUwgKFJlbG9jYXRhYmxlIGZpbGUpCiAgTWFjaGluZTogICAg
ICAgICAgICAgICAgICAgICAgICAgICBMaW51eCBCUEYKICBWZXJzaW9uOiAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDB4MQogIEVudHJ5IHBvaW50IGFkZHJlc3M6ICAgICAgICAgICAgICAgMHgw
CiAgU3RhcnQgb2YgcHJvZ3JhbSBoZWFkZXJzOiAgICAgICAgICAwIChieXRlcyBpbnRvIGZpbGUp
CiAgU3RhcnQgb2Ygc2VjdGlvbiBoZWFkZXJzOiAgICAgICAgICA2NDgzMiAoYnl0ZXMgaW50byBm
aWxlKQogIEZsYWdzOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwCiAgU2l6ZSBvZiB0
aGlzIGhlYWRlcjogICAgICAgICAgICAgICA2NCAoYnl0ZXMpCiAgU2l6ZSBvZiBwcm9ncmFtIGhl
YWRlcnM6ICAgICAgICAgICAwIChieXRlcykKICBOdW1iZXIgb2YgcHJvZ3JhbSBoZWFkZXJzOiAg
ICAgICAgIDAKICBTaXplIG9mIHNlY3Rpb24gaGVhZGVyczogICAgICAgICAgIDY0IChieXRlcykK
ICBOdW1iZXIgb2Ygc2VjdGlvbiBoZWFkZXJzOiAgICAgICAgIDEzCiAgU2VjdGlvbiBoZWFkZXIg
c3RyaW5nIHRhYmxlIGluZGV4OiAxCgo+IAo+PiAKPj4gSW4gdGhlIG1lYW50aW1lLCB3ZXJlIHlv
dSBhYmxlIHRvIGNvbmZpcm0gdGhhdCBicGZ0b29sIGNhbiBhbHNvIGJlIHVzZWQgCj4+IHRvIGR1
bXAgaml0dGVkIHRlc3RzIGZyb20gdGVzdF9icGYua28gbW9kdWxlIG9uIHg4Nl82NCA/IEluIHRo
YXQgY2FuIHlvdSAKPj4gdGVsbCBtZSBob3cgdG8gcHJvY2VlZCA/Cj4+IAo+PiBUaGFua3MKPj4g
Q2hyaXN0b3BoZQo+PiAKPiAKPiAKPiBDaHJpc3RvcGhlCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
