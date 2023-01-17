Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08019C3DA78
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 16:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4n6GaPIvc7RogPp3GklEm0V9v+/lHxIczBmqL5N4tMg=; b=bkgZJSAgFJlCIWub2v4T7VX0Js
	+4BJxJXhmMhpKymWMzD/86KeqasqX8pYRhvyvZS88ysi+wctt9SxrAuG8bOqRLK5ohPbf/8Vd53yq
	viQJszmQdpEKfd5ixCsgl9TRWqf67+1J94z9SABwW1QelVdiVvAovZvht4mmb+4hZD6Ye75wa4+sm
	586C7IaHgaJSHksyhucFM0WPBb3kA+ppsoktAfZjADxcAq6Y8bsDXhFGginMcFcJ6CurEkynncFrk
	4ky4dWFCBCkmzFF2tRyxPGWXBU7VcW0XpK7tkFMGj6vI4UOHXckFQGmZ4uXHK3Zhvh84G9r5jNy7V
	lej9D8NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHoUT-00F1fF-KP; Tue, 17 Jan 2023 16:07:13 +0000
Received: from www62.your-server.de ([213.133.104.62])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHoNU-00Ez7n-MM
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 16:00:02 +0000
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1pHoN1-0007ZP-51; Tue, 17 Jan 2023 16:59:31 +0100
Received: from [85.1.206.226] (helo=linux.home)
	by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1pHoN0-0009Hp-CC; Tue, 17 Jan 2023 16:59:30 +0100
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
To: Tonghao Zhang <tong@infragraf.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.or" <linux-arm-kernel@lists.infradead.or>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Hao Luo <haoluo@google.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Hou Tao <houtao1@huawei.com>,
 KP Singh <kpsingh@kernel.org>, Yonghong Song <yhs@fb.com>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>
References: <20230105030614.26842-1-tong@infragraf.org>
 <ea7673e1-40ec-18be-af89-5f4fd0f71742@csgroup.eu>
 <71c83f39-f85f-d990-95b7-ab6068839e6c@iogearbox.net>
 <5836b464-290e-203f-00f2-fc6632c9f570@csgroup.eu>
 <147A796D-12C0-482F-B48A-16E67120622B@infragraf.org>
 <0b46b813-05f2-5083-9f2e-82d72970dae2@csgroup.eu>
 <4380D454-3ED0-43F4-9A79-102BB0E3577A@infragraf.org>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <d91bbb9e-484b-d43d-e62d-0474ff21cf91@iogearbox.net>
Date: Tue, 17 Jan 2023 16:59:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <4380D454-3ED0-43F4-9A79-102BB0E3577A@infragraf.org>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.7/26784/Tue Jan 17 09:29:12 2023)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_080000_775341_59B25139 
X-CRM114-Status: GOOD (  25.17  )
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

