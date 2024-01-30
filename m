Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934B9C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 08:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hL4Et1s8WFUmFGedN70oa5kLshrhxa1Kb3a34MZ50EI=; b=sjsqCbjZ86TJnU
	Vuw0uFUpXf5gEEfx7+FacLiOkrpzPDcqX/XwV3g5apdtgmJsHNUNUsyt9JaAe59GgdpBwNHeyhrrX
	afbcdskDFtrVVn+UowpXmieNyCk+bJQT8cOF2KW/o21LbK1Re1vTizBSpJJ1epr1GbUOX4y4WrntR
	PZlIM7LXOt6EYjU3hJADbb1e13OWw31NvZzBWCNMFGcvjGdBxjn6oqsNd4Puw88nmureyZWI7fN3e
	Nvoe1rLRbDTlHXQENM8LTLWtMpVpP28IypunTUTzE2tD5F78xK4eeiyr2U1lgDpoEdMUXcGlJAl2V
	+p8GPkXx6HTiIjwEDHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjMP-0000000FgCi-1zG8;
	Tue, 30 Jan 2024 08:20:49 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjML-0000000Fg9M-2aZ8
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 08:20:47 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4TPJ4n4ThKz1vsn4;
	Tue, 30 Jan 2024 16:20:09 +0800 (CST)
Received: from kwepemd100009.china.huawei.com (unknown [7.221.188.135])
	by mail.maildlp.com (Postfix) with ESMTPS id 3979B1A016B;
	Tue, 30 Jan 2024 16:20:34 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemd100009.china.huawei.com (7.221.188.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.28; Tue, 30 Jan 2024 16:20:33 +0800
Message-ID: <b1bf2bc8-870d-40a4-9ad2-2b4ced34c43f@huawei.com>
Date: Tue, 30 Jan 2024 16:20:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND bpf-next v3 4/6] riscv, bpf: Add necessary Zbb
 instructions
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Pu Lehui <pulehui@huaweicloud.com>,
	<bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong
 Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
	<kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke Nelson
	<luke.r.nels@gmail.com>, Andrew Jones <ajones@ventanamicro.com>
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
 <20240115131235.2914289-5-pulehui@huaweicloud.com>
 <871qa2zog6.fsf@all.your.base.are.belong.to.us>
 <03ebc63f-7b96-4a70-ad10-a4ffc1d5b1cc@huawei.com>
 <0b2bb6aa-e114-157b-94d1-4acb091b48b8@iogearbox.net>
 <8734ufwdic.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <8734ufwdic.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd100009.china.huawei.com (7.221.188.135)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_002046_050662_5912A458 
X-CRM114-Status: GOOD (  13.72  )
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

