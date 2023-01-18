Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBE3C00A5A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 02:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=34dSyic90Ou2o/mFKEINPGaeVwUf2A8fYS54YqrN6bc=; b=XunCeCMf1BabVg
	8YzsCCciEXCw+m55dAcKr8OyMDFk7m4rJBW294cr3oW427j34bT594qy71O4XTj0cP392hSgfrNB2
	WZ4ILSxLTr9Q74L4IKeX3BaCLEK/WuN4nLDHewusOPD61zOqsYycn/lIAcUrMS3aY8apUoC1vSgkB
	es+tNNhAcIXJxiTkTZnI0JzxIxlXFRW02zIN6Kn70QHwCce7X5bRJdPBZ3EPt9WpqPpEwAs3dGxTi
	Ze78YRfrb5ICrCdZv4FfpYJHqEzFiHkhWrcGpx8h7G/JAK+GC98tgo9LnTGdgjdProBL/xEJlhyH+
	1/+omoYdQl1cHA6A9khw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHxxw-00GYhu-GU; Wed, 18 Jan 2023 02:14:16 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHxxt-00GYgM-7O
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 02:14:15 +0000
X-QQ-mid: bizesmtp63t1674007995t7ilarhe
Received: from smtpclient.apple ( [1.202.165.115])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Jan 2023 10:13:12 +0800 (CST)
X-QQ-SSF: 00000000000000809000000A0000000
X-QQ-FEAT: znfcQSa1hKYt2IoUPBjev0xJiHXY9/1L91X5VNAqb/e5yZ9oi32VUsokqo2nJ
	+wPh7qedOpf/tsd3HzSONUeqf1pOD8MPxuZr0e8HJYW8yc9nStr3qH/UMCs7uC97bBIoauC
	46fR5fcZOGBhfbnbvnndoVjlwYD2qlmAiNd3g85zOD6ybo+JHkDJ3YFv8gZnfdK624jb5L0
	3NpTCtRd7BPUQQ1oMUmzarTm8J9gSabU6CkDDw5Lbcuxyg02RDuJDKqY2Y632j6Vq7rTuFa
	9P1D7m16VwFZTPebxFJpM0XMMvQf3jvYtbqAw/ST3zovg30ZxZruPNqLj1J99TB8FXiCDQs
	VGQcZ15w70JL0IH4ZUAQo2ndqJtFyqEEz+MovJW
X-QQ-GoodBg: 0
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
From: Tonghao Zhang <tong@infragraf.org>
In-Reply-To: <d91bbb9e-484b-d43d-e62d-0474ff21cf91@iogearbox.net>
Date: Wed, 18 Jan 2023 10:13:11 +0800
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
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
Message-Id: <7159E8F8-AE66-4563-8A29-D10D66EFAF3D@infragraf.org>
References: <20230105030614.26842-1-tong@infragraf.org>
 <ea7673e1-40ec-18be-af89-5f4fd0f71742@csgroup.eu>
 <71c83f39-f85f-d990-95b7-ab6068839e6c@iogearbox.net>
 <5836b464-290e-203f-00f2-fc6632c9f570@csgroup.eu>
 <147A796D-12C0-482F-B48A-16E67120622B@infragraf.org>
 <0b46b813-05f2-5083-9f2e-82d72970dae2@csgroup.eu>
 <4380D454-3ED0-43F4-9A79-102BB0E3577A@infragraf.org>
 <d91bbb9e-484b-d43d-e62d-0474ff21cf91@iogearbox.net>
To: Daniel Borkmann <daniel@iogearbox.net>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:infragraf.org:qybglogicsvr:qybglogicsvr5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_181413_606215_618551A5 
X-CRM114-Status: GOOD (  24.71  )
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

