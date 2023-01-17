Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EA1C63797
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 05:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EYZPP+iR7nK+f0u3JC0RLazzctXKWh8I17kR3GmBlU=; b=eGDRk/iTXQ/5B8
	ITunHg6379ISnGUGptyMTpAvX6IVAWdedksB9MPMHu/iSWxo1vcVSgX/Kos/tR8jzkCqceux24U0G
	N2eWxLC/2RWdUcOhN2j4E7PJlmKUVG0ISWzc71u9Vl1nQkhqxJLqE3thIJ7FmoMiu9sHIhR0iLO8i
	v+ViyjZHKwKiXbYiQ0MQoZ5FMNFrPUUOnqjQo1eu5Uwz7Z6TZg03g/d+lZ5eglz8zV/md5Rqpb3L3
	Kk56gKe3Wz/+m2T9+/daS0yYcdqEYamrloUYxzG3kJfqrjxNAALd1gEH3Eyo6FQaEIVb1Hivjn/6s
	KmN5rkME7XCXwDnRmSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHeZc-00Cz1r-EO; Tue, 17 Jan 2023 05:31:52 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHeZZ-00Cz0P-7V
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 05:31:51 +0000
X-QQ-mid: bizesmtp63t1673933452t22prkyo
Received: from smtpclient.apple ( [1.202.165.115])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Jan 2023 13:30:49 +0800 (CST)
X-QQ-SSF: 00000000000000709000000A0000000
X-QQ-FEAT: AC2Z5zz8gBT5NrlZsUHrGX7M6x4b6w7laLHTaGrrBF0cvQnK+h1mht/fhRhSz
	1fICMuYxXFczf/h6V+62SQezYwdekoTVCEs41JyNQk2aRdNP/SQ+pr+TwXxBucFOaTo9KDm
	KeG+KNgO43dfcagWaZA2fZQHokfiuaYC3+cgrPVaT1zBQxlmaEZ20ky8h8jHbtyqh06J6A8
	SuMuNlSvWtc/bkoYYk8F1TAtRXBMn+SRMIZJq8KrMGtrSt3zAmaSQFz7mvrdGMJtsCRy4vq
	ajkUAeM4j5IzVSIWdgCiDJQ+vm3Km2MoX8V5DPPwuD5oGSAegbggtiSk41aBSdUrOwNURBz
	jly3lQb6uaae1MUuE8uC2LohNgljCe+zM7/FZWTxFLtBYkFFYrITSDRYxVuW1sz84gSWReP
X-QQ-GoodBg: 0
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
From: Tonghao Zhang <tong@infragraf.org>
In-Reply-To: <5836b464-290e-203f-00f2-fc6632c9f570@csgroup.eu>
Date: Tue, 17 Jan 2023 13:30:49 +0800
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
Message-Id: <147A796D-12C0-482F-B48A-16E67120622B@infragraf.org>
References: <20230105030614.26842-1-tong@infragraf.org>
 <ea7673e1-40ec-18be-af89-5f4fd0f71742@csgroup.eu>
 <71c83f39-f85f-d990-95b7-ab6068839e6c@iogearbox.net>
 <5836b464-290e-203f-00f2-fc6632c9f570@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Daniel Borkmann <daniel@iogearbox.net>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:infragraf.org:qybglogicsvr:qybglogicsvr5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_213149_619266_BB4785B0 
X-CRM114-Status: GOOD (  20.48  )
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

