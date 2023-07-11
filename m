Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C55EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 17:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVzHJVFVV34P5na9CkEKqPSEUYDQf9ds2grXnWcv+yY=; b=qpA1vFFtx2teQ0
	Ovc8Qq2Ua0Z+3tix8Qvi49uhGcGlrj4pAjhhBA3X8ie0nSPyzprJmBGiXbN6OUJGTnu/CD76CKsOu
	05pcpMkiQFh+cYF5wWmjWPfsn4EXLJRNi4s0B6RyefkW1XC2mu78YYeSPnzVMhU/QBch2Ab7CIFgP
	NPZIuHYrtHZPUS3coit/8uR6Kzu8cmabNsb3pgsXgBlLwpB2F6joKAecvY1KthIu0eZf9s7idwKZm
	JoUNokjKmUNPVy8W4QTLFMYGrAiYLk+IsTeFRftT8rAcovXHRleCg1qLI9p+7xK/gVrHnoxI3s1j3
	wFHeJS5f/dVgURNnRzPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJHFP-00FYjy-1l;
	Tue, 11 Jul 2023 17:33:59 +0000
Received: from 17.mo584.mail-out.ovh.net ([46.105.41.16])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJHFM-00FYjS-0a
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 17:33:58 +0000
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.4.132])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id D5724270F0
	for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 17:33:51 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-l5klt (unknown [10.110.171.34])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 602A01FD37;
	Tue, 11 Jul 2023 17:33:51 +0000 (UTC)
Received: from courmont.net ([37.59.142.107])
	by ghost-submission-6684bf9d7b-l5klt with ESMTPSA
	id WdOxEn+SrWTPKC4Auh2lqg
	(envelope-from <remi@remlab.net>); Tue, 11 Jul 2023 17:33:51 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-107S001ecf9f6e3-4f29-4dc6-a688-e1e232be3982,
                    BD5993DD31A8D185A8BDB9FDB50A3FED214DC06B) smtp.auth=postmaster@courmont.net
X-OVh-ClientIp: 87.92.194.88
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/12] riscv: Add vector extension XOR implementation
Date: Tue, 11 Jul 2023 20:33:50 +0300
Message-ID: <2289969.yH7iMFiWxO@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20230711153743.1970625-3-heiko@sntech.de>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230711153743.1970625-3-heiko@sntech.de>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10556156052126767579
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrfedtgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvffufffkohgjfhgggfgtsehtqhertddttdejnecuhfhrohhmpeftrohmihcuffgvnhhishdqvehouhhrmhhonhhtuceorhgvmhhisehrvghmlhgrsgdrnhgvtheqnecuggftrfgrthhtvghrnheptdetleevudfgtdevleeuhfffgeehvdevieetvdektdegtdekvedvhfegkeehhfdunecuffhomhgrihhnpeigohhrrdhssgdprhgvmhhlrggsrdhnvghtnecukfhppeduvdejrddtrddtrddupdekjedrledvrdduleegrdekkedpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrvghmihesrhgvmhhlrggsrdhnvghtqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_103356_515658_14FE7311 
X-CRM114-Status: GOOD (  10.32  )
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

