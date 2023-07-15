Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D08EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 09:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUaoe7DRU2YVao+tR0tRZsbetWcAh1Dh8jxlxVubwDQ=; b=nEP9HLFtzat+N1
	Aqs7nf9HcKAPDrOsBJs9UciD/JhxEu3mER58eXyY1Aljecphz7VjwbZsM0S/5CuXt+CZ0pkZsEXof
	wOxfBVvO+lCkzplEM5EjdGZgiB2LWAe5RVi0VP4gjfUInybLVQdus1uXBqNJfXsOVB9PUeV7uUcXA
	OhDBEOHREnttNvLxC97i6RpKpo57FJSGhRY9NySv5g9AN71V1jI7eoTMJEmZOKOZNyo68zo/Icq/5
	DTPOxD7UNHb40NjgzxjJFEVk6gS/Ub1wvEsnnTdbyJVCqg1GplNMIo6Ds+EBiel9ixBF5I8BOyK2j
	qav6FjcancPXH0xTpyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKbIf-008GAh-2W;
	Sat, 15 Jul 2023 09:10:49 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKbIb-008G8o-1D
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 09:10:47 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R32Y96HpxztR8t;
	Sat, 15 Jul 2023 17:07:25 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 15 Jul 2023 17:10:27 +0800
Message-ID: <56a6a35c-7320-4569-71e3-c4daffee78f3@huawei.com>
Date: Sat, 15 Jul 2023 17:10:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH V11 0/5] riscv: Optimize function trace
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Song Shuai
	<suagrfillet@gmail.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <rostedt@goodmis.org>, <mhiramat@kernel.org>,
	<mark.rutland@arm.com>, <guoren@kernel.org>, <bjorn@rivosinc.com>,
	<jszhang@kernel.org>, <conor.dooley@microchip.com>, <palmer@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-trace-kernel@vger.kernel.org>, <songshuaishuai@tinylab.org>,
	<bpf@vger.kernel.org>
References: <20230627111612.761164-1-suagrfillet@gmail.com>
 <87jzv5q9tv.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <87jzv5q9tv.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500020.china.huawei.com (7.221.188.8)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_021046_262604_4A0B6FE0 
X-CRM114-Status: GOOD (  15.40  )
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

