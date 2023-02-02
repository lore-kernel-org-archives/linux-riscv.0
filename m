Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9BFC636CD
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 00:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jnKJ0xDArMqB158d/4cOEFrsRFnHJLBV6vMVC97+8Oc=; b=B+L7Fu/Eia1PFg
	x+/wKBfBQiGQqahX5qnBwZr/U/Vtcpc/11MoNw12A5Ys7je7oxPrekYsHDKKj6EzbUiOqMneIBU2H
	Wk81E+ypXWEhBAk5mRo1LZM95NcX1i5O32XDDHDcBH7p65epXUzTEfmf9Eh35CaAIdUdN3Yz4FL6P
	+/YAAXng9049p+R7iJoo0IQACD9owrs5MqDRw0poD+P2SiW85eM6Jnp5/ht06AivblFooZesqDbrM
	vz8e2TeoQQcFe0+fdT3wPo2uQTopejioffca8SCVX3UhmtV5dEgiDGx5208dRI4FqH4Al/3hz5+EO
	a0iKz2Bgdsz6xsv7b/NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNNqM-00E0Ie-BG; Thu, 02 Feb 2023 00:52:50 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNNqJ-00E0Hp-6s
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 00:52:49 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4P6gBK2FbQzJqqg;
	Thu,  2 Feb 2023 08:48:09 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 2 Feb 2023 08:52:38 +0800
Message-ID: <f161df27-f2d7-0367-33a0-9ff5e4b880d9@huawei.com>
Date: Thu, 2 Feb 2023 08:52:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] riscv: Add header include guards to insn.h
To: Conor Dooley <conor.dooley@microchip.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<heiko.stuebner@vrull.eu>, <ajones@ventanamicro.com>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, <jszhang@kernel.org>,
	<vincent.chen@sifive.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>
References: <20230129094242.282620-1-liaochang1@huawei.com>
 <Y9fZ2ZxdMmXgO5aB@wendy> <9a4f98a7-fa03-7960-29ce-0bff018c0ac9@huawei.com>
 <Y9o0Bv7VBM74ePHH@wendy>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <Y9o0Bv7VBM74ePHH@wendy>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_165247_606882_C5C995FD 
X-CRM114-Status: GOOD (  18.38  )
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