TGUgdGlpc3RhaW5hIDExLiBoZWluw6RrdXV0YSAyMDIzLCAxOC4zNy4zMyBFRVNUIEhlaWtvIFN0
dWVibmVyIGEgw6ljcml0IDoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9saWIveG9yLlMgYi9h
cmNoL3Jpc2N2L2xpYi94b3IuUwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMDAwLi4zYmMwNTllMTgxNzEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9yaXNjdi9s
aWIveG9yLlMKPiBAQCAtMCwwICsxLDgxIEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9yLWxhdGVyICovCj4gKy8qCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMSBTaUZp
dmUKPiArICovCj4gKyNpbmNsdWRlIDxsaW51eC9saW5rYWdlLmg+Cj4gKyNpbmNsdWRlIDxhc20t
Z2VuZXJpYy9leHBvcnQuaD4KPiArI2luY2x1ZGUgPGFzbS9hc20uaD4KPiArCj4gK0VOVFJZKHhv
cl9yZWdzXzJfKQo+ICsJdnNldHZsaSBhMywgYTAsIGU4LCBtOCwgdGEsIG1hCgpBRkFJQ1QsIHNv
IGZhciwgTGludXggb25seSB1c2VzIGB2c2V0dmxpYCB0byBzYXZlL3Jlc3RvcmUvZmx1c2ggdmVj
dG9ycywgYW5kIAp0aGF0J3MsIG9mIGNvdXJzZSwgd2l0aCBMTVVMPTgsIHNvIHRoYXQncyBub3Qg
cmVhbGx5IHRlbGxpbmcgbXVjaCBhbnl0aGluZy4gClRoaXMgZnVuY3Rpb24gY291bGQgYmUgdGhl
IGZpcnN0IGFjdHVhbCB2ZWN0b3Igb3B0aW1pc2F0aW9uIGluIGtlcm5lbCBpZi93aGVuIAppdCBn
ZXRzIG1lcmdlZC4KClNob3VsZCB0aGUgc2FtZSBncm91cCBtdWx0aXBsaWVyIGJlIHVzZWQgZm9y
ICJhY3R1YWwiIHZlY3RvciBsb29wcyB0aHJvdWdob3V0IAp0aGUga2VybmVsPyBJJ3ZlIHNlZW4g
Y29uZmxpY3RpbmcgYWR2aXNlcyBvciBvcGluaW9ucyBoZXJlLiBTaG91bGQga2VybmVsIGNvZGUg
CmFsd2F5cyB1c2UgdGhlIG1heGltdW0gcG9zc2libGUgTE1VTCwgZGVwZW5kaW5nIG9uIHJlZ2lz
dGVyIHByZXNzdXJlIG9mIHRoZSAKbG9vcD8gT3Igd2lsbCB0aGF0IGp1c3QgaW5jcmVhc2UgbGF0
ZW5jeSB3aXRoIG5vIGJhbmR3aWR0aCBnYWlucyBjb21wYXJlZCB0bywgCnNheSwgTE1VTD0xIG9y
IExNVUw9Mj8KCj4gKwl2bGU4LnYgdjAsIChhMSkKPiArCXZsZTgudiB2OCwgKGEyKQo+ICsJc3Vi
IGEwLCBhMCwgYTMKPiArCXZ4b3IudnYgdjE2LCB2MCwgdjgKPiArCWFkZCBhMiwgYTIsIGEzCj4g
Kwl2c2U4LnYgdjE2LCAoYTEpCj4gKwlhZGQgYTEsIGExLCBhMwo+ICsJYm5leiBhMCwgeG9yX3Jl
Z3NfMl8KPiArCXJldAo+ICtFTkQoeG9yX3JlZ3NfMl8pCj4gK0VYUE9SVF9TWU1CT0woeG9yX3Jl
Z3NfMl8pCj4gKwo+ICtFTlRSWSh4b3JfcmVnc18zXykKPiArCXZzZXR2bGkgYTQsIGEwLCBlOCwg
bTgsIHRhLCBtYQo+ICsJdmxlOC52IHYwLCAoYTEpCj4gKwl2bGU4LnYgdjgsIChhMikKPiArCXN1
YiBhMCwgYTAsIGE0Cj4gKwl2eG9yLnZ2IHYwLCB2MCwgdjgKPiArCXZsZTgudiB2MTYsIChhMykK
PiArCWFkZCBhMiwgYTIsIGE0Cj4gKwl2eG9yLnZ2IHYxNiwgdjAsIHYxNgo+ICsJYWRkIGEzLCBh
MywgYTQKPiArCXZzZTgudiB2MTYsIChhMSkKPiArCWFkZCBhMSwgYTEsIGE0Cj4gKwlibmV6IGEw
LCB4b3JfcmVnc18zXwo+ICsJcmV0Cj4gK0VORCh4b3JfcmVnc18zXykKPiArRVhQT1JUX1NZTUJP
TCh4b3JfcmVnc18zXykKPiArCj4gK0VOVFJZKHhvcl9yZWdzXzRfKQo+ICsJdnNldHZsaSBhNSwg
YTAsIGU4LCBtOCwgdGEsIG1hCj4gKwl2bGU4LnYgdjAsIChhMSkKPiArCXZsZTgudiB2OCwgKGEy
KQo+ICsJc3ViIGEwLCBhMCwgYTUKPiArCXZ4b3IudnYgdjAsIHYwLCB2OAo+ICsJdmxlOC52IHYx
NiwgKGEzKQo+ICsJYWRkIGEyLCBhMiwgYTUKPiArCXZ4b3IudnYgdjAsIHYwLCB2MTYKPiArCXZs
ZTgudiB2MjQsIChhNCkKPiArCWFkZCBhMywgYTMsIGE1Cj4gKwl2eG9yLnZ2IHYxNiwgdjAsIHYy
NAo+ICsJYWRkIGE0LCBhNCwgYTUKPiArCXZzZTgudiB2MTYsIChhMSkKPiArCWFkZCBhMSwgYTEs
IGE1Cj4gKwlibmV6IGEwLCB4b3JfcmVnc180Xwo+ICsJcmV0Cj4gK0VORCh4b3JfcmVnc180XykK
PiArRVhQT1JUX1NZTUJPTCh4b3JfcmVnc180XykKPiArCj4gK0VOVFJZKHhvcl9yZWdzXzVfKQo+
ICsJdnNldHZsaSBhNiwgYTAsIGU4LCBtOCwgdGEsIG1hCj4gKwl2bGU4LnYgdjAsIChhMSkKPiAr
CXZsZTgudiB2OCwgKGEyKQo+ICsJc3ViIGEwLCBhMCwgYTYKPiArCXZ4b3IudnYgdjAsIHYwLCB2
OAo+ICsJdmxlOC52IHYxNiwgKGEzKQo+ICsJYWRkIGEyLCBhMiwgYTYKPiArCXZ4b3IudnYgdjAs
IHYwLCB2MTYKPiArCXZsZTgudiB2MjQsIChhNCkKPiArCWFkZCBhMywgYTMsIGE2Cj4gKwl2eG9y
LnZ2IHYwLCB2MCwgdjI0Cj4gKwl2bGU4LnYgdjgsIChhNSkKPiArCWFkZCBhNCwgYTQsIGE2Cj4g
Kwl2eG9yLnZ2IHYxNiwgdjAsIHY4Cj4gKwlhZGQgYTUsIGE1LCBhNgo+ICsJdnNlOC52IHYxNiwg
KGExKQo+ICsJYWRkIGExLCBhMSwgYTYKPiArCWJuZXogYTAsIHhvcl9yZWdzXzVfCj4gKwlyZXQK
PiArRU5EKHhvcl9yZWdzXzVfKQo+ICtFWFBPUlRfU1lNQk9MKHhvcl9yZWdzXzVfKQoKCi0tIArj
g6zjg5/jg7vjg4fjg4st44Kv44O844Or44Oi44OzCmh0dHA6Ly93d3cucmVtbGFiLm5ldC8KCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
