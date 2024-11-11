Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CDDD2E9C2
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:CC:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OKemuEWKg4o3aJcgIWVSs4vG7TPTn6zJ26hINVVWjgc=; b=cuRuPfHdPzHZuXYNsGYNXTiNfM
	tnPnMWJNl1AXcXPsmVDJ4/3kgOpz/IzeBnzs+/+zSGtHLRg9aKjBEpR8Fc1C4+PX2NOfzG2Ulxamb
	d1l/Nfv55T5SXavs0BM1xv7rbvfvzCTlk0LFog3XgnOWwTi1h45hI0yRFE9GK/7q9aliDCNOXvYIy
	xlzYNtkGuRVtxwg2qgHY4Qtkif4nUst8mbpN9b/EdoicPgt9hPSKZGOaejAMI/XXr3roAc+n7EG3p
	qY55CSzjpjiz71PAT+LLPcyKfWRpcsvzQH1N00dvpxt92M6RLgYngr/Jp7tImB2f9j5j7wbu396hu
	zYVLrYnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQ8s-0000000Gtna-0ZGr;
	Mon, 11 Nov 2024 08:51:26 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPx7-0000000Gpsy-0kRp;
	Mon, 11 Nov 2024 08:39:19 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xn2wb1nvlz10VB1;
	Mon, 11 Nov 2024 16:37:19 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 3DA53140257;
	Mon, 11 Nov 2024 16:39:11 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 11 Nov 2024 16:39:09 +0800
CC: <yangyicong@hisilicon.com>, Xu Yang <xu.yang_2@nxp.com>, John Garry
	<john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, James Clark
	<james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, Leo Yan
	<leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
	<mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
	<namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang
	<kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen
	<chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, Athira Rajeev
	<atrajeev@linux.vnet.ibm.com>, Ben Zong-You Xie <ben717@andestech.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>, Sandipan Das
	<sandipan.das@amd.com>, Benjamin Gray <bgray@linux.ibm.com>, Ravi Bangoria
	<ravi.bangoria@amd.com>, =?UTF-8?Q?Cl=c3=a9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>, "Masami Hiramatsu (Google)"
	<mhiramat@kernel.org>, Dima Kogan <dima@secretsauce.net>, "Dr. David Alan
 Gilbert" <linux@treblig.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Junhao He <hejunhao3@huawei.com>
Subject: Re: [PATCH v2 8/8] perf pmu: Move pmu_metrics_table__find and remove
 ARM override
To: Ian Rogers <irogers@google.com>
References: <20241107162035.52206-1-irogers@google.com>
 <20241107162035.52206-9-irogers@google.com>
 <5a57de7c-924e-ccd6-8981-b9fddc647465@huawei.com>
 <CAP-5=fWw04Qi+3=y7M4uMrhgrFWpnF7mZ09yb4v0P0qFT1Gfnw@mail.gmail.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <e8603b0c-86db-c258-179a-f228c43ebf0b@huawei.com>
Date: Mon, 11 Nov 2024 16:39:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAP-5=fWw04Qi+3=y7M4uMrhgrFWpnF7mZ09yb4v0P0qFT1Gfnw@mail.gmail.com>
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_003917_594872_DD178083 
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

