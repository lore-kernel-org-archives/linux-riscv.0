Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5FFC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WLtv1SbdvI+OWQVC3evCV298YvlNm4vL9+bGAC7sGw=; b=eumrw2j74ORg27
	l6/0ZXIYsqL5xvEaZIYbD125a7QIpVYSq5T34GCCuLS0AmXUUIrOToyi6qpqVG+DfTGqzDPwagow4
	HO6o6cDzK1UvhG8HG6v9ybHkC23S3azEihlobcsrinXwB8E+lHERlNQuYIrLREaWpwmkf56wyxl3j
	zzyuutuH/wjMrGdwB4ilAsy0tijnsts9QpJyRh1lGFo5Vorht2ofiE4EyGY9Ps8GVkRj4Nh5OGnFA
	S8q/REvc8kyzzi5ddeuxHBhq/dHLPDc4IfvYG9t6pauW8gSkcbwINkTz7pL5mvtm2cZA7+/MOFPci
	Svcfhe4cYWYMmjStZ/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXtf-00FdGm-Up; Thu, 02 Feb 2023 11:36:55 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXtb-00FdEy-VU
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 11:36:54 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4P6xZR2pcYzfYq9;
	Thu,  2 Feb 2023 19:36:31 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 2 Feb 2023 19:36:41 +0800
Message-ID: <8a87d19b-f612-0f5b-7a13-d3c42822313e@huawei.com>
Date: Thu, 2 Feb 2023 19:36:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] riscv: Add header include guards to insn.h
To: Joe Perches <joe@perches.com>, Conor Dooley <conor.dooley@microchip.com>,
	Andrew Morton <akpm@linux-foundation.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<heiko.stuebner@vrull.eu>, <ajones@ventanamicro.com>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, <jszhang@kernel.org>,
	<vincent.chen@sifive.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20230129094242.282620-1-liaochang1@huawei.com>
 <Y9fZ2ZxdMmXgO5aB@wendy> <9a4f98a7-fa03-7960-29ce-0bff018c0ac9@huawei.com>
 <Y9o0Bv7VBM74ePHH@wendy> <f161df27-f2d7-0367-33a0-9ff5e4b880d9@huawei.com>
 <38d7d022d6e88d643c8037e26707a719cb55ff1d.camel@perches.com>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <38d7d022d6e88d643c8037e26707a719cb55ff1d.camel@perches.com>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_033652_408525_09C0B8C5 
X-CRM114-Status: GOOD (  16.67  )
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