CgpPbiAyMDI0LzEvMzAgMTQ6MTgsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gRGFuaWVsIEJvcmtt
YW5uIDxkYW5pZWxAaW9nZWFyYm94Lm5ldD4gd3JpdGVzOgo+IAo+PiBPbiAxLzI5LzI0IDEwOjEz
IEFNLCBQdSBMZWh1aSB3cm90ZToKPj4+IE9uIDIwMjQvMS8yOCAxOjE2LCBCasO2cm4gVMO2cGVs
IHdyb3RlOgo+Pj4+IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaWNsb3VkLmNvbT4gd3JpdGVzOgo+
Pj4+Cj4+Pj4+IEZyb206IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+Pj4+Cj4+Pj4+
IEFkZCBuZWNlc3NhcnkgWmJiIGluc3RydWN0aW9ucyBpbnRyb2R1Y2VkIGJ5IFswXSB0byByZWR1
Y2UgY29kZSBzaXplIGFuZAo+Pj4+PiBpbXByb3ZlIHBlcmZvcm1hbmNlIG9mIFJWNjQgSklULiBN
ZWFud2hpbGUsIGEgcnVudGltZSBkZXRldGVkIGhlbHBlciBpcwo+Pj4+PiBhZGRlZCB0byBjaGVj
ayB3aGV0aGVyIHRoZSBDUFUgc3VwcG9ydHMgWmJiIGluc3RydWN0aW9ucy4KPj4+Pj4KPj4+Pj4g
TGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWJpdG1hbmlwL3JlbGVhc2VzL2Rv
d25sb2FkLzEuMC4wL2JpdG1hbmlwLTEuMC4wLTM4LWc4NjVlN2E3LnBkZiBbMF0KPj4+Pj4gU2ln
bmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+
ICDCoCBhcmNoL3Jpc2N2L25ldC9icGZfaml0LmggfCAzMiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+Pj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKPj4+
Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaCBiL2FyY2gvcmlz
Y3YvbmV0L2JwZl9qaXQuaAo+Pj4+PiBpbmRleCBlMzA1MDFiNDZmOGYuLjUxZjZkMjE0MDg2ZiAx
MDA2NDQKPj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oCj4+Pj4+ICsrKyBiL2Fy
Y2gvcmlzY3YvbmV0L2JwZl9qaXQuaAo+Pj4+PiBAQCAtMTgsNiArMTgsMTEgQEAgc3RhdGljIGlu
bGluZSBib29sIHJ2Y19lbmFibGVkKHZvaWQpCj4+Pj4+ICDCoMKgwqDCoMKgIHJldHVybiBJU19F
TkFCTEVEKENPTkZJR19SSVNDVl9JU0FfQyk7Cj4+Pj4+ICDCoCB9Cj4+Pj4+ICtzdGF0aWMgaW5s
aW5lIGJvb2wgcnZ6YmJfZW5hYmxlZCh2b2lkKQo+Pj4+PiArewo+Pj4+PiArwqDCoMKgIHJldHVy
biBJU19FTkFCTEVEKENPTkZJR19SSVNDVl9JU0FfWkJCKSAmJiByaXNjdl9oYXNfZXh0ZW5zaW9u
X2xpa2VseShSSVNDVl9JU0FfRVhUX1pCQik7Cj4+Pj4KPj4+PiBIbW0sIEknbSB0aGlua2luZyBh
Ym91dCB0aGUgSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX1pCQikgc2VtYW50aWNzCj4+Pj4g
Zm9yIGEga2VybmVsIEpJVCBjb21waWxlci4KPj4+Pgo+Pj4+IElTX0VOQUJMRUQoQ09ORklHX1JJ
U0NWX0lTQV9aQkIpIGFmZmVjdHMgdGhlIGtlcm5lbCBjb21waWxlciBmbGFncy4KPj4+PiBTaG91
bGQgaXQgYmUgZW5vdWdoIHRvIGp1c3QgaGF2ZSB0aGUgcnVuLXRpbWUgY2hlY2s/IFNob3VsZCBh
IGtlcm5lbAo+Pj4+IGJ1aWx0IHcvbyBaYmIgYmUgYWJsZSB0byBlbWl0IFpiYiBmcm9tIHRoZSBK
SVQ/Cj4+Pgo+Pj4gTm90IGVub3VnaCwgYmVjYXVzZSByaXNjdl9oYXNfZXh0ZW5zaW9uX2xpa2Vs
eShSSVNDVl9JU0FfRVhUX1pCQikgaXMKPj4+IGEgcGxhdGZvcm0gY2FwYWJpbGl0eSBjaGVjaywg
YW5kIHRoZSBvdGhlciBvbmUgaXMgYSBrZXJuZWwgaW1hZ2UKPj4+IGNhcGFiaWxpdHkgY2hlY2su
IFdlIGNhbiBwYXNzIHRoZSBjaGVjawo+Pj4gcmlzY3ZfaGFzX2V4dGVuc2lvbl9saWtlbHkoUklT
Q1ZfSVNBX0VYVF9aQkIpIHdoZW4KPj4+IENPTkZJR19SSVNDVl9JU0FfWkJCPW4uIEFuZCBteSBs
b2NhbCB0ZXN0IHByb3ZlIGl0Lgo+IAo+IFdoYXQgSSdtIHRyeWluZyB0byBzYXkgKGFuZCBkcmV3
IGFzIHdlbGwgaW4gdGhlIG90aGVyIHJlcGx5KSBpcyB0aGF0Cj4gInJpc2N2X2hhc19leHRlbnNp
b25fbGlrZWx5KFJJU0NWX0lTQV9FWFRfWkJCKSB3aGVuCj4gQ09ORklHX1JJU0NWX0lTQV9aQkI9
biIgc2hvdWxkIGFsc28gbWFrZSB0aGUgSklUIGVtaXQgWmJiIGluc25zLiBUaGUKPiBwbGF0Zm9y
bSBjaGVjayBzaG91bGQgYmUgc3VmZmljaWVudC4KCk9vaCwgdGhpcyBpcyByZWFsbHkgYmV5b25k
IG15IGV4cGVjdGF0aW9uLiBUaGUgdGVzdF9wcm9ncyBjYW4gcGFzcyB3aGVuIAp3aXRoIG9ubHkg
cGxhdGZvcm0gY2hlY2sgYW5kIGl0IGNhbiByZWNvZ25pemUgdGhlIHpiYiBpbnN0cnVjdGlvbnMu
IE5vdyAKSSBrbm93IGl0LiBTb3JyeSBmb3IgbWlzbGVhZGluZy7wn5mBCgpDdXJpb3VzIGlmIENP
TkZJR19SSVNDVl9JU0FfWkJCIGlzIHN0aWxsIG5lY2Vzc2FyeT8KCj4gCj4+IFNvIGlmIEkgdW5k
ZXJzdGFuZCB5b3UgY29ycmVjdGx5LCBvbmx5IHJlbHlpbmcgb24gdGhlCj4+IHJpc2N2X2hhc19l
eHRlbnNpb25fbGlrZWx5KFJJU0NWX0lTQV9FWFRfWkJCKSBwYXJ0IHdvdWxkIG5vdCB3b3JrIC0K
Pj4gaW93LCB0aGUgSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX1pCQikgaXMgbWFuZGF0b3J5
IGhlcmU/Cj4+Cj4+IFRoYW5rcywKPj4gRGFuaWVsCj4+Cj4+IFAucy46IEdpdmVuIEJqb3JuJ3Mg
cmV2aWV3IGFuZCB0ZXN0cyBJIHRvb2sgdGhlIHNlcmllcyBpbnRvIGJwZi1uZXh0Cj4+IG5vdy4g
VGhhbmtzIGV2ZXJ5b25lIQo+IAo+IFRoYW5rcyEgWWVzLCB0aGlzIGlzIG1haW5seSBhIHNlbWFu
dGljIGRpc2N1c3Npb24sIGFuZCBpdCBjYW4gYmUgZnVydGhlcgo+IHJlbGF4ZWQgbGF0ZXIgd2l0
aCBhIGZvbGxvdyB1cCAtLSBpZiBhcHBsaWNhYmxlLgo+IAo+IAo+IEJqw7ZybgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