T24gMS8xNy8yMyAzOjIyIFBNLCBUb25naGFvIFpoYW5nIHdyb3RlOgo+IAo+IAo+PiBPbiBKYW4g
MTcsIDIwMjMsIGF0IDM6MzAgUE0sIENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lA
Y3Nncm91cC5ldT4gd3JvdGU6Cj4+Cj4+Cj4+Cj4+IExlIDE3LzAxLzIwMjMgw6AgMDY6MzAsIFRv
bmdoYW8gWmhhbmcgYSDDqWNyaXQgOgo+Pj4KPj4+Cj4+Pj4gT24gSmFuIDksIDIwMjMsIGF0IDQ6
MTUgUE0sIENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3Jv
dGU6Cj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4gTGUgMDYvMDEvMjAyMyDDoCAxNjozNywgRGFuaWVsIEJv
cmttYW5uIGEgw6ljcml0IDoKPj4+Pj4gT24gMS81LzIzIDY6NTMgUE0sIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6Cj4+Pj4+PiBMZSAwNS8wMS8yMDIzIMOgIDA0OjA2LCB0b25nQGluZnJhZ3JhZi5v
cmcgYSDDqWNyaXQgOgo+Pj4+Pj4+IEZyb206IFRvbmdoYW8gWmhhbmcgPHRvbmdAaW5mcmFncmFm
Lm9yZz4KPj4+Pj4+Pgo+Pj4+Pj4+IFRoZSB4ODZfNjQgY2FuJ3QgZHVtcCB0aGUgdmFsaWQgaW5z
biBpbiB0aGlzIHdheS4gQSB0ZXN0IEJQRiBwcm9nCj4+Pj4+Pj4gd2hpY2ggaW5jbHVkZSBzdWJw
cm9nOgo+Pj4+Pj4+Cj4+Pj4+Pj4gJCBsbHZtLW9iamR1bXAgLWQgc3VicHJvZy5vCj4+Pj4+Pj4g
RGlzYXNzZW1ibHkgb2Ygc2VjdGlvbiAudGV4dDoKPj4+Pj4+PiAwMDAwMDAwMDAwMDAwMDAwIDxz
dWJwcm9nPjoKPj4+Pj4+PiAgICAgICAgICAgMDogICAgICAgMTggMDEgMDAgMDAgNzMgNzUgNjIg
NzAgMDAgMDAgMDAgMDAgNzIgNmYgNjcgMDAgcjEKPj4+Pj4+PiA9IDI5MTE0NDU5OTAzNjUzMjM1
IGxsCj4+Pj4+Pj4gICAgICAgICAgIDI6ICAgICAgIDdiIDFhIGY4IGZmIDAwIDAwIDAwIDAwICoo
dTY0ICopKHIxMCAtIDgpID0gcjEKPj4+Pj4+PiAgICAgICAgICAgMzogICAgICAgYmYgYTEgMDAg
MDAgMDAgMDAgMDAgMDAgcjEgPSByMTAKPj4+Pj4+PiAgICAgICAgICAgNDogICAgICAgMDcgMDEg
MDAgMDAgZjggZmYgZmYgZmYgcjEgKz0gLTgKPj4+Pj4+PiAgICAgICAgICAgNTogICAgICAgYjcg
MDIgMDAgMDAgMDggMDAgMDAgMDAgcjIgPSA4Cj4+Pj4+Pj4gICAgICAgICAgIDY6ICAgICAgIDg1
IDAwIDAwIDAwIDA2IDAwIDAwIDAwIGNhbGwgNgo+Pj4+Pj4+ICAgICAgICAgICA3OiAgICAgICA5
NSAwMCAwMCAwMCAwMCAwMCAwMCAwMCBleGl0Cj4+Pj4+Pj4gRGlzYXNzZW1ibHkgb2Ygc2VjdGlv
biByYXdfdHAvc3lzX2VudGVyOgo+Pj4+Pj4+IDAwMDAwMDAwMDAwMDAwMDAgPGVudHJ5PjoKPj4+
Pj4+PiAgICAgICAgICAgMDogICAgICAgODUgMTAgMDAgMDAgZmYgZmYgZmYgZmYgY2FsbCAtMQo+
Pj4+Pj4+ICAgICAgICAgICAxOiAgICAgICBiNyAwMCAwMCAwMCAwMCAwMCAwMCAwMCByMCA9IDAK
Pj4+Pj4+PiAgICAgICAgICAgMjogICAgICAgOTUgMDAgMDAgMDAgMDAgMDAgMDAgMDAgZXhpdAo+
Pj4+Pj4+Cj4+Pj4+Pj4ga2VybmVsIHByaW50IG1lc3NhZ2U6Cj4+Pj4+Pj4gWyAgNTgwLjc3NTM4
N10gZmxlbj04IHByb2dsZW49NTEgcGFzcz0zIGltYWdlPWZmZmZmZmZmYTAwMGMyMGMKPj4+Pj4+
PiBmcm9tPWtwcm9iZS1sb2FkIHBpZD0xNjQzCj4+Pj4+Pj4gWyAgNTgwLjc3NzIzNl0gSklUIGNv
ZGU6IDAwMDAwMDAwOiBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYwo+Pj4+Pj4+IGNj
IGNjIGNjIGNjIGNjCj4+Pj4+Pj4gWyAgNTgwLjc3OTAzN10gSklUIGNvZGU6IDAwMDAwMDEwOiBj
YyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYwo+Pj4+Pj4+IGNjIGNjIGNjIGNjIGNjCj4+
Pj4+Pj4gWyAgNTgwLjc4MDc2N10gSklUIGNvZGU6IDAwMDAwMDIwOiBjYyBjYyBjYyBjYyBjYyBj
YyBjYyBjYyBjYyBjYyBjYwo+Pj4+Pj4+IGNjIGNjIGNjIGNjIGNjCj4+Pj4+Pj4gWyAgNTgwLjc4
MjU2OF0gSklUIGNvZGU6IDAwMDAwMDMwOiBjYyBjYyBjYwo+Pj4+Pj4+Cj4+Pj4+Pj4gJCBicGZf
aml0X2Rpc2FzbQo+Pj4+Pj4+IDUxIGJ5dGVzIGVtaXR0ZWQgZnJvbSBKSVQgY29tcGlsZXIgKHBh
c3M6MywgZmxlbjo4KQo+Pj4+Pj4+IGZmZmZmZmZmYTAwMGMyMGMgKyA8eD46Cj4+Pj4+Pj4gICAg
ICAgMDogICBpbnQzCj4+Pj4+Pj4gICAgICAgMTogICBpbnQzCj4+Pj4+Pj4gICAgICAgMjogICBp
bnQzCj4+Pj4+Pj4gICAgICAgMzogICBpbnQzCj4+Pj4+Pj4gICAgICAgNDogICBpbnQzCj4+Pj4+
Pj4gICAgICAgNTogICBpbnQzCj4+Pj4+Pj4gICAgICAgLi4uCj4+Pj4+Pj4KPj4+Pj4+PiBVbnRp
bCBicGZfaml0X2JpbmFyeV9wYWNrX2ZpbmFsaXplIGlzIGludm9rZWQsIHdlIGNvcHkgcndfaGVh
ZGVyIHRvCj4+Pj4+Pj4gaGVhZGVyCj4+Pj4+Pj4gYW5kIHRoZW4gaW1hZ2UvaW5zbiBpcyB2YWxp
ZC4gQlRXLCB3ZSBjYW4gdXNlIHRoZSAiYnBmdG9vbCBwcm9nIGR1bXAiCj4+Pj4+Pj4gSklUZWQg
aW5zdHJ1Y3Rpb25zLgo+Pj4+Pj4KPj4+Pj4+IE5BQ0suCj4+Pj4+Pgo+Pj4+Pj4gQmVjYXVzZSB0
aGUgZmVhdHVyZSBpcyBidWdneSBvbiB4ODZfNjQsIHlvdSByZW1vdmUgaXQgZm9yIGFsbAo+Pj4+
Pj4gYXJjaGl0ZWN0dXJlcyA/Cj4+Pj4+Pgo+Pj4+Pj4gT24gcG93ZXJwYyBicGZfaml0X2VuYWJs
ZSA9PSAyIHdvcmtzIGFuZCBpcyB2ZXJ5IHVzZWZ1bGwuCj4+Pj4+Pgo+Pj4+Pj4gTGFzdCB0aW1l
IEkgdHJpZWQgdG8gdXNlIGJwZnRvb2wgb24gcG93ZXJwYy8zMiBpdCBkaWRuJ3Qgd29yay4gSSBk
b24ndAo+Pj4+Pj4gcmVtZW1iZXIgdGhlIGRldGFpbHMsIEkgdGhpbmsgaXQgd2FzIGFuIGlzc3Vl
IHdpdGggZW5kaWFuZXNzLiBNYXliZSBpdAo+Pj4+Pj4gaXMgZml4ZWQgbm93LCBidXQgaXQgbmVl
ZHMgdG8gYmUgdmVyaWZpZWQuCj4+Pj4+Pgo+Pj4+Pj4gU28gcGxlYXNlLCBiZWZvcmUgcmVtb3Zp
bmcgYSB3b3JraW5nIGFuZCB1c2VmdWxsIGZlYXR1cmUsIG1ha2Ugc3VyZQo+Pj4+Pj4gdGhlcmUg
aXMgYW4gYWx0ZXJuYXRpdmUgYXZhaWxhYmxlIHRvIGl0IGZvciBhbGwgYXJjaGl0ZWN0dXJlcyBp
biBhbGwKPj4+Pj4+IGNvbmZpZ3VyYXRpb25zLgo+Pj4+Pj4KPj4+Pj4+IEFsc28sIEkgZG9uJ3Qg
dGhpbmsgYnBmdG9vbCBpcyB1c2FibGUgdG8gZHVtcCBrZXJuZWwgQlBGIHNlbGZ0ZXN0cy4KPj4+
Pj4+IFRoYXQncyB2aXRhbCB3aGVuIGEgc2VsZnRlc3QgZmFpbHMgaWYgeW91IHdhbnQgdG8gaGF2
ZSBhIGNoYW5jZSB0bwo+Pj4+Pj4gdW5kZXJzdGFuZCB3aHkgaXQgZmFpbHMuCj4+Pj4+Cj4+Pj4+
IElmIHRoaXMgaXMgYWN0aXZlbHkgdXNlZCBieSBKSVQgZGV2ZWxvcGVycyBhbmQgY29uc2lkZXJl
ZCB1c2VmdWwsIEknZCBiZQo+Pj4+PiBvayB0byBsZWF2ZSBpdCBmb3IgdGhlIHRpbWUgYmVpbmcu
IE92ZXJhbGwgZ29hbCBpcyB0byByZWFjaCBmZWF0dXJlIHBhcml0eQo+Pj4+PiBhbW9uZyAoYXQg
bGVhc3QgbWFqb3IgYXJjaCkgSklUcyBhbmQgbm90IGp1c3QgaGF2ZSBtb3N0IGZ1bmN0aW9uYWxp
dHkgb25seQo+Pj4+PiBhdmFpbGFibGUgb24geDg2LTY0IEpJVC4gQ291bGQgeW91IGhvd2V2ZXIg
Y2hlY2sgd2hhdCBpcyBub3Qgd29ya2luZyB3aXRoCj4+Pj4+IGJwZnRvb2wgb24gcG93ZXJwYy8z
Mj8gUGVyaGFwcyBpdCdzIG5vdCB0b28gbXVjaCBlZmZvcnQgdG8ganVzdCBmaXggaXQsCj4+Pj4+
IGJ1dCBkZXRhaWxzIHdvdWxkIGJlIHVzZWZ1bCBvdGhlcndpc2UgJ2l0IGRpZG4ndCB3b3JrJyBp
cyB0b28gZnV6enkuCj4+Pj4KPj4+PiBTdXJlIEkgd2lsbCB0cnkgdG8gdGVzdCBicGZ0b29sIGFn
YWluIGluIHRoZSBjb21pbmcgZGF5cy4KPj4+Pgo+Pj4+IFByZXZpb3VzIGRpc2N1c3Npb24gYWJv
dXQgdGhhdCBzdWJqZWN0IGlzIGhlcmU6Cj4+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjEwNDE1MDkzMjUwLjMzOTEyNTctMS1KaWFu
bGluLkx2QGFybS5jb20vIzI0MTc2ODQ3PQo+Pj4gSGkgQ2hyaXN0b3BoZQo+Pj4gQW55IHByb2dy
ZXNzPyBXZSBkaXNjdXNzIHRvIGRlcHJlY2F0ZSB0aGUgYnBmX2ppdF9lbmFibGUgPT0gMiBpbiAy
MDIxLCBidXQgYnBmdG9vbCBjYW4gbm90IHJ1biBvbiBwb3dlcnBjLgo+Pj4gTm93IGNhbiB3ZSBm
aXggdGhpcyBpc3N1ZT8KPj4KPj4gSGkgVG9uZywKPj4KPj4gSSBoYXZlIHN0YXJ0ZWQgdG8gbG9v
ayBhdCBpdCBidXQgSSBkb24ndCBoYXZlIGFueSBmcnVpdGZ1bGwgZmVlZGJhY2sgeWV0Lgo+Pgo+
PiBJbiB0aGUgbWVhbnRpbWUsIHdlcmUgeW91IGFibGUgdG8gY29uZmlybSB0aGF0IGJwZnRvb2wg
Y2FuIGFsc28gYmUgdXNlZAo+PiB0byBkdW1wIGppdHRlZCB0ZXN0cyBmcm9tIHRlc3RfYnBmLmtv
IG1vZHVsZSBvbiB4ODZfNjQgPyBJbiB0aGF0IGNhbiB5b3UKPj4gdGVsbCBtZSBob3cgdG8gcHJv
Y2VlZCA/Cj4gTm93IEkgZG8gbm90IHRlc3QsIGJ1dCB3ZSBjYW4gZHVtcCB0aGUgaW5zbiBhZnRl
ciBicGZfcHJvZ19zZWxlY3RfcnVudGltZSBpbiB0ZXN0X2JwZi5rby4gYnBmX21hcF9nZXRfaW5m
b19ieV9mZCBjYW4gY29weSB0aGUgaW5zbiB0byB1c2Vyc3BhY2UsIGJ1dCB3ZSBjYW4KPiBkdW1w
IHRoZW0gaW4gdGVzdF9icGYua28gaW4gdGhlIHNhbWUgd2F5LgoKSXNzdWUgaXMgdGhhdCB0aGVz
ZSBwcm9ncyBhcmUgbm90IGNvbnN1bWFibGUgZnJvbSB1c2Vyc3BhY2UgKGFuZCB0aGVyZWZvcmUg
bm90IGJwZnRvb2wpLgppdCdzIGp1c3Qgc2ltcGxlIGJwZl9wcm9nX2FsbG9jICsgY29weSBvZiB0
ZXN0IGluc25zICsgYnBmX3Byb2dfc2VsZWN0X3J1bnRpbWUoKSB0byB0ZXN0CkpJVHMgKHNlZSBn
ZW5lcmF0ZV9maWx0ZXIoKSkuIFNvbWUgb2YgdGhlbSBjb3VsZCBiZSBjb252ZXJ0ZWQgb3ZlciB0
byB0ZXN0X3ZlcmlmaWVyLCBidXQKbm90IGFsbCBtaWdodCBhY3R1YWxseSBwYXNzIHZlcmlmaWVy
LCBpaXJjLiBEb24ndCB0aGluayBpdCdzIGEgZ29vZCBpZGVhIHRvIGFsbG93IGV4cG9zaW5nCnRo
ZW0gdmlhIGZkIHRiaC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