CgrlnKggMjAyMy8yLzIgMTE6MzMsIEpvZSBQZXJjaGVzIOWGmemBkzoKPiBPbiBUaHUsIDIwMjMt
MDItMDIgYXQgMDg6NTIgKzA4MDAsIGxpYW9jaGFuZyAoQSkgd3JvdGU6Cj4+Cj4+IOWcqCAyMDIz
LzIvMSAxNzo0MiwgQ29ub3IgRG9vbGV5IOWGmemBkzoKPj4+IEhpLAo+Pj4KPj4+IE9uIFdlZCwg
RmViIDAxLCAyMDIzIGF0IDA1OjM3OjI0UE0gKzA4MDAsIGxpYW9jaGFuZyAoQSkgd3JvdGU6Cj4+
Pj4g5ZyoIDIwMjMvMS8zMCAyMjo1MywgQ29ub3IgRG9vbGV5IOWGmemBkzoKPj4+Pj4gT24gU3Vu
LCBKYW4gMjksIDIwMjMgYXQgMDU6NDI6NDJQTSArMDgwMCwgTGlhbyBDaGFuZyB3cm90ZToKPj4+
Pj4+IEFkZCBoZWFkZXIgaW5jbHVkZSBndWFyZHMgdG8gaW5zbi5oIHRvIHByZXZlbnQgcmVwZWF0
aW5nIGRlY2xhcmF0aW9uIG9mCj4+Pj4+PiBhbnkgaWRlbnRpZmllcnMgaW4gaW5zbi5oLgo+Pj4+
Pgo+Pj4+PiBJJ20gY3VyaW91cywgZGlkIHlvdSBzcG90IHRoaXMgImJ5IGhhbmQiIHdoaWxlIGRv
aW5nIG90aGVyIHdvcmssIG9yIGRvCj4+Pj4+IHlvdSBoYXZlIGEgdG9vbCB0aGF0IGZvdW5kIGl0
IGZvciB5b3U/Cj4+Pj4KPj4+PiBJIGZvdW5kIHRoaXMgImJ5IGhhbmQiLCBpbnNwaXJlZCBieSBz
Y3JpcHRzL2NoZWNrZGVjbGFyZXMucGwsIGkgd3JpdGUgYSB0aW55IHRvb2wKPj4+PiB0byBhbmFs
eXNlIHRoZSBtaXNzaW5nIGhlYWRlciBndWFyZHMgaW4gaGVhZGVyIGZpbGUuCj4+Pgo+Pj4gT2ho
LCBjb29sISBJJ2QgbG92ZSB0byBhZGQgdGhpcyBvbmUgdG8gdGhlIGNoZWNrcyBvbiBwYXRjaHdv
cmsgc28gdGhhdAo+Pj4gd2UgZG8gbm90IGVuZCB1cCBhZGRpbmcgYW55IG1vcmUgb2YgdGhlc2Uu
IElmIHRoaXMgaXMgYmFzZWQgb24KPj4+IGNoZWNrZGVjbGFyZXMsIGlzIGl0IEdQTHYyPwo+Pgo+
PiBEZWZpbml0ZWx5LCBpdCBpcyBHUEx2MixpIHdpbGwgYXBwZW5kaW5nIGxpY2VuY2UgaWRlbnRp
ZmllciBhbmQgY29weXJpZ2h0IGluZm8gbGF0ZXIuCj4+Cj4+IEhp77yMQEpvZSBQZXJjaGVzLCBp
cyBpdCBvayB0byBpbnRlZ3JhdGUgdGhpcyB0b29sIHRvIHNjcmlwdHM/Cj4gCj4gRG9uJ3Qgc2Vl
IHdoeSBub3QuCj4gUGVyaGFwcyBzdWJtaXQgaXQgYXMgYSByZWFsIHBhdGNoIHRvIEFuZHJldyBN
b3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gCj4gVHJpdmlhbCBub3RlcyBiZWxv
dzoKPiAKPj4+PiAjIS91c3IvYmluL2VudiBwZXJsCj4+Pj4gdXNlIHN0cmljdDsKPj4+Pgo+Pj4+
IHN1YiB1c2FnZSB7Cj4+Pj4gICAgICAgICBwcmludCAiVXNhZ2U6IGNoZWNrZ3VhcmRzLnBsIGZp
bGUxLmggLi4uXG4iOwo+Pj4+ICAgICAgICAgcHJpbnQgIldhcm4gb2YgbWlzc2luZyBoZWFkZXIg
Z3VhcmRzXG4iOwo+Pj4+ICAgICAgICAgZXhpdCAxOwo+Pj4+IH0KPj4+Pgo+Pj4+IGlmICgkI0FS
R1YgPCAwKSB7Cj4+Pj4gICAgICAgICB1c2FnZSgpOwo+Pj4+IH0KPj4+Pgo+Pj4+IGZvcmVhY2gg
bXkgJGZpbGUgKEBBUkdWKSB7Cj4+Pj4gICAgICAgICBvcGVuKG15ICRmLCAnPCcsICRmaWxlKQo+
Pj4+ICAgICAgICAgICAgIG9yIGRpZSAiQ2Fubm90IG9wZW4gJGZpbGU6ICQhLlxuIjsKPj4+Pgo+
Pj4+ICAgICAgICAgbXkgJHNjYW5fYXJlYSA9IDE7Cj4+Pj4gICAgICAgICBteSAkZ3VhcmRzX3dh
cm4gPSAwOwo+Pj4+Cj4+Pj4gICAgICAgICAjIFRoZSBsaW5lcyBvZiBoZWFkZXIgZmlsZSBhcmUg
ZGl2aWRlZCBpbnRvIHNldmVyYWwgYXJlYXMgYXMgZm9sbG93czoKPj4+PiAgICAgICAgICMKPj4+
PiAgICAgICAgICMgLi4uIGFyZWExIC4uLgo+Pj4+ICAgICAgICAgIyAjaWZuZGVmIF9IRUFERVJf
R1VBUkQKPj4+PiAgICAgICAgICMgLi4uIGFyZWEyIC4uLgo+Pj4+ICAgICAgICAgIyAjZGVmaW5l
IF9IRUFERVJfR1VBUkQKPj4+PiAgICAgICAgICMgLi4uIGFyZWEzIC4uLgo+Pj4+ICAgICAgICAg
IyAjZW5kaWYgLyogX0hFQURFUl9HVUFSRCAqLwo+Pj4+ICAgICAgICAgIyAuLi4gYXJlYTQgLi4u
Cj4+Pj4gICAgICAgICAjIEVPRgo+Pj4+ICAgICAgICAgIwo+Pj4+ICAgICAgICAgIyBJZiBhbnkg
c3RhdGVtZW50IGlzIGZvdW5kIGluIGFyZWExLCBhcmVhMiwgYW5kIGFyZWE0LCBpdAo+Pj4+ICAg
ICAgICAgIyB0aHJvd3MgYSB3YXJuaW5nIG9mIGlsbGVnYWwgdXNhZ2Ugb2YgaGVhZGVyIGd1YXJk
IHVzYWdlLgo+IAo+IE5vdCBpbGxlZ2FsLCBpbnZhbGlkCj4gCj4+Pj4gICAgICAgICB3aGlsZSAo
PCRmPikgewo+Pj4+ICAgICAgICAgICAgICAgICBpZiAobS9eKC4qKTtccyokL28pIHsKPj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICBpZiAoJHNjYW5fYXJlYSA9PSAxIHx8ICRzY2FuX2FyZWEg
PT0gMiB8fCAkc2Nhbl9hcmVhID09IDQpIHsKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICsrJGd1YXJkc193YXJuOwo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIH0KPj4+
PiAgICAgICAgICAgICAgICAgfSBlbHNpZiAobS9eXHMqKCNpZm5kZWZccyspW2EtekEtWjAtOV9d
Kl9IW19dKlxzKiQvbykgewo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICsrJHNjYW5fYXJl
YTsKPj4+PiAgICAgICAgICAgICAgICAgfSBlbHNpZiAobS9eXHMqKCNkZWZpbmVccyspW2EtekEt
WjAtOV9dKl9IW19dKlxzKiQvbykgewo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICsrJHNj
YW5fYXJlYTsKPj4+PiAgICAgICAgICAgICAgICAgfSBlbHNpZiAobS9eXHMqKCNlbmRpZilccypc
L1wqXHMqW2EtekEtWjAtOV9dKl9IW19dKlxzKlwqXC9ccyokL28pIHsKPj4+PiAgICAgICAgICAg
ICAgICAgICAgICAgICArKyRzY2FuX2FyZWE7Cj4+Pj4gICAgICAgICAgICAgICAgIH0KPj4+PiAg
ICAgICAgIH0KPj4+Pgo+Pj4+ICAgICAgICAgY2xvc2UoJGYpOwo+Pj4+Cj4+Pj4gICAgICAgICBp
ZiAoJGd1YXJkc193YXJuKSB7Cj4+Pj4gICAgICAgICAgICAgICAgIHByaW50ICJJbGxlZ2FsIHVz
YWdlIG9mIGhlYWRlciBndWFyZCBmb3VuZCBpbiAkZmlsZS5cbiI7Cj4gCj4gaGVyZSB0b28KPiAK
PiBUaGVyZSBhcmUgYWxzbyB1c2VzIGxpa2UgI2lmICFkZWZpbmVkKEZPTykKPiBUaGVyZSBjYW4g
YmUgc3BhY2VzIGJlZm9yZSBhbmQgYWZ0ZXIgdGhlICMKPiAKPiBJdCBtaWdodCBhbHNvIGJlIHVz
ZWZ1bCB0byBoYXZlIGEgY2hlY2sgZm9yIG1pc3NpbmcgaGVhZGVyIGd1YXJkcy4KCk9LLCBpIHdp
bGwgdXNlIGEgc3RyaWN0ZXIgcGF0dGVybiBpbiB0aGUgcmVhbCBwYXRjaC4KClRoYW5rcy4KCj4g
Cj4gCj4gCj4gCgotLSAKQlIsCkxpYW8sIENoYW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