CgrlnKggMjAyMy8yLzEgMTc6NDIsIENvbm9yIERvb2xleSDlhpnpgZM6Cj4gSGksCj4gCj4gT24g
V2VkLCBGZWIgMDEsIDIwMjMgYXQgMDU6Mzc6MjRQTSArMDgwMCwgbGlhb2NoYW5nIChBKSB3cm90
ZToKPj4g5ZyoIDIwMjMvMS8zMCAyMjo1MywgQ29ub3IgRG9vbGV5IOWGmemBkzoKPj4+IE9uIFN1
biwgSmFuIDI5LCAyMDIzIGF0IDA1OjQyOjQyUE0gKzA4MDAsIExpYW8gQ2hhbmcgd3JvdGU6Cj4+
Pj4gQWRkIGhlYWRlciBpbmNsdWRlIGd1YXJkcyB0byBpbnNuLmggdG8gcHJldmVudCByZXBlYXRp
bmcgZGVjbGFyYXRpb24gb2YKPj4+PiBhbnkgaWRlbnRpZmllcnMgaW4gaW5zbi5oLgo+Pj4KPj4+
IEknbSBjdXJpb3VzLCBkaWQgeW91IHNwb3QgdGhpcyAiYnkgaGFuZCIgd2hpbGUgZG9pbmcgb3Ro
ZXIgd29yaywgb3IgZG8KPj4+IHlvdSBoYXZlIGEgdG9vbCB0aGF0IGZvdW5kIGl0IGZvciB5b3U/
Cj4+Cj4+IEkgZm91bmQgdGhpcyAiYnkgaGFuZCIsIGluc3BpcmVkIGJ5IHNjcmlwdHMvY2hlY2tk
ZWNsYXJlcy5wbCwgaSB3cml0ZSBhIHRpbnkgdG9vbAo+PiB0byBhbmFseXNlIHRoZSBtaXNzaW5n
IGhlYWRlciBndWFyZHMgaW4gaGVhZGVyIGZpbGUuCj4gCj4gT2hoLCBjb29sISBJJ2QgbG92ZSB0
byBhZGQgdGhpcyBvbmUgdG8gdGhlIGNoZWNrcyBvbiBwYXRjaHdvcmsgc28gdGhhdAo+IHdlIGRv
IG5vdCBlbmQgdXAgYWRkaW5nIGFueSBtb3JlIG9mIHRoZXNlLiBJZiB0aGlzIGlzIGJhc2VkIG9u
Cj4gY2hlY2tkZWNsYXJlcywgaXMgaXQgR1BMdjI/CgpEZWZpbml0ZWx5LCBpdCBpcyBHUEx2Mixp
IHdpbGwgYXBwZW5kaW5nIGxpY2VuY2UgaWRlbnRpZmllciBhbmQgY29weXJpZ2h0IGluZm8gbGF0
ZXIuCgpIae+8jEBKb2UgUGVyY2hlcywgaXMgaXQgb2sgdG8gaW50ZWdyYXRlIHRoaXMgdG9vbCB0
byBzY3JpcHRzPwoKVGhhbmtzLgoKPiAKPiBUaGFua3MhCj4gCj4+Cj4+ICMhL3Vzci9iaW4vZW52
IHBlcmwKPj4gdXNlIHN0cmljdDsKPj4KPj4gc3ViIHVzYWdlIHsKPj4gICAgICAgICBwcmludCAi
VXNhZ2U6IGNoZWNrZ3VhcmRzLnBsIGZpbGUxLmggLi4uXG4iOwo+PiAgICAgICAgIHByaW50ICJX
YXJuIG9mIG1pc3NpbmcgaGVhZGVyIGd1YXJkc1xuIjsKPj4gICAgICAgICBleGl0IDE7Cj4+IH0K
Pj4KPj4gaWYgKCQjQVJHViA8IDApIHsKPj4gICAgICAgICB1c2FnZSgpOwo+PiB9Cj4+Cj4+IGZv
cmVhY2ggbXkgJGZpbGUgKEBBUkdWKSB7Cj4+ICAgICAgICAgb3BlbihteSAkZiwgJzwnLCAkZmls
ZSkKPj4gICAgICAgICAgICAgb3IgZGllICJDYW5ub3Qgb3BlbiAkZmlsZTogJCEuXG4iOwo+Pgo+
PiAgICAgICAgIG15ICRzY2FuX2FyZWEgPSAxOwo+PiAgICAgICAgIG15ICRndWFyZHNfd2FybiA9
IDA7Cj4+Cj4+ICAgICAgICAgIyBUaGUgbGluZXMgb2YgaGVhZGVyIGZpbGUgYXJlIGRpdmlkZWQg
aW50byBzZXZlcmFsIGFyZWFzIGFzIGZvbGxvd3M6Cj4+ICAgICAgICAgIwo+PiAgICAgICAgICMg
Li4uIGFyZWExIC4uLgo+PiAgICAgICAgICMgI2lmbmRlZiBfSEVBREVSX0dVQVJECj4+ICAgICAg
ICAgIyAuLi4gYXJlYTIgLi4uCj4+ICAgICAgICAgIyAjZGVmaW5lIF9IRUFERVJfR1VBUkQKPj4g
ICAgICAgICAjIC4uLiBhcmVhMyAuLi4KPj4gICAgICAgICAjICNlbmRpZiAvKiBfSEVBREVSX0dV
QVJEICovCj4+ICAgICAgICAgIyAuLi4gYXJlYTQgLi4uCj4+ICAgICAgICAgIyBFT0YKPj4gICAg
ICAgICAjCj4+ICAgICAgICAgIyBJZiBhbnkgc3RhdGVtZW50IGlzIGZvdW5kIGluIGFyZWExLCBh
cmVhMiwgYW5kIGFyZWE0LCBpdAo+PiAgICAgICAgICMgdGhyb3dzIGEgd2FybmluZyBvZiBpbGxl
Z2FsIHVzYWdlIG9mIGhlYWRlciBndWFyZCB1c2FnZS4KPj4gICAgICAgICB3aGlsZSAoPCRmPikg
ewo+PiAgICAgICAgICAgICAgICAgaWYgKG0vXiguKik7XHMqJC9vKSB7Cj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmICgkc2Nhbl9hcmVhID09IDEgfHwgJHNjYW5fYXJlYSA9PSAyIHx8ICRz
Y2FuX2FyZWEgPT0gNCkgewo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICsrJGd1
YXJkc193YXJuOwo+PiAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4+ICAgICAgICAgICAgICAg
ICB9IGVsc2lmIChtL15ccyooI2lmbmRlZlxzKylbYS16QS1aMC05X10qX0hbX10qXHMqJC9vKSB7
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICsrJHNjYW5fYXJlYTsKPj4gICAgICAgICAgICAg
ICAgIH0gZWxzaWYgKG0vXlxzKigjZGVmaW5lXHMrKVthLXpBLVowLTlfXSpfSFtfXSpccyokL28p
IHsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgKyskc2Nhbl9hcmVhOwo+PiAgICAgICAgICAg
ICAgICAgfSBlbHNpZiAobS9eXHMqKCNlbmRpZilccypcL1wqXHMqW2EtekEtWjAtOV9dKl9IW19d
KlxzKlwqXC9ccyokL28pIHsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgKyskc2Nhbl9hcmVh
Owo+PiAgICAgICAgICAgICAgICAgfQo+PiAgICAgICAgIH0KPj4KPj4gICAgICAgICBjbG9zZSgk
Zik7Cj4+Cj4+ICAgICAgICAgaWYgKCRndWFyZHNfd2Fybikgewo+PiAgICAgICAgICAgICAgICAg
cHJpbnQgIklsbGVnYWwgdXNhZ2Ugb2YgaGVhZGVyIGd1YXJkIGZvdW5kIGluICRmaWxlLlxuIjsK
Pj4gICAgICAgICB9Cj4+IH0KPj4KPj4gVGhhbmtzLgo+Pgo+Pj4KPj4+PiBGaXhlczogZWRkZTU1
ODRjN2FiICgicmlzY3Y6IEFkZCBTVyBzaW5nbGUtc3RlcCBzdXBwb3J0IGZvciBLREIiKQo+Pj4K
Pj4+IEhlaCwgSSBhcHByZWNpYXRlIHlvdSBnb2luZyBiYWNrIHRvIHRoZSBmaWxlJ3Mgb3JpZ2lu
YWwgbmFtZSB0byBmaW5kIHRoZQo+Pj4gY29ycmVjdCBmaXhlcyB0YWchCj4+PiBJIGZpZ3VyZSB0
aGF0IGl0J3MgcHJvYmFibHkgd29ydGggYWRkaW5nIGEgZml4ZXMgdGFnIGZvciB0aGUgcmVuYW1l
IHRvbywKPj4+IHNvIHRoYXQgdGhlIHN0YWJsZSBib3RzIGRvbid0IGdldCBjb25mdXNlZD8gVGhh
dCB3b3VsZCBiZToKPj4+IEZpeGVzOiBjOWMxYWYzZjE4NmEgKCJSSVNDLVY6IHJlbmFtZSBwYXJz
ZV9hc20uaCB0byBpbnNuLmgiKQo+Pj4KPj4+IFByb2JhYmx5IG92ZXJraWxsIHdoZW4geW91IGhh
dmUgRHJldydzIGFscmVhZHkgZm9yIHNvbWV0aGluZyBzbyB0cml2aWFsLAo+Pj4gYnV0Ogo+Pj4g
UmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4+
Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IExpYW8gQ2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4K
Pj4+PiAtLS0KPj4+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pbnNuLmggfCA0ICsrKysKPj4+
PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9p
bnNuLmgKPj4+PiBpbmRleCAyNWVmOWMwYjE5ZTcuLjIyYzc2MTNiZmRhMyAxMDA2NDQKPj4+PiAt
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24uaAo+Pj4+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaW5zbi5oCj4+Pj4gQEAgLTMsNiArMyw5IEBACj4+Pj4gICAqIENvcHlyaWdo
dCAoQykgMjAyMCBTaUZpdmUKPj4+PiAgICovCj4+Pj4gIAo+Pj4+ICsjaWZuZGVmIF9BU01fUklT
Q1ZfSU5TTl9ICj4+Pj4gKyNkZWZpbmUgX0FTTV9SSVNDVl9JTlNOX0gKPj4+PiArCj4+Pj4gICNp
bmNsdWRlIDxsaW51eC9iaXRzLmg+Cj4+Pj4gIAo+Pj4+ICAjZGVmaW5lIFJWX0lOU05fRlVOQ1Qz
X01BU0sJR0VOTUFTSygxNCwgMTIpCj4+Pj4gQEAgLTM2NSwzICszNjgsNCBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgcmlzY3ZfaW5zbl9pbnNlcnRfdXR5cGVfaXR5cGVfaW1tKHUzMiAqdXR5cGVfaW5z
biwgdTMyICppdHlwZQo+Pj4+ICAJKnV0eXBlX2luc24gfD0gKGltbSAmIFJWX1VfSU1NXzMxXzEy
X01BU0spICsgKChpbW0gJiBCSVQoMTEpKSA8PCAxKTsKPj4+PiAgCSppdHlwZV9pbnNuIHw9ICgo
aW1tICYgUlZfSV9JTU1fMTFfMF9NQVNLKSA8PCBSVl9JX0lNTV8xMV8wX09QT0ZGKTsKPj4+PiAg
fQo+Pj4+ICsjZW5kaWYgLyogX0FTTV9SSVNDVl9JTlNOX0ggKi8KPj4+PiAtLSAKPj4+PiAyLjI1
LjEKPj4+Pgo+Pj4+Cj4+Cj4+IC0tIAo+PiBCUiwKPj4gTGlhbywgQ2hhbmcKPj4KCi0tIApCUiwK
TGlhbywgQ2hhbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