Cgo+IE9uIEphbiA5LCAyMDIzLCBhdCA0OjE1IFBNLCBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+IAo+IAo+IAo+IExlIDA2LzAxLzIwMjMgw6Ag
MTY6MzcsIERhbmllbCBCb3JrbWFubiBhIMOpY3JpdCA6Cj4+IE9uIDEvNS8yMyA2OjUzIFBNLCBD
aHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pj4gTGUgMDUvMDEvMjAyMyDDoCAwNDowNiwgdG9uZ0Bp
bmZyYWdyYWYub3JnIGEgw6ljcml0IDoKPj4+PiBGcm9tOiBUb25naGFvIFpoYW5nIDx0b25nQGlu
ZnJhZ3JhZi5vcmc+Cj4+Pj4gCj4+Pj4gVGhlIHg4Nl82NCBjYW4ndCBkdW1wIHRoZSB2YWxpZCBp
bnNuIGluIHRoaXMgd2F5LiBBIHRlc3QgQlBGIHByb2cKPj4+PiB3aGljaCBpbmNsdWRlIHN1YnBy
b2c6Cj4+Pj4gCj4+Pj4gJCBsbHZtLW9iamR1bXAgLWQgc3VicHJvZy5vCj4+Pj4gRGlzYXNzZW1i
bHkgb2Ygc2VjdGlvbiAudGV4dDoKPj4+PiAwMDAwMDAwMDAwMDAwMDAwIDxzdWJwcm9nPjoKPj4+
PiAgICAgICAgICAwOiAgICAgICAxOCAwMSAwMCAwMCA3MyA3NSA2MiA3MCAwMCAwMCAwMCAwMCA3
MiA2ZiA2NyAwMCByMSAKPj4+PiA9IDI5MTE0NDU5OTAzNjUzMjM1IGxsCj4+Pj4gICAgICAgICAg
MjogICAgICAgN2IgMWEgZjggZmYgMDAgMDAgMDAgMDAgKih1NjQgKikocjEwIC0gOCkgPSByMQo+
Pj4+ICAgICAgICAgIDM6ICAgICAgIGJmIGExIDAwIDAwIDAwIDAwIDAwIDAwIHIxID0gcjEwCj4+
Pj4gICAgICAgICAgNDogICAgICAgMDcgMDEgMDAgMDAgZjggZmYgZmYgZmYgcjEgKz0gLTgKPj4+
PiAgICAgICAgICA1OiAgICAgICBiNyAwMiAwMCAwMCAwOCAwMCAwMCAwMCByMiA9IDgKPj4+PiAg
ICAgICAgICA2OiAgICAgICA4NSAwMCAwMCAwMCAwNiAwMCAwMCAwMCBjYWxsIDYKPj4+PiAgICAg
ICAgICA3OiAgICAgICA5NSAwMCAwMCAwMCAwMCAwMCAwMCAwMCBleGl0Cj4+Pj4gRGlzYXNzZW1i
bHkgb2Ygc2VjdGlvbiByYXdfdHAvc3lzX2VudGVyOgo+Pj4+IDAwMDAwMDAwMDAwMDAwMDAgPGVu
dHJ5PjoKPj4+PiAgICAgICAgICAwOiAgICAgICA4NSAxMCAwMCAwMCBmZiBmZiBmZiBmZiBjYWxs
IC0xCj4+Pj4gICAgICAgICAgMTogICAgICAgYjcgMDAgMDAgMDAgMDAgMDAgMDAgMDAgcjAgPSAw
Cj4+Pj4gICAgICAgICAgMjogICAgICAgOTUgMDAgMDAgMDAgMDAgMDAgMDAgMDAgZXhpdAo+Pj4+
IAo+Pj4+IGtlcm5lbCBwcmludCBtZXNzYWdlOgo+Pj4+IFsgIDU4MC43NzUzODddIGZsZW49OCBw
cm9nbGVuPTUxIHBhc3M9MyBpbWFnZT1mZmZmZmZmZmEwMDBjMjBjIAo+Pj4+IGZyb209a3Byb2Jl
LWxvYWQgcGlkPTE2NDMKPj4+PiBbICA1ODAuNzc3MjM2XSBKSVQgY29kZTogMDAwMDAwMDA6IGNj
IGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjIAo+Pj4+IGNjIGNjIGNjIGNjIGNjCj4+Pj4g
WyAgNTgwLjc3OTAzN10gSklUIGNvZGU6IDAwMDAwMDEwOiBjYyBjYyBjYyBjYyBjYyBjYyBjYyBj
YyBjYyBjYyBjYyAKPj4+PiBjYyBjYyBjYyBjYyBjYwo+Pj4+IFsgIDU4MC43ODA3NjddIEpJVCBj
b2RlOiAwMDAwMDAyMDogY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgCj4+Pj4gY2Mg
Y2MgY2MgY2MgY2MKPj4+PiBbICA1ODAuNzgyNTY4XSBKSVQgY29kZTogMDAwMDAwMzA6IGNjIGNj
IGNjCj4+Pj4gCj4+Pj4gJCBicGZfaml0X2Rpc2FzbQo+Pj4+IDUxIGJ5dGVzIGVtaXR0ZWQgZnJv
bSBKSVQgY29tcGlsZXIgKHBhc3M6MywgZmxlbjo4KQo+Pj4+IGZmZmZmZmZmYTAwMGMyMGMgKyA8
eD46Cj4+Pj4gICAgICAwOiAgIGludDMKPj4+PiAgICAgIDE6ICAgaW50Mwo+Pj4+ICAgICAgMjog
ICBpbnQzCj4+Pj4gICAgICAzOiAgIGludDMKPj4+PiAgICAgIDQ6ICAgaW50Mwo+Pj4+ICAgICAg
NTogICBpbnQzCj4+Pj4gICAgICAuLi4KPj4+PiAKPj4+PiBVbnRpbCBicGZfaml0X2JpbmFyeV9w
YWNrX2ZpbmFsaXplIGlzIGludm9rZWQsIHdlIGNvcHkgcndfaGVhZGVyIHRvIAo+Pj4+IGhlYWRl
cgo+Pj4+IGFuZCB0aGVuIGltYWdlL2luc24gaXMgdmFsaWQuIEJUVywgd2UgY2FuIHVzZSB0aGUg
ImJwZnRvb2wgcHJvZyBkdW1wIiAKPj4+PiBKSVRlZCBpbnN0cnVjdGlvbnMuCj4+PiAKPj4+IE5B
Q0suCj4+PiAKPj4+IEJlY2F1c2UgdGhlIGZlYXR1cmUgaXMgYnVnZ3kgb24geDg2XzY0LCB5b3Ug
cmVtb3ZlIGl0IGZvciBhbGwKPj4+IGFyY2hpdGVjdHVyZXMgPwo+Pj4gCj4+PiBPbiBwb3dlcnBj
IGJwZl9qaXRfZW5hYmxlID09IDIgd29ya3MgYW5kIGlzIHZlcnkgdXNlZnVsbC4KPj4+IAo+Pj4g
TGFzdCB0aW1lIEkgdHJpZWQgdG8gdXNlIGJwZnRvb2wgb24gcG93ZXJwYy8zMiBpdCBkaWRuJ3Qg
d29yay4gSSBkb24ndAo+Pj4gcmVtZW1iZXIgdGhlIGRldGFpbHMsIEkgdGhpbmsgaXQgd2FzIGFu
IGlzc3VlIHdpdGggZW5kaWFuZXNzLiBNYXliZSBpdAo+Pj4gaXMgZml4ZWQgbm93LCBidXQgaXQg
bmVlZHMgdG8gYmUgdmVyaWZpZWQuCj4+PiAKPj4+IFNvIHBsZWFzZSwgYmVmb3JlIHJlbW92aW5n
IGEgd29ya2luZyBhbmQgdXNlZnVsbCBmZWF0dXJlLCBtYWtlIHN1cmUKPj4+IHRoZXJlIGlzIGFu
IGFsdGVybmF0aXZlIGF2YWlsYWJsZSB0byBpdCBmb3IgYWxsIGFyY2hpdGVjdHVyZXMgaW4gYWxs
Cj4+PiBjb25maWd1cmF0aW9ucy4KPj4+IAo+Pj4gQWxzbywgSSBkb24ndCB0aGluayBicGZ0b29s
IGlzIHVzYWJsZSB0byBkdW1wIGtlcm5lbCBCUEYgc2VsZnRlc3RzLgo+Pj4gVGhhdCdzIHZpdGFs
IHdoZW4gYSBzZWxmdGVzdCBmYWlscyBpZiB5b3Ugd2FudCB0byBoYXZlIGEgY2hhbmNlIHRvCj4+
PiB1bmRlcnN0YW5kIHdoeSBpdCBmYWlscy4KPj4gCj4+IElmIHRoaXMgaXMgYWN0aXZlbHkgdXNl
ZCBieSBKSVQgZGV2ZWxvcGVycyBhbmQgY29uc2lkZXJlZCB1c2VmdWwsIEknZCBiZQo+PiBvayB0
byBsZWF2ZSBpdCBmb3IgdGhlIHRpbWUgYmVpbmcuIE92ZXJhbGwgZ29hbCBpcyB0byByZWFjaCBm
ZWF0dXJlIHBhcml0eQo+PiBhbW9uZyAoYXQgbGVhc3QgbWFqb3IgYXJjaCkgSklUcyBhbmQgbm90
IGp1c3QgaGF2ZSBtb3N0IGZ1bmN0aW9uYWxpdHkgb25seQo+PiBhdmFpbGFibGUgb24geDg2LTY0
IEpJVC4gQ291bGQgeW91IGhvd2V2ZXIgY2hlY2sgd2hhdCBpcyBub3Qgd29ya2luZyB3aXRoCj4+
IGJwZnRvb2wgb24gcG93ZXJwYy8zMj8gUGVyaGFwcyBpdCdzIG5vdCB0b28gbXVjaCBlZmZvcnQg
dG8ganVzdCBmaXggaXQsCj4+IGJ1dCBkZXRhaWxzIHdvdWxkIGJlIHVzZWZ1bCBvdGhlcndpc2Ug
J2l0IGRpZG4ndCB3b3JrJyBpcyB0b28gZnV6enkuCj4gCj4gU3VyZSBJIHdpbGwgdHJ5IHRvIHRl
c3QgYnBmdG9vbCBhZ2FpbiBpbiB0aGUgY29taW5nIGRheXMuCj4gCj4gUHJldmlvdXMgZGlzY3Vz
c2lvbiBhYm91dCB0aGF0IHN1YmplY3QgaXMgaGVyZTogCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjEwNDE1MDkzMjUwLjMzOTEyNTct
MS1KaWFubGluLkx2QGFybS5jb20vIzI0MTc2ODQ3PQpIaSBDaHJpc3RvcGhlCkFueSBwcm9ncmVz
cz8gV2UgZGlzY3VzcyB0byBkZXByZWNhdGUgdGhlIGJwZl9qaXRfZW5hYmxlID09IDIgaW4gMjAy
MSwgYnV0IGJwZnRvb2wgY2FuIG5vdCBydW4gb24gcG93ZXJwYy4KTm93IGNhbiB3ZSBmaXggdGhp
cyBpc3N1ZT8gCj4gCj4+IAo+PiBBbHNvLCB3aXRoIHJlZ2FyZHMgdG8gdGhlIGxhc3Qgc3RhdGVt
ZW50IHRoYXQgYnBmdG9vbCBpcyBub3QgdXNhYmxlIHRvCj4+IGR1bXAga2VybmVsIEJQRiBzZWxm
dGVzdHMuIENvdWxkIHlvdSBlbGFib3JhdGUgc29tZSBtb3JlPyBJIGhhdmVuJ3QgdXNlZAo+PiBi
cGZfaml0X2VuYWJsZSA9PSAyIGluIGEgbG9uZyB0aW1lIGFuZCBmb3IgZGVidWdnaW5nIGFsd2F5
cyByZWxpZWQgb24KPj4gYnBmdG9vbCB0byBkdW1wIHhsYXRlZCBpbnNucyBvciBKSVQuIE9yIGRv
IHlvdSBtZWFuIGJ5IEJQRiBzZWxmdGVzdHMKPj4gdGhlIHRlc3RfYnBmLmtvIG1vZHVsZT8gR2l2
ZW4gaXQgaGFzIGEgYmlnIGJhdGNoIHdpdGgga2VybmVsLW9ubHkgdGVzdHMsCj4+IHRoZXJlIEkg
Y2FuIHNlZSBpdCdzIHByb2JhYmx5IHN0aWxsIHVzZWZ1bC4KPiAKPiBZZXMgSSBtZWFuIHRlc3Rf
YnBmLmtvCj4gCj4gSSB1c2VkIGl0IGFzIHRoZSB0ZXN0IGJhc2lzIHdoZW4gSSBpbXBsZW1lbnRl
ZCBlQlBGIGZvciBwb3dlcnBjLzMyLiBBbmQgCj4gbm90IHNvIGxvbmcgYWdvIGl0IGhlbHBlZCBk
ZWNvdmVyIGFuZCBmaXggYSBidWcsIHNlZSAKPiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMv
bGludXgvY29tbWl0Lzg5ZDIxZTI1OWE5NGY3ZDU1ODJlYzY3NWFhNDQ1ZjVhNzlmMzQ3ZTQKPiAK
Pj4gCj4+IENoZWVycywKPj4gRGFuaWVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
