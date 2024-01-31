Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78E6C48285
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 10:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8o2wDPnhNrWvbaP+m9tQvAnJ3uO3EqfhQDv/tVJuEw0=; b=ImhXAWtmD+jrOw
	OWgIB/blFd40AF6+cLb9y/YaopbPTKMJTk2qPwkZLfI7Q6nt0tjO3OqTXl0cIxwb0gvT75VwQ9QTq
	4E/nLMPkY+ZuMKK0f9qtPpIzU11vapkI3yiugUev/i0HWdj764iri1V9SE6i5aH+2QJxRFw80wyqE
	00jlpwYjhBTNwQdVTQ4fOFilkn9NDK66oj6m0Kkb/77l922EX2jM9IUHvBGb8CGcZ9PpAs26Kx8no
	cYhqTtjxoMkXyKkKQFwpLps1hIKhHVazBj2iBUWo0q+LwpTE00YHMQ1oqpt0hO0WRuGwJL149rDRr
	N1Emh2Oh9x4JYHkhV1vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV7sW-00000002p4T-2hwC;
	Wed, 31 Jan 2024 10:31:36 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV6kR-00000002PHf-0MR4
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 09:19:13 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4TPxL45PDCz4f3kjV
	for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 17:18:52 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id E480E1A016E
	for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 17:18:56 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP1 (Coremail) with SMTP id cCh0CgB3RxB_ELpldj8jCg--.58078S2;
	Wed, 31 Jan 2024 17:18:55 +0800 (CST)
Message-ID: <694648e8-09ce-4a1f-8c2c-db0c6c37da5d@huaweicloud.com>
Date: Wed, 31 Jan 2024 17:18:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 4/4] riscv, bpf: Mixing bpf2bpf and tailcalls
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Pu Lehui <pulehui@huawei.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>
References: <20230919035711.3297256-1-pulehui@huaweicloud.com>
 <20230919035711.3297256-5-pulehui@huaweicloud.com>
 <87lecqobyb.fsf@all.your.base.are.belong.to.us>
 <4e73b095-0c08-4a6f-b2ee-8f7a071b14ee@huaweicloud.com>
 <87cytjusud.fsf@all.your.base.are.belong.to.us>
 <5d776261-338b-4ebb-bb9b-1dbc91cd06c3@huawei.com>
 <87zfwnympo.fsf@all.your.base.are.belong.to.us>
 <5a30caa3-3351-41e7-a77f-91e5959b2da6@huawei.com>
 <87le86q04a.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <87le86q04a.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: cCh0CgB3RxB_ELpldj8jCg--.58078S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKrWrtF4DCF4fur18JFWkJFb_yoW7AF1DpF
	W3X3W7Kr4kXr1Iyr12yF18Xay0kr47JryUZr1rtr1rAr1q9r1qgF4xGF4j9FyxAr18Kr1U
	Zr4jqrW3Zw18JaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
	AIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
	aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUbG2NtUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_011911_502918_22208A18 
X-CRM114-Status: GOOD (  20.55  )
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