Cgo+IE9uIEphbiAxNywgMjAyMywgYXQgMTE6NTkgUE0sIERhbmllbCBCb3JrbWFubiA8ZGFuaWVs
QGlvZ2VhcmJveC5uZXQ+IHdyb3RlOgo+IAo+IE9uIDEvMTcvMjMgMzoyMiBQTSwgVG9uZ2hhbyBa
aGFuZyB3cm90ZToKPj4+IE9uIEphbiAxNywgMjAyMywgYXQgMzozMCBQTSwgQ2hyaXN0b3BoZSBM
ZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToKPj4+IAo+Pj4gCj4+PiAK
Pj4+IExlIDE3LzAxLzIwMjMgw6AgMDY6MzAsIFRvbmdoYW8gWmhhbmcgYSDDqWNyaXQgOgo+Pj4+
IAo+Pj4+IAo+Pj4+PiBPbiBKYW4gOSwgMjAyMywgYXQgNDoxNSBQTSwgQ2hyaXN0b3BoZSBMZXJv
eSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToKPj4+Pj4gCj4+Pj4+IAo+Pj4+
PiAKPj4+Pj4gTGUgMDYvMDEvMjAyMyDDoCAxNjozNywgRGFuaWVsIEJvcmttYW5uIGEgw6ljcml0
IDoKPj4+Pj4+IE9uIDEvNS8yMyA2OjUzIFBNLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pj4+
Pj4+IExlIDA1LzAxLzIwMjMgw6AgMDQ6MDYsIHRvbmdAaW5mcmFncmFmLm9yZyBhIMOpY3JpdCA6
Cj4+Pj4+Pj4+IEZyb206IFRvbmdoYW8gWmhhbmcgPHRvbmdAaW5mcmFncmFmLm9yZz4KPj4+Pj4+
Pj4gCj4+Pj4+Pj4+IFRoZSB4ODZfNjQgY2FuJ3QgZHVtcCB0aGUgdmFsaWQgaW5zbiBpbiB0aGlz
IHdheS4gQSB0ZXN0IEJQRiBwcm9nCj4+Pj4+Pj4+IHdoaWNoIGluY2x1ZGUgc3VicHJvZzoKPj4+
Pj4+Pj4gCj4+Pj4+Pj4+ICQgbGx2bS1vYmpkdW1wIC1kIHN1YnByb2cubwo+Pj4+Pj4+PiBEaXNh
c3NlbWJseSBvZiBzZWN0aW9uIC50ZXh0Ogo+Pj4+Pj4+PiAwMDAwMDAwMDAwMDAwMDAwIDxzdWJw
cm9nPjoKPj4+Pj4+Pj4gICAgICAgICAgMDogICAgICAgMTggMDEgMDAgMDAgNzMgNzUgNjIgNzAg
MDAgMDAgMDAgMDAgNzIgNmYgNjcgMDAgcjEKPj4+Pj4+Pj4gPSAyOTExNDQ1OTkwMzY1MzIzNSBs
bAo+Pj4+Pj4+PiAgICAgICAgICAyOiAgICAgICA3YiAxYSBmOCBmZiAwMCAwMCAwMCAwMCAqKHU2
NCAqKShyMTAgLSA4KSA9IHIxCj4+Pj4+Pj4+ICAgICAgICAgIDM6ICAgICAgIGJmIGExIDAwIDAw
IDAwIDAwIDAwIDAwIHIxID0gcjEwCj4+Pj4+Pj4+ICAgICAgICAgIDQ6ICAgICAgIDA3IDAxIDAw
IDAwIGY4IGZmIGZmIGZmIHIxICs9IC04Cj4+Pj4+Pj4+ICAgICAgICAgIDU6ICAgICAgIGI3IDAy
IDAwIDAwIDA4IDAwIDAwIDAwIHIyID0gOAo+Pj4+Pj4+PiAgICAgICAgICA2OiAgICAgICA4NSAw
MCAwMCAwMCAwNiAwMCAwMCAwMCBjYWxsIDYKPj4+Pj4+Pj4gICAgICAgICAgNzogICAgICAgOTUg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgZXhpdAo+Pj4+Pj4+PiBEaXNhc3NlbWJseSBvZiBzZWN0aW9u
IHJhd190cC9zeXNfZW50ZXI6Cj4+Pj4+Pj4+IDAwMDAwMDAwMDAwMDAwMDAgPGVudHJ5PjoKPj4+
Pj4+Pj4gICAgICAgICAgMDogICAgICAgODUgMTAgMDAgMDAgZmYgZmYgZmYgZmYgY2FsbCAtMQo+
Pj4+Pj4+PiAgICAgICAgICAxOiAgICAgICBiNyAwMCAwMCAwMCAwMCAwMCAwMCAwMCByMCA9IDAK
Pj4+Pj4+Pj4gICAgICAgICAgMjogICAgICAgOTUgMDAgMDAgMDAgMDAgMDAgMDAgMDAgZXhpdAo+
Pj4+Pj4+PiAKPj4+Pj4+Pj4ga2VybmVsIHByaW50IG1lc3NhZ2U6Cj4+Pj4+Pj4+IFsgIDU4MC43
NzUzODddIGZsZW49OCBwcm9nbGVuPTUxIHBhc3M9MyBpbWFnZT1mZmZmZmZmZmEwMDBjMjBjCj4+
Pj4+Pj4+IGZyb209a3Byb2JlLWxvYWQgcGlkPTE2NDMKPj4+Pj4+Pj4gWyAgNTgwLjc3NzIzNl0g
SklUIGNvZGU6IDAwMDAwMDAwOiBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYwo+Pj4+
Pj4+PiBjYyBjYyBjYyBjYyBjYwo+Pj4+Pj4+PiBbICA1ODAuNzc5MDM3XSBKSVQgY29kZTogMDAw
MDAwMTA6IGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjCj4+Pj4+Pj4+IGNjIGNjIGNj
IGNjIGNjCj4+Pj4+Pj4+IFsgIDU4MC43ODA3NjddIEpJVCBjb2RlOiAwMDAwMDAyMDogY2MgY2Mg
Y2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MKPj4+Pj4+Pj4gY2MgY2MgY2MgY2MgY2MKPj4+Pj4+
Pj4gWyAgNTgwLjc4MjU2OF0gSklUIGNvZGU6IDAwMDAwMDMwOiBjYyBjYyBjYwo+Pj4+Pj4+PiAK
Pj4+Pj4+Pj4gJCBicGZfaml0X2Rpc2FzbQo+Pj4+Pj4+PiA1MSBieXRlcyBlbWl0dGVkIGZyb20g
SklUIGNvbXBpbGVyIChwYXNzOjMsIGZsZW46OCkKPj4+Pj4+Pj4gZmZmZmZmZmZhMDAwYzIwYyAr
IDx4PjoKPj4+Pj4+Pj4gICAgICAwOiAgIGludDMKPj4+Pj4+Pj4gICAgICAxOiAgIGludDMKPj4+
Pj4+Pj4gICAgICAyOiAgIGludDMKPj4+Pj4+Pj4gICAgICAzOiAgIGludDMKPj4+Pj4+Pj4gICAg
ICA0OiAgIGludDMKPj4+Pj4+Pj4gICAgICA1OiAgIGludDMKPj4+Pj4+Pj4gICAgICAuLi4KPj4+
Pj4+Pj4gCj4+Pj4+Pj4+IFVudGlsIGJwZl9qaXRfYmluYXJ5X3BhY2tfZmluYWxpemUgaXMgaW52
b2tlZCwgd2UgY29weSByd19oZWFkZXIgdG8KPj4+Pj4+Pj4gaGVhZGVyCj4+Pj4+Pj4+IGFuZCB0
aGVuIGltYWdlL2luc24gaXMgdmFsaWQuIEJUVywgd2UgY2FuIHVzZSB0aGUgImJwZnRvb2wgcHJv
ZyBkdW1wIgo+Pj4+Pj4+PiBKSVRlZCBpbnN0cnVjdGlvbnMuCj4+Pj4+Pj4gCj4+Pj4+Pj4gTkFD
Sy4KPj4+Pj4+PiAKPj4+Pj4+PiBCZWNhdXNlIHRoZSBmZWF0dXJlIGlzIGJ1Z2d5IG9uIHg4Nl82
NCwgeW91IHJlbW92ZSBpdCBmb3IgYWxsCj4+Pj4+Pj4gYXJjaGl0ZWN0dXJlcyA/Cj4+Pj4+Pj4g
Cj4+Pj4+Pj4gT24gcG93ZXJwYyBicGZfaml0X2VuYWJsZSA9PSAyIHdvcmtzIGFuZCBpcyB2ZXJ5
IHVzZWZ1bGwuCj4+Pj4+Pj4gCj4+Pj4+Pj4gTGFzdCB0aW1lIEkgdHJpZWQgdG8gdXNlIGJwZnRv
b2wgb24gcG93ZXJwYy8zMiBpdCBkaWRuJ3Qgd29yay4gSSBkb24ndAo+Pj4+Pj4+IHJlbWVtYmVy
IHRoZSBkZXRhaWxzLCBJIHRoaW5rIGl0IHdhcyBhbiBpc3N1ZSB3aXRoIGVuZGlhbmVzcy4gTWF5
YmUgaXQKPj4+Pj4+PiBpcyBmaXhlZCBub3csIGJ1dCBpdCBuZWVkcyB0byBiZSB2ZXJpZmllZC4K
Pj4+Pj4+PiAKPj4+Pj4+PiBTbyBwbGVhc2UsIGJlZm9yZSByZW1vdmluZyBhIHdvcmtpbmcgYW5k
IHVzZWZ1bGwgZmVhdHVyZSwgbWFrZSBzdXJlCj4+Pj4+Pj4gdGhlcmUgaXMgYW4gYWx0ZXJuYXRp
dmUgYXZhaWxhYmxlIHRvIGl0IGZvciBhbGwgYXJjaGl0ZWN0dXJlcyBpbiBhbGwKPj4+Pj4+PiBj
b25maWd1cmF0aW9ucy4KPj4+Pj4+PiAKPj4+Pj4+PiBBbHNvLCBJIGRvbid0IHRoaW5rIGJwZnRv
b2wgaXMgdXNhYmxlIHRvIGR1bXAga2VybmVsIEJQRiBzZWxmdGVzdHMuCj4+Pj4+Pj4gVGhhdCdz
IHZpdGFsIHdoZW4gYSBzZWxmdGVzdCBmYWlscyBpZiB5b3Ugd2FudCB0byBoYXZlIGEgY2hhbmNl
IHRvCj4+Pj4+Pj4gdW5kZXJzdGFuZCB3aHkgaXQgZmFpbHMuCj4+Pj4+PiAKPj4+Pj4+IElmIHRo
aXMgaXMgYWN0aXZlbHkgdXNlZCBieSBKSVQgZGV2ZWxvcGVycyBhbmQgY29uc2lkZXJlZCB1c2Vm
dWwsIEknZCBiZQo+Pj4+Pj4gb2sgdG8gbGVhdmUgaXQgZm9yIHRoZSB0aW1lIGJlaW5nLiBPdmVy
YWxsIGdvYWwgaXMgdG8gcmVhY2ggZmVhdHVyZSBwYXJpdHkKPj4+Pj4+IGFtb25nIChhdCBsZWFz
dCBtYWpvciBhcmNoKSBKSVRzIGFuZCBub3QganVzdCBoYXZlIG1vc3QgZnVuY3Rpb25hbGl0eSBv
bmx5Cj4+Pj4+PiBhdmFpbGFibGUgb24geDg2LTY0IEpJVC4gQ291bGQgeW91IGhvd2V2ZXIgY2hl
Y2sgd2hhdCBpcyBub3Qgd29ya2luZyB3aXRoCj4+Pj4+PiBicGZ0b29sIG9uIHBvd2VycGMvMzI/
IFBlcmhhcHMgaXQncyBub3QgdG9vIG11Y2ggZWZmb3J0IHRvIGp1c3QgZml4IGl0LAo+Pj4+Pj4g
YnV0IGRldGFpbHMgd291bGQgYmUgdXNlZnVsIG90aGVyd2lzZSAnaXQgZGlkbid0IHdvcmsnIGlz
IHRvbyBmdXp6eS4KPj4+Pj4gCj4+Pj4+IFN1cmUgSSB3aWxsIHRyeSB0byB0ZXN0IGJwZnRvb2wg
YWdhaW4gaW4gdGhlIGNvbWluZyBkYXlzLgo+Pj4+PiAKPj4+Pj4gUHJldmlvdXMgZGlzY3Vzc2lv
biBhYm91dCB0aGF0IHN1YmplY3QgaXMgaGVyZToKPj4+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjEwNDE1MDkzMjUwLjMzOTEyNTct
MS1KaWFubGluLkx2QGFybS5jb20vIzI0MTc2ODQ3PQo+Pj4+IEhpIENocmlzdG9waGUKPj4+PiBB
bnkgcHJvZ3Jlc3M/IFdlIGRpc2N1c3MgdG8gZGVwcmVjYXRlIHRoZSBicGZfaml0X2VuYWJsZSA9
PSAyIGluIDIwMjEsIGJ1dCBicGZ0b29sIGNhbiBub3QgcnVuIG9uIHBvd2VycGMuCj4+Pj4gTm93
IGNhbiB3ZSBmaXggdGhpcyBpc3N1ZT8KPj4+IAo+Pj4gSGkgVG9uZywKPj4+IAo+Pj4gSSBoYXZl
IHN0YXJ0ZWQgdG8gbG9vayBhdCBpdCBidXQgSSBkb24ndCBoYXZlIGFueSBmcnVpdGZ1bGwgZmVl
ZGJhY2sgeWV0Lgo+Pj4gCj4+PiBJbiB0aGUgbWVhbnRpbWUsIHdlcmUgeW91IGFibGUgdG8gY29u
ZmlybSB0aGF0IGJwZnRvb2wgY2FuIGFsc28gYmUgdXNlZAo+Pj4gdG8gZHVtcCBqaXR0ZWQgdGVz
dHMgZnJvbSB0ZXN0X2JwZi5rbyBtb2R1bGUgb24geDg2XzY0ID8gSW4gdGhhdCBjYW4geW91Cj4+
PiB0ZWxsIG1lIGhvdyB0byBwcm9jZWVkID8KPj4gTm93IEkgZG8gbm90IHRlc3QsIGJ1dCB3ZSBj
YW4gZHVtcCB0aGUgaW5zbiBhZnRlciBicGZfcHJvZ19zZWxlY3RfcnVudGltZSBpbiB0ZXN0X2Jw
Zi5rby4gYnBmX21hcF9nZXRfaW5mb19ieV9mZCBjYW4gY29weSB0aGUgaW5zbiB0byB1c2Vyc3Bh
Y2UsIGJ1dCB3ZSBjYW4KPj4gZHVtcCB0aGVtIGluIHRlc3RfYnBmLmtvIGluIHRoZSBzYW1lIHdh
eS4KPiAKPiBJc3N1ZSBpcyB0aGF0IHRoZXNlIHByb2dzIGFyZSBub3QgY29uc3VtYWJsZSBmcm9t
IHVzZXJzcGFjZSAoYW5kIHRoZXJlZm9yZSBub3QgYnBmdG9vbCkuCj4gaXQncyBqdXN0IHNpbXBs
ZSBicGZfcHJvZ19hbGxvYyArIGNvcHkgb2YgdGVzdCBpbnNucyArIGJwZl9wcm9nX3NlbGVjdF9y
dW50aW1lKCkgdG8gdGVzdAo+IEpJVHMgKHNlZSBnZW5lcmF0ZV9maWx0ZXIoKSkuIFNvbWUgb2Yg
dGhlbSBjb3VsZCBiZSBjb252ZXJ0ZWQgb3ZlciB0byB0ZXN0X3ZlcmlmaWVyLCBidXQKPiBub3Qg
YWxsIG1pZ2h0IGFjdHVhbGx5IHBhc3MgdmVyaWZpZXIsIGlpcmMuIERvbid0IHRoaW5rIGl0J3Mg
YSBnb29kIGlkZWEgdG8gYWxsb3cgZXhwb3NpbmcKPiB0aGVtIHZpYSBmZCB0YmguCkhpCkkgbWVh
biB0aGF0LCBjYW4gd2UgaW52b2tlIHRoZSBicGZfaml0X2R1bXAgaW4gdGVzdF9icGYua28gZGly
ZWN0bHkgPy4gYnBmX3Byb2dfZ2V0X2luZm9fYnlfZmQgY29weSB0aGUgaW5zbiB0byB1c2Vyc3Bh
Y2UsIGJ1dCB3ZSBvbmx5IGR1bXAgaW5zbiBpbiB0ZXN0X2JwZi5rbwoKICAgICAgICAgICAgICAg
IGlmIChicGZfZHVtcF9yYXdfb2soZmlsZS0+Zl9jcmVkKSkgey8vIGNvZGUgY29waWVkIGZyb20g
YnBmX3Byb2dfZ2V0X2luZm9fYnlfZmQsIG5vdCB0ZXN0ZWQKCiAgICAgICAgICAgICAgICAgICAg
ICAgIC8qIGZvciBtdWx0aS1mdW5jdGlvbiBwcm9ncmFtcywgY29weSB0aGUgSklUZWQKICAgICAg
ICAgICAgICAgICAgICAgICAgICogaW5zdHJ1Y3Rpb25zIGZvciBhbGwgdGhlIGZ1bmN0aW9ucwog
ICAgICAgICAgICAgICAgICAgICAgICAgKi8KICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHBy
b2ctPmF1eC0+ZnVuY19jbnQpIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmb3Ig
KGkgPSAwOyBpIDwgcHJvZy0+YXV4LT5mdW5jX2NudDsgaSsrKSB7CiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsZW4gPSBwcm9nLT5hdXgtPmZ1bmNbaV0tPmppdGVkX2xl
bjsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGltZyA9ICh1OCAqKSBw
cm9nLT5hdXgtPmZ1bmNbaV0tPmJwZl9mdW5jOwogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYnBmX2ppdF9kdW1wKDEsIGxlbiwgMSwgaW1nKTsKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7CiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYnBmX2ppdF9kdW1wKDEsIHVsZW4sIDEsIHByb2ct
PmJwZl9mdW5jKTsKICAgICAgICAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgfQoK
CiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
