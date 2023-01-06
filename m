Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B5AC3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 15:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsDJoDoTIDg4IvPajo/bFVlvYkQJuGhtCRJRi+98Qgo=; b=aCV5h5Y5h0puBxxphahl2WOWFg
	ni/8HS8w6qg0PjfeUCRXDNGM6Ta/g6W5DVOmerJamdACDAH9MxKdN+/QHzFhYe2VMip48p2uOOyrL
	ZyUnI0osF+DYO9IYedCWWO1+ilMkNTQwN1OAkoklxw407q1uZ2TNtijc3cGc4T/Xxr4ZFKb7SPfl1
	681J10vjpi3zI04msx2Xu9Kc0WYTWRaL1wiqlc8XuaoTw7cDKs5TwnXjdSEvM1GH+5hTRv/6LfHYx
	2Ro7t02FuZyRmjpVhXdMq6/t8SqZAZ++epjK+3D4TVx0UrInLF/l+b6Xn/YHWpN1f4CtzpioB0MxN
	QH7VIK/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDon8-009NQi-WC; Fri, 06 Jan 2023 15:37:59 +0000
Received: from www62.your-server.de ([213.133.104.62])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDon5-009NOf-R4
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 15:37:57 +0000
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1pDomj-0001nf-BJ; Fri, 06 Jan 2023 16:37:33 +0100
Received: from [85.1.206.226] (helo=linux.home)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1pDomi-000T50-HK; Fri, 06 Jan 2023 16:37:32 +0100
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "tong@infragraf.org" <tong@infragraf.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.or" <linux-arm-kernel@lists.infradead.or>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
Cc: Hao Luo <haoluo@google.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Hou Tao <houtao1@huawei.com>,
 KP Singh <kpsingh@kernel.org>, Yonghong Song <yhs@fb.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, naveen.n.rao@linux.ibm.com,
 mpe@ellerman.id.au
References: <20230105030614.26842-1-tong@infragraf.org>
 <ea7673e1-40ec-18be-af89-5f4fd0f71742@csgroup.eu>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <71c83f39-f85f-d990-95b7-ab6068839e6c@iogearbox.net>
Date: Fri, 6 Jan 2023 16:37:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <ea7673e1-40ec-18be-af89-5f4fd0f71742@csgroup.eu>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.7/26773/Fri Jan  6 09:48:44 2023)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_073755_893897_3F5EF727 
X-CRM114-Status: GOOD (  23.74  )
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