T24gMjAyNC8xMS8xMCAwOjEwLCBJYW4gUm9nZXJzIHdyb3RlOgo+IE9uIFNhdCwgTm92IDksIDIw
MjQgYXQgMjo1NOKAr0FNIFlpY29uZyBZYW5nIDx5YW5neWljb25nQGh1YXdlaS5jb20+IHdyb3Rl
Ogo+Pgo+PiBIaSwKPj4KPj4gT24gMjAyNC8xMS84IDA6MjAsIElhbiBSb2dlcnMgd3JvdGU6Cj4+
PiBNb3ZlIHBtdV9tZXRyaWNzX3RhYmxlX19maW5kIHRvIHRoZSBqZXZlbnRzLnB5IGdlbmVyYXRl
ZCBwbXUtZXZlbnRzLmMKPj4+IGFuZCByZW1vdmUgaW5kaXJlY3Rpb24gb3ZlcnJpZGUgZm9yIEFS
TS4gVGhlIG1vdmVtZW50IHJlbW92ZXMKPj4+IHBlcmZfcG11X19maW5kX21ldHJpY3NfdGFibGUg
dGhhdCBleGlzdHMgdG8gZW5hYmxlIHRoZSBBUk0KPj4+IG92ZXJyaWRlLiBUaGUgQVJNIG92ZXJy
aWRlIGlzbid0IG5lY2Vzc2FyeSBhcyBqdXN0IHRoZSBDUFVJRCwgbm90IFBNVSwKPj4+IGlzIHVz
ZWQgaW4gdGhlIG1ldHJpYyB0YWJsZSBsb29rdXAuIE9uIG5vbi1BUk0gdGhlIENQVSBhcmd1bWVu
dCBpcwo+Pj4ganVzdCBpZ25vcmVkIGZvciB0aGUgQ1BVSUQsIGZvciBBUk0gLTEgaXMgcGFzc2Vk
IHNvIHRoYXQgdGhlIENQVUlEIGZvcgo+Pj4gdGhlIGZpcnN0IGxvZ2ljYWwgQ1BVIGlzIHJlYWQu
Cj4+Cj4+IFNpbmNlIHRoZSBsb2dpYyBoZXJlJ3MgYWxyZWFkeSBiZWVuIHRvdWNoaW5nLCBpcyBp
dCBwb3NzaWJsZSB0byBzdGVwIGl0IGZ1cnRoZXIgdG8ganVzdAo+PiBpZ25vcmUgdGhlIENQVUlE
IG1hdGNoaW5nIHdoZW4gZmluZGluZyB0aGUgc3lzdGVtIG1ldHJpY3MvZXZlbnRzIHRhYmxlcz8g
SXQncyBtYXkgbm90IGJlCj4+IHRoYXQgcmVhc29uYWJsZSBmb3IgZmluZGluZyBhIHN5c3RlbSBt
ZXRyaWNzL2V2ZW50cyBmcm9tIHRoZSBDUFVJRCwgc2luY2Ugb25lIHN5c3RlbSBQTVUgbWF5Cj4+
IGV4aXN0cyBvbiBkaWZmZXJlbnQgcGxhdGZvcm1zIHdpdGggZGlmZmVyZW50IENQVSB0eXBlcy4K
PiAKPiBUaGUgaXNzdWUgaXMgZm9yIGNvbmNpc2VuZXNzIHJlYXNvbnMgd2UgbGV0IG1ldHJpY3Mg
YW5kIG1ldHJpYwo+IHRocmVzaG9sZHMgcmVmZXIgdG8gb3RoZXIgbWV0cmljcywgZm9yIGV4YW1w
bGU6Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGVy
Zi9wZXJmLXRvb2xzLW5leHQuZ2l0L3RyZWUvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gveDg2
L2ljZWxha2V4L2ljeC1tZXRyaWNzLmpzb24jbjc4Cj4gYGBgCj4gICAgIHsKPiAgICAgICAgICJC
cmllZkRlc2NyaXB0aW9uIjogIlRoaXMgY2F0ZWdvcnkgcmVwcmVzZW50cyBmcmFjdGlvbiBvZgo+
IHNsb3RzIHdoZXJlIG5vIHVvcHMgYXJlIGJlaW5nIGRlbGl2ZXJlZCBkdWUgdG8gYSBsYWNrIG9m
IHJlcXVpcmVkCj4gcmVzb3VyY2VzIGZvciBhY2NlcHRpbmcgbmV3IHVvcHMgaW4gdGhlIEJhY2tl
bmQiLAo+ICAgICAgICAgIk1ldHJpY0V4cHIiOiAidG9wZG93blxcLWJlXFwtYm91bmQgLyAodG9w
ZG93blxcLWZlXFwtYm91bmQgKwo+IHRvcGRvd25cXC1iYWRcXC1zcGVjICsgdG9wZG93blxcLXJl
dGlyaW5nICsgdG9wZG93blxcLWJlXFwtYm91bmQpICsgNQo+ICogY3B1QElOVF9NSVNDLlJFQ09W
RVJZX0NZQ0xFU1xcLGNtYXNrXFw9MVxcLGVkZ2VAIC8gdG1hX2luZm9fc2xvdHMiLAo+ICAgICAg
ICAgIk1ldHJpY0dyb3VwIjogIlRtYUwxO1RvcGRvd25MMTt0bWFfTDFfZ3JvdXAiLAo+ICAgICAg
ICAgIk1ldHJpY05hbWUiOiAidG1hX2JhY2tlbmRfYm91bmQiLAo+ICAgICAgICAgIk1ldHJpY1Ro
cmVzaG9sZCI6ICJ0bWFfYmFja2VuZF9ib3VuZCA+IDAuMiIsCj4gICAgICAgICAiTWV0cmljZ3Jv
dXBOb0dyb3VwIjogIlRvcGRvd25MMSIsCj4gICAgICAgICAiUHVibGljRGVzY3JpcHRpb24iOiAi
VGhpcyBjYXRlZ29yeSByZXByZXNlbnRzIGZyYWN0aW9uIG9mCj4gc2xvdHMgd2hlcmUgbm8gdW9w
cyBhcmUgYmVpbmcgZGVsaXZlcmVkIGR1ZSB0byBhIGxhY2sgb2YgcmVxdWlyZWQKPiByZXNvdXJj
ZXMgZm9yIGFjY2VwdGluZyBuZXcgdW9wcyBpbiB0aGUgQmFja2VuZC4gQmFja2VuZCBpcyB0aGUK
PiBwb3J0aW9uIG9mIHRoZSBwcm9jZXNzb3IgY29yZSB3aGVyZSB0aGUgb3V0LW9mLW9yZGVyIHNj
aGVkdWxlcgo+IGRpc3BhdGNoZXMgcmVhZHkgdW9wcyBpbnRvIHRoZWlyIHJlc3BlY3RpdmUgZXhl
Y3V0aW9uIHVuaXRzOyBhbmQgb25jZQo+IGNvbXBsZXRlZCB0aGVzZSB1b3BzIGdldCByZXRpcmVk
IGFjY29yZGluZyB0byBwcm9ncmFtIG9yZGVyLiBGb3IKPiBleGFtcGxlOyBzdGFsbHMgZHVlIHRv
IGRhdGEtY2FjaGUgbWlzc2VzIG9yIHN0YWxscyBkdWUgdG8gdGhlIGRpdmlkZXIKPiB1bml0IGJl
aW5nIG92ZXJsb2FkZWQgYXJlIGJvdGggY2F0ZWdvcml6ZWQgdW5kZXIgQmFja2VuZCBCb3VuZC4K
PiBCYWNrZW5kIEJvdW5kIGlzIGZ1cnRoZXIgZGl2aWRlZCBpbnRvIHR3byBtYWluIGNhdGVnb3Jp
ZXM6IE1lbW9yeQo+IEJvdW5kIGFuZCBDb3JlIEJvdW5kLiBTYW1wbGUgd2l0aDogVE9QRE9XTi5C
QUNLRU5EX0JPVU5EX1NMT1RTIiwKPiAgICAgICAgICJTY2FsZVVuaXQiOiAiMTAwJSIKPiAgICAg
fSwKPiBgYGAKPiAKPiBUaGUgc3lzdGVtIG1ldHJpY3Mgd2VyZSBhZGRlZCBvbiB0b3Agb2YgdGhp
cyBhbmQgd2UgbmV2ZXIgcmV0aG91Z2h0Cj4gdGhlIGRlc2lnbi4gRm9yIGEgbWV0cmljIHRvIHJl
ZmVyIHRvIGFub3RoZXIgbWV0cmljIHRoZXJlIG5lZWRzIHRvIGJlCj4gc29tZSBraW5kIG9mIHBs
YWNlIHdlIGxvb2sgdXAgZnJvbSBhbmQgZm9yIHRoYXQgd2UgdXNlIHRoZSBDUFVJRAo+IGFzc29j
aWF0ZWQgdGFibGUuIFBlcmhhcHMgdGhlIGVhc2llc3QgdGhpbmcgaXMgdGhhdCBpZiBubyBDUFVJ
RCB0YWJsZQo+IGlzIG1hdGNoZWQgd2UgaGF2ZSBhbiBlbXB0eSB0YWJsZS4KPiAKCnRoYW5rcyBm
b3IgdGhlIGNsYXJpZmljYWl0b24uIG9rIHRoZW4gaXQncyBkaWZmZXJlbnQgZnJvbSBteSBwcm9i
bGVtIGFuZCBJCnNob3VsZG4ndCBoYXZlIG1peGVkIHRoZW0gdXAuCgpUaGFua3MuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