CgpPbiAyMDIzLzcvMTMgMjoxMSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBTb25nIFNodWFpIDxz
dWFncmZpbGxldEBnbWFpbC5jb20+IHdyaXRlczoKPiAKPiBbLi4uXQo+IAo+PiBBZGQgV0lUSF9E
SVJFQ1RfQ0FMTFMgc3VwcG9ydCBbM10gKHBhdGNoIDMsIDQpCj4+ID09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAKPiBXZSd2ZSBoYWQgc29tZSBvZmZsaXN0
IGRpc2N1c3Npb25zLCBzbyBoZXJlJ3Mgc29tZSBpbnB1dCBmb3IgYSB3aWRlcgo+IGF1ZGllbmNl
ISBNb3N0IGltcG9ydGFudGx5LCB0aGlzIGlzIGZvciBQYWxtZXIsIHNvIHRoYXQgdGhpcyBzZXJp
ZXMgaXMKPiBub3QgbWVyZ2VkIHVudGlsIGEgcHJvcGVyIEJQRiB0cmFtcG9saW5lIGZpeCBpcyBp
biBwbGFjZS4KPiAKPiBOb3RlIHRoYXQgd2hhdCdzIGN1cnJlbnRseSB1c2FibGUgZnJvbSBCUEYg
dHJhbXBvbGluZSAqd29ya3MqLiBJdCdzCj4gd2hlbiB0aGlzIHNlcmllcyBpcyBhZGRlZCB0aGF0
IGl0IGJyZWFrcy4KPiAKPiBUTDtEUiBUaGlzIHNlcmllcyBhZGRzIERZTkFNSUNfRlRSQUNFX1dJ
VEhfRElSRUNUX0NBTExTLCB3aGljaCBlbmFibGVzCj4gZmVudHJ5L2ZleGl0IEJQRiB0cmFtcG9s
aW5lIHN1cHBvcnQuIFVuZm9ydHVuYXRlbHkgdGhlCj4gZmV4aXQvQlBGX1RSQU1QX0ZfU0tJUF9G
UkFNRSBwYXJ0cyBvZiB0aGUgUlYgQlBGIHRyYW1wb2xpbmUgYnJlYWtzCj4gd2l0aCB0aGlzIGFk
ZGl0aW9uLCBhbmQgbmVlZCB0byBiZSBhZGRyZXNzZWQgKnByaW9yKiBtZXJnaW5nIHRoaXMKPiBz
ZXJpZXMuIEFuIGVhc3kgd2F5IHRvIHJlcHJvZHVjZSwgaXMganVzdCBjYWxsaW5nIGFueSBvZiB0
aGUga3NlbGZ0ZXN0Cj4gdGVzdHMgdGhhdCB1c2VzIGZleGl0IHBhdGNoaW5nLgo+IAo+IFRoZSBp
c3N1ZSBpcyBhcm91bmQgdGhlIG5vcCBzZWxkLCBhbmQgaG93IGEgY2FsbCBpcyBkb25lOyBUaGUg
bm9wIHNsZWQKPiAocGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5KSBzaXplIGNoYW5nZWQgZnJvbSAx
NkIgdG8gOEIgaW4gY29tbWl0Cj4gNjcyNGE3NmNmZjg1ICgicmlzY3Y6IGZ0cmFjZTogUmVkdWNl
IHRoZSBkZXRvdXIgY29kZSBzaXplIHRvIGhhbGYiKSwgYnV0Cj4gQlBGIGNvZGUgc3RpbGwgdXNl
cyB0aGUgb2xkIDE2Qi4gU28gaXQnbGwgd29yayBmb3IgQlBGIHByb2dyYW1zLCBidXQgbm90Cj4g
Zm9yIHJlZ3VsYXIga2VybmVsIGZ1bmN0aW9ucy4KPiAKPiBBbiBleGFtcGxlOgo+IAo+ICAgIHwg
ZmZmZmZmZmY4MGZhNDE1MCA8YnBmX2ZlbnRyeV90ZXN0MT46Cj4gICAgfCBmZmZmZmZmZjgwZmE0
MTUwOiAgICAgICAwMDAxICAgICAgICAgICAgICAgICAgICBub3AKPiAgICB8IGZmZmZmZmZmODBm
YTQxNTI6ICAgICAgIDAwMDEgICAgICAgICAgICAgICAgICAgIG5vcAo+ICAgIHwgZmZmZmZmZmY4
MGZhNDE1NDogICAgICAgMDAwMSAgICAgICAgICAgICAgICAgICAgbm9wCj4gICAgfCBmZmZmZmZm
ZjgwZmE0MTU2OiAgICAgICAwMDAxICAgICAgICAgICAgICAgICAgICBub3AKPiAgICB8IGZmZmZm
ZmZmODBmYTQxNTg6ICAgICAgIDExNDEgICAgICAgICAgICAgICAgICAgIGFkZCAgICAgc3Asc3As
LTE2Cj4gICAgfCBmZmZmZmZmZjgwZmE0MTVhOiAgICAgICBlNDIyICAgICAgICAgICAgICAgICAg
ICBzZCAgICAgIHMwLDgoc3ApCj4gICAgfCBmZmZmZmZmZjgwZmE0MTVjOiAgICAgICAwODAwICAg
ICAgICAgICAgICAgICAgICBhZGQgICAgIHMwLHNwLDE2Cj4gICAgfCBmZmZmZmZmZjgwZmE0MTVl
OiAgICAgICA2NDIyICAgICAgICAgICAgICAgICAgICBsZCAgICAgIHMwLDgoc3ApCj4gICAgfCBm
ZmZmZmZmZjgwZmE0MTYwOiAgICAgICAyNTA1ICAgICAgICAgICAgICAgICAgICBhZGR3ICAgIGEw
LGEwLDEKPiAgICB8IGZmZmZmZmZmODBmYTQxNjI6ICAgICAgIDAxNDEgICAgICAgICAgICAgICAg
ICAgIGFkZCAgICAgc3Asc3AsMTYKPiAgICB8IGZmZmZmZmZmODBmYTQxNjQ6ICAgICAgIDgwODIg
ICAgICAgICAgICAgICAgICAgIHJldAo+IAo+IGlzIHBhdGNoZWQgdG86Cj4gCj4gICAgfCBmZmZm
ZmZmZjgwZmE0MTUwOiAgZjcwYzAyOTcgICAgICAgICAgICAgICAgICAgICBhdWlwYyAgIHQwLC0x
NTAyMDg1MTIKPiAgICB8IGZmZmZmZmZmODBmYTQxNTQ6ICBlYjAyODJlNyAgICAgICAgICAgICAg
ICAgICAgIGphbHIgICAgdDAsdDAsLTMzNgo+IAo+IFRoZSByZXR1cm4gYWRkcmVzcyB0byBicGZf
ZmVudHJ5X3Rlc3QxIGlzIHN0b3JlZCBpbiB0MCBhdCBCUEYKPiB0cmFtcG9saW5lIGVudHJ5LiBS
ZXR1cm4gdG8gdGhlICpwYXJlbnQqIGlzIGluIHJhLiBUaGUgdHJhbXBsaW5lIGhhcwo+IHRvIGRl
YWwgd2l0aCB0aGlzLgo+IAo+IEZvciBCUEZfVFJBTVBfRl9TS0lQX0ZSQU1FL0NBTExfT1JJRywg
dGhlIEJQRiB0cmFtcG9saW5lIHdpbGwgc2tpcCB0b28KPiBtYW55IGJ5dGVzLCBhbmQgbm90IGNv
cnJlY3RseSBoYW5kbGUgcGFyZW50IGNhbGxzLgo+IAo+IEZ1cnRoZXI7IFRoZSBCUEYgdHJhbXBv
bGluZSBjdXJyZW50bHkgaGFzIGEgZGlmZmVyZW50IHdheSBvZiBwYXRjaGluZwo+IHRoZSBub3Bz
IGZvciBCUEYgcHJvZ3JhbXMsIHRoYW4gd2hhdCBmdHJhY2UgZG9lcy4gVGhhdCBzaG91bGQgYmUg
Y2hhbmdlZAo+IHRvIG1hdGNoIHdoYXQgZnRyYWNlIGRvZXMgKGF1aXBjL2phbHIgdDApLgo+IAo+
IFRvIHN1bW1hcml6ZToKPiAgICogQWxpZ24gQlBGIG5vcCBzbGVkIHdpdGggcGF0Y2hhYmxlLWZ1
bmN0aW9uLWVudHJ5OiA4Qi4KPiAgICogQWRhcHQgQlBGIHRyYW1wb2xpbmUgZm9yIDhCIG5vcCBz
bGVkcy4KPiAgICogQWRhcHQgQlBGIHRyYW1wb2xpbmUgdDAgcmV0dXJuLCByYSBwYXJlbnQgc2No
ZW1lLgo+IAoKVGhhbmtzIEJqw7ZybiwgSSBtYWtlIGEgYWRhcHRhdGlvbiBhcyBmb2xsb3dzLCBs
b29raW5nIGZvcndhcmQgdG8geW91ciAKcmV2aWV3LgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YnBmLzIwMjMwNzE1MDkwMTM3LjIxNDEzNTgtMS1wdWxlaHVpQGh1YXdlaWNsb3VkLmNvbS8KCj4g
Cj4gQ2hlZXJzLAo+IEJqw7Zybgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