T24gMS81LzIzIDY6NTMgUE0sIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4gTGUgMDUvMDEvMjAy
MyDDoCAwNDowNiwgdG9uZ0BpbmZyYWdyYWYub3JnIGEgw6ljcml0wqA6Cj4+IEZyb206IFRvbmdo
YW8gWmhhbmcgPHRvbmdAaW5mcmFncmFmLm9yZz4KPj4KPj4gVGhlIHg4Nl82NCBjYW4ndCBkdW1w
IHRoZSB2YWxpZCBpbnNuIGluIHRoaXMgd2F5LiBBIHRlc3QgQlBGIHByb2cKPj4gd2hpY2ggaW5j
bHVkZSBzdWJwcm9nOgo+Pgo+PiAkIGxsdm0tb2JqZHVtcCAtZCBzdWJwcm9nLm8KPj4gRGlzYXNz
ZW1ibHkgb2Ygc2VjdGlvbiAudGV4dDoKPj4gMDAwMDAwMDAwMDAwMDAwMCA8c3VicHJvZz46Cj4+
ICAgICAgICAgIDA6ICAgICAgIDE4IDAxIDAwIDAwIDczIDc1IDYyIDcwIDAwIDAwIDAwIDAwIDcy
IDZmIDY3IDAwIHIxID0gMjkxMTQ0NTk5MDM2NTMyMzUgbGwKPj4gICAgICAgICAgMjogICAgICAg
N2IgMWEgZjggZmYgMDAgMDAgMDAgMDAgKih1NjQgKikocjEwIC0gOCkgPSByMQo+PiAgICAgICAg
ICAzOiAgICAgICBiZiBhMSAwMCAwMCAwMCAwMCAwMCAwMCByMSA9IHIxMAo+PiAgICAgICAgICA0
OiAgICAgICAwNyAwMSAwMCAwMCBmOCBmZiBmZiBmZiByMSArPSAtOAo+PiAgICAgICAgICA1OiAg
ICAgICBiNyAwMiAwMCAwMCAwOCAwMCAwMCAwMCByMiA9IDgKPj4gICAgICAgICAgNjogICAgICAg
ODUgMDAgMDAgMDAgMDYgMDAgMDAgMDAgY2FsbCA2Cj4+ICAgICAgICAgIDc6ICAgICAgIDk1IDAw
IDAwIDAwIDAwIDAwIDAwIDAwIGV4aXQKPj4gRGlzYXNzZW1ibHkgb2Ygc2VjdGlvbiByYXdfdHAv
c3lzX2VudGVyOgo+PiAwMDAwMDAwMDAwMDAwMDAwIDxlbnRyeT46Cj4+ICAgICAgICAgIDA6ICAg
ICAgIDg1IDEwIDAwIDAwIGZmIGZmIGZmIGZmIGNhbGwgLTEKPj4gICAgICAgICAgMTogICAgICAg
YjcgMDAgMDAgMDAgMDAgMDAgMDAgMDAgcjAgPSAwCj4+ICAgICAgICAgIDI6ICAgICAgIDk1IDAw
IDAwIDAwIDAwIDAwIDAwIDAwIGV4aXQKPj4KPj4ga2VybmVsIHByaW50IG1lc3NhZ2U6Cj4+IFsg
IDU4MC43NzUzODddIGZsZW49OCBwcm9nbGVuPTUxIHBhc3M9MyBpbWFnZT1mZmZmZmZmZmEwMDBj
MjBjIGZyb209a3Byb2JlLWxvYWQgcGlkPTE2NDMKPj4gWyAgNTgwLjc3NzIzNl0gSklUIGNvZGU6
IDAwMDAwMDAwOiBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBj
Ywo+PiBbICA1ODAuNzc5MDM3XSBKSVQgY29kZTogMDAwMDAwMTA6IGNjIGNjIGNjIGNjIGNjIGNj
IGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjCj4+IFsgIDU4MC43ODA3NjddIEpJVCBjb2Rl
OiAwMDAwMDAyMDogY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2Mg
Y2MKPj4gWyAgNTgwLjc4MjU2OF0gSklUIGNvZGU6IDAwMDAwMDMwOiBjYyBjYyBjYwo+Pgo+PiAk
IGJwZl9qaXRfZGlzYXNtCj4+IDUxIGJ5dGVzIGVtaXR0ZWQgZnJvbSBKSVQgY29tcGlsZXIgKHBh
c3M6MywgZmxlbjo4KQo+PiBmZmZmZmZmZmEwMDBjMjBjICsgPHg+Ogo+PiAgICAgIDA6ICAgaW50
Mwo+PiAgICAgIDE6ICAgaW50Mwo+PiAgICAgIDI6ICAgaW50Mwo+PiAgICAgIDM6ICAgaW50Mwo+
PiAgICAgIDQ6ICAgaW50Mwo+PiAgICAgIDU6ICAgaW50Mwo+PiAgICAgIC4uLgo+Pgo+PiBVbnRp
bCBicGZfaml0X2JpbmFyeV9wYWNrX2ZpbmFsaXplIGlzIGludm9rZWQsIHdlIGNvcHkgcndfaGVh
ZGVyIHRvIGhlYWRlcgo+PiBhbmQgdGhlbiBpbWFnZS9pbnNuIGlzIHZhbGlkLiBCVFcsIHdlIGNh
biB1c2UgdGhlICJicGZ0b29sIHByb2cgZHVtcCIgSklUZWQgaW5zdHJ1Y3Rpb25zLgo+IAo+IE5B
Q0suCj4gCj4gQmVjYXVzZSB0aGUgZmVhdHVyZSBpcyBidWdneSBvbiB4ODZfNjQsIHlvdSByZW1v
dmUgaXQgZm9yIGFsbAo+IGFyY2hpdGVjdHVyZXMgPwo+IAo+IE9uIHBvd2VycGMgYnBmX2ppdF9l
bmFibGUgPT0gMiB3b3JrcyBhbmQgaXMgdmVyeSB1c2VmdWxsLgo+IAo+IExhc3QgdGltZSBJIHRy
aWVkIHRvIHVzZSBicGZ0b29sIG9uIHBvd2VycGMvMzIgaXQgZGlkbid0IHdvcmsuIEkgZG9uJ3QK
PiByZW1lbWJlciB0aGUgZGV0YWlscywgSSB0aGluayBpdCB3YXMgYW4gaXNzdWUgd2l0aCBlbmRp
YW5lc3MuIE1heWJlIGl0Cj4gaXMgZml4ZWQgbm93LCBidXQgaXQgbmVlZHMgdG8gYmUgdmVyaWZp
ZWQuCj4gCj4gU28gcGxlYXNlLCBiZWZvcmUgcmVtb3ZpbmcgYSB3b3JraW5nIGFuZCB1c2VmdWxs
IGZlYXR1cmUsIG1ha2Ugc3VyZQo+IHRoZXJlIGlzIGFuIGFsdGVybmF0aXZlIGF2YWlsYWJsZSB0
byBpdCBmb3IgYWxsIGFyY2hpdGVjdHVyZXMgaW4gYWxsCj4gY29uZmlndXJhdGlvbnMuCj4gCj4g
QWxzbywgSSBkb24ndCB0aGluayBicGZ0b29sIGlzIHVzYWJsZSB0byBkdW1wIGtlcm5lbCBCUEYg
c2VsZnRlc3RzLgo+IFRoYXQncyB2aXRhbCB3aGVuIGEgc2VsZnRlc3QgZmFpbHMgaWYgeW91IHdh
bnQgdG8gaGF2ZSBhIGNoYW5jZSB0bwo+IHVuZGVyc3RhbmQgd2h5IGl0IGZhaWxzLgoKSWYgdGhp
cyBpcyBhY3RpdmVseSB1c2VkIGJ5IEpJVCBkZXZlbG9wZXJzIGFuZCBjb25zaWRlcmVkIHVzZWZ1
bCwgSSdkIGJlCm9rIHRvIGxlYXZlIGl0IGZvciB0aGUgdGltZSBiZWluZy4gT3ZlcmFsbCBnb2Fs
IGlzIHRvIHJlYWNoIGZlYXR1cmUgcGFyaXR5CmFtb25nIChhdCBsZWFzdCBtYWpvciBhcmNoKSBK
SVRzIGFuZCBub3QganVzdCBoYXZlIG1vc3QgZnVuY3Rpb25hbGl0eSBvbmx5CmF2YWlsYWJsZSBv
biB4ODYtNjQgSklULiBDb3VsZCB5b3UgaG93ZXZlciBjaGVjayB3aGF0IGlzIG5vdCB3b3JraW5n
IHdpdGgKYnBmdG9vbCBvbiBwb3dlcnBjLzMyPyBQZXJoYXBzIGl0J3Mgbm90IHRvbyBtdWNoIGVm
Zm9ydCB0byBqdXN0IGZpeCBpdCwKYnV0IGRldGFpbHMgd291bGQgYmUgdXNlZnVsIG90aGVyd2lz
ZSAnaXQgZGlkbid0IHdvcmsnIGlzIHRvbyBmdXp6eS4KCkFsc28sIHdpdGggcmVnYXJkcyB0byB0
aGUgbGFzdCBzdGF0ZW1lbnQgdGhhdCBicGZ0b29sIGlzIG5vdCB1c2FibGUgdG8KZHVtcCBrZXJu
ZWwgQlBGIHNlbGZ0ZXN0cy4gQ291bGQgeW91IGVsYWJvcmF0ZSBzb21lIG1vcmU/IEkgaGF2ZW4n
dCB1c2VkCmJwZl9qaXRfZW5hYmxlID09IDIgaW4gYSBsb25nIHRpbWUgYW5kIGZvciBkZWJ1Z2dp
bmcgYWx3YXlzIHJlbGllZCBvbgpicGZ0b29sIHRvIGR1bXAgeGxhdGVkIGluc25zIG9yIEpJVC4g
T3IgZG8geW91IG1lYW4gYnkgQlBGIHNlbGZ0ZXN0cwp0aGUgdGVzdF9icGYua28gbW9kdWxlPyBH
aXZlbiBpdCBoYXMgYSBiaWcgYmF0Y2ggd2l0aCBrZXJuZWwtb25seSB0ZXN0cywKdGhlcmUgSSBj
YW4gc2VlIGl0J3MgcHJvYmFibHkgc3RpbGwgdXNlZnVsLgoKQ2hlZXJzLApEYW5pZWwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