CgpPbiAyMDI0LzEvMzEgMDowMywgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBQdSBMZWh1aSA8cHVs
ZWh1aUBodWF3ZWkuY29tPiB3cml0ZXM6Cj4gCj4+IE9uIDIwMjQvMS8zMCAyMToyOCwgQmrDtnJu
IFTDtnBlbCB3cm90ZToKPj4+IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+IHdyaXRlczoK
Pj4+Cj4+Pj4gT24gMjAyNC8xLzMwIDE2OjI5LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+Pj4+PiBQ
dSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRlczoKPj4+Pj4KPj4+Pj4+IE9u
IDIwMjMvOS8yOCAxNzo1OSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4+Pj4+PiBQdSBMZWh1aSA8
cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRlczoKPj4+Pj4+Pgo+Pj4+Pj4+PiBGcm9tOiBQ
dSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJbiB0aGUgY3Vy
cmVudCBSVjY0IEpJVCwgaWYgd2UganVzdCBkb24ndCBpbml0aWFsaXplIHRoZSBUQ0MgaW4gc3Vi
cHJvZywKPj4+Pj4+Pj4gdGhlIFRDQyBjYW4gYmUgcHJvcGFnYXRlZCBmcm9tIHRoZSBwYXJlbnQg
cHJvY2VzcyB0byB0aGUgc3VicHJvY2VzcywgYnV0Cj4+Pj4+Pj4+IHRoZSBUQ0Mgb2YgdGhlIHBh
cmVudCBwcm9jZXNzIGNhbm5vdCBiZSByZXN0b3JlZCB3aGVuIHRoZSBzdWJwcm9jZXNzCj4+Pj4+
Pj4+IGV4aXRzLiBTaW5jZSB0aGUgUlY2NCBUQ0MgaXMgaW5pdGlhbGl6ZWQgYmVmb3JlIHNhdmlu
ZyB0aGUgY2FsbGVlIHNhdmVkCj4+Pj4+Pj4+IHJlZ2lzdGVycyBpbnRvIHRoZSBzdGFjaywgd2Ug
Y2Fubm90IHVzZSB0aGUgY2FsbGVlIHNhdmVkIHJlZ2lzdGVyIHRvCj4+Pj4+Pj4+IHBhc3MgdGhl
IFRDQywgb3RoZXJ3aXNlIHRoZSBvcmlnaW5hbCB2YWx1ZSBvZiB0aGUgY2FsbGVlIHNhdmVkIHJl
Z2lzdGVyCj4+Pj4+Pj4+IHdpbGwgYmUgZGVzdHJveWVkLiBTbyB3ZSBpbXBsZW1lbnRlZCBtaXhp
bmcgYnBmMmJwZiBhbmQgdGFpbGNhbGxzCj4+Pj4+Pj4+IHNpbWlsYXIgdG8geDg2XzY0LCBpLmUu
IHVzaW5nIGEgbm9uLWNhbGxlZSBzYXZlZCByZWdpc3RlciB0byB0cmFuc2Zlcgo+Pj4+Pj4+PiB0
aGUgVENDIGJldHdlZW4gZnVuY3Rpb25zLCBhbmQgc2F2aW5nIHRoYXQgcmVnaXN0ZXIgdG8gdGhl
IHN0YWNrIHRvCj4+Pj4+Pj4+IHByb3RlY3QgdGhlIFRDQyB2YWx1ZS4gQXQgdGhlIHNhbWUgdGlt
ZSwgd2UgYWxzbyBjb25zaWRlciB0aGUgc2NlbmFyaW8KPj4+Pj4+Pj4gb2YgbWl4aW5nIHRyYW1w
b2xpbmUuCj4+Pj4+Pj4KPj4+Pj4+PiBIaSEKPj4+Pj4+Pgo+Pj4+Pj4+IFRoZSBSSVNDLVYgSklU
IHRyaWVzIHRvIG1pbmltaXplIHRoZSBzdGFjayB1c2FnZSwgZS5nLiBpdCBkb2Vzbid0IGhhdmUg
YQo+Pj4+Pj4+IGZpeGVkIHByby9lcGlsb2d1ZSBsaWtlIHNvbWUgb2YgdGhlIG90aGVyIEpJVHMu
IEkgdGhpbmsgd2UgY2FuIGRvIGJldHRlcgo+Pj4+Pj4+IGhlcmUsIHNvIHRoYXQgdGhlIHBhc3Mt
VENDLXZpYS1yZWdpc3RlciBjYW4gYmUgdXNlZCwgYW5kIHRoZSBhZGRpdGlvbmFsCj4+Pj4+Pj4g
c3RhY2sgYWNjZXNzIGNhbiBiZSBhdm9pZGVkLgo+Pj4+Pj4+Cj4+Pj4+Pj4gVG9kYXksIHRoZSBU
Q0MgaXMgcGFzc2VkIHZpYSBhIHJlZ2lzdGVyIChhNikgYW5kIGNhbiBiZSB2aWV3ZWQgYXMgYQo+
Pj4+Pj4+ICJzdGF0ZSIgdmFyaWFibGUvdHJhbnNwYXJlbnQgYXJndW1lbnQvcmV0dXJuIHZhbHVl
LiBBcyB5b3UgcG9pbnQgb3V0LCB3ZQo+Pj4+Pj4+IGxvb3NlIHRoaXMgd2hlbiB3ZSBkbyBhIGNh
bGwuIE9uIChhbnkpIGNhbGxzIHdlIG1vdmUgdGhlIFRDQyB0byBhCj4+Pj4+Pj4gY2FsbGVlLXNh
dmVkIHJlZ2lzdGVyLgo+Pj4+Pj4+Cj4+Pj4+Pj4gV0RZVCBhYm91dCB0aGUgZm9sbG93aW5nIHNj
aGVtZToKPj4+Pj4+Pgo+Pj4+Pj4+IDEgUGlja3VwIHRoZSBhcm02NCBicGYyYnBmL3RhaWxtaXgg
bWVjaGFuaXNtIG9mIGp1c3QgY2xlYXJpbmcgdGhlIFRDQwo+Pj4+Pj4+ICAgICAgIGZvciB0aGUg
bWFpbiBwcm9ncmFtLgo+Pj4+Pj4+IDIgRm9yIEJQRiBoZWxwZXIgY2FsbHMsIG1vdmUgVENDIHRv
IHM2LCBwZXJmb3JtIHRoZSBjYWxsLCBhbmQgcmVzdG9yZQo+Pj4+Pj4+ICAgICAgIGE2LiBEaXRv
IGZvciBrZnVuYyBjYWxscyAoQlBGX1BTRVVET19LRlVOQ19DQUxMKS4KPj4+Pj4+PiAzIEZvciBh
bGwgb3RoZXIgY2FsbHMsIGE2IGlzIHBhc3NlZCB0cmFuc3BhcmVudGx5Lgo+Pj4+Pj4+Cj4+Pj4+
Pj4gRm9yIDIgYnBmX2ppdF9nZXRfZnVuY19hZGRyKCkgY2FuIGJlIHVzZWQgdG8gZGV0ZXJtaW5l
IGlmIHRoZSBjYWxsZWUgaXMKPj4+Pj4+PiBhIEJQRiBoZWxwZXIgb3Igbm90Lgo+Pj4+Pj4+Cj4+
Pj4+Pj4gSW4gc3VtbWFyeTsgRGV0ZXJtaW5lIGluIHRoZSBKSVQgaWYgd2UncmUgbGVhdmluZyBC
UEYtbGFuZCwgYW5kIG5lZWQgdG8KPj4+Pj4+PiBtb3ZlIHRoZSBUQ0MgdG8gYSBjYWxsZWUtc2F2
ZWQgcmVnLCBvciBub3QsIGFuZCBzYXZlIHVzIGEgYnVuY2ggb2Ygc3RhY2sKPj4+Pj4+PiBzdG9y
ZS9sb2Fkcy4KPj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFZhbHVhYmxlIHNjaGVtZS4gQnV0IHdlIG5l
ZWQgdG8gY29uc2lkZXIgVENDIGJhY2sgcHJvcGFnYXRpb24uIExldCBtZQo+Pj4+Pj4gc2hvdyBh
biBleGFtcGxlIG9mIGNhbGxpbmcgc3VicHJvZyB3aXRoIFRDQyBzdG9yZWQgaW4gQTY6Cj4+Pj4+
Pgo+Pj4+Pj4gcHJvZzEoVENDPT0xKXsKPj4+Pj4+ICAgICAgICAgc3VicHJvZzEoVENDPT0xKQo+
Pj4+Pj4gICAgICAgICAgICAgLT4gdGFpbGNhbGwxKFRDQz09MCkKPj4+Pj4+ICAgICAgICAgICAg
ICAgICAtPiBzdWJwcm9nMihUQ0M9PTApCj4+Pj4+PiAgICAgICAgIHN1YnByb2czKFRDQz09MCkg
PC0tLSBzaG91bGQgYmUgVENDPT0xCj4+Pj4+PiAgICAgICAgICAgICAtXC0+IHRhaWxjYWxsMiA8
LS0tIGNhbid0IGJlIGNhbGxlZAo+Pj4+Pj4gfQo+Pj4+Cj4+Pj4gTGV0J3MgYmFjayB3aXRoIHRo
aXMgZXhhbXBsZSBhZ2Fpbi4gSW1hZ2luZSB0aGF0IHRoZSB0YWlsY2FsbCBjaGFpbiBpcyBhCj4+
Pj4gbGlzdCBsaW1pdGVkIHRvIDMzIGVsZW1lbnRzLiBXaGVuIHRoZSBsaXN0IGhhcyAzMiBlbGVt
ZW50cywgd2UgY2FsbAo+Pj4+IHN1YnByb2cxIGFuZCB0aGVuIHRhaWxjYWxsMS4gQXQgdGhpcyB0
aW1lLCB0aGUgbGlzdCBlbGVtZW50cyBjb3VudAo+Pj4+IGJlY29tZXMgMzMuIFRoZW4gd2UgY2Fs
bCBzdWJwcm9nMiBhbmQgcmV0dXJuIHByb2cxLiBBdCB0aGlzIHRpbWUsIHRoZQo+Pj4+IGxpc3Qg
cmVtb3ZlcyAxIGVsZW1lbnQgYW5kIGJlY29tZXMgMzIgZWxlbWVudHMuIEF0IHRoaXMgdGltZSwg
dGhlcmUKPj4+PiBzdGlsbCBjYW4gcGVyZm9ybSAxIHRhaWxjYWxsLgo+Pj4+Cj4+Pj4gSSd2ZSBh
dHRhY2hlZCBhIGRpYWdyYW0gdGhhdCBzaG93cyBtaXhpbmcgdGFpbGNhbGwgYW5kIHN1YnByb2dz
IGlzCj4+Pj4gbmVhcmx5IGEgImNhbGwiLiBJdCBjYW4gcmV0dXJuIHRvIGNhbGxlciBmdW5jdGlv
bi4KPj4+Cj4+PiBIbW0uIExldCBtZSBwdXQgbXkgUSBpbiBhbm90aGVyIHdheS4KPj4+Cj4+PiBU
aGUga2VybmVsIGNhbGxzIGludG8gQlBGX1BST0dfUlVOKCkgKH5hIEJQRiBjb250ZXh0KS4gV291
bGQgaXQgZXZlciBiZQo+Pj4gT0sgdG8gZG8gbW9yZSB0aGFuIDMzIHRhaWwgY2FsbHMsIHJlZ2Fy
ZGxlc3Mgb2Ygc3VicHJvZ3Mgb3Igbm90Pwo+Pj4KPj4+IEluIHlvdXIgZXhhbXBsZSwgVENDIGlz
IDEuIFlvdSBhcmUgYWxsb3dlZCB0byBwZXJmb3JtIG9uZSB0YWlsIGNhbGwuIEluCj4+PiB5b3Vy
IGV4YW1wbGUgcHJvZzEgcGVyZm9ybXMgdHdvLgo+Pj4KPj4+IE15IHZpZXcgb2YgVENDIGhhcyBh
bHdheXMgYmVlbiB+YSBjb3VudGVyIG9mIHRoZSBudW1iZXIgb2YgdGFpbGNhbGxzfi4KPj4+Cj4+
PiBXaXRoIHlvdXIgZXhhbXBsZSBleHBhbmRlZDoKPj4+IHByb2cxKFRDQz09MzMpewo+Pj4gICAg
ICAgICBzdWJwcm9nMShUQ0M9PTMzKQo+Pj4gICAgICAgICAgICAgLT4gdGFpbGNhbGwxKFRDQz09
MzMpIC0+IHRhaWxjYWxsMShUQ0M9PTMyKSAtPiB0YWlsY2FsbDEoVENDPT0zMSkgLT4gLi4uIC8v
IDMzIHRpbWVzCj4+PiAgICAgICAgIC8vIExlaHVpIHNheXMgVENDIHNob3VsZCBiZSAzMyBhZ2Fp
bi4KPj4+ICAgICAgICAgLy8gQmrDtnJuIHNheXMgIml0J3MgdGhlIG51bWJlciBvZiB0YWlsY2Fs
bHMiLCBhbmQgc3VicHJvZzMgY2Fubm90IHBlcmZvcm0gYSB0YWlsIGNhbGwKPj4+ICAgICAgICAg
c3VicHJvZzMoVENDPT0/KQo+Pgo+PiBZZXMsIG15IHZpZXcgaXMgdGFrZSB0aGlzIHNvbWV0aGlu
ZyBsaWtlIGEgc3RhY2vvvIx3aGlsZSB5b3UgdGFrZSB0aGlzIGFzCj4+IGEgZml4ZWQgZ2xvYmFs
IHZhbHVlLgo+Pgo+PiBwcm9nMShUQ0M9PTMzKXsKPj4gICAgICAgc3VicHJvZzEoVENDPT0zMykK
Pj4gICAgICAgICAgIC0+IHRhaWxjYWxsMShUQ0M9PTMzKSAtPiB0YWlsY2FsbDEoVENDPT0zMikg
LT4KPj4gdGFpbGNhbGwxKFRDQz09MzEpIC0+IC4uLiAvLyAzMyB0aW1lcyAtPiBzdWJwcm9nMihU
Q0M9PTApCj4+ICAgICAgIHN1YnByb2czKFRDQz09MzMpCj4+IAktPiB0YWlsY2FsbDEoVENDPT0z
MykgLT4gdGFpbGNhbGwxKFRDQz09MzIpIC0+IHRhaWxjYWxsMShUQ0M9PTMxKSAtPgo+PiAuLi4g
Ly8gMzMgdGltZXMKPj4KPj4+ICAgICAgICAgICAgIAo+Pj4gTXkgdmlldyBoYXMsIGFnYWluLCBi
ZWVuIHRoYW4gVENDIGlzIGEgcnVuLXRpbWUgY291bnQgb2YgdGhlIG51bWJlcgo+Pj4gdGFpbGNh
bGxzIChmZW50cnkvZmV4aXQgcGF0Y2ggYnBmLXByb2dyYW1zIGluY2x1ZGVkKS4KPj4+Cj4+PiBX
aGF0IGRvZXMgeDg2IGFuZCBhcm02NCBkbz8KPj4KPj4gV2hlbiBzdWJwcm9nIHJldHVybiBiYWNr
IHRvIGNhbGxlciBicGYgcHJvZ3JhbSwgdGhleSBib3RoIHJlc3RvcmUgVENDIHRvCj4+IHRoZSB2
YWx1ZSB3aGVuIGVudGVyIGludG8gc3VicHJvZy4gVGhlIEFSTTY0IHVzZXMgdGhlIGNhbGxlZSBz
YXZlZAo+PiByZWdpc3RlciB0byBzdG9yZSB0aGUgVENDLiBXaGVuIHRoZSBBUk02NCBleGl0cywg
dGhlIFRDQyBpcyByZXN0b3JlZCB0bwo+PiB0aGUgdmFsdWUgd2hlbiBpdCBlbnRlci4gVGhlIHdo
aWxlIHg4NiB1c2VzIHRoZSBzdGFjayB0byBkbyB0aGUgc2FtZSB0aGluZy4KPiAKPiBPayEgVGhh
bmtzIGZvciBjbGFyaWZ5aW5nLiBJJ2xsIGNvbnRpbnVlIHJldmlld2luZyB0aGUgdjIgb2YgeW91
cgo+IHNlcmllcyEKPiAKPiBCVFcsIEkgd29uZGVyIGlmIHdlIGNhbiB0cmlnZ2VyIHRoaXMgWzFd
IG9uIFJWNjQgLS0gaS5lLiBjYWxsaW5nIHRoZQo+IG1haW4gcHJvZywgd2lsbCByZXNldCB0aGUg
dGNjIGNvdW50Lgo+IAo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjAyNDAxMDQx
NDIyMjYuODc4NjktMS1oZmZpbHdscW1AZ21haWwuY29tLwoKWWVzLCBJIGhhdmUgYmVlbiBwYXlp
bmcgYXR0ZW50aW9uIHRvIHRoaXMgbWF0dGVyIHJlY2VudGx5IGFuZCB3aWxsIAphbGxvY2F0ZSB0
aW1lIHRvIGFuYWx5emUgaXQuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
